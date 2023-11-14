<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "grocerystore";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$email = $_POST['email'];
$password = $_POST['password'];
$name = $_POST['name'];

$sql = "SELECT * FROM customer WHERE email = '$email' and password = '$password'";

$result = $conn->query($sql);
if ($result->num_rows > 0) {
  // Fetch customer data

  $response = new stdClass();
  while($customer = $result->fetch_assoc()) {
    $response->customerID = $customer["customerID"];
    $response->Name = $customer["Name"]; // Fetch the Name attribute
  }


  // Fetch customer orders
  $orders_stmt = $conn->prepare("UPDATE customer SET name = ? WHERE customerID = ?");
  $orders_stmt->bind_param("si", $name, $response->customerID);

  $orders_stmt->execute();

  $orders_result = $orders_stmt->get_result();
  $customer_orders = array();
  if ($orders_result->num_rows > 0) {
    while($order = $orders_result->fetch_assoc()) {
      $customer_orders[] = $order;
    }
  } else {
    $customer_orders = null;
  }
  $response->customerOrders = $customer_orders;
  echo json_encode($response);
  $orders_stmt->close();
} else {
  echo json_encode(array("error"=> "Invalid credentials"));
}

$conn->close();
?>

<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "grocerystore"; // change to grocerystore1 if you want with keys

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Get email and password from form
$email = $_POST['email'];
$password = $_POST['password'];

// Prepare and bind
$stmt = $conn->prepare("SELECT * FROM customer WHERE email = ? AND password = ?");
$stmt->bind_param("ss", $email, $password);

$stmt->execute();

$result = $stmt->get_result();
if ($result->num_rows > 0) {
  // Fetch customer data

  $response = new stdClass();
  while($customer = $result->fetch_assoc()) {
    $response->customerID = $customer["customerID"];
    $response->Name = $customer["Name"]; // Fetch the Name attribute
  }


  // Fetch customer orders
  $orders_stmt = $conn->prepare("SELECT * FROM `order` WHERE CustomerID = ?");
  $orders_stmt->bind_param("i", $response->customerID);

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

$stmt->close();
$conn->close();

?>

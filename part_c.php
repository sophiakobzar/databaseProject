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

$sql = "SELECT * 
        FROM customer 
        WHERE email = ? AND password = ?";

if (!mysqli_stmt_prepare($stmt,$sql)) {
    echo "failed";
}
else {
    //bind parameters to placeholders
    mysqli_stmt_bind_param($stmt, "ss", $email, $password );
    //run parameters inside database
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    while ($row = mysqli_fetch_assoc($result)) {
        echo $customer['Name'];
    }
}

/*if ($stmt = $conn->prepare($sql)) {
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();

    $stmt->bind_result($Name, $customerID);
    while ($stmt->fetch()) {
        printf ("%s %s\n",$Name, $customerID);
    }
}*/

$result = $conn->query($sql);
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

$conn->close();
?>

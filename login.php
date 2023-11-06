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

// ... existing code ...

// ... existing code ...

$stmt->execute();

$result = $stmt->get_result();
if ($result->num_rows > 0) {
  // Fetch customer data
  while($customer = $result->fetch_assoc()) {
    $customerID = $customer["customerID"];
    echo "Customer ID: " . $customerID;
  }

  echo "Login successful";

  // Fetch customer orders
  $orders_stmt = $conn->prepare("SELECT * FROM `order` WHERE CustomerID = ?");
  $orders_stmt->bind_param("i", $customerID);

  $orders_stmt->execute();

  $orders_result = $orders_stmt->get_result();
  if ($orders_result->num_rows > 0) {
    echo "Customer Orders:";
    while($order = $orders_result->fetch_assoc()) {
      echo "\nOrder ID: " . $order["OrderID"] . ", Subtotal: " . $order["subtotal"] . ", Address: " . $order["address"] . ", Total Price: " . $order["totalPrice"];
    }
  } else {
    echo "\nNo orders found for this customer.\n";
  }

  $orders_stmt->close();
} else {
  echo "Invalid credentials";
}

$stmt->close();
$conn->close();
?>

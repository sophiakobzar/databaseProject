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

// Get data from form
$name = $_POST['Name'];
$paymentMethod = $_POST['Payment Method'];
$email = $_POST['email'];
$password = $_POST['password']; // Don't forget to hash this before inserting

// Prepare and bind
$stmt = $conn->prepare("INSERT INTO `customer` (`Name`, `Payment Method`, `email`, `password`, `customerID`) VALUES (?, ?, ?, ?, 23)");
$stmt->bind_param("ssss", $name, $paymentMethod, $email, $password);

$stmt->execute();

echo "Account created successfully";

$stmt->close();
$conn->close();
?>
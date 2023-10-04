<?php
// Get the JSON data from the POST request
$data = json_decode(file_get_contents('php://input'), true);

// Database connection
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

// Prepare and bind
$stmt = $conn->prepare("UPDATE items SET quantity = quantity - ? WHERE itemName = ?");
$stmt->bind_param("is", $quantity, $itemName);

// Set parameters and execute
$itemName = $data['itemName'];
$quantity = $data['quantity'];
$stmt->execute();

echo json_encode(['message' => 'Item updated successfully']);

$stmt->close();
$conn->close();
?>
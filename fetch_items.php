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

$sql = "SELECT imageName, itemID, itemName, price, quantity FROM items WHERE quantity > 0";
$result = $conn->query($sql);

$items = array();
while($row = $result->fetch_assoc()) {
  $items[] = $row;
}

echo json_encode($items);

$conn->close();
?>
<?php
  $itemName = $_POST['itemName'];
  $price = $_POST['price'];

  // Create connection
  $conn = new mysqli("localhost", "root", "", "grocerystore");

  // Check connection
  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }

  // Prepare SQL statement
  $stmt = $conn->prepare("UPDATE items SET price = ? WHERE itemName = ?");
  $stmt->bind_param("ss", $price, $itemName);

  // Execute SQL statement
  if ($stmt->execute()) {
    echo "Record updated successfully";
  } else {
    echo "Error updating record: " . $stmt->error;
  }

  // Close statement and connection
  $stmt->close();
  $conn->close();
?>

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
  $sql = "UPDATE items SET price = '$price' WHERE itemName = '$itemName'";

  // Execute SQL statement
  if ($conn->query($sql) === TRUE) {
    echo "Record updated successfully";
  } else {
    echo "Error updating record: " . $conn->error;
  }

  // Close connection
  $conn->close();
?>

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

// Get the JSON data sent from the client
$data = json_decode(file_get_contents('php://input'), true);

if ($data && isset($data['itemsToUpdate']) && is_array($data['itemsToUpdate'])) {
  foreach ($data['itemsToUpdate'] as $item) {
    $itemName = $item['name'];
    $quantity = $item['quantity'];
    
    // Update the quantity using prepared statements to prevent SQL injection
    $stmt = $conn->prepare("UPDATE items SET quantity = quantity - ? WHERE itemName = ?");
    $stmt->bind_param("is", $quantity, $itemName);
    
    if ($stmt->execute()) {
      // Quantity updated successfully
    } else {
      // Error occurred, log the error
      error_log("Error updating quantity: " . $stmt->error);
    }
    // Close the statement
    $stmt->close();
  }
  // Send back a response with the updated quantities
  echo json_encode($data['itemsToUpdate']);
} else {
  // Handle invalid or missing data
  echo json_encode(['error' => 'Invalid data']);
}
// Close the database connection
$conn->close();
?>

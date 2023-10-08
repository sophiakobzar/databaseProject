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

// Calculate the total price based on items in the order
function calculateTotalPrice($itemsToUpdate, $conn) {
  $totalPrice = 0;
  foreach ($itemsToUpdate as $item) {
    $itemName = $item['name'];
    $quantity = $item['quantity'];

    // Query the database to get the price of the item
    $query = "SELECT price FROM items WHERE itemName = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $itemName);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows == 1) {
      $row = $result->fetch_assoc();
      $price = $row['price'];
      $totalPrice += $price * $quantity;
    }
    
    // Close the statement
    $stmt->close();
  }
  return $totalPrice;
}

// ... (other code)

if ($data && isset($data['itemsToUpdate']) && is_array($data['itemsToUpdate'])) {
  // Generate a unique OrderID
  $orderID = generateUniqueOrderID($conn);

  // Calculate the total price
  $totalPrice = calculateTotalPrice($data['itemsToUpdate'], $conn);

  // Insert the order into the "order" table with the calculated total
  $stmt = $conn->prepare("INSERT INTO `order` (`OrderID`, `totalPrice`) VALUES (?, ?)");
  $stmt->bind_param("sd", $orderID, $totalPrice); // Use "d" for double

  if ($stmt->execute()) {
    // Order inserted successfully
    echo json_encode(['success' => true]);
  } else {
    // Error occurred, log the error
    error_log("Error inserting order: " . $stmt->error);
    echo json_encode(['error' => 'Error inserting order']);
  }
  // Close the statement
  $stmt->close();

  // ... (other code)
} else {
  // Handle invalid or missing data
  echo json_encode(['error' => 'Invalid data']);
}



// Function to generate a unique OrderID
function generateUniqueOrderID($conn) {
  $orderID = "";
  do {
    $orderID = generateRandomOrderID();
    $query = "SELECT * FROM `order` WHERE `OrderID` = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $orderID);
    $stmt->execute();
    $result = $stmt->get_result();
    $stmt->close();
  } while ($result->num_rows > 0); // Repeat until a unique OrderID is generated
  return $orderID;
}

// Function to generate a random OrderID
function generateRandomOrderID() {
  $characters = '0123456789';
  $orderID = '';
  for ($i = 0; $i < 6; $i++) { // Generate a 6-character OrderID
    $orderID .= $characters[rand(0, strlen($characters) - 1)];
  }
  return $orderID;
}

// Get the JSON data sent from the client
$data = json_decode(file_get_contents('php://input'), true);

if ($data && isset($data['itemsToUpdate']) && is_array($data['itemsToUpdate'])) {
  // Generate a unique OrderID
  $orderID = generateUniqueOrderID($conn);

  // Insert the order into the "order" table
  $stmt = $conn->prepare("INSERT INTO `order` (`OrderID`, `totalPrice`) VALUES (?, ?)");
  $stmt->bind_param("sd", $orderID, $data['totalPrice']); // Use "d" for double

  if ($stmt->execute()) {
    // Order inserted successfully
  } else {
    // Error occurred, log the error
    error_log("Error inserting order: " . $stmt->error);
  }
  // Close the statement
  $stmt->close();

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

  // Send back a response with a success message
  echo json_encode(['success' => true]);
} else {
  // Handle invalid or missing data
  echo json_encode(['error' => 'Invalid data']);
}

// Close the database connection
$conn->close();
?>

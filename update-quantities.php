<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "grocerystore"; // change either grocerystore1 if you want with keys

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Function to generate a unique random OrderID
function generateUniqueOrderID($conn) {
    $orderID = mt_rand(10000, 99999); // Generate a random order ID
    $sql = "SELECT OrderID FROM `order` WHERE OrderID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $orderID);
    $stmt->execute();
    $result = $stmt->get_result();
    $stmt->close();
    
    // Check if the generated order ID already exists
    if ($result->num_rows > 0) {
        // If it exists, generate a new one recursively
        return generateUniqueOrderID($conn);
    }
    
    return $orderID; // Return the unique order ID
}

function generateGuestCustomerID($conn) {
  $customerID = mt_rand(1000, 9999); // Generate a random order ID
    $sql = "SELECT CustomerID FROM `customer` WHERE customerID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $customerID);
    $stmt->execute();
    $result = $stmt->get_result();
    $stmt->close();
    
    // Check if the generated order ID already exists
    if ($result->num_rows > 0) {
        // If it exists, generate a new one recursively
        return generateUniqueOrderID($conn);
    }
    
    return $customerID; // Return the unique order ID
}

// Get the JSON data sent from the client
$data = json_decode(file_get_contents('php://input'), true);

if ($data && isset($data['0']['itemsToUpdate']) && isset($data['0']['customer']) && isset($data['0']['total'])) {
  
  
  // Generate a unique OrderID
  $orderID = generateUniqueOrderID($conn);
  $customerID;
  //if order is a guest order inserts a guest customer entry
  if(isset($data['0']['customer']['0']['Guest'])){
    $customerID = generateGuestCustomerID($conn);
    $stmt = $conn->prepare("INSERT INTO `customer` (`Name`, `customerID` , `Payment Method`,  `email`) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("siss", $data['0']['customer']['0']['Name'], $customerID, $data['0']['customer']['0']['PaymentMethod'], $data['0']['customer']['0']['email']);
    if ($stmt->execute()) {
      // Guest Customer inserted successfully
      echo json_encode(['message' => 'customer placed successfully']);
    } else {
      // Error occurred, log the error
      error_log("Error inserting Customer: " . $stmt->error);
      echo json_encode(['error' => 'Failed to insert customer']);
    }
    $stmt->close();

  }else{
    $customerID = $data['0']['customer']['0']['customerID'];
  }
  
  // Insert the order into the `order` table
  $subTotal = $data['0']['total']; // You can set the total price here
  $totalPrice = $subTotal;
  $stmt = $conn->prepare("INSERT INTO `order` (`OrderID`, `subtotal` , `address`,  `totalPrice`, `CustomerID` ) VALUES (?, ?, ?, ?, ?)");
  $stmt->bind_param("idsdi", $orderID, $subTotal,$data['0']['address'], $totalPrice, $customerID);
  
  if (!$stmt->execute()) {
    // Error occurred, log the error
    error_log("Error inserting order: " . $stmt->error);
    echo json_encode(['error' => 'Failed to place the order']);
  }
  $stmt->close();
  
  foreach ($data[0]['itemsToUpdate'] as $item) {
    $itemID = $item['itemID'];
    $quantity = $item['quantity'];
    
    // Update the quantity using prepared statements to prevent SQL injection
    $stmt = $conn->prepare("UPDATE items SET quantity = quantity - ? WHERE itemID = ?");
    $stmt->bind_param("is", $quantity, $itemID);
    
    if (!$stmt->execute()) {
      // Error occurred, log the error
      error_log("Error updating quantity: " . $stmt->error);
    }
    // Close the statement
    $stmt->close();
  }
  
  foreach ($data[0]['itemsToUpdate'] as $item) {
    $itemID = $item['itemID'];
    $quantity = $item['quantity'];
    
    // Update the quantity using prepared statements to prevent SQL injection
    $stmt = $conn->prepare("INSERT INTO `partof` (`OrderID`, `itemID`, `quantity`) VALUES (?, ?, ?)");
    $stmt->bind_param("iii", $orderID, $itemID, $quantity);
    
    if (!$stmt->execute()) {
      // Error occurred, log the error
      error_log("Error updating partof table: " . $stmt->error);
    }
    // Close the statement
    echo json_encode(["result"=> "success"]);
    $stmt->close();
  }
  
} else {
  // Handle invalid or missing data
  echo json_encode(['error' => 'Invalid data']);
}

// Close the database connection
$conn->close();
?>

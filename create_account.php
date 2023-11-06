<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "grocerystore";
function generateCustomerID($conn) {
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

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Get data from form
$name = $_POST['Name'];
$paymentMethod = $_POST['PaymentMethod'];
$email = $_POST['email'];
$password = $_POST['password']; // Don't forget to hash this before inserting
$customerID = generateCustomerID($conn);

// Prepare and bind
$stmt = $conn->prepare("INSERT INTO `customer` (`Name`, `Payment Method`, `email`, `password`, `customerID`) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("ssssi", $name, $paymentMethod, $email, $password, $customerID);

$stmt->execute();
echo "Account created successfully";
$stmt->close();
$conn->close();
?>
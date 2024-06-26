<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "grocerystore";

// Get the JSON data sent from the client
$data = json_decode(file_get_contents('php://input'), true);
error_log("Received data from client: " . print_r($data, true));

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

// Get the JSON data sent from the client
$data = json_decode(file_get_contents('php://input'), true);

if ($data && isset($data['itemsToUpdate']) && is_array($data['itemsToUpdate'])) {
    $totalPrice = 0; // Initialize the total price

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

        // Get the price of the item from the database
        $priceQuery = $conn->query("SELECT price FROM items WHERE itemName = '$itemName'");
        $priceRow = $priceQuery->fetch_assoc();
        $itemPrice = $priceRow['price'];

        // Calculate the item subtotal and add it to the total price
        $itemSubtotal = $itemPrice * $quantity;
        $totalPrice += $itemSubtotal;

        // Close the statement
        $stmt->close();
    }

    // Insert the order into the `order` table
    $orderID = generateUniqueOrderID($conn);
    $stmt = $conn->prepare("INSERT INTO `order` (`OrderID`, `totalPrice`) VALUES (?, ?");
    $stmt->bind_param("id", $orderID, $totalPrice);

    if ($stmt->execute()) {
        // Order inserted successfully
        echo json_encode(['message' => 'Order placed successfully']);
    } else {
        // Error occurred, log the error
        error_log("Error inserting order: " . $stmt->error);
        echo json_encode(['error' => 'Failed to place the order']);
    }
    $stmt->close();
} else {
    // Handle invalid or missing data
    echo json_encode(['error' => 'Invalid data']);
}

// Close the database connection
$conn->close();
?>

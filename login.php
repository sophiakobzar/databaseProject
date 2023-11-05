<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "grocerystore"; // change to grocerystore1 if you want with keys

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Get email and password from form
$email = $_POST['email'];
$password = $_POST['password'];

// Prepare and bind
$stmt = $conn->prepare("SELECT * FROM customer WHERE email = ? AND password = ?");
$stmt->bind_param("ss", $email, $password);

$stmt->execute();

$result = $stmt->get_result();
if ($result->num_rows > 0) {
  echo "Login successful";
} else {
  echo "Invalid credentials";
}

$stmt->close();
$conn->close();
?>

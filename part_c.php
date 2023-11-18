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

$email = $_POST['email'];
$password = $_POST['password'];

$sql = "SELECT * 
        FROM customer 
        WHERE email = ? AND password = ?";

$stmt = $conn->prepare($sql); // Define $stmt here

if (!$stmt) {
    echo "failed";
}
else {
    //bind parameters to placeholders
    $stmt->bind_param("ss", $email, $password );
    //run parameters inside database
    $stmt->execute();
    $result = $stmt->get_result();

    while ($row = $result->fetch_assoc()) {
        echo $row['Name'];
    }
}

$conn->close();
?>

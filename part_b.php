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
$newName = $_POST['name'];

$sql = "SELECT * FROM customer WHERE email = '$email' and password = '$password'";

$result = $conn->query($sql);
if ($result->num_rows > 0) {
  // Fetch customer data
  $response = new stdClass();
  while($customer = $result->fetch_assoc()) {
    $response->customerID = $customer["customerID"];
    $response->OldName = $customer["Name"]; // Fetch the Name attribute
  }

  // Update customer name
  $update_stmt = $conn->prepare("UPDATE customer SET name = ? WHERE customerID = ?");
  $update_stmt->bind_param("si", $newName, $response->customerID);
  $update_stmt->execute();

  // Set the new name in the response
  $response->NewName = $newName;

  echo json_encode($response);
  $update_stmt->close();
} else {
  echo json_encode(array("error"=> "Invalid credentials"));
}

$conn->close();
?>

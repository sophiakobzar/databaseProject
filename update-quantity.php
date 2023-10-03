<?php
// Get the JSON data from the POST request
$data = json_decode(file_get_contents('php://input'), true);

// Read the CSV file into an array
$csv = array_map('str_getcsv', file('items.csv'));

// Update the quantity of the specified item
foreach ($csv as &$item) {
  if ($item[1] == $data['name']) {
    $item[3] -= $data['quantity'];
  }
}

// Open the CSV file for writing
$fp = fopen('items.csv', 'w');

// Write each line to the CSV file
foreach ($csv as $line) {
  fputcsv($fp, $line);
}

// Close the CSV file
fclose($fp);

echo json_encode(['message' => 'Item updated successfully']);
?>

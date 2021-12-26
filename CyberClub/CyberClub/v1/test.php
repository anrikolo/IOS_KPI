<?php
require_once '../includes/DbOperation.php';

$response = array();
$result = array();
//$db = new DbOperation();
$conn = mysqli_connect('localhost', 'root', '', 'CyberClub');
$stmt = mysqli_query($conn,"SELECT *  FROM pc");

while ($row = mysqli_fetch_object($stmt)) {
    //echo json_encode($row);
    array_push($response, $row);
}

//$response = $db->getPC();

echo json_encode($response);
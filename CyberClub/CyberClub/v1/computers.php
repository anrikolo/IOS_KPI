<?php

require_once '../includes/DbOperation.php';

$response = array();

$db = new DbOperation();
if ($db->getPC()) {
    $response['error'] = false;
    $response = $db->getPC();
} else {
    $response['error'] = true;
    $response['message'] = 'Invalid username or password';
}


echo json_encode($response);
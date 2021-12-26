<?php
//importing required script
require_once '../includes/DbOperation.php';

$response = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_pc = $_POST['id_pc'];
    $id_order = $_POST['id_order'];

    //creating db operation object
    $db = new DbOperation();
    //adding user to database
    $result = $db->createOrder($id_pc, $id_order);
    if ($result == ORDER_CREATED) {
        $response['error'] = false;
        $response['message'] = 'Order created successfully';
    } elseif ($result == ORDER_NOT_CREATED) {
        $response['error'] = true;
        $response['message'] = 'Some error occurred';
    }
}

echo json_encode($response);
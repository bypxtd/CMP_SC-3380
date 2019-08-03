<?php

include '../adminCheck.php';
include '../../../inc/utils.php';
include 'Equipment.php';

// verify serial number is correct
if (!isset($_REQUEST['SerialNumber']) || !Equipment::verifySerialNumber($_REQUEST['SerialNumber'])) {
    include '../getFail.php';
    exit;
}
$serialnumber = $_REQUEST['SerialNumber'];

$action = empty($_POST['action']) ? '' : $_POST['action'];

if ($action == 'do') {

    // set type
    if (!empty($_POST['Type'])) {
        $message = Equipment::setType($serialnumber, $_POST['Type']);
        makeLog("UpdateEquipmentType $serialnumber");
    }

    // set manufacturer
    if (!empty($_POST['Manufacturer'])) {
        $message = Equipment::setManufacturer($serialnumber, $_POST['Manufacturer']);
        makeLog("UpdateEquipmentManufacturer $serialnumber");
    }

    // set price
    if (!empty($_POST['Price'])) {
        $message = Equipment::setPrice($serialnumber, $_POST['Price']);
        makeLog("UpdateEquipmentPrice $serialnumber");
    }

    // print error message
    if (!empty($message)) {
        include 'editEquipment_form.php';
        exit;
    } else {
        // done!
        $message = '<p style="color: green;">Success</p>';
        include 'editEquipment_form.php';
        exit;
    }
} else {
    // print empty form
    $message = '';
    include 'editEquipment_form.php';
    exit;
}


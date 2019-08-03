<?php
require '../adminCheck.php';

include '../../../inc/utils.php';

include 'Equipment.php';

$action = empty($_POST['action']) ? '' : $_POST['action'];

if ($action == 'do')
{
    // request POST vars
    $serialnumber = !isset($_POST['SerialNumber']) ? '' : $_POST['SerialNumber'];
    $type = !isset($_POST['Type']) ? '' : $_POST['Type'];
    $manufacturer = !isset($_POST['Manufacturer']) ? '' : $_POST['Manufacturer'];
    $price = !isset($_POST['Price']) ? '' : $_POST['Price'];
    $quantity = empty($_POST['Quantity']) ? 1 : $_POST['Quantity']; // empty() because blank is valid

    // validate
    if (!validate($serialnumber, $price, $quantity))
    {
        $message = 'Invalid input.';
        include 'createEquipment_form.php';
        exit;
    }
    // convert to numeric
    $serialnumber += 0;
    $price += 0.0;
    $quantity += 0;

    // use attempts to prevent infinite loop
    for ($i = 0, $attempts = 1000; $i < $quantity; $i++, $attempts--)
    {
        $message = equipment_create($serialnumber + $i, $type, $manufacturer, $price);

        // duplicate key: need one more
        if ($message == 1022 || $message == 1062) {
            $quantity++;
        }
        // break on any other message value
        elseif (!empty($message)) {
            break;
        }

        if ($attempts <= 0) {
            $message = '1000 attempt timeout.  Please contact the site administrator.';
            break;
        }
    }

    if (isset($message))
        include 'createEquipment_form.php';
    else
        header("Location: index.php");
} else {
    $message = '';
    include 'createEquipment_form.php';
    exit;
}

function equipment_create($serialnumber, $type, $manufacturer, $price)
{
    require '../adminCheck.php';

    $query = 'INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price) VALUES (?,?,?,?)';

    $mysqli = openDB();

    $stmt = $mysqli->stmt_init();
    if (!$stmt->prepare($query))
    {
        $message = 'Error preparing statement<br>';
        $message .= nl2br(print_r($stmt->error_list, true), false);
        return $message;
    }

    if (!$stmt->bind_param('issd', $serialnumber, $type, $manufacturer, $price))
    {
        $message = 'Error binding parameters<br>';
        $message .= nl2br(print_r($stmt->error_list, true), false);
        return $message;
    }

    if (!$stmt->execute())
    {
        // duplicate key
        if ($stmt->errno == 1022 || $stmt->errno == 1062) {
            return $stmt->errno;
        }

        $message = 'Error executing statement<br>';
        $message .= nl2br(print_r($stmt->error_list, true), false);
        return $message;
    }

    makeLog("CreateEquipment $serialnumber");

    return;
}

function validate($serialnumber, $price, $quantity)
{
    // validate serial number
    $options = array(
        'min_range' => 1    // no 0 b/c of filter_var's corner case
    );

    if (!filter_var($serialnumber, FILTER_VALIDATE_INT, $options))
        return false;

    // validate price as float or int
    if (!filter_var($price, FILTER_VALIDATE_FLOAT) && !filter_var($price, FILTER_VALIDATE_INT, $options))
        return false;

    if ($price + 0.0 < 0.0)
        return false;

    // validate quantity
    $options = array(
        'min_range' => 1
    );

    if (!filter_var($quantity, FILTER_VALIDATE_INT, $options))
        return false;

    // good
    return true;
}

<?php

require '../adminCheck.php';

// request values and validate
if (!isset($_GET['name']))
{
    include '../getFail.php';
    exit;
}
else
{
    $name = $_GET['name'];
}

$query = "UPDATE Authentication SET Password=? WHERE UserID=?";

// open database
include '../../../inc/utils.php';
$mysqli = openDB();

// prepare statement
$stmt = $mysqli->stmt_init();
if (!$stmt->prepare($query))
{
    echo "Error preparing statement: <br>";
    echo nl2br(print_r($stmt->error_list, true), false);
    return;
}

// bind blank password and username
if (!$stmt->bind_param('ss', password_hash('', PASSWORD_DEFAULT), $name))
{
    echo "Error binding parameters: <br>";
    echo nl2br(print_r($stmt->error_list, true), false);
    return;
}

// query database
if (!$stmt->execute())
{
    echo "Error executing query: <br>";
    echo nl2br(print_r($stmt->error_list, true), false);
    return;
}

// done

// log action
$actionkey = "ResetUserPassword {$_GET['name']}";
makeLog($actionkey);

// redirect to previous page
header("Location: {$_SERVER['HTTP_REFERER']}");
exit;
?>

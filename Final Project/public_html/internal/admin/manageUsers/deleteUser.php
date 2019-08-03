<?php

require '../adminCheck.php';

// request values and validate
if (!isset($_GET['do']) || !isset($_GET['name']))
{
    include '../getFail.php';
    exit;
}
else
{
    // set $do to 1 if true, 0 otherwise
    // bind_param does not take booleans, so we have to use integers
    $do = $_GET['do'] == 'true' ? 1 : 0;

    $name = $_GET['name'];
}

// query to delete or restore user
$query = "UPDATE Person SET Graveyard=? WHERE UserID=?";

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

// bind username
if (!$stmt->bind_param('ss', $do, $name))
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
$actionkey = $do ? "DeleteUser {$_GET['name']}" : "RestoreUser {$_GET['name']}";
makeLog($actionkey);

// redirect to previous page
header("Location: {$_SERVER['HTTP_REFERER']}");
exit;
?>

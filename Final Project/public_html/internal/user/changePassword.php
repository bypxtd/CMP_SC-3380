<?php
require '../../inc/autoload.php';
require '../login/loginCheck.php';
//require '../../inc/utils.php';

//if(!$_SESSION['loggedin'] && empty($_SESSION['warning']))
if (empty($_SESSION['person'])) {
    header("Location: ../login/login.php");
    exit;
} else {
    // get person object
    $employee = unserialize($_SESSION['person']);

    // make sure person is an employee
    if ( get_parent_class($employee) !== 'Employee' ) {
        header("Location: ../login/login.php");
        exit;
    }
}

$action = !isset($_POST['action']) ? '' : $_POST['action'];

if ($action == 'do') {
    // get data from post
    $oldpassword = !isset($_POST['oldpassword']) ? '' : $_POST['oldpassword'];
    $newpassword = !isset($_POST['newpassword']) ? '' : $_POST['newpassword'];
    $newpassword_confirm = !isset($_POST['newpassword_confirm']) ? '' : $_POST['newpassword_confirm'];

    // set password and verify
    if ( !( $employee->authentication->setPassword($oldpassword, $newpassword, $newpassword_confirm) ) ) {
        $message = "Old password incorrect or new passwords mismatch.";
        include "changePassword_form.php";
        exit;
    }

    // save to database
    $employee->authentication->save();

    // unset password change warning
    unset($_SESSION['warning']);

    // update login info
    $_SESSION['person'] = serialize($employee);

    // redirect
    header("Location: /~GROUP14/internal/user/userPage.php");
    exit;

    //change_password();
} else {
    include "changePassword_form.php";
    exit;
}

//function change_password()
//{
//    require '../login/loginCheck.php';
//
//    $oldpassword = !isset($_POST['oldpassword']) ? '' : $_POST['oldpassword'];
//    $newpassword = !isset($_POST['newpassword']) ? '' : $_POST['newpassword'];
//    $newpassword_confirm = !isset($_POST['newpassword_confirm']) ? '' : $_POST['newpassword_confirm'];
//
//    $query = "UPDATE Authentication SET Password=? WHERE UserID=?";
//
//    // open database
//    $mysqli = openDB();
//
//    $oldpassword = $mysqli->real_escape_string($oldpassword);
//    $newpassword = $mysqli->real_escape_string($newpassword);
//    $newpassword_confirm = $mysqli->real_escape_string($newpassword_confirm);
//
//    $newpassword_hashed = password_hash($newpassword, PASSWORD_DEFAULT);
//
//    // new passwords must match
//    if (!password_verify($newpassword_confirm, $newpassword_hashed))
//    {
//        $message = "Passwords must match.";
//        include 'changePassword_form.php';
//        exit;
//    }
//
//    // old password must match
//    // function from utils.php
//    if (!db_password_verify(unserialize($_SESSION['person'])->userID, $oldpassword))
//    {
//        $message = "Old password incorrect.";
//        include 'changePassword_form.php';
//        exit;
//    }
//
//    // destroy new unhashed passwords (save old for after query)
//    unset($oldpassword);
//    unset($_POST['oldnewpassword']);
//    unset($newpassword);
//    unset($_POST['newpassword']);
//    unset($newpassword_confirm);
//    unset($_POST['newpassword_confirm']);
//
//
//    // prepare statement
//    if (!$stmt = $mysqli->prepare($query))
//    {
//        echo "Error preparing statement: <br>";
//        echo nl2br(print_r($stmt->error_list, true), false);
//        return;
//    }
//
//    // bind username
//    if (!$stmt->bind_param('ss', $newpassword_hashed, unserialize($_SESSION['person'])->userID))
//    {
//        echo "Error binding parameters: <br>";
//        echo nl2br(print_r($stmt->error_list, true), false);
//        return;
//    }
//
//    // query database
//    if (!$stmt->execute())
//    {
//        echo "Error executing query: <br>";
//        echo nl2br(print_r($stmt->error_list, true), false);
//        return;
//    }
//
//    // log action
//    $actionkey = "UpdateUserPassword";
//    makeLog($actionkey);
//
//    // done
//
//    // redirect to previous page
//    unset($_SESSION['warning']);
//    header("Location: /~GROUP14/internal/user/userPage.php");
//    exit;
//
//}

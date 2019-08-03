<?php

require '../../inc/autoload.php';
require 'loginCheck.php';

//if they are logged in, send to the desired page
if ($_SESSION['loggedin']) {
    header("Location: successPage.php");
    exit;
}


//here it checks if there was an action specified, which it should be from the login_form.php
$action = empty($_POST['action']) ? '' : $_POST['action'];

//here it looks to see if the login form was loaded, since the login_form will sneakily set the action to 'do_login'
if ($action == 'do_login') {
    // open authentication
    $auth = Authentication::open($_POST['username']);

    // failed to open
    if (!$auth) {
        $username = '';
        $error = 'invalid username';
        include 'login_form.php';
        exit;
    }

    // open employee
    switch ($auth->roles) {
        case 'c':
            $employee = Conductor::open($auth->userID);
            break;
        case 'e':
            $employee = Engineer::open($auth->userID);
            break;
        case 'a':
            $employee = Administrator::open($auth->userID);
            break;
        default:
            $username = $auth->userID;
            $error = 'Invalid roles in Auth.';
            include 'login_form.php';
            break;
    }

    if (!($employee->login($_POST['password'], $auth->roles))) {
        $username = $auth->userID;
        $error = 'Username or password incorrect.';
        include 'login_form.php';
        exit;
    }

    // if password is NULL, require a password change
    if (empty($_POST['password'])) {
        $_SESSION['warning'] = 'changePassword';
        header("Location: /~GROUP14/internal/user/changePassword.php");
        exit;
    }

    // redirect to previous page
    //header('Location: ' . $_SERVER['HTTP_REFERER']);
    //exit;

    handle_login();
} else {
    $username = "";
    $error = "";
    include "login_form.php";
    exit;
}



//include "../DB.php";

function handle_login() {
    require 'loginCheck.php';

    $username = !isset($_POST['username']) ? '' : $_POST['username'];
    $password = !isset($_POST['password']) ? '' : $_POST['password'];

    // Connect to the database
    include '../../inc/utils.php';
    $mysqli = openDB();

    // Build query
    //$query = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";

    // prepare statement
    $stmt = $mysqli->stmt_init();
    if (!$stmt->prepare("
        SELECT Authentication.UserID, Password, Roles, FirstName, LastName, Graveyard
        FROM Authentication
        JOIN Person
        ON Person.UserID=Authentication.UserID
        WHERE Authentication.UserID=?"))
    {
        echo "Error preparing statement: <br>";
        nl2br(print_r($stmt->error_list, true), false);
        exit;
    }

    // bind parameters
    if (!$stmt->bind_param('s', $username))
    {
        echo "Error binding parameters: <br>";
        nl2br(print_r($stmt->error_list, true), false);
        exit;
    }

    //$result = $mysqli->query($query);

    // execute statement
    $stmt->execute();

    // get result
    $result = $stmt->get_result();

    // fail if username doesn't match
    if ($result->num_rows != 1)
    {
        $error = "Username or password does not match.";
        include 'login_form.php';
        exit;
    }

    // get row from result
    $row = $result->fetch_assoc();

    // fail if user deleted
    if ($row['Graveyard'])
    {
        $error = "User was deleted.  Please contact site administrator.";
        include 'login_form.php';
        exit;
    }

    // get UserID and hashed password into variables
    $UserID = $row['UserID'];
    $HashedPassword = $row['Password'];
    $firstname = $row['FirstName'];
    $lastname = $row['LastName'];
    $roles = $row['Roles'];

    // compare password with hashed password
    if (!password_verify($password, $HashedPassword))
    {
        $error = "Username or password does not match.";
        include 'login_form.php';
        exit;
    }

    // put login into session
    $_SESSION['loggedin'] = true;
    $_SESSION['name'] = $UserID;
    $_SESSION['firstname'] = $firstname;
    $_SESSION['lastname'] = $lastname;
    $_SESSION['roles'] = $roles;

    // if password is NULL, require a password change
    if (empty($password))
    {
        $_SESSION['warning'] = 'changePassword';
        header("Location: /~GROUP14/internal/user/changePassword.php");
        exit;
    }

    // redirect to previous page
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;

    /*
    // If there was a result...
    if ($result) {

        //fetch_assoc takes a row from the query result and turns it into an associative array
        //does this one row at a time until there are no more rows
        while( $row = $result->fetch_assoc() )  {
            //print_r($row);  <-- good function for printing out rows 
            $name = $row['name'];
            //row values can be accessed like so
            //print "Username: " . $row['username'] . ' <br></br>Password: ' . $row['password'] . ' <br></br>Name:' . $row['name']; 
            //print "<br></br>\n"; 
        }

        //stores the last used row from result
        //not so neccesary


        // How many records were returned?
        $match = $result->num_rows;


        // Close the results
        $result->close();
        // Close the DB connection
        $mysqli->close();

        // If there was a match, login
        if ($match == 1) {
            //store data in the session
            $_SESSION['loggedin'] = $username;
            $_SESSION['name'] = $name;
            $error = 'Logged in as ' . $_SESSION['name'];
            header("Location: successPage.php");
            //require "login_form.php";
            exit;
        }
        else {
            $error = 'Error: Incorrect username or password';
            require "login_form.php";
            exit;
        }
    }
    // Else, there was no result
    else {
        $error = 'Login Error: Please contact the system administrator.';
        require "login_form.php";
        exit;
    }
     */


}

?>

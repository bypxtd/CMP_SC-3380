<?php

require '../../inc/autoload.php';
require '../../internal/login/loginCheck.php';

// if they are logged in as an employee, send to the the employee side of the store
if (isset($_SESSION['loggedin']))
{
    if ($_SESSION['loggedin'])
    {
        header("Location: ../../internal/login/successPage.php");
        exit;
    }
}

//here it checks if there was an action specified, which it should be from the verify_form.php
$action = empty($_POST['action']) ? '' : $_POST['action'];

//here it looks to see if the login form was loaded, since the verify_form will sneakily set the action to 'do_login'
if ($action == 'do_login') {
    handle_login();
} else {
    //if not loaded, call function to load form
    include 'verify_form.php';
    exit;
}

function handle_login()
{
    require '../../internal/login/loginCheck.php';

    // post data
    $username = empty($_POST['username']) ? '' : $_POST['username'];
    $companyid = empty($_POST['CompanyID']) ? '' : $_POST['CompanyID'];

    include '../../inc/utils.php';
    $mysqli = openDB();

    // no injections plz
    //$username = $mysqli->real_escape_string($username);
    //$companyid = $mysqli->real_escape_string($companyid);

    // select person, outer join with Customer
    $stmt = $mysqli->stmt_init();
    if (!$stmt->prepare("SELECT Person.UserID, CompanyID, FirstName, LastName, Graveyard
        FROM Person
        JOIN Customer
        ON Customer.UserID=Person.UserID
        WHERE Person.UserID=?"))
    {
        echo "Error preparing statement: <br>";
        echo nl2br(print_r($stmt->error_list, true), false);
        exit;
    }

    // bind them
    if (!$stmt->bind_param('s', $username))
    {
        echo "Error binding parameters: <br>";
        echo nl2br(print_r($stmt->error_list, true), false);
        exit;
    }

    // execute
    $stmt->execute();

    // get results
    $result = $stmt->get_result();

    // fail if username and companyid doesn't match
    if ($result->num_rows != 1)
    {
        $error = 'UserID incorrect. <br> Note: New accounts are only created when reserving a rail car for the first time.';
        include 'verify_form.php';
        exit;
    }

    // get row from result
    $row = $result->fetch_assoc();

    // get UserID and hashed password into variables
    $UserID = $row['UserID'];
    $CompanyID = $row['CompanyID'];
    $firstname = $row['FirstName'];
    $lastname = $row['LastName'];
    $roles = '';   // no roles
    $deleted = $row['Graveyard'] == 1 ? true : false;


    // fail if companyid doesn't match
    if ($CompanyID !== $companyid)
    {
        $error = 'Company ID does not match.';
        include 'verify_form.php';
        exit;
    }

    // fail if deleted
    if ($deleted)
    {
        $error = 'User deleted.  Please contact the site administrator.';
        include 'verify_form.php';
        exit;
    }

    // put login into session
    $_SESSION['loggedin'] = false;  // NOTE: THE CUSTOMER IS NOT ABLE TO ACCESS EMPLOYEE-LEVEL STUFF DUE TO THIS BEING FALSE
    $_SESSION['name'] = $UserID;
    $_SESSION['companyid'] = $CompanyID;
    $_SESSION['firstname'] = $firstname;
    $_SESSION['lastname'] = $lastname;
    $_SESSION['roles'] = $roles;
    $_SESSION['person'] = serialize(Customer::open($UserID));

    // redirect to previous page
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}
?>

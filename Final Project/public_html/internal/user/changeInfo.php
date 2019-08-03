<?php
require '../../inc/autoload.php';
require '../login/loginCheck.php';

//if(!$_SESSION['loggedin'])
//{
//    header("Location: ../login/login.php");
//    exit;
//}
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
    // values to change (default from session)
    $firstname = empty($_POST['firstname']) ? $employee->firstName : $_POST['firstname'];
    $lastname = empty($_POST['lastname']) ? $employee->lastName: $_POST['lastname'];
    $role = empty($_POST['role']) ? $employee->authentication->roles : $_POST['role'];

    $password_confirm = !isset($_POST['password_confirm']) ? '' : $_POST['password_confirm'];

    // verify password
    if ( !( $employee->authentication->validate($password_confirm) ) ) {
        $message = 'Password invalid.';
        include "changePassword_form.php";
        exit;
    }

    if ($employee->authentication->roles == 'a') {
        // admin cannot change their own role
        $role = 'a';
    }
    
    // either change role or just update
    if ($employee->authentication->roles !== $role) {
        // change role
        switch ($role) {
            case 'e':
                // save in engineer tables
                $employee->authentication->roles = $role;
                $engineer = new Engineer($employee->userID, $firstname, $lastname, $employee->graveyard, $employee->authentication, $employee->status, $employee->rank, 0);
                if (!$engineer->save()) {
                    $message = "Couldn't save.";
                    include 'changeInfo_form.php';
                    exit;
                }

                // delete from conductor
                $query = new QuerySingle('Conductor');
                if (!$query->deleteByPK($employee->userID)) {
                    $message = "Couldn't delete.";
                    include 'changeInfo_form.php';
                    exit;
                }
                break;
            case 'c':
                // save in conductor tables
                $employee->authentication->roles = $role;
                $conductor = new Conductor($employee->userID, $firstname, $lastname, $employee->graveyard, $employee->authentication, $employee->status, $employee->rank);
                if (!$conductor->save()) {
                    $message = "Couldn't save.";
                    include 'changeInfo_form.php';
                    exit;
                }

                // delete from engineer
                $query = new QuerySingle('Engineer');
                if (!$query->deleteByPK($employee->userID)) {
                    $message = "Couldn't delete.";
                    include 'changeInfo_form.php';
                    exit;
                }
                break;
            default:
                break;
        }
    } else {
        // just update
        $employee->firstName = $firstname;
        $employee->lastName = $lastname;
        if (!$employee->save()) {
            $message = "Couldn't save.";
            include 'changeInfo_form.php';
            exit;
        }
    }

    // update log in info
    $_SESSION['person'] = serialize($employee);

    // redirect to user page
    header("Location: /~GROUP14/internal/user/userPage.php");
    exit;

    //change_info();
} else {
    include 'changeInfo_form.php';
    exit;
}

/**
 * Changes info based on values in POST and SESSION
 * including transfering c <-> e
 */
//function change_info()
//{
//    require '../login/loginCheck.php';
//
//    // values to change (default is session's values)
//    $firstname = empty($_POST['firstname']) ? $_SESSION['firstname'] : $_POST['firstname'];
//    $lastname = empty($_POST['lastname']) ? $_SESSION['lastname'] : $_POST['lastname'];
//    $role = empty($_POST['role']) ? $_SESSION['roles'] : $_POST['role'];
//
//    $password_confirm = !isset($_POST['password_confirm']) ? '' : $_POST['password_confirm'];
//
//    // return if empty
//    if (empty($_POST['firstname']) && empty($_POST['lastname']) && empty($_POST['role']))
//    {
//        $message = 'Nothing changed.';
//        include 'changeInfo_form.php';
//        exit;
//    }
//
//    // admin cannot change their own role
//    if ($_SESSION['roles'] == 'a')
//        $role = 'a';
//
//    // build query(s)
//
//    // build person query
//    $query_person = 'UPDATE Person SET FirstName=?, LastName=? WHERE UserID=?';  // query for person table
//    if (empty($_POST['firstname']) && empty($_POST['lastname']))
//        unset($query_person);    // no query if no changes
//
//    // build employee queries
//    switch ($role)
//    {
//        case 'a':
//            break;
//        case 'e':
//            $query_auth = 'UPDATE Authentication SET Roles = "e" WHERE UserID = ?';   // query for auth table
//            $query_cond = 'DELETE FROM Conductor WHERE UserID = ?';     // query for conductor table
//            $query_eng = 'INSERT INTO Engineer (UserID) VALUES (?) ON DUPLICATE KEY UPDATE UserID=UserID';    // query for engineer table
//            $query_new_hist = 'INSERT INTO EngineerHistory (UserID, TrainNumber) SELECT UserID, TrainNumber FROM ConductorHistory WHERE UserID=?';  // query for engineer history
//            $query_old_hist = 'DELETE FROM ConductorHistory WHERE UserID = ?';    // query for conductor history
//            break;
//        case 'c':
//            $query_auth = 'UPDATE Authentication SET Roles = "c" WHERE UserID = ?';
//            $query_cond = 'INSERT INTO Conductor (UserID) VALUES (?) ON DUPLICATE KEY UPDATE UserID=UserID';
//            $query_eng = 'DELETE FROM Engineer WHERE UserID = ?';
//            $query_new_hist = 'INSERT INTO ConductorHistory (UserID, TrainNumber) SELECT UserID, TrainNumber FROM EngineerHistory WHERE UserID=?';  // query for conductory history
//            $query_old_hist = 'DELETE FROM EngineerHistory WHERE UserID = ?';   // query for engineer history
//            break;
//        default:
//            $message = 'Role selection is invalid.';
//            include 'changeInfo_form.php';
//            exit;
//    }
//
//    // build query array
//    $queries = array();
//    // person query could be unset on no changes
//    if (isset($query_person))
//        $queries['Person'] = $query_person;
//    // only add role changes if the option is different from SESSION
//    if ($role != $_SESSION['roles'])
//    {
//        if (isset($query_auth))
//            $queries['Authentication'] = $query_auth;
//        if (isset($query_cond))
//            $queries['Conductor'] = $query_cond;
//        if (isset($query_eng))
//            $queries['Engineer'] = $query_eng;
//        // NOTE: NEW HISTORY MUST BE INSERTED BEFORE OLD IS DELETED
//        if (isset($query_new_hist))
//            $queries['NewHistory'] = $query_new_hist;
//        if (isset($query_old_hist))
//            $queries['OldHistory'] = $query_old_hist;
//    }
//
//    require '../../inc/utils.php';
//    $mysqli = openDB();
//
//    $firstname = $mysqli->real_escape_string($firstname);
//    $lastname = $mysqli->real_escape_string($lastname);
//    $role = $mysqli->real_escape_string($role);
//    $password_confirm = $mysqli->real_escape_string($password_confirm);
//
//    // confirm password must match
//    // function from utils.php
//    if (!db_password_verify($_SESSION['name'], $password_confirm))
//    {
//        $message = "Password incorrect.";
//        include 'changeInfo_form.php';
//        exit;
//    }
//
//    // destroy unhashed password
//    unset($_POST['password_confirm']);
//    unset($password_confirm);
//
//    // prepare statements
//    // note there is a corner case for Person query
//    foreach ($queries as $key => $query)
//    {
//        $stmt = $mysqli->stmt_init();
//        if (!$stmt->prepare($query))
//        {
//            echo "Error preparing statement: <br>";
//            echo nl2br(print_r($stmt->error_list, true), false);
//            return;
//        }
//
//        // bind username
//        // or bind firstname, lastname, username for Person query
//        if ($key == 'Person')
//            $x = $stmt->bind_param('sss', $firstname, $lastname, $_SESSION['name']);
//        else
//            $x = $stmt->bind_param('s', $_SESSION['name']);
//        if (!$x)
//        {
//            echo "Error binding parameters: <br>";
//            echo nl2br(print_r($stmt->error_list, true), false);
//            return;
//        }
//
//        // query database
//        if (!$stmt->execute())
//        {
//            echo "Error executing query: <br>";
//            echo nl2br(print_r($stmt->error_list, true), false);
//            return;
//        }
//
//        // done
//
//        // log action
//        if ($query[0] == 'I')
//            $actionkey = "InsertUser{$key}";
//        else if ($query[0] == 'U')
//            $actionkey = "UpdateUser{$key}Values";
//        else if ($query[0] == 'D')
//            $actionkey = "DeleteUser{$key}";
//        makeLog($actionkey);
//    }
//
//    // update SESSION info
//    $_SESSION['firstname'] = $firstname;
//    $_SESSION['lastname'] = $lastname;
//    $_SESSION['roles'] = $role;
//    $person = unserialize($_SESSION['person']);
//    $person->firstName = $firstname;
//    $person->lastName = $lastname;
//    $person->authentication->roles = $role;
//    $_SESSION['person'] = serialize($person);
//
//    // redirect to user page
//    header("Location: /~GROUP14/internal/user/userPage.php");
//    exit;
//}

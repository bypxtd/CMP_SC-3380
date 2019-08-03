<?php

require '../../../inc/autoload.php';
require '../adminCheck.php';

if (!isset($_REQUEST['name']))
{
    include '../getFail.php';
    exit;
}


$auth = Authentication::open($_REQUEST['name']);

// if not in auth table, try to open customer
if (!$auth) {
    $person = Customer::open($_REQUEST['name']);

    if (!$person) {
        include '../getFail.php';
        exit;
    }
} else {
    // open relevant employee
    switch ($auth->roles) {
        case 'a':
            $person = Administrator::open($auth->userID);
            break;
        case 'c':
            $person = Conductor::open($auth->userID);
            break;
        case 'e':
            $person = Engineer::open($auth->userID);
            break;
        default:
            die('error.');
    }
}

// update database if form is submitted
if (isset($_POST['submit'])) {
    // update and save person
    $person->firstName = $_POST['FirstName'];
    $person->lastName = $_POST['LastName'];
    $person->save();

    $message = '<span class="good">Information updated.</span>';
}

?>
<!DOCTYPE html>
<html lang="en">
    <head>
<?php include '../../../inc/meta.php'; ?>
        <title>Edit User Info | Missouri Rail</title>
    </head>
    <body>
<?php include '../../../inc/header.php'; ?>
        <main>
            <h1>Edit User Info</h1>
            <aside><a href="index.php">&#8617;Back</a></aside>
            <p class="flow-text">UserID: <strong><?= $person->userID ?></strong></p>

            <form action="changeUserInfo.php" method="POST">
                <input type="hidden" name="name" value="<?= $person->userID ?>">
                <fieldset>
                    <legend>New info</legend>

                    <label for="FirstName">First Name</label>
                    <input type="text" name="FirstName" value="<?= $person->firstName ?>" id="FirstName"> <br>

                    <label for="LastName">Last Name</label>
                    <input type="text" name="LastName" value="<?= $person->lastName ?>" id="LastName"> <br>

<?php
switch (get_class($person)) {
    case 'Engineer':
        echo <<<HTML
                    <label for="Hours">Hours</label>
                    <input type="number" name="Hours" value="{$person->hours}" id="Hours">
HTML;
        /* PASSTHROUGH */
    case 'Conductor':
        echo <<<HTML

                    <br> <input type="radio" name="Status" value="1" id="active" 
HTML;
        if ($person->status) {
            echo 'checked';
        }
        
        echo <<<HTML
>
                    <label for="active">Active</label>

                    <input type="radio" name="Status" value="0" id="inactive"
HTML;
        if (!$person->status) {
            echo 'checked';
        }
        
        echo <<<HTML
>
                    <label for="inactive">Inactive</label> <br>

                    <input type="radio" name="Rank" value="senior" id="senior" 
HTML;
        if ($person->rank === 'senior') {
            echo 'checked';
        }
        
        echo <<<HTML
>
                    <label for="senior">Senior</label>

                    <input type="radio" name="Rank" value="junior" id="junior"
HTML;
        if ($person->rank === 'junior') {
            echo 'checked';
        }
        
        echo <<<HTML
>
                    <label for="junior">Junior</label>
HTML;
        break;
    case 'Customer':
        echo <<<HTML
                    <label for="CompanyID">CompanyID</label>
                    <input type="text" name="CompanyID" id="CompanyID" value="{$person->companyID}">
HTML;
        break;
    case 'Administrator':
    default:
        break;
}
?>

<?php
echo isset($message) ? $message : '';
?>

                    <br> <input type="submit" name="submit" value="Submit">
                    <input type="reset" name="reset" value="Reset to current info">
                </fieldset>
                <fieldset>
                    <legend>Old info</legend>

<?php
echo 'Name: <strong>' . $person->getName() . '</strong><br>';
switch (get_class($person)) {
    case 'Engineer':
        echo 'Hours: <strong>' . $person->hours . '</strong><br>';
        /* PASSTHROUGH */
    case 'Conductor':
        echo 'Status: <strong>' . ($person->status ? 'Active' : 'Inactive') . '</strong><br>';
        echo 'Rank: <strong>' . $person->rank . '</strong><br>';
        break;
    case 'Customer':
        echo 'CompanyID: <strong>' . $person->companyID . '</strong><br>';
        break;
    case 'Administrator':
    default:
        break;
}
?>

                </fieldset>
            </form>
        </main>
<?php include '../../../inc/footer.php'; ?>
    </body>
</html>

<?php

require '../adminCheck.php';

function getUserData($UserID)
{
    require '../../../inc/utils.php';
    $mysqli = openDB();

    // prepare statement
    // left outer join to get customers too (NULL in authentication)
    $stmt = $mysqli->stmt_init();
    if (!$stmt->prepare("SELECT Person.UserID, Roles, FirstName, LastName, Graveyard
        FROM Person
        LEFT OUTER JOIN Authentication
        ON Authentication.UserID=Person.UserID
        WHERE Person.UserID=?"))
    {
        echo "Error preparing statement: <br>";
        echo nl2br(print_r($stmt->error_list, true), false);
        return;
    }

    // bind parameters
    if (!$stmt->bind_param('s', $UserID))
    {
        echo "Error binding parameters: <br>";
        echo nl2br(print_r($stmt->error_list, true), false);
        return;
    }

    // execute statement
    if (!$stmt->execute())
    {
        echo "Error executing statement: <br>";
        echo nl2br(print_r($stmt->error_list, true), false);
        return;
    }

    // get results from query
    if (!$result = $stmt->get_result())
    {
        echo "Error getting result: <br>";
        echo nl2br(print_r($stmt->error_list, true), false);
        return;
    }

    if ($result->num_rows != 1)
    {
        echo "UserID incorrect. ";
        return false;
    }

    $row = $result->fetch_assoc();

    return $row;
}

// get user data as an array
if (!isset($_GET['name']))
{
    include '../getFail.php';
    return;
}

$data = getUserData($_GET['name']);
if (!isset($data) || !$data)
    die("UserID incorrect or database error.");

?>
<!DOCTYPE html>
<html lang="en">
    <head>
<?php include '../../../inc/meta.php'; ?>
        <title><?php echo $data['UserID']; ?> | Edit User | Missouri Rail</title>
    </head>
    <body>
<?php include '../../../inc/header.php'; ?>
        <main>
            <h1>Edit User &#8216;<?php echo $data['UserID']; ?>&#8217;</h1>
            <aside>
                <a href="index.php">&#8617;Back</a>
            </aside>
            <table>
                <thead>
                    <tr>
                        <th>Last Name</th>
                        <th>First Name</th>
                        <th>UserID</th>
                        <th>Roles</th>
                        <th>Deleted?</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><?php echo $data['LastName']; ?></td>
                        <td><?php echo $data['FirstName']; ?></td>
                        <td><?php echo $data['UserID']; ?></td>
                        <td><?php echo empty($data['Roles']) ? "Vendor (no roles)" : $data['Roles']; ?></td>
                        <td><?php echo $data['Graveyard'] ?></td>
                    </tr>
                </tbody>
            </table>
            <h2>User Options for <?php echo $data['UserID']; ?></h2>
            <p><a href="changeUserInfo.php?name=<?=$data['UserID']?>">Change User Info</a></p>
<?php
// print delete/restore options
if ($data['Graveyard'] == 0)
    echo '<p><a href="deleteUser.php?name=' . $data['UserID'] . '&do=true">Delete User</a></p>';
else
    echo '<p><a href="deleteUser.php?name=' . $data['UserID'] . '&do=false">Undelete User</a></p>';

// print reset option if the user has roles
if (isset($data['Roles']))
    echo '<p><a href="resetUserPassword.php?name=' . $data['UserID'] . '">Send Password Reset</a></p>';
?>
        </main>
<?php include '../../../inc/footer.php'; ?>
    </body>
</html>

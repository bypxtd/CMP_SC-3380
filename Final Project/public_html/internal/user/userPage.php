<?php
include '../../inc/autoload.php';
include "../login/loginCheck.php";

if(empty($_SESSION['person']))  {
    header("Location: ../login/login.php");
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
<?php include '../../inc/meta.php'; ?>
        <title><?php echo $_SESSION['name']; ?> User Page | Missouri Rail</title>
    </head>
    <body>
<?php include '../../inc/header.php'; ?>
        <main>
            <h1><?php echo $_SESSION['name']; ?></h1>
            <h2>User Options</h2>
            <p><a href="changePassword.php">Change Password</a></p>
            <p><a href="changeInfo.php">Change Personal Information</a></p>
            <p><a href="/~GROUP14/log.php">View Log for <strong><?php echo $_SESSION['name']; ?></strong></a></p>
            <?php
if ($_SESSION['roles'] == 'a')
{
    echo "<div class='alert alert-info'><strong>Notice: {$_SESSION['name']}</strong> is an administrator.";
    echo " <a href='/~GROUP14/internal/admin/' class='alert-link'>Admin Tools</a></div>\n";
}
?>
            <p><a href="/~GROUP14/internal/login/logout.php" class="logout">log out</a></p>
            <h2>Current Login Data</h2>
            <pre><?php echo unserialize($_SESSION['person']); ?></pre>
        </main>
<?php include '../../inc/footer.php'; ?>
    </body>
</html>

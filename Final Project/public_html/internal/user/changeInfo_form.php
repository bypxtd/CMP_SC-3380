<!DOCTYPE html>
<html lang="en">
    <head>
<?php include '../../inc/meta.php'; ?>
        <title>Change Info | Missouri Rail</title>
    </head>
    <body>
<?php include '../../inc/header.php'; ?>
        <main>
            <h1>Change Info</h1>
            <aside><a href="userPage.php">&#8617;Back</a></aside>
            <p class="flow-text">Username: <strong><?php echo unserialize($_SESSION['person'])->userID; ?></strong></p>
            <form action="changeInfo.php" method="POST">
                <fieldset>
                    <legend>New Info (empty boxes will remain unchanged)</legend>
                    <input type="hidden" name="action" value="do">

                    <input type="text" name="firstname" placeholder="First Name" autofocus><br>
                    <input type="text" name="lastname" placeholder="Last Name"><br>

                    <input type="radio" name="role" id="conductor" value="c" <?php if (unserialize($_SESSION['person'])->authentication->roles == 'a') echo 'disabled'; ?>>
                    <label for="conductor">Conductor</label>

                    <input type="radio" name="role" id="engineer" value="e" <?php if (unserialize($_SESSION['person'])->authentication->roles == 'a') echo 'disabled'; ?>>
                    <label for="engineer" >Engineer</label><br>

                    <input type="password" name="password_confirm" id="password_confirm" required placeholder="Enter your password"><br>

<?php echo isset($message) ? '<div class="alert alert-info">' . $message . '</div>' : ''; ?>

                    <br> <input type="submit" name="submit" value="Submit">
                    <input type="reset" name="reset" value="Reset">
                </fieldset>
                <fieldset>
                    <legend>Current Info</legend>
                    <input type="text" value="<?php echo unserialize($_SESSION['person'])->firstName; ?>" disabled><br>
                    <input type="text" value="<?php echo unserialize($_SESSION['person'])->lastName; ?>" disabled><br>

                    <input type="radio" id="current_role" disabled>
<?php
echo "<label for='current_role' style='cursor: default;'>";
switch (unserialize($_SESSION['person'])->authentication->roles)
{
    case 'c':
        echo "Conductor";
        break;
    case 'e':
        echo "Engineer";
        break;
    case 'a':
        echo "Administrator (cannot change role)";
        break;
}
echo "</label>";
?>
                </fieldset>
            </form>
            <p><a href="changePassword.php">Click here to change password</a></p>
        </main>
<?php include '../../inc/footer.php'; ?>
    </body>
</html>

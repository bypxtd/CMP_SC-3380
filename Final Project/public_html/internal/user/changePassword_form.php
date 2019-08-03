<!DOCTYPE html>
<html lang="en">
    <head>
<?php include '../../inc/meta.php'; ?>
        <title>Change Password | Missouri Rail</title>
    </head>
    <body>
<?php include '../../inc/header.php'; ?>
        <main>
            <h1>Change Password</h1>
            <aside><a href="userPage.php">&#8617;Back</a></aside>
<?php
if (isset($_SESSION['warning']) && $_SESSION['warning'] == 'changePassword')
{
    echo '<div class="alert alert-warning">You must change your password.</div>';
}
?>
            <form action="changePassword.php" method="POST">
                <fieldset>
                    <legend>Change Password</legend>
                    <input type="hidden" name="action" value="do">
                    <input type="password" name="oldpassword" id="oldpassword" placeholder="Old Password"><br>
                    <input type="password" name="newpassword" id="newpassword" required placeholder="New Password">
                    <input type="password" name="newpassword_confirm" id="newpassword_confirm" required placeholder="Confirm New Password">
<?php echo isset($message) ? '<div class="alert alert-info">' . $message . '</div>' : ''; ?>
                    <br> <input type="submit" name="submit" value="Submit">
                </fieldset>
            </form>
        </main>
<?php include '../../inc/footer.php'; ?>
    </body>
</html>

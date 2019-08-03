<!DOCTYPE html>
<html lang="en">

        <head>
<?php include '../../inc/meta.php'; ?>
        <title>Create User</title>

    </head>

        <body>
<?php include '../../inc/header.php'; ?>
        <main>
        <form action="createUser.php" method="POST">
            <fieldset>
                <legend>Create New User</legend>
                <input type="hidden" name="action" value="make_new">

                <input type="text" name="firstname" placeholder="First Name" autofocus required>
                <input type="text" name="lastname" placeholder="Last Name" required><br>

                <input type="text" name="username" placeholder="Username" required><br>

                <input type="password" name="password" placeholder="Password" required><br>
                <input type="password" name="password_confirm" placeholder="Confirm Password" required><br>

                <fieldset>
                    <legend>Choose a role</legend>
                    <input type="radio" name="role" id="conductor" value="c">
                    <label for="conductor">Conductor</label>

                    <input type="radio" name="role" id="engineer" value="e">
                    <label for="engineer">Engineer</label>
                </fieldset>

                <br>

                <input type="password" id="secret" name="secret" placeholder="Secret Code">

<?php
if (isset($error)) {
    echo "<p class='flow-text'>$error</p>\n";
}
else {
    echo "<p class='flow-text'>Error.</p>\n";
}
?>

                <br><input type="submit" name="submit" value="Create User">
            </fieldset>

        </form>
        <p><a href="/~GROUP14/internal/login/login.php">Click Here to Login!</a></p>
        </main>
<?php include '../../inc/footer.php'; ?>
    </body>
</html>

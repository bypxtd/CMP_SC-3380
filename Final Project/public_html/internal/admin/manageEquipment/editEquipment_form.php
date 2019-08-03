<!DOCTYPE html>
<html lang="en">
    <head>
<?php include '../../../inc/meta.php'; ?>
        <title>View Equipment | Missouri Rail</title>
    </head>
    <body>
<?php include '../../../inc/header.php'; ?>
        <main>
            <h1>View Equipment</h1>
            <aside>
                <a href="index.php">&#8617;Back</a>
            </aside>
            <p>Serial Number: <strong><?php echo $_REQUEST['SerialNumber']; ?></strong></p>
            <p>Current Location: <strong><?php echo Equipment::getLocation($_REQUEST['SerialNumber'])['Name']; ?></strong></p>
            <form action="editEquipment.php?SerialNumber=<?php echo $_REQUEST['SerialNumber']; ?>" method="POST">
                <fieldset>
                    <legend>Current Info</legend>
                    <input type="text" value="<?php echo Equipment::getType($_REQUEST['SerialNumber']); ?>" disabled>
                    <input type="text" value="<?php echo Equipment::getManufacturer($_REQUEST['SerialNumber']); ?>" disabled>
                    <input type="number" step="any" value="<?php echo Equipment::getPrice($_REQUEST['SerialNumber']); ?>" disabled>
                </fieldset>
                <fieldset>
                    <legend>Change Info (blank will be left unchanged)</legend>

                    <input type="hidden" name="action" value="do">

                    <select name="Type">
                        <option selected disabled hidden value="">Select Type</option>
<?php Equipment::displayOptions(); ?>
                    </select><br>

                    <input type="text" name="Manufacturer" placeholder="Manufacturer">
                    <input type="number" step="any" name="Price" placeholder="Price"> <br>

<?php echo (!empty($message)) ? $message : ''; ?>
                    <input type="submit" name="submit" value="Submit">
                    <input type="reset" name="reset" value="Reset">
                </fieldset>
            </form>
        </main>
<?php include '../../../inc/footer.php'; ?>
    </body>
</html>

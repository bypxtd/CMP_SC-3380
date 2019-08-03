<!DOCTYPE html>
<html lang="en">
    <head>
<?php include "/home/GROUP14/public_html/inc/meta.php"; ?>
        <title>Create Equipment | Missouri Rail</title>
    </head>
    <body>
<?php include "/home/GROUP14/public_html/inc/header.php"; ?>
        <main>
            <h1>Create Equipment</h1>
            <aside><a href="index.php">&#8617;Back</a></aside>
            <form action="createEquipment.php" method="POST">
                <fieldset>
                    <legend>Enter data</legend>
                    <input type="hidden" name="action" value="do">

                    <input type="number" name="SerialNumber" placeholder="Serial Number" autofocus required>
                    <select name="Type" required>
                        <option selected disabled hidden value="">Select Type</option>
<?php Equipment::displayOptions(); ?>
                    </select><br>
                    <input type="text" name="Manufacturer" placeholder="Manufacturer" required>
                    <input type="number" name="Price" placeholder="Price" step="any" required><br>
                </fieldset>
                <fieldset>
                    <legend>Create multiple (SerialNumber will be incremented)</legend>
                    <input type="number" name="Quantity" placeholder="Quantity" min="0"><br>
<?php echo isset($message) ? $message : ''; ?>
                    <input type="submit" name="submit" value="Submit">
                </fieldset>
            </form>
        </main>
<?php include "/home/GROUP14/public_html/inc/footer.php"; ?>
    </body>
</html>

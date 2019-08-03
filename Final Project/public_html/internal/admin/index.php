<?php
require '../../inc/autoload.php';
require 'adminCheck.php';
?>
<!DOCTYPE html>
<html lang="en">
    <head>
<?php include '../../inc/meta.php'; ?>
        <title>Admin Tools | Missouri Rail</title>
    </head>
    <body>
<?php include '../../inc/header.php'; ?>
        <main>
            <h1>Administrator Tools</h1>
            <h2><a href="manageUsers/">Manage Users</a></h2>
            <p><ul>
                <li>Edit Users (Engineers, Conductors, Vendors)</li>
                <li>Delete Users</li>
                <li>Send Password Reset</li>
            </ul></p>
            <h2><a href="manageEquipment/">Manage Equipment</a></h2>
            <p><ul>
                <li>Add equipment to master list</li>
            </ul></p>
            <h2><a href="manageTrains/">Manage Trains</a></h2>
            <p><ul>
                <li>Add Trains to Schedule</li>
                <li>Edit Schedule</li>
                <li>Assign conductors/engineers to Trains</li>
            </ul></p>
        </main>
<?php include '../../inc/footer.php'; ?>
    </body>
</html>

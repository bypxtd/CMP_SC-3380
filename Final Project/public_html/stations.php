<?php
require 'inc/autoload.php';
require 'internal/login/loginCheck.php';
?>
<!DOCTYPE html>
<html lang="en">
    <head>
<?php include 'inc/meta.php'; ?>
        <title>Stations | Missouri Rail</title>
    </head>
    <body>
<?php include 'inc/header.php'; ?>
        <main>
            <h1>Station list</h1>
            <p class="flow-text">With so many stations, our brave, wonderful company is known around the world as "The Rail". Having such a general name,
            	there should be no doubt we are the best. Take a look at our many locations we operate out of and gasp in awe.</p>
            <div id="station-list">
<?php
$query = new QuerySingle('Location');

$query->displayAll();
?>
            </div>
        </main>
<?php include 'inc/footer.php'; ?>
    </body>
</html>

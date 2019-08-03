<?php
include '../../../inc/autoload.php';
include '../adminCheck.php';
?>
<!DOCTYPE html>
<html lang="en">
    <head>
<?php include '../../../inc/meta.php'; ?>
        <title>Manage Trains | Missouri Rail</title>
    </head>
    <body>
<?php include '../../../inc/header.php'; ?>
        <main>
            <h1>Manage Trains</h1>
            <aside><a href="../">&#8617;Back</a></aside>
            <aside>
                <a href="createTrain.php">Create Train</a>
            </aside>
<?php
$query = new QuerySingle('Train');

$query->displayAll(true, array('update' => 'editTrain.php'));
?>
        </main>
<?php include '../../../inc/footer.php'; ?>
    </body>
</html>

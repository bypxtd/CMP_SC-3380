<?php
include '../../../inc/autoload.php';
include '../adminCheck.php';

function list_equipment()
{
    include '../../../inc/utils.php';
    $mysqli = openDB();

    $query = "SELECT SerialNumber, Type, Manufacturer, Price
        FROM Equipment";

    display_table($mysqli, $query, "Equipment");

}

?>
<!DOCTYPE html>
<html lang="en">
    <head>
<?php include '../../../inc/meta.php'; ?>
        <title>Manage Equipement | Missouri Rail</title>
    </head>
    <body>
<?php include '../../../inc/header.php'; ?>
        <main>
            <h1>Manage Equipment</h1>
            <aside><a href="../">&#8617;Back</a></aside>
            <aside>
                <a href="createEquipment.php">Add New</a>
            </aside>
            <div id="equipment-list">
<?php
$query = new QuerySingle('Equipment');

$query->displayAll(true, array('update' => 'editEquipment.php'));

//list_equipment();
?>
            </div>
        </main>
<?php include '../../../inc/footer.php'; ?>
    </body>
</html>

<?php
include '../../../inc/autoload.php';
include '../adminCheck.php';
?>
<!DOCTYPE html>
<html lang="en">
    <head>
<?php include '../../../inc/meta.php'; ?>
        <title>Edit Train | Missouri Rail</title>
    </head>
    <body>
<?php include '../../../inc/header.php'; ?>
        <main>
            <h1>Edit Train</h1>
            <aside>
                <a href="index.php">&#8617;Back</a>
            </aside>
<?php
if (isset($_POST['update'])) {
    $train = Train::open($_POST['TrainNumber']);
    echo '<pre>' . $train . '</pre>';
    echo <<<HTML
            <form action="editTrain.php" method="POST">
                <fieldset>
                    <legend>Enter new data</legend>
                    <label for="TrainNumber">Train Number</label>
                    <input type="text" id="TrainNumber" value="{$train->trainNumber}" readonly>
                    <input type="hidden" name="TrainNumber" value="{$train->trainNumber}" readonly>

                    <label for="DepartureDate">Departure Date</label>
                    <input type="text" name="DepartureDate" id="DepartureDate" value="{$train->departureDate}">

                    <label for="DepartureTime">Departure Time</label>
                    <input type="text" name="DepartureTime" id="DepartureTime" value="{$train->departureTime}">

                    <br><input type="submit" name="submit" value="Submit">
                </fieldset>
                <fieldset>
                    <legend>Existing data</legend>
                    <input type="text" value="{$train->trainNumber}" readonly>
                    <input type="text" value="{$train->departureDate}" readonly>
                    <input type="text" value="{$train->departureTime}" readonly>
                </fieldset>
            </form>
HTML;
} elseif (isset($_POST['submit'])) {
    $train = Train::open($_POST['TrainNumber']);
    $train->departureDate = $_POST['DepartureDate'];
    $train->departureTime = $_POST['DepartureTime'];
    $train->save();
    echo '<span class="good">Train successfully updated.</span>';
} else {
    echo 'No train specified.';
}
?>
        </main>
<?php include '../../../inc/footer.php'; ?>
    </body>
</html>

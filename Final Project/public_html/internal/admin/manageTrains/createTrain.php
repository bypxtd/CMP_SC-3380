<?php
include '../../../inc/autoload.php';
include '../adminCheck.php';
?>
<!DOCTYPE html>
<html lang="en">
    <head>
<?php include '../../../inc/meta.php'; ?>
        <title>Create Train | Missouri Rail</title>
    </head>
    <body>
<?php include '../../../inc/header.php'; ?>
        <main>
            <h1>Create Train</h1>
            <aside>
                <a href="index.php">&#8617;Back</a>
            </aside>
<?php
if (isset($_POST['submit'])) {
    // save train
    if (!($train = Train::init($_POST['DepartureTime'], $_POST['DepartureDate']))) {
        trigger_error(
            'Could not initialize a train.',
            E_USER_ERROR
        );
    }
    $train->save();

    // save personnel
    foreach ($_POST['engineers'] as $eid) {
        if (!($engineer = Engineer::open($eid))) {
            trigger_error(
                'Invalid UserID: ' . $eid,
                E_USER_NOTICE);
            continue;
        }
        $engineer->saveHistory($train->trainNumber);
    }
    foreach ($_POST['conductors'] as $cid) {
        if (!($conductor = Conductor::open($cid))) {
            trigger_error(
                'Invalid UserID: ' . $cid,
                E_USER_NOTICE);
            continue;
        }
        $conductor->saveHistory($train->trainNumber);
    }

    // save route
    if (!($departure = Location::open(unserialize($_POST['departure'])))) {
        trigger_error(
            'Invalid location data: ' . $_POST['departure'],
            E_USER_NOTICE);
    } else {
        $departure->saveDeparture($train->trainNumber);
    }

    if (!($destination = Location::open(unserialize($_POST['destination'])))) {
        trigger_error(
            'Invalid location data: ' . $_POST['departure'],
            E_USER_NOTICE);
    } else {
        $destination->saveDestination($train->trainNumber);
    }

    // save locomotives
    foreach ($_POST['engines'] as $id) {
        if (!($engine = Equipment::open($id))) {
            trigger_error(
                'Invalid serial number: ' . $id,
                E_USER_NOTICE
            );
            continue;
        }
        $engine->saveEngineHistory($train->trainNumber);
    }

    echo 'Train saved.';
} else {
    echo <<<HTML
            <form action="createTrain.php" method="POST" class="vertical-form">
                <fieldset>
                    <legend>Train info</legend>

                    <label for="DepartureDate">Departure Date</label>
                    <input type="date" name="DepartureDate" id="DepartureDate" placeholder="YYYY-MM-DD">

                    <label for="DepartureTime">Departure Time</label>
                    <input type="time" name="DepartureTime" id="DepartureTime" placeholder="HH:MM:SS">
                </fieldset>
                <fieldset>
                    <legend>Add Personnel</legend>

                    <label for="engineers">Engineers</label>
                    <select name="engineers[]" id="engineers" multiple>

HTML;

    $query = new QuerySingle('Engineer');

    if (!($result = $query->selectAll()) || $result->num_rows < 1) {
        echo "<option selected value=''>No Engineers Available</option>\n";
    } else {
        while ($row = $result->fetch_assoc()) {
            $engineer = Engineer::open($row['UserID']);
            echo "<option value='{$engineer->userID}'>{$engineer->getName()}</option>\n";
        }
    }

    echo <<<HTML
                    </select>

                    <label for="conductors">Conductors</label>
                    <select name="conductors[]" id="conductors" multiple>

HTML;

    $query = new QuerySingle('Conductor');

    if (!($result = $query->selectAll()) || $result->num_rows < 1) {
        echo "<option selected value=''>No Conductors Available</option>\n";
    } else {
        while ($row = $result->fetch_assoc()) {
            $conductor = Conductor::open($row['UserID']);
            echo "<option value='{$conductor->userID}'>{$conductor->getName()}</option>\n";
        }
    }

    echo <<<HTML
                    </select>
                </fieldset>
                <fieldset>
                    <legend>Route</legend>

                    <label for="departure">Departure</label>
                    <select id="departure" name="departure">

HTML;

    $query = new QuerySingle('Location');

    if (!($result = $query->selectAll()) || $result->num_rows < 1) {
        echo "<option selected value=''>No Locations in Database</option>\n";
    } else {
        echo "<option selected disabled hidden value=''>Selected a departure</option>";
        while ($row = $result->fetch_assoc()) {
            if (!($location = Location::open(array('Zip' => $row['Zip'], 'Address' => $row['Address'])))) {
                echo "<option>{$query->getLink()->error}</option>";
            } else {
                echo "<option value='" . serialize($location->getPK()) . "'>{$location->name}</option>\n";
            }
        }
    }

    echo <<<HTML
                    </select>

                    <label for="destination">Destination</label>
                    <select id="destination" name="destination">

HTML;

    if (!($result) || $result->num_rows < 1) {
        echo "<option selected value=''>No Locations in Database</option>\n";
    } else {
        $result->data_seek(0);
        echo "<option selected disabled hidden value=''>Selected a destination</option>";
        while ($row = $result->fetch_assoc()) {
            if (!($location = Location::open(array('Zip' => $row['Zip'], 'Address' => $row['Address'])))) {
                echo "<option>{$query->getLink()->error}</option>";
            } else {
                echo "<option value='" . serialize($location->getPK()) . "'>{$location->name}</option>\n";
            }
        }
    }

    echo <<<HTML
                    </select>
                </fieldset>
                <fieldset>
                    <legend>Locomotives</legend>

                    <label for="engine">Locomotives avaliable (by serial number):</label>
                    <select name="engines[]" id="engine" multiple>
HTML;

    $query = new QuerySingle('Equipment');

    if (!($result = $query->selectByColName('Type', 'locomotive')) || $result->num_rows < 1) {
        echo "<option selected value=''>No Engines in Database</option>\n";
    } else {
        echo "<option selected disabled hidden value=''>Selected a locomotive</option>";
        while ($row = $result->fetch_assoc()) {
            if (!($engine = Equipment::open($row['SerialNumber']))) {
                echo "<option>Error</option>";
            } else {
                echo "<option value='{$engine->getPK()}'>{$engine->serialNumber}</option>\n";
            }
        }
    }

    echo <<<HTML
                    </select>
                </fieldset>
                <fieldset>
                    <legend>Confirm</legend>

                    <input type="submit" name="submit" value="Submit">
                </fieldset>
            </form>

HTML;
}
?>
        </main>
<?php include '../../../inc/footer.php'; ?>
    </body>
</html>

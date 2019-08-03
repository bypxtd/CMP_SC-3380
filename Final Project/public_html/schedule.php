<?php
require 'inc/autoload.php';
require 'internal/login/loginCheck.php';
?>
<!DOCTYPE html>
<html lang="en">
    <head>
<?php include 'inc/meta.php'; ?>
        <title>Train Schedule</title>
    </head>
    <body>
<?php include 'inc/header.php'; ?>
        <main>
            <h1>Train Schedule</h1>
            <p class="flow-text">Here at Missouri Rail, we strive to be right on time with everything. We are on a nonstop grind to become the best there ever was.</p>	
            <div id="schedule-list">
<?php
$query = new QuerySingle('Train');

$queryString = <<<SQL
SELECT Train.TrainNumber, Train.DepartureTime, Train.DepartureDate, Dep.Name AS depname, Dest.Name AS destname
FROM Train
INNER JOIN Departure
USING (TrainNumber)
INNER JOIN Location AS Dep
ON Dep.ZIP=Departure.ZIP AND Dep.Address=Departure.Address
INNER JOIN Destination
USING (TrainNumber)
INNER JOIN Location AS Dest
ON Dest.ZIP=Destination.ZIP AND Dest.Address=Destination.Address
WHERE Train.DepartureDate > CURRENT_DATE
SQL;

if (!($result = $query->quickQuery($queryString))) {
    echo '<span class="bad">Error retrieving train schedule.</span>';
}

$query->displayTable($result, false, array(), array('Train No.', 'Time', 'Date', 'Departing From', 'Destination'));
?>
            </div>
        <p>Note: The Missouri Rail is not responsible for any missed trains, since we have no control over time...yet</p>
        </main>
<?php include 'inc/footer.php'; ?>
    </body>
</html>

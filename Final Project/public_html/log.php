<?php
require 'inc/autoload.php';
require 'internal/login/loginCheck.php';

// decode GET and print log (for AJAX)
if (!empty($_GET['filter'])) {
    if (!$options = json_decode($_GET['filter'], true)) {
        trigger_error(
            'Error decoding json from $_GET.',
            E_USER_ERROR
        );
    }
    displayLogByRoles($options);
    exit;   // end AJAX request
}

/**
 * assembles a query
 */
function getQuery($roles, $options)
{
    $otherfilter = '';
    // hide action stuff
    if (!empty($options['hideaction'])) {
        $chars = str_split($options['hideaction']);
        for ($i = 0; $i < count($chars); $i++) {
            // add on other filters
            switch ($chars[$i]) {
                case 'u':
                    $otherfilter .= " ActionKey NOT LIKE '%User%'";
                    break;
                case 'e':
                    $otherfilter .= " ActionKey NOT LIKE '%Equip%'";
                    break;
                case 't':
                    $otherfilter .= " ActionKey NOT LIKE '%Train%'";
                    break;
                case 'l':
                    $otherfilter .= " ActionKey NOT LIKE '%Location%'";
                    break;
                case 'r':
                    $otherfilter .= " ActionKey NOT LIKE '%Reservation%'";
                    break;
            }

            // add ANDs if we have multiple filters
            if (count($chars) > 1 && $i + 1 < count($chars)) {
                $otherfilter .= ' AND';
            }
        }
    }

    // date stuff
    if (!empty($options['date'])) {
        // need an AND
        if (!empty($options['hideaction'])) {
            $otherfilter .= ' AND';
        }

        // assuming date has been parsed
        $otherfilter .= " LogDate LIKE '%{$options['date']}%'";
    }

    // limit stuff
    if (!empty($options['limit'])) {
        $limit = " LIMIT {$options['limit']}";
    }

    // order stuff
    if (!empty($options['order'])) {
        switch ($options['order']) {
        case 'a':
            $order = " ORDER BY LogNumber ASC";
            break;
        case 'd':
            $order = " ORDER BY LogNumber DESC";
            break;
        default:
            break;
        }
    }

    // build main query
    switch ($roles) {
        // select for all user id's
        case 'a':
            $query = <<<SQL
SELECT LogNumber, IP, LogDate, LogTime, ActionKey, UserID
FROM LogEntry
SQL;
            $query .= !empty($otherfilter) ? " WHERE $otherfilter" : '';
            $query .= isset($order) ? $order : '';
            $query .= isset($limit) ? $limit : '';
            return $query;
            break;
        // select based on userid (userid must be bound)
        // or all actions related to the userid
        case 'c':
        case 'e':
            $query = <<<SQL
SELECT LogNumber, IP, LogDate, LogTime, ActionKey, UserID
FROM LogEntry
WHERE (UserID=? OR ActionKey LIKE ?)
SQL;
            $query .= !empty($otherfilter) ? " AND $otherfilter" : '';
            $query .= isset($order) ? $order : '';
            $query .= isset($limit) ? $limit : '';
            return $query;
            break;
        // select all actions from a company based on a given userid
        // or all actions related to the userid
        default:
            $query = <<<SQL
SELECT LogNumber, IP, LogDate, LogTime, ActionKey, LogEntry.UserID
FROM LogEntry
WHERE (
LogEntry.UserID IN
(
    SELECT UserID
    FROM Customer
    WHERE CompanyID IN
    (
        SELECT CompanyID
        FROM Customer
        WHERE UserID=?
    )
)
OR ActionKey LIKE ?)
SQL;
            $query .= !empty($otherfilter) ? " AND $otherfilter" : '';
            $query .= isset($order) ? $order : '';
            $query .= isset($limit) ? $limit : '';
            return $query;
            break;
    }
}

// returns bound statement based on roles and userid
function getSTMT($mysqli, $roles, $userid, $options)
{
    // prepare statement based on roles
    if (!$stmt = $mysqli->prepare(getQuery($roles, $options))) {
        echo "Error preparing statement: <br>";
        echo nl2br(print_r($mysqli->error, true), false);
        exit;
    }

    // bind parameters based on roles
    switch ($roles) {
        // no parameters needed for admin query
        case 'a':
            break;
        // userid needed twice for engineers and conductors
        case 'c':
        case 'e':
            // anything that ends with a space, then the userid
            $like = '% ' . $userid;
            $stmt->bind_param('ss', $userid, $like);
            break;
        // userid needed twice for customers
        default:
            $like = '% ' . $userid;
            $stmt->bind_param('ss', $userid, $like);
            break;
    }

    // fail on error
    if ($stmt->errno) {
        echo "Error binding parameters: <br>";
        echo nl2br(print_r($stmt->error_list, true), false);
        exit;
    }

    return $stmt;
}

// displays log based on userid and roles and actiontype
// is_internal is currently an unused variable
function displayLog($roles_given, $userid_given, $options)
{
    // new database object
    include 'inc/utils.php';
    $mysqli = opendb();

    // new statement
    $stmt = getSTMT($mysqli, $roles_given, $userid_given, $options);

    // execute and store results
    if (!$stmt->execute()) {
        echo "Error executing query: <br>";
        echo nl2br(print_r($stmt->error_list, true), false);
        exit;
    }

    // bind results
    $num_rows = $stmt->num_rows;
    //if (!$stmt->bind_result($logid, $ip, $logdate, $logtime, $actionkey, $userid))
    if (!($result = $stmt->get_result())) {
        echo "Error binding results: <br>";
        echo nl2br(print_r($stmt->error_list, true), false);
        exit;
    }

    // get field names
    $metaResults = $stmt->result_metadata();
    $fields = $metaResults->fetch_fields();

    echo "Showing {$result->num_rows} results.";
    // print table header
    echo "<table>\n";
    echo "<caption class='flow-text'>Log for <strong>$userid_given</strong> with roles <strong>$roles_given</strong></caption>\n";
    echo "<thead>\n";
    echo "<tr>\n";
    foreach ($fields as $field) {
        if ($field->name == 'LogNumber') {
            echo "<th>No.</th>";
            continue;
        }
        echo "<th>$field->name</th>\n";
    }
    echo "</tr>\n";
    echo "</thead>\n";

    // print table body
    echo "<tbody>\n";
    foreach ($result as $row) {
        echo "<tr>\n";
        foreach ($row as $r) {
            echo "<td>$r</td>\n";
        }
        echo "</tr>\n";
    }
    echo "</tbody>\n";
    echo "</table>\n";
    if (isset($options['limit'])) {
        echo "<aside>Increase limit to view more results.</aside>";
    }

    // done!

    return;
}

function displayLogByRoles($options)
{
    if (isset($_SESSION['person'])) {
        $person = unserialize($_SESSION['person']);
    } else {
        $person = false;
    }

    if (!$person) {
        // guests
        echo '<pre>';
        echo 'Log is only viewable to registered employees or logged-in vendors.<br>';
        echo '<a href="store/">Return to Store</a>';
        echo '</pre>';
    } elseif (get_parent_class($person) === 'Employee') {
        // employees
        displayLog($person->authentication->roles, $person->userID, $options);
    } else {
        // vendors
        displayLog('x', $person->userID, $options);
    }
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
<?php include 'inc/meta.php'; ?>
        <title>Activity Log</title>
<script type="text/javascript">
<!--
// javascript for AJAX
function filterLog()
{
    // display loading in a span until done
    document.getElementById("ajax-message").style.opacity = 1;

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function()
    {
        if (this.readyState == XMLHttpRequest.DONE && this.status == 200) {
            // set log-list to xmlhttp's response
            document.getElementById("log-list").innerHTML = this.responseText;
            // done!
            setTimeout(function(){document.getElementById("ajax-message").style.opacity = 0;}, 50);
        }
    }

    var options = {};

    // filter
    var f = "";
    if (document.getElementById("showUsers").checked == false) {
        f += "u";
    }
    if (document.getElementById("showEquipment").checked == false) {
        f += "e";
    }
    if (document.getElementById("showTrains").checked == false) {
        f += "t";
    }
    if (document.getElementById("showLocations").checked == false) {
        f += "l";
    }
    if (document.getElementById("showReservations").checked == false) {
        f += "r";
    }
    options["hideaction"] = f;

    // date
    var d = document.getElementById("date").value;
    options["date"] = d;

    // limit
    var l = document.getElementById("limit").value;
    if (l < 1 || !l) {
        l = 0;
    } else {
        options["limit"] = l;
    }

    // ascending or descending
    if (document.getElementById("desc").checked) {
        options["order"] = 'd';
    } else if (document.getElementById("asc").checked) {
        options["order"] = 'a';
    }

    // send request, appending options
    xmlhttp.open("GET", "log.php?filter=" + JSON.stringify(options), true);
    xmlhttp.send();

}
//-->
</script>
    </head>
    <body>
<?php include 'inc/header.php'; ?>
        <main>
            <h1>Log</h1>

            <fieldset>
                <legend>Filter</legend>
                <input type="checkbox" id="showUsers" checked>
                <label for="showUsers">Show Users Log</label>

                <input type="checkbox" id="showEquipment" checked>
                <label for="showEquipment">Show Equipment Log</label>

                <input type="checkbox" id="showTrains" checked>
                <label for="showTrains">Show Trains Log</label>

                <input type="checkbox" id="showLocations" checked>
                <label for="showLocations">Show Locations Log</label>

                <input type="checkbox" id="showReservations" checked>
                <label for="showReservations">Show Reservations Log</label> <br>

                <label for="date">Restrict date:</label>
                <input type="date" id="date" value="" placeholder="YYYY-MM-DD">

                <label for="limit">Limit results:</label>
                <input type="number" id="limit" value="" min="1" max="4294967295" placeholder="LIMIT"> <br>

                <input type="radio" id="desc" value="desc" name="order">
                <label for="desc">Newest results</label>

                <input type="radio" id="asc" value="asc"  name="order" checked>
                <label for="asc">Oldest results</label> <br>

                <button onclick="filterLog()">Filter Log</button>
                <span id="ajax-message" class="whirl" style="opacity: 0">Loading...</span>

            </fieldset>
<script type="text/javascript">
<!--
    var ua = navigator.userAgent;

if (ua.match(/(msie)/i)) {
    document.write('<div class="alert alert-danger">It appears you are using Internet Explorer.  Please don\'t.</div>');
} else if (ua.match(/(firefox)/i)) {
    document.write('<div class="alert alert-danger">The date field is not supported in Firefox. Behavior may be unexpected.</div>');
}
//-->
</script>

            <div id="log-list">
<?php
displayLogByRoles(array());
?>
            </div>
        </main>
<?php include 'inc/footer.php'; ?>
    </body>
</html>

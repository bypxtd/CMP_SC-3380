<?php

/*
 * Utility functions
 */


// opens link to database using Group14's defined information
function openDB()
{

    //require '/home/GROUP14/CONFIG.php';

    // static to avoid connecting more than once
    static $mysqli;

    if (!isset($mysqli))
    {
        // open ini file as array
        $config = parse_ini_file('/home/GROUP14/config.ini.php');

        // open link to database
        $mysqli = new mysqli($config['hostname'], $config['username'], $config['password'], $config['database']);
    }

    if ($mysqli->connect_errno)
    {
        echo 'Could not connect to the database: (' . $mysqli->errno . ') ' . $mysqli->error;
        exit;
    }

    return $mysqli;
    
}

// gets client's IP
function get_client_ip() {
    $ipaddress = '';
    if (getenv('HTTP_CLIENT_IP'))
        $ipaddress = getenv('HTTP_CLIENT_IP');
    elseif(getenv('HTTP_X_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
    elseif(getenv('HTTP_X_FORWARDED'))
        $ipaddress = getenv('HTTP_X_FORWARDED');
    elseif(getenv('HTTP_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_FORWARDED_FOR');
    elseif(getenv('HTTP_FORWARDED'))
        $ipaddress = getenv('HTTP_FORWARDED');
    elseif(getenv('REMOTE_ADDR'))
        $ipaddress = getenv('REMOTE_ADDR');
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}

// inserts a row into LogEntry
// Note: there must be a 'name' in $_SESSION
function makeLog($actionKey) {

    if(!$actionKey)  {
    	echo "There is no action key!";
    	return;
    }
    
    $ip = get_client_ip();
    //$username = isset($_SESSION['name']) ? $_SESSION['name'] : '';
    $username = isset($_SESSION['person']) ? unserialize($_SESSION['person'])->userID : 'unknown username';
    
    $mysqli = openDB();

    //$query = "INSERT INTO LogEntry (UserID) SELECT UserID FROM Person WHERE UserID = ?";
    $query = "INSERT INTO LogEntry (UserID, Ip, LogDate, LogTime, ActionKey) VALUES (?, ?, CURDATE(), CURTIME(), ?)";

    // prepare statement
    if (!$stmt = $mysqli->prepare($query))
    {
        echo "Error preparing statement: <br>";
        echo nl2br(print_r($stmt->error_list, true), false);
        return;
    }

    if (!$stmt->bind_param('sss', $username, $ip, $actionKey))
    {
        echo "Error binding parameters: <br>";
        echo nl2br(print_r($stmt->error_list, true), false);
        return;
    }

    if (!$stmt->execute())
    {
        echo "Error executing query: <br>";
        echo nl2br(print_r($stmt->error_list, true), false);
        return;
    }


}

function makeLogByQuery($query)
{
    //TODO: parse query into actionkey
    makeLog($query);
}

// displays a dynamic table my querying the database
// NOTE: use prepared statements for user-input queries
function display_table($mysqli, $query, $tablename)
{

    // execute query
    if (!$result = $mysqli->query($query))
    {
        echo "Error executing statement: <br>";
        echo $mysqli->error;
        return;
    }

    // print table
    $fields = $result->fetch_fields();
    echo "\n<table>\n";
    echo "<caption>$tablename in DB</caption>\n";
    echo "<thead>\n";
    echo "<tr>\n";
    foreach ($fields as $field)
    {
        echo "<th>$field->name</th>";
    }
    echo "<tr>\n";

    echo "</thead>\n<tbody>\n";
    // get row as an array
    while ($row = $result->fetch_assoc())
    {
        echo "<tr>\n";
        foreach ($row as $key => $r)
        {
            echo '<td>';
            if ($key == 'UserID')
                echo "<a href='/~GROUP14/internal/admin/manageUsers/editUser.php?name=$r'>";
            elseif ($key == 'SerialNumber')
                echo "<a href='/~GROUP14/internal/admin/manageEquipment/editEquipment.php?SerialNumber=$r'>";
            echo $r;
            if ($key == 'UserID' || $key == 'SerialNumber')
                echo '</a>';
            echo '</td>';
        }
        echo "</tr>\n";
    }

    // close table
    echo "</tbody>\n</table>\n";

}

// verifys password against database
function db_password_verify($username, $plaintext)
{
    $mysqli = openDB();

    $stmt = $mysqli->stmt_init();
    if (!$stmt->prepare("
        SELECT UserID, Password
        FROM Authentication
        WHERE UserID=?"))
    {
        echo "Error preparing statement: <br>";
        nl2br(print_r($stmt->error_list, true), false);
        exit;
    }

    // bind parameters
    if (!$stmt->bind_param('s', $username))
    {
        echo "Error binding parameters: <br>";
        nl2br(print_r($stmt->error_list, true), false);
        exit;
    }

    // execute statement
    $stmt->execute();

    // get result
    $result = $stmt->get_result();

    // fail if username doesn't match
    if ($result->num_rows != 1)
    {
        return false;
    }

    // get row from result
    $row = $result->fetch_assoc();


    // get UserID and hashed password into variables
    $UserID = $row['UserID'];
    $HashedPassword = $row['Password'];

    // compare password with hashed password
    if (!password_verify($plaintext, $HashedPassword))
    {
        return false;
    }

    return true;
}

?>

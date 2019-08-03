<?php

// need openDB()
if (!function_exists('openDB')) {
    include '/home/GROUP14/public_html/inc/utils.php';
}

class Equipment
{
    protected static $mysqli;   // database link

    /**
     * opens a link if one's not
     * already open
     */
    protected static function openDatabase()
    {
        if (empty(self::$mysqli)) {
            self::$mysqli = openDB();
        }
    }

    /* Getter and Setter methods */

    public static function getType($serialnumber)
    {
        self::openDatabase();

        $query = 'SELECT Type FROM Equipment WHERE SerialNumber = ?';

        if (!$stmt = self::$mysqli->prepare($query)) {
            return false;
        }

        if (!$stmt->bind_param('i', $serialnumber)) {
            return false;
        }

        if (!$stmt->execute()) {
            return false;
        }

        $result = $stmt->get_result();

        $row = $result->fetch_assoc();

        return $row['Type'];
    }

    public static function setType($serialnumber, $type)
    {
        self::openDatabase();

        $query = 'UPDATE Equipment SET Type = ? WHERE SerialNumber = ?';

        if (!$stmt = self::$mysqli->prepare($query)) {
            return self::$mysqli->errno;
        }

        if (!$stmt->bind_param('si', $type, $serialnumber)) {
            return $stmt->errno;
        }

        if (!$stmt->execute()) {
            return $stmt->errno;
        }

        return;
    }

    public static function getManufacturer($serialnumber)
    {
        self::openDatabase();

        $query = 'SELECT Manufacturer FROM Equipment WHERE SerialNumber = ?';

        if (!$stmt = self::$mysqli->prepare($query)) {
            return false;
        }

        if (!$stmt->bind_param('i', $serialnumber)) {
            return false;
        }

        if (!$stmt->execute()) {
            return false;
        }

        $result = $stmt->get_result();

        $row = $result->fetch_assoc();

        return $row['Manufacturer'];
    }

    public static function setManufacturer($serialnumber, $manufacturer)
    {
        self::openDatabase();

        $query = 'UPDATE Equipment SET Manufacturer = ? WHERE SerialNumber = ?';

        if (!$stmt = self::$mysqli->prepare($query)) {
            return self::$mysqli->errno;
        }

        if (!$stmt->bind_param('si', $manufacturer, $serialnumber)) {
            return $stmt->errno;
        }

        if (!$stmt->execute()) {
            return $stmt->errno;
        }

        return;
    }

    public static function getPrice($serialnumber)
    {
        self::openDatabase();

        $query = 'SELECT Price FROM Equipment WHERE SerialNumber = ?';

        if (!$stmt = self::$mysqli->prepare($query)) {
            return false;
        }

        if (!$stmt->bind_param('i', $serialnumber)) {
            return false;
        }

        if (!$stmt->execute()) {
            return false;
        }

        $result = $stmt->get_result();

        $row = $result->fetch_assoc();

        return $row['Price'] + 0.0; // cast to float
    }

    public static function setPrice($serialnumber, $price)
    {
        if (!filter_var($price, FILTER_VALIDATE_FLOAT)) {
            return false;
        }

        $price += 0.0;  // cast to float

        self::openDatabase();

        $query = 'UPDATE Equipment SET Price = ? WHERE SerialNumber = ?';

        if (!$stmt = self::$mysqli->prepare($query)) {
            return self::$mysqli->errno;
        }

        if (!$stmt->bind_param('di', $price, $serialnumber)) {
            return $stmt->errno;
        }

        if (!$stmt->execute()) {
            return $stmt->errno;
        }

        return;
    }

    /**
     * finds the current location of a car
     * given its serial number
     */
    public static function getLocation($serialnumber)
    {
        self::openDatabase();

        $query = <<<SQL
SELECT Name, Address, City, State, ZIP
FROM Equipment
INNER JOIN Reservation
USING (SerialNumber)
INNER JOIN Train
USING (TrainNumber)
INNER JOIN Destination
USING (TrainNumber)
INNER JOIN Location
USING (ZIP, Address)
WHERE SerialNumber = ?
ORDER BY DepartureDate DESC
LIMIT 1
SQL;

        if (!$stmt = self::$mysqli->prepare($query)) {
            return false;
        }

        if (!$stmt->bind_param('i', $serialnumber)) {
            return false;
        }

        if (!$stmt->execute()) {
            return false;
        }

        $result = $stmt->get_result();

        $location = $result->fetch_assoc();

        return $location;
    }

    /**
     * inserts new Equipment into database
     */
    public static function createEquipment($serialnumber, $type, $manufacturer, $price)
    {
        self::openDatabase();

        $query = 'INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price) VALUES (?,?,?,?)';
    }

    /**
     * prints options based on enum
     */
    public static function displayOptions()
    {
        self::openDatabase();

        // obtain columns from description of table
        $query = 'SHOW COLUMNS FROM Equipment WHERE Field = "Type"';

        if (!$result = self::$mysqli->query($query))
        {
            return false;
        }

        $row = $result->fetch_assoc();

        $types = $row['Type'];

        // RegEx
        preg_match("/^enum\(\'(.*)\'\)$/", $types, $matches);

        // get array from matches
        //$enums = explode("','", $matches[1]);
        $enums = preg_split("/(\'\s*,\s*\')/", $matches[1]);

        // print array
        foreach ($enums as $enum)
        {
            echo '<option value="';
            echo $enum;
            echo '">';
            echo ucfirst($enum);
            echo "</option>\n";
        }
    }

    /**
     * verifys serial number exists
     */
    public static function verifySerialNumber($serialnumber)
    {
        self::openDatabase();

        $query = 'SELECT * FROM Equipment WHERE SerialNumber = ?';

        if (!$stmt = self::$mysqli->prepare($query)) {
            return false;
        }

        if (!$stmt->bind_param('i', $serialnumber)) {
            return false;
        }

        if (!$stmt->execute()) {
            return false;
        }

        $result = $stmt->get_result();

        if ($result->num_rows != 1) {
            return false;
        }

        return true;
    }
}

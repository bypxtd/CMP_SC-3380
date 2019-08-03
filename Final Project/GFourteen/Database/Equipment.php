<?php

class Equipment extends Entity
{
    // instance variables
    protected $serialNumber;
    protected $type;
    protected $manufacturer;
    protected $price;
    protected $capacity;

    protected $location;

    // array of allowed types
    protected static $typesArray;

    public function __construct($serialNumber, $type, $price, $manufacturer, $capacity = 100)
    {
        // get allowed types from database
        if (empty(self::$typesArray)) {
            self::$typesArray = self::findTypes();
        }

        // set serial number
        $this->serialNumber = $serialNumber;

        // validate type
        //if (!in_array($type, $this->typesArray, true)) {
        //    throw new Exception('Invalid type.');
        //} else {
            $this->type = $type;
        //}

        // set manufacturer and price
        $this->manufacturer = $manufacturer;
        $this->price = $price;
        $this->capacity = $capacity;

        // find and set location
        $this->location = self::findLocation($serialNumber);
    }

    public function getPK()
    {
        return $this->serialNumber;
    }

    public function save()
    {
        // validate
        if (!in_array($this->type, $this->typesArray, true)) {
            $trace = debug_backtrace();
            trigger_error(
                'Undefined type via save(): ' . $this->type .
                ' in ' . $trace[0]['file'] .
                ' on line ' . $trace[0]['line'],
                E_USER_WARNING);
            return false;
        }

        // put row values into array
        $row = array(
            'SerialNumber' => $this->serialNumber,
            'Type' => $this->type,
            'Manufacturer' => $this->manufacturer,
            'Price' => $this->price
        );

        return $this->saveRow($row);
    }

    /**
     * finds the current location of a car
     * given its serial number
     *
     * @return Location|boolean Object location or false on failed query
     */
    public static function findLocation($serialNumber)
    {
        $query = new Query();

        $queryString = <<<SQL
SELECT Zip, Address
FROM Equipment
INNER JOIN Reservation
USING (SerialNumber)
INNER JOIN Train
USING (TrainNumber)
INNER JOIN Destination
USING (TrainNumber)
INNER JOIN Location
USING (Zip, Address)
WHERE SerialNumber = ? AND DepartureDate < CURDATE()
ORDER BY DepartureDate DESC
LIMIT 1
SQL;

        $types = 'i';

        $params = array(&$serialNumber);

        if (!($result = $query->safeQuery($queryString, $types, $params)) || $result->num_rows !== 1) {
            return false;
        }

        $row = $result->fetch_assoc();

        //$location = new Location($row['Zip'], $row['Address'], $row['Name'], $row['City'], $row['State']);
        $location = Location::open(array('Zip' => $row['Zip'], 'Address' => $row['Address']));

        return $location;
    }

    public static function findTypes()
    {
        $query = new Query();

        // obtain columns from description of table
        $queryString = "SHOW COLUMNS FROM Equipment WHERE Field = 'Type'";

        if (!($result = $query->quickQuery($queryString))) {
            return false;
        }

        $row = $result->fetch_assoc();

        $types = $row['Type'];

        // RegEx
        // matches content
        // example: `enum('example','example2')`
        //          the regex will match `example','example2`
        preg_match("/^enum\(\'(.*)\'\)$/", $types, $matches);

        // return array from matches
        //return explode("','", $matches[1]);
        return preg_split("/(\'\s*,\s*\')/", $matches[1]);
    }

    public function saveEngineHistory($trainNumber)
    {
        // only locomotives can be saved in engine history
        if ($this->type !== 'locomotive') {
            return false;
        }

        $query = new QuerySingle('EngineHistory');

        $row = array(
            'TrainNumber' => $trainNumber,
            'SerialNumber' => $this->serialNumber
        );

        return $query->insertRow($row);
    }
}

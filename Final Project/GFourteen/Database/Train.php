<?php

class Train extends Entity
{
    // table rows
    protected $trainNumber;
    protected $departureTime;
    protected $departureDate;

    // other attributes
    // array of objects
    protected $engineers;
    protected $conductors;
    protected $locomotives;
    protected $cars;
    protected $departure;
    protected $destination;

    public function __construct($trainNumber, $departureTime, $departureDate)
    {
        $this->trainNumber = $trainNumber;
        $this->departureTime = $departureTime;
        $this->departureDate = $departureDate;

        $this->engineers = array();
        $this->conductors = array();
        $this->locomotives = array();
        $this->cars = array();
    }

    public static function open($pk)
    {
        $train = parent::open($pk);

        $train->retrieveAttributes();

        return $train;
    }

    public function save()
    {
        $row = array(
            'TrainNumber' => $this->trainNumber,
            'DepartureTime' => $this->departureTime,
            'DepartureDate' => $this->departureDate
        );

        return $this->saveRow($row, 'Train');
    }

    public function getPK()
    {
        return $this->trainNumber;
    }

    public static function init($departureTime, $departureDate)
    {
        $query = new Query();

        $queryString = <<<SQL
SELECT TrainNumber
FROM Train
ORDER BY TrainNumber DESC
LIMIT 1
SQL;

        if (!($result = $query->quickQuery($queryString))) {
            return false;
        }

        $row = $result->fetch_assoc();

        return new self($row['TrainNumber'] + 1, $departureTime, $departureDate);
    }

    public function __set($name, $value)
    {
        if (property_exists(get_class($this), $name) && $name !== 'trainNumber') {
            $this->$name = $value;
            return;
        }

        // else trigger a notice
        $trace = debug_backtrace();
        if ($name === 'trainNumber') {
            trigger_error(
                'Cannot set trainNumber via __set(): ' .
                ' in ' . $trace[0]['file'] .
                ' on line ' . $trace[0]['line'],
                E_USER_NOTICE);
        } else {
            trigger_error(
                'Undefined property via __set(): ' . $name .
                ' in ' . $trace[0]['file'] .
                ' on line ' . $trace[0]['line'],
                E_USER_NOTICE);
        }
        return null;
    }

    protected function retrieveAttributes()
    {
        $this->engineers = $this->findEngineers();
        $this->conductors = $this->findConductors();
        $this->locomotives = $this->findLocomotives();
        $this->cars = $this->findCars();
        $this->departure = $this->findDeparture();
        $this->destination = $this->findDestination();
    }

    protected function findEngineers()
    {
        $query = new QuerySingle('EngineerHistory');

        if (!($result = $query->selectByColName('TrainNumber', $this->trainNumber)) || $result->num_rows < 1) {
            trigger_error(
                'No engineers found.');
            return false;
        }

        $engineers = array();
        while ($row = $result->fetch_assoc()) {
            $engineers[] = Engineer::open($row['UserID']);
        }

        return $engineers;
    }

    protected function findConductors()
    {
        $query = new QuerySingle('ConductorHistory');

        if (!($result = $query->selectByColName('TrainNumber', $this->trainNumber)) || $result->num_rows < 1) {
            trigger_error(
                'No conductors found.');
            return false;
        }

        $conductors = array();
        while ($row = $result->fetch_assoc()) {
            $conductors[] = Conductor::open($row['UserID']);
        }

        return $conductors;
    }

    protected function findLocomotives()
    {
        $query = new QuerySingle('EngineHistory');

        if (!($result = $query->selectByColName('TrainNumber', $this->trainNumber)) || $result->num_rows < 1) {
            trigger_error(
                'No locomotives found.');
            return false;
        }

        $locomotives = array();
        while ($row = $result->fetch_assoc()) {
            $locomotives[] = Equipment::open($row['SerialNumber']);
        }

        return $locomotives;
    }

    protected function findCars()
    {
        $query = new QuerySingle('Reservation');

        if (!($result = $query->selectByColName('TrainNumber', $this->trainNumber))) {
            return false;
        }

        $cars = array();
        while ($row = $result->fetch_assoc()) {
            $cars[] = Equipment::open($row['SerialNumber']);
        }

        return $cars;
    }

    protected function findDeparture()
    {
        $query = new QuerySingle('Departure');

        if (!($result = $query->selectByColName('TrainNumber', $this->trainNumber)) || $result->num_rows < 1) {
            trigger_error(
                'No departure found.');
            return false;
        }

        $row = $result->fetch_assoc();

        return Location::open(array(
            'Zip' => $row['Zip'],
            'Address' => $row['Address']));
    }

    protected function findDestination()
    {
        $query = new QuerySingle('Destination');

        if (!($result = $query->selectByColName('TrainNumber', $this->trainNumber)) || $result->num_rows < 1) {
            trigger_error(
                'No destination found.');
            return false;
        }

        $row = $result->fetch_assoc();

        return Location::open(array(
            'Zip' => $row['Zip'],
            'Address' => $row['Address']));
    }
}

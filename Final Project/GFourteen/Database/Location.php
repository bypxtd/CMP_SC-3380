<?php

class Location extends Entity
{
    protected $zip;
    protected $address;
    protected $name;
    protected $city;
    protected $state;

    public function __construct($zip, $address, $name, $city, $state)
    {
        $this->zip = $zip;
        $this->address = $address;
        $this->name = $name;
        $this->city = $city;
        $this->state = $state;
    }

    public function getPK()
    {
        return array(
            'Zip' => $this->zip,
            'Address' => $this->address
        );
    }

    public function saveDeparture($trainNumber)
    {
        $query = new QuerySingle('Departure');

        $row = array(
            'TrainNumber' => $trainNumber,
            'Zip' => $this->zip,
            'Address' => $this->address
        );

        return $query->insertRow($row);
    }

    public function saveDestination($trainNumber)
    {
        $query = new QuerySingle('Destination');

        $row = array(
            'TrainNumber' => $trainNumber,
            'Zip' => $this->zip,
            'Address' => $this->address
        );

        return $query->insertRow($row);
    }
}

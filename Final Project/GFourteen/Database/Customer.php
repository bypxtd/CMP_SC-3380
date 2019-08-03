<?php

class Customer extends Person
{
    protected $companyID;

    protected $reservations;

    public function __construct($userID, $firstName, $lastName, $graveyard = false, $companyID = null)
    {
        parent::__construct($userID, $firstName, $lastName, $graveyard);

        $this->companyID = $companyID;

        $this->reservations = $this->findReservations();
    }

    public static function open($userID)
    {
        // open person
        $query = new QuerySingle('Person');
        if (!($result = $query->selectByPK($userID)) || $result->num_rows !== 1) {
            return false;
        }

        // store person data
        $row = $result->fetch_assoc();

        $firstName = $row['FirstName'];
        $lastName = $row['LastName'];
        $graveyard = $row['Graveyard'];

        // open customer
        $query->setTable('Customer');
        if (!($result = $query->selectByPK($userID)) || $result->num_rows !== 1) {
            return false;
        }

        // store customer data
        $row = $result->fetch_assoc();

        $companyID = $row['CompanyID'];

        return new self($userID, $firstName, $lastName, $graveyard, $companyID);
    }

    public function save()
    {
        // query person
        $row = array(
            'UserID' => $this->userID,
            'FirstName' => $this->firstName,
            'LastName' => $this->lastName,
            'Graveyard' => $this->graveyard
        );

        if (!$this->saveRow($row, 'Person')) {
            return false;
        }

        // query customer
        $row = array(
            'UserID' => $this->userID,
            'CompanyID' => $this->companyID
        );

        return $this->saveRow($row, 'Customer');
    }

    public function login($companyID = null)
    {
        // determine if arguments are good
        $isValid = $companyID === $this->companyID;

        // invalid
        if (!$isValid) {
            return false;
        }

        return parent::login();
    }

    public function saveReservation($trainNumber, $serialNumber, $cargo)
    {
        $query = new QuerySingle('Reservation');

        $row = array(
            'TrainNumber' => $trainNumber,
            'SerialNumber' => $serialNumber,
            'Cargo' => $cargo,
            'UserID' => $this->userID
        );

        return $query->insertRow($row);
    }

    public function findReservations()
    {
        $query = new QuerySingle('Reservation');

        if (!($result = $query->selectByColName('UserID', $this->userID))) {
            // query failed
            return false;
        } elseif ($result->num_rows < 1) {
            // no reservations
            return array();
        } else {
            // return an array of arrays of reservations
            $arr = array();
            while ($row = $result->get_result()) {
                $arr[] = $row;
            }
            return $arr;
        }
    }

    public function verifyReservation($trainNumber, $serialNumber)
    {
        foreach ($this->reservations as $r) {
            if ( ($r['TrainNumber'] === $trainNumber) && ($r['SerialNumber'] === $serialNumber) ) {
                return true;
            }
        }

        return false;
    }
}

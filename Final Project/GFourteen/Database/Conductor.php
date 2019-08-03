<?php

class Conductor extends Employee
{
    protected $status;
    protected $rank;

    public function __construct($userID, $firstName, $lastName, $graveyard = false, $authentication = null, $status, $rank)
    {
        parent::__construct($userID, $firstName, $lastName, $graveyard, $authentication);

        $this->status = $status;
        $this->rank = $rank;
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

        // query employee
        $query->setTable('Employee');
        if (!$query->verifyPK($userID)) {
            return false;
        }

        // query conductor
        $query->setTable('Conductor');
        if (!($result = $query->selectByPK($userID)) || $result->num_rows !== 1) {
            return false;
        }

        // store conductor data
        $row = $result->fetch_assoc();

        $status = $row['Status'];
        $rank = $row['Rank'];

        // open auth
        if (!$auth = Authentication::open($userID)) {
            return false;
        }

        return new self($userID, $firstName, $lastName, $graveyard, $auth, $status, $rank);
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

        // query employee
        $row = array(
            'UserID' => $this->userID
        );
        if (!$this->saveRow($row, 'Employee')) {
            return false;
        }

        // query conductor
        $row = array(
            'UserID' => $this->userID,
            'Status' => $this->status,
            'Rank' => $this->rank
        );
        if (!$this->saveRow($row, 'Conductor')) {
            return false;
        }

        // save auth
        return $this->authentication->save();
    }

    public function saveHistory($trainNumber)
    {
        $query = new QuerySingle('ConductorHistory');

        $row = array(
            'TrainNumber' => $trainNumber,
            'UserID' => $this->userID
        );

        return $query->insertRow($row);
    }
}

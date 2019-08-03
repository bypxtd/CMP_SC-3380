<?php

class Engineer extends Employee
{
    protected $status;
    protected $rank;
    protected $hours;

    public function __construct($userID, $firstName, $lastName, $graveyard = false, $authentication = null, $status, $rank, $hours)
    {
        parent::__construct($userID, $firstName, $lastName, $graveyard, $authentication);

        $this->status = $status;
        $this->rank = $rank;
        $this->hours = $hours;
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

        // query engineer
        $query->setTable('Engineer');
        if (!($result = $query->selectByPK($userID)) || $result->num_rows !== 1) {
            return false;
        }

        // store engineer data
        $row = $result->fetch_assoc();

        $status = $row['Status'];
        $rank = $row['Rank'];
        $hours = $row['Hours'];

        // open auth
        if (!$auth = Authentication::open($userID)) {
            return false;
        }

        return new self($userID, $firstName, $lastName, $graveyard, $auth, $status, $rank, $hours);
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
        $this->saveRow($row, 'Person');

        // query employee
        $row = array(
            'UserID' => $this->userID
        );
        $this->saveRow($row, 'Employee');

        // query engineer
        $row = array(
            'UserID' => $this->userID,
            'Status' => $this->status,
            'Rank' => $this->rank,
            'Hours' => $this->hours
        );
        $this->saveRow($row, 'Engineer');

        // save auth
        $this->authentication->save();

        return true;
    }

    public function saveHistory($trainNumber)
    {
        $query = new QuerySingle('EngineerHistory');

        $row = array(
            'TrainNumber' => $trainNumber,
            'UserID' => $this->userID
        );

        return $query->insertRow($row);
    }
}

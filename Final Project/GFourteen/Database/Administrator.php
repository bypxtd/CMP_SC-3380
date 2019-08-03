<?php

class Administrator extends Employee
{
    public function __construct($userID, $firstName, $lastName, $graveyard = false, $authentication = null)
    {
        parent::__construct($userID, $firstName, $lastName, $graveyard, $authentication);
    }

    public static function open($userID)
    {
        // query person
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

        // query administrator
        $query->setTable('Administrator');
        if (!$query->verifyPK($userID)) {
            return false;
        }

        // open auth
        if (!$auth = Authentication::open($userID)) {
            return false;
        }

        return new self($userID, $firstName, $lastName, $graveyard, $auth);
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

        // query administrator
        $row = array(
            'UserID' => $this->userID
        );
        if (!$this->saveRow($row, 'Administrator')) {
            return false;
        }

        // query authentication
        return $this->authentication->save();
    }
}

<?php

abstract class Employee extends Person
{
    protected $authentication;

    public function __construct($userID, $firstName, $lastName, $graveyard = false, $authentication = null)
    {
        parent::__construct($userID, $firstName, $lastName, $graveyard);

        $this->authentication = $authentication;
    }

    public function login($plaintextPassword = null, $roles = null)
    {
        // determine if arguments are good
        $isValid = $this->authentication->validate($plaintextPassword, $roles);

        // invalid
        if (!$isValid) {
            return false;
        }

        return parent::login();
    }
}

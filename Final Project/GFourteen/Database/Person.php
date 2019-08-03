<?php

abstract class Person extends Entity
{
    protected $userID;
    protected $firstName;
    protected $lastName;
    protected $graveyard;

    public function __construct($userID, $firstName, $lastName, $graveyard = false)
    {
        $this->userID = $userID;
        $this->firstName = $firstName;
        $this->lastName = $lastName;
        $this->graveyard = $graveyard;
    }

    public function getPK()
    {
        return $this->userID;
    }

    public function getName()
    {
        return $this->firstName . ' ' . $this->lastName;
    }

    /**
     * 'deletes' a person
     */
    public function delete()
    {
        $this->graveyard = true;
    }

    /**
     * 'restores' person from graveyard
     */
    public function restore()
    {
        $this->graveyard = false;
    }

    public function __set($name, $value)
    {
        switch ($name)
        {
            // userid is primay key, and use delete/restore for graveyard
            case 'userID':
            case 'graveyard':
                $trace = debug_backtrace();
                trigger_error(
                    'Unaccessible private variable via __set(): ' . $name .
                    ' in ' . $trace[0]['file'] .
                    ' on line '. $trace[0]['line'],
                    E_USER_NOTICE);
                break;
            default:
                if (property_exists(get_class($this), $name)) {
                    $this->$name = $value;
                } else {
                    $trace = debug_backtrace();
                    trigger_error(
                        'Undefined property via __set(): ' . $name .
                        ' in ' . $trace[0]['file'] .
                        ' on line ' . $trace[0]['line'],
                        E_USER_NOTICE);
                }
                break;
        }
    }

    /**
     * login with some input
     * e.g. some secret code
     */
    public function login()
    {
        // start session if not started
        if (session_status() !== PHP_SESSION_ACTIVE) {
            if (!session_start()) {
                trigger_error(
                    'Could not log in via login()',
                    E_USER_NOTICE);
                return false;
            }
        }

        // put login into session
        $_SESSION['person'] = serialize($this);

        return true;
    }

    public function logout()
    {
        // start session if not started
        if (session_status() !== PHP_SESSION_ACTIVE) {
            if (!session_start()) {
                return false;
            }
        }

        unset($_SESSION['person']);

        return true;
    }
}

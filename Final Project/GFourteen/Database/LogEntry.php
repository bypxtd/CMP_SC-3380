<?php

class LogEntry extends Entity
{
    // columns
    protected $logNumber;
    protected $ip;
    protected $logDate;
    protected $logTime;
    protected $actionKey;
    protected $userID;

    /**
     * protected.  use init() instead.
     */
    protected function __construct($logNumber, $ip, $logDate, $logTime, $actionKey, $userID)
    {
        $this->logNumber = $logNumber;
        $this->ip = $ip;
        $this->logDate = $logDate;
        $this->logTime = $logTime;
        $this->actionKey = $actionKey;
        $this->userID = $userID;
    }

    /**
     * returns new initialzed log entry
     *
     * @param string $actionKey action key
     * @param string $userID user id doing the action
     * @return LogEntry initialized instance of this class
     */
    public static function init($actionKey, $userID)
    {
        if (empty($actionKey)) {
            return null;
        }

        $query = new Query();

        $queryString = <<<SQL
SELECT LogNumber
FROM LogEntry
ORDER BY LogNumber DESC
LIMIT 1
SQL;

        // if query fails, start at zero
        if (!($result = $query->quickQuery($queryString))) {
            $logNumber = 0;
        } else {
            $row = $result->fetch_assoc();
            $logNumber = $row['LogNumber'];
        }
        // increment to next available log number
        $logNumber++;

        return new self($logNumber, self::getClientIP(), date('Y-m-d'), date('H:i:s'), $actionKey, $userID);
    }

    public function getPK()
    {
        return array(
            'LogNumber' => $this->logNumber,
            'UserID' => $this->userID
        );
    }

    /**
     * generates an action key based on query statement
     * Types generated:
     *  User - for user-related actions
     *  Equipment - for cars
     *  Train - for trains
     *  Location - for locations
     *  Reservation - for reservations
     *
     * @param   string      $queryString    query statement
     * @param   mixed|mixed[] $pk           primary key or array of primary keys
     * @return  string                      action key
     */
    public static function generateActionKey($queryString, $pk = null)
    {
        $actionKey = '';

        // table modified
        if (preg_match('/(Person|Employee|Administrator|Engineer|Conductor|Customer)/', $queryString) === 1) {
            $actionKey .= 'User';
        } elseif (preg_match('/(Authentication)/', $queryString) === 1) {
            $actionKey .= 'UserAuth';
        } elseif (preg_match('/(Equipment)/',$queryString) === 1) {
            $actionKey .=  'Equipment';
        } elseif (preg_match('/(Train)/', $queryString) === 1) {
            $actionKey .= 'Train';
        } elseif (preg_match('/(Location)/', $queryString) === 1) {
            $actionKey .= 'Location';
        } elseif (preg_match('/(Reservation)/', $queryString) === 1) {
            $actionKey .= 'Reservation';
        } else {
            $actionKey .= 'TableRow';
        }

        // action done
        if (in_array(substr($queryString, 0, 3), array('INS'))) {
            $actionKey .= 'Created';
        } elseif (in_array(substr($queryString, 0, 3), array('UPD'))) {
            $actionKey .= 'Updated';
        } elseif (in_array(substr($queryString, 0, 3), array('DEL'))) {
            $actionKey .= 'Deleted';
        } elseif (in_array(substr($queryString, 0, 3), array('NO '))) {
            return '';
        } else {
            $actionKey .= 'Modified';
        }

        // space
        $actionKey .= ' ';

        // append primary key(s)
        if (isset($pk)) {
            if (is_array($pk)) {
                // implode array into string separated by commas
                $actionKey = implode(',', $pk);
            } else {
                $actionKey .= $pk;
            }
        } else {
            $actionKey .= 'PK undefined';
        }

        return $actionKey;
    }

    /**
     * gets client's IP address
     */
    public static function getClientIP()
    {
        $ipaddress = '';
        if (getenv('HTTP_CLIENT_IP'))
            $ipaddress = getenv('HTTP_CLIENT_IP');
        elseif(getenv('HTTP_X_FORWARDED_FOR'))
            $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
        elseif(getenv('HTTP_X_FORWARDED'))
            $ipaddress = getenv('HTTP_X_FORWARDED');
        elseif(getenv('HTTP_FORWARDED_FOR'))
            $ipaddress = getenv('HTTP_FORWARDED_FOR');
        elseif(getenv('HTTP_FORWARDED'))
            $ipaddress = getenv('HTTP_FORWARDED');
        elseif(getenv('REMOTE_ADDR'))
            $ipaddress = getenv('REMOTE_ADDR');
        else
            $ipaddress = 'UNKNOWN';
        return $ipaddress;
    }
}

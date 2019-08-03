<?php

abstract class Entity implements EntityInterface
{
    /* EntityInterface functions */

    public static function open($pk)
    {
        // open link to table
        $query = new QuerySingle(get_called_class());

        // retrieve row by primary key
        if (!($result = $query->selectByPK($pk)) || $result->num_rows < 1) {
            $trace = debug_backtrace();
            trigger_error(
                'Undefined primary key via ' . get_called_class() . '::open():' . var_export($pk, true) .
                ' in ' . $trace[0]['file'] .
                ' on line ' . $trace[0]['line'],
                E_USER_WARNING
            );

            return false;
        }
        $row = $result->fetch_assoc();

        // call child's constructor with unpacked row
        // WARNING: child's constructor must have arguments in EXACT order
        // as database table, or else unpacking the row will lead to undefined behavior
        return new static(...array_values($row));
    }

    /**
     * NOTE: you must override this method if not all the
     * instance variables should go in the table
     * or else the query will fail
     */
    public function save()
    {
        // get properties of this
        $row = get_object_vars($this);

        // capitalize first letter of keys
        // (because that's how our database works)
        foreach($row as $key => $value) {
            $row[ucfirst($key)] = $value;
            unset($row[$key]);
        }

        // save row for this table
        return $this->saveRow($row, get_class($this));
    }

    /**
     * implementation specific primary key
     */
    abstract public function getPK();

    /* Entity functions */

    /**
     * saves row to single table
     *
     * @param   mixed[]     $row        associative array of row to save
     * @param   string      $tableName  name of table to save to
     * @return  boolean
     */
    protected function saveRow($row, $tableName)
    {
        $query = new QuerySingle($tableName);

        // determine if row already exists
        if ($query->verifyPK($this->getPK())) {
            // update table
            $returnValue = $query->updateByPK($row);
        } else {
            // insert into table
            $returnValue = $query->insertRow($row);
        }

        // only log if not a log entry itself (plz no recursion)
        if (get_class($this) !== 'LogEntry') {
            // make sure no error
            if ($query->getLink()->errno === 0) {
                // generate action key from the latest query run and the primary key of this table
                $actionKey = LogEntry::generateActionKey($query->latestQuery, $this->getPK());

                // initialize a new log entry using the action key and the userid of the logged in person
                if ($logEntry = LogEntry::init($actionKey, unserialize($_SESSION['person'])->userID)) {
                    // save log entry
                    $logEntry->save();
                }

            } else {
                $trace = debug_backtrace();
                trigger_error(
                    'Unable to save log entry via saveRow(): (' . $query->getLink()->errno . ') ' .
                    $query->getLink()->error .
                    ' in ' . $trace[0]['file'] .
                    ' on line ' . $trace[0]['line'],
                    E_USER_NOTICE
                );
            }
        }

        return $returnValue;
    }

    public function __get($name)
    {
        if (property_exists(get_class($this), $name)) {
            return $this->$name;
        }

        // else trigger a notice
        $trace = debug_backtrace();
        trigger_error(
            'Undefined property via __get(): ' . $name .
            ' in ' . $trace[0]['file'] .
            ' on line ' . $trace[0]['line'],
            E_USER_NOTICE);
        return null;
    }

    public function __toString()
    {
        return nl2br(print_r($this, true), false);
    }

    public function __sleep()
    {
        // convert this to array
        $vars = (array)$this;

        // loop each property
        foreach ($vars as $key => $val)
        {
            if (is_null($val))
            {
                // unset null values
                unset($vars[$key]);
            }
        }

        // return names of all properties to serialize
        return array_keys($vars);
    }
}

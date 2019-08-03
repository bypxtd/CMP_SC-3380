<?php

class QuerySingle extends Query implements QuerySingleInterface
{
    // table to select from
    protected $tableName;

    // primary key(s) column name of table
    protected $tablePK;

    // column names
    protected $columns;

    public function __construct($tableName)
    {
        parent::__construct();

        // set table name (and also primary key column name and columns)
        $this->setTable($tableName);
    }

    public function setTable($tableName)
    {
        // escape tablename
        $tableName = $this->getLink()->real_escape_string($tableName);

        // get table index information
        $query = <<<SQL
SHOW KEYS FROM 
SQL;

        // append table name
        $query .= $tableName;

        // look for indices which are primary
        $query .= <<<SQL

WHERE Key_name = 'PRIMARY'
SQL;

        // get rows containing primary keys of table
        if (!($result = $this->quickQuery($query)) || $result->num_rows < 1) {
            $trace = debug_backtrace();
            trigger_error(
                'Unable to set table name via setTable(): ' . $tableName .
                ' in ' . $trace[0]['file'] .
                ' on line ' . $trace[0]['line'],
                E_USER_WARNING);

            return false;
        }

        if ($result->num_rows === 1) {
            // single primary key

            $row = $result->fetch_assoc();

            // set pk
            $this->tablePK = $row['Column_name'];
        } else {
            // multiple primary keys

            $this->tablePK = array();

            // loop through all pks
            while ($row = $result->fetch_assoc()) {
                $this->tablePK[] = $row['Column_name'];
            }
        }

        // set table
        $this->tableName = $tableName;

        // set columns
        $this->columns = $this->findColumns();

        return true;
    }

    protected function findColumns()
    {
        // get information about columns in the table
        $query = "DESCRIBE {$this->tableName}";

        // query database
        if (!($result = $this->quickQuery($query)) || $result->num_rows < 1) {
            $trace = debug_backtrace();
            trigger_error(
                'Unable to describe table via findColumns(): ' . $this->tableName .
                ' in ' . $trace[0]['file'] .
                ' on line ' . $trace[0]['line'],
                E_USER_WARNING);

            return;
        }

        // array of columns
        $columns = array();

        // loop through columns
        while ($row = $result->fetch_assoc()) {
            $columns[] = $row['Field'];
        }

        return $columns;
    }

    /* INSERT FUNCTIONS */

    public function insertRow($row)
    {
        // initial part of query
        $query = <<<SQL
INSERT INTO {$this->tableName} (
SQL;

        // save keys of row in array
        $keys = array_keys($row);

        // validate row keys
        foreach ($keys as $key) {
            if (!in_array($key, $this->columns)) {
                $trace = debug_backtrace();
                trigger_error(
                    'Undefined fieldname via insertRow(): ' . $key .
                    ' in ' . $trace[0]['file'] .
                    ' on line ' . $trace[0]['line'],
                    E_USER_WARNING
                );

                return false;
            }
        }

        // save end value of row
        $end = end($keys);

        /*
        // append key to query
        foreach ($keys as $key) {
            $query .= $key;

            // commas except for last one
            if ($key !== $end) {
                $query .= ',';
            }
        }
         */
        $query .= implode(',', $keys);

        // done with column names
        $query .= ')';

        // begin adding values to query
        $query .= <<<SQL

VALUES (
SQL;

        // specify types of params to bind
        $types = '';

        // values need to be stored as references
        $params = array();

        // add ?s to query and types
        // and row to params
        foreach ($row as $key => &$r) {
            $query .= '?';
            $types .= self::getSQLType($r);
            $params[] = &$r;

            // add commas except after last one
            if ($key !== $end) {
                $query .= ',';
            }
        }

        $query .= ')';

        // return boolean
        return $this->safeQuery($query, $types, $params);
    }

    /* SELECT FUNCTIONS */

    /**
     * display everything in table
     */
    public function displayAll($doOptions = false, $forms = array())
    {
        $query = <<<SQL
SELECT *
FROM {$this->tableName}
SQL;

        if (!($result = $this->quickQuery($query)) || $result->num_rows < 1) {
            $trace = debug_backtrace();
            trigger_error(
                'Unable to select from table via displayAll(): ' . $this->tableName .
                ' in ' . $trace[0]['file'] .
                ' on line ' . $trace[0]['line'],
                E_USER_NOTICE);

            return;
        }

        $this->displayTable($result, $doOptions, $forms);
    }

    public function displayByColName($fieldname, $fieldvalue, $doOptions = false, $forms = array())
    {
        if (!($result = $this->selectByColName($fieldname, $fieldvalue))) {
            $trace = debug_backtrace();
            trigger_error(
                'Unable to select from table via displayByColName(): ' . $this->tableName .
                ' in ' . $trace[0]['file'] .
                ' on line ' . $trace[0]['line'],
                E_USER_NOTICE);

            return;
        }

        $this->displayTable($result, $doOptions, $forms);
    }

    public function displayLikeColName($fieldname, $fieldvalue, $doOptions = false, $forms = array())
    {
        $this->displayByColName($fieldname, '%' . $fieldvalue . '%', $doOptions, $forms);
    }

    public function selectByPK($pk)
    {
        // if primary key is not composite, simply select
        if (!is_array($pk) && !is_array($this->tablePK)) {
            return $this->selectByColName($this->tablePK, $pk);
        } else {
            // given pk is not an array and yet the table has composite primary key
            if (!is_array($pk)) {
                $trace = debug_backtrace();
                trigger_error(
                    'Mismatch of primary key and expected via selectByPK(): ' . $this->tableName .
                    ' has ' . count($this->tablePK) . ' primary keys ' .
                    ' in ' . $trace[0]['file'] .
                    ' on line ' . $trace[0]['line'],
                    E_USER_ERROR
                );
            }

            // else, primary key is composite. we can't use selectByColName()

            $queryString = <<<SQL
SELECT *
FROM {$this->tableName}
WHERE 
SQL;

            // types for bind_param
            $types = '';

            // array of references
            $params = array();

            // keys in associative array
            $keys = array_keys($pk);

            // last key
            $end = end($keys);

            // iterate through each value in array
            foreach ($pk as $key => &$value) {
                // make sure key is a valid column (prevent sql inject)
                if (!in_array($key, $this->tablePK)) {
                    $trace = debug_backtrace();
                    trigger_error(
                        'Undefined fieldname via selectByPK(): ' . $key .
                        ' in ' . $trace[0]['file'] .
                        ' on line ' . $trace[0]['line'],
                        E_USER_WARNING);

                    return false;
                }

                // type of primary key
                $types .= self::getSQLType($value);

                // store primary key by reference
                $params[] = &$value;

                // append each key onto query string
                $queryString .= <<<SQL
$key = ?
SQL;

                // add AND for all but last.
                if ($key !== $end) {
                    $queryString .= ' AND ';
                }
            }

            // query the database.
            return $this->safeQuery($queryString, $types, $params);
        }
    }

    /**
     * returns a mysqli_result of rows similar to given
     * fieldvalue in one column fieldname
     */
    public function selectByColName($fieldname, $fieldvalue)
    {
        $query = <<<SQL
SELECT *
FROM {$this->tableName}
WHERE 
SQL;

        // add on the necessary column name
        // but only if fieldname is valid
        if (in_array($fieldname, $this->columns)) {
            $query .= <<<SQL
$fieldname LIKE ?
SQL;

            // type of fieldvalue
            $types = self::getSQLType($fieldvalue);

            // pass parameters by reference in array
            $params = array(&$fieldvalue);

            return $this->safeQuery($query, $types, $params);
        }

        $trace = debug_backtrace();
        trigger_error(
            'Undefined fieldname via selectByColName(): ' . $fieldname .
            ' in ' . $trace[0]['file'] .
            ' on line ' . $trace[0]['line'],
            E_USER_WARNING);

        return false;
    }

    public function selectLikeColName($fieldname, $fieldvalue)
    {
        // wildcard for partial matches
        return $this->selectByColName($fieldname, '%' . $fieldvalue . '%');
    }

    public function selectAll()
    {
        // select everything
        $query = <<<SQL
SELECT *
FROM {$this->tableName}
SQL;

        // quick query (tableName should've been escaped)
        return $this->quickQuery($query);
    }

    public function displayTable($result, $doOptions = false, $forms = array(), $headers = array())
    {
        // no results
        if ($result->num_rows < 1) {
            $this->notify('No results.');
            return;
        }

        // verify form
        foreach ($forms as $formName => $form) {
            if (!file_exists($form)) {
                // file doesn't exists so remove from array and trigger a notice
                trigger_error(
                    'Undefined form via displayTable(): ' . $form,
                    E_USER_NOTICE);
                unset($forms[$formName]);
            }
        }

        echo "<table>\n";

        echo "<thead>\n";

        // note: fetch_fields gets an array of objects
        $fields = $result->fetch_fields();

        // get name from each object into array
        $fields = array_map(create_function('$o', 'return $o->name;'), $fields);

        // use headers instead if set and counts match
        if (!empty($headers) && count($headers) === count($fields) ) {
            $fields = $headers;
        }

        // print head row using fields
        echo '<tr>';
        foreach ($fields as $field) {
            echo '<th>';
            echo ucfirst($field);   // upper case
            echo "</th>\n";
        }
        if ($doOptions) {
            echo "<th>Options</th>\n";
        }
        echo "</tr>\n";

        echo "</thead>\n";

        // print body
        echo "<tbody>\n";
        while ($row = $result->fetch_assoc()) {
            echo '<tr>';
            foreach ($row as $r) {
                echo '<td>';
                echo $r;
                echo "</td>\n";
            }
            if ($doOptions) {
                echo '<td>';
                $this->printOptions($row, $forms);
                echo "</td>\n";
            }
            echo "</tr>\n";
        }
        echo "</tbody>\n";

        echo "</table>\n";
    }

    /**
     * print forms
     * using php's HEREDOC
     *
     * @param   mixed[]     $row        values to put into hidden inputs
     * @param   string[]    $forms      array of form urls for form action
     */
    protected static function printOptions(array $row, array $forms)
    {
        // loop through forms
        foreach ($forms as $formName => $form) {
            // start form
            echo <<<HTML
    <form action="{$form}" method="POST">
HTML;

            // print hidden inputs into form
            foreach ($row as $key => $r) {
                echo <<<HTML

        <input type="hidden" name="{$key}" value="{$r}">
HTML;
            }

            // uppercase form name
            $content = ucfirst($formName);

            // end edit form
            echo <<<HTML

        <button type="submit" name="{$formName}" value="{$formName}">{$content}</button>
    </form>
HTML;
        }
    }

    public function verifyPK($pk)
    {
        // try to select from table
        if (!($result = $this->selectByPK($pk))) {
            $trace = debug_backtrace();
            trigger_error(
                'Could not verify primary key via verifyPK(): ' . $pk .
                ' in ' . $trace[0]['file'] .
                ' on line ' . $trace[0]['line'],
                E_USER_NOTICE
            );

            return false;
        }

        // row does not exist
        if ($result->num_rows < 1) {
            return false;
        }

        // row exists
        return true;
    }

    /* DELETE FUNCTIONS */

    public function deleteByPK($pk)
    {
        if (!is_array($pk)) {
            return $this->deleteByColName($this->tablePK, $pk);
        } else {
            // else, primary key is composite. we can't use deleteByColName()
            
            $queryString = <<<SQL
DELETE FROM {$this->tableName}
WHERE 
SQL;

            $types = '';

            $params = array();

            // keys of associative array
            $keys = array_keys($pk);

            // last key
            $end = end($keys);

            // iterate through each value in array
            foreach ($pk as $key => &$value) {
                // make sure key is a valid column (prevent sql inject)
                if (!in_array($key, $this->tablePK)) {
                    $trace = debug_backtrace();
                    trigger_error(
                        'Undefined fieldname via deleteByPK(): ' . $key .
                        ' in ' . $trace[0]['file'] .
                        ' on line ' . $trace[0]['line'],
                        E_USER_WARNING);

                    return false;
                }

                // type of primary key
                $types .= self::getSQLType($value);

                // store primary key by reference
                $params[] = &$value;

                // append each key onto query string
                $queryString .= <<<SQL
$key = ?
SQL;

                // add ANDs for all but last.
                if ($key !== $end) {
                    $queryString .= ' AND ';
                }
            }

            // query the database.
            return $this->safeQuery($queryString, $types, $params);
        }
    }

    public function deleteByColName($fieldname, $fieldvalue)
    {
        $query = <<<SQL
DELETE FROM {$this->tableName}
WHERE 
SQL;

        // make sure fieldname is valid
        if (in_array($fieldname, $this->columns)) {
            $query .= <<<SQL
$fieldname = ?
SQL;

            // primary key type
            $types = self::getSQLType($fieldvalue);

            // put fieldvalue in array
            $params = array(&$fieldvalue);

            // return status of query
            return $this->safeQuery($query, $types, $params);
        }

        $trace = debug_backtrace();
        trigger_error(
            'Undefined fieldname via deleteByColName(): ' . $fieldname .
            ' in ' . $trace[0]['file'] .
            ' on line ' . $trace[0]['line'],
            E_USER_WARNING);

        return false;
    }

    /* UPDATE FUNCTIONS */

    public function updateByPK($row)
    {
        if (!is_array($this->tablePK)) {
            return $this->updateByColName($this->tablePK, $row);
        } else {
            $query = <<<SQL
UPDATE {$this->tableName}
SET 
SQL;

            // get pk array and validate columns
            $pk = array();
            foreach ($row as $key => $value) {
                // validate
                if (!in_array($key, $this->columns)) {
                    $trace = debug_backtrace();
                    trigger_error(
                        'Undefined fieldname via updateByPK(): ' . $key .
                        ' in ' . $trace[0]['file'] .
                        ' on line ' . $trace[0]['line'],
                        E_USER_WARNING
                    );

                    return false;
                }

                // field key is a primary key column
                if (in_array($key, $this->tablePK)) {
                    $pk[$key] = $value;

                    // remove field key from row
                    unset($row[$key]);
                }
            }

            // validate primary keys
            if (array_keys($pk) !== $this->tablePK) {
                $trace = debug_backtrace();
                trigger_error(
                    'Mismatch of primary key and expected via updateByPK(): ' . $this->tableName .
                    ' has ' . count($this->tablePK) . ' primary keys ' .
                    ' in ' . $trace[0]['file'] .
                    ' on line ' . $trace[0]['line'],
                    E_USER_WARNING
                );

                return false;
            }

            // get keys of remaining row
            $keys = array_keys($row);

            // append imploded values
            $query .= implode(' = ?, ', $keys);
            $query .= ' = ?';

            // append primary keys
            $query .= ' WHERE ';
            $query .= implode(' = ? AND ', array_keys($pk));
            $query .= ' = ?';

            // specify types of params to bind
            $types = '';

            // values need to be stored as references
            $params = array();

            // add types
            // and row to params
            foreach ($row as &$r) {
                $types .= self::getSQLType($r);
                $params[] = &$r;
            }

            // put primary keys in params and types
            foreach ($pk as &$p) {
                $types .= self::getSQLType($p);
                $params[] = &$p;
            }

            // return boolean
            return $this->safeQuery($query, $types, $params);
        }
    }

    /**
     * uses fieldname of the given row
     * to update all other columns.
     */
    public function updateByColName($fieldname, $row)
    {
        // initial part of query
        $query = <<<SQL
UPDATE {$this->tableName}
SET 
SQL;

        // retrive fieldvalue and validate
        if (isset($row[$fieldname]) && in_array($fieldname, $this->columns)) {
            $fieldvalue = $row[$fieldname];
            unset($row[$fieldname]);

            // do nothing if array is now empty
            if (empty($row)) {
                $this->latestQuery = 'NO CHANGE to ' . $this->tableName;
                return true;
            }
        } else {
            $trace = debug_backtrace();
            trigger_error(
                'Undefined search column via updateByColName(): ' . $fieldname .
                ' in ' . $trace[0]['file'] .
                ' on line ' . $trace[0]['line'],
                E_USER_WARNING);

            return false;
        }

        // save keys of row in array
        $keys = array_keys($row);

        // validate row keys
        foreach ($keys as $key) {
            if (!in_array($key, $this->columns)) {
                $trace = debug_backtrace();
                trigger_error(
                    'Undefined fieldname via updateByColName(): ' . $key .
                    ' in ' . $trace[0]['file'] .
                    ' on line ' . $trace[0]['line'],
                    E_USER_WARNING
                );

                return false;
            }
        }

        // save end value of row
        $end = end($keys);

        // append keys to query
        $query .= implode(' = ?, ', $keys);
        $query .= ' = ?';

        // specify fieldname
        $query .= <<<SQL

WHERE $fieldname = ?
SQL;

        // specify types of params to bind
        $types = '';

        // values need to be stored as references
        $params = array();

        // add types
        // and row to params
        foreach ($row as &$r) {
            $types .= self::getSQLType($r);
            $params[] = &$r;
        }

        // put primary key in params and types
        $types .= self::getSQLType($fieldvalue);
        $params[] = &$fieldvalue;

        // return boolean
        return $this->safeQuery($query, $types, $params);
    }
}

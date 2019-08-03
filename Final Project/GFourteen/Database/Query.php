<?php

class Query implements QueryInterface
{
    // database link
    protected $mysqli;

    // latest query run
    protected $latestQuery;

    // static database link
    private static $staticmysqli;

    // location of config file
    const CONFIG_PATH = '/home/GROUP14/config.ini.php';

    public function __construct()
    {
        // open static link
        $this->openDatabase();

        // set instance link
        $this->mysqli = self::$staticmysqli;
    }

    /**
     * opens static link to database
     */
    private function openDatabase()
    {
        // only open link if not already open
        if (empty(self::$staticmysqli)) {
            // open config file
            $config = parse_ini_file(self::CONFIG_PATH);

            // open link to database
            self::$staticmysqli = new mysqli($config['hostname'], $config['username'], $config['password'], $config['database']);

            // destroy config data for security
            unset($config);
        }

        // end on error
        if (self::$staticmysqli->connect_errno) {
            $trace = debug_backtrace();
            trigger_error(
                'Error opening database via openDatabase(): (' . self::$staticmysqli->errno . ') ' . self::$staticmysqli->error . 
                ' in ' . $trace[0]['file'] .
                ' on line ' . $trace[0]['line'],
                E_USER_ERROR);
        }
    }

    public function getLink()
    {
        return $this->mysqli;
    }

    public function quickQuery($query)
    {
        // store latest query
        $this->latestQuery = $query;

        // use mysqli_query()
        return $this->getLink()->query($query);
    }

    public function safeQuery(string $query, string $type, array $params)
    {
        // store latest query
        $this->latestQuery = $query;

        // prepare statement
        if (!$stmt = $this->getLink()->prepare($query)) {
            $trace = debug_backtrace();
            trigger_error(
                'Error preparing statement via safeQuery(): (' . $this->getLink()->errno . ') ' . $this->getLink()->error .
                ' in ' . $trace[0]['file'] .
                ' on line ' . $trace[0]['line'],
                E_USER_WARNING);

            return false;
        }

        // bind parameter array
        // we have to use this function instead of bind_param directly
        // because $params will have a varying amount of parameters
        $callback = array($stmt, 'bind_param');     // function to call on stmt
        $params_arr = array_merge(array($type), $params);   // parameters to pass
        if (!call_user_func_array($callback, $params_arr)) {
            $trace = debug_backtrace();
            trigger_error(
                'Error binding parameters via safeQuery(): (' . $this->getLink()->errno . ') ' . $this->getLink()->error .
                ' in ' . $trace[0]['file'] .
                ' on line ' . $trace[0]['line'],
                E_USER_WARNING);

            return false;
        }

        // execute statement
        if (!($stmt->execute())) {
            $trace = debug_backtrace();
            trigger_error(
                'Error executing statement via safeQuery(): (' . $this->getLink()->errno . ') ' . $this->getLink()->error .
                ' in ' . $trace[0]['file'] .
                ' on line ' . $trace[0]['line'],
                E_USER_WARNING);

            return false;
        }

        // return the result if query is a SELECT, SHOW, DESCRIBE, or EXPLAIN statement
        $arr = array('SEL', 'SHO', 'DES', 'EXP');
        if (in_array(substr($query, 0, 3), $arr, true)) {
            return $stmt->get_result();
        } elseif (!$stmt->errno) {
            // successful query
            return true;
        } else {
            // nope. check $stmt->errno
            return false;
        }
    }

    public static function notify($message, $isGood = false)
    {
        if ($isGood) {
            echo <<<HTML

        <div class="alert alert-success">$message</div>

HTML;
        } else {
            echo <<<HTML

        <div class="alert alert-danger">$message</div>

HTML;
        }
    }

    public static function getSQLType($var)
    {
        switch (gettype($var)) {
            case 'boolean':
            case 'integer':
                return 'i';
            case 'double':
                return 'd';
            case 'string':
                return 's';
            default:
                // trigger an error, but return s for string as default
                $trace = debug_backtrace();
                trigger_error(
                    'Undefined type of variable via getSQLType(): ' . gettype($var) .
                    ' in ' . $trace[0]['file'] .
                    ' on line ' . $trace[0]['line'],
                    E_USER_WARNING);
                return 's';
        }
    }

    public function __get($name)
    {
        if (property_exists(get_class($this), $name)) {
            // `$name` not `name`
            return $this->$name;
        }

        $trace = debug_backtrace();
        trigger_error(
            'Undefined property via __get(): ' . $name .
            ' in ' . $trace[0]['file'] .
            ' on line ' . $trace[0]['line'],
            E_USER_NOTICE);
        return null;
    }
}

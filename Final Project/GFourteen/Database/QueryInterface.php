<?php

/**
 * class for general querying functions
 */
interface QueryInterface
{
    /**
     * returns the currently opened link.
     *
     * @return mysqli_link opened database link
     */
    public function getLink();

    /**
     * direcly querys database
     * DO NOT use with user-input query
     * (use safeQuery instead)
     *
     * @param string $query query to run on database
     * @return mysqli_result|boolean Result from a SELECT query or false on failure of any other query
     */
    public function quickQuery($query);

    /**
     * uses prepared statements
     * to query database with params array
     * NOTE: $params must be an array of REFERENCES, not values
     *
     * @param string $query query to run on database
     * @param string $type types of each param (s = string, i = integer, d = double/float)
     * @param mixed[] $params array of references to parameters to bind to query
     * @return mysqli_result|boolean Result from a SELECT query or false on failure of any other query
     */
    public function safeQuery(string $query, string $type, array $params);

    /**
     * print text inside span
     * (for CSS)
     *
     * @param string $message message to echo
     * @param boolean $isGood determines if html class equals good or bad
     */
    public static function notify($message, $isGood);

    /**
     * gives the type identifier needed for mysqli_stmt:bind_param()
     *
     * @param mixed $var variable to parse
     * @return string i, d, or s
     */
    public static function getSQLType($var);

    /**
     * magic method
     * returns the desired class property
     * NOTE: PHP auto-calls this function
     * for example, $this->property will return __get('property')
     *
     * @param string $name name of property
     * @return mixed property
     */
    public function __get($name);
}

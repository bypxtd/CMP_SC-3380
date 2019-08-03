<?php

/**
 * single-table queries with single or composite primary keys
 */
interface QuerySingleInterface
{
    /**
     * set current table (and primary key and columns names)
     *
     * @param   string      $tableName  name of table
     * @return  boolean                 true on success, false on query fail
     */
    public function setTable($tableName);

    /**
     * inserts associative array into row
     *
     * @param   mixed       $row        array of data
     * @return  boolean
     */
    public function insertRow($row);

    /**
     * displays all rows in table
     *
     * @param   boolean     $doOptions  on true, display column for options
     * @param   string[]    $forms      associative array of forms to print in options.
     */
    public function displayAll($doOptions, $forms);

    /**
     * displays rows by a particular column name
     *
     * @param   string      $fieldname  name of column to search by
     * @param   mixed       $fieldvalue value to search for
     * @param   boolean     $doOptions  on true, display column for options
     * @param   string[]    $forms      associative array of forms to print in options.
     */
    public function displayByColName($fieldname, $fieldvalue, $doOptions, $forms);

    /**
     * displays rows LIKE a particular column name
     *
     * @param   string      $fieldname  name of column to search for
     * @param   mixed       $fieldvalue value to search LIKE
     * @param   boolean     $doOptions  on true, display column for options
     * @param   string[]    $forms      associative array of forms to print in options.
     */
    public function displayLikeColName($fieldname, $fieldvalue, $doOptions = false, $forms = array());

    /**
     * prints table dynamically using a given mysqli_result.
     *
     * @param   mysqli_result $result   result to print into table
     * @param   boolean     $doOptions  print options
     * @param   string[]    $forms      paths to page to submit form to
     * @param   string      $headers    custom table headings.  count must match number of fields
     * @return  boolean                 true on success, false if formPath doesn't exist
     */
    public function displayTable($result, $doOptions, $forms, $headers);

    /**
     * selects row by primary key
     *
     * @param   string|string[] $pk     primary key or array of primary keys
     * @return  boolean|mysqli_result   false on fail, else returns a result
     */
    public function selectByPK($pk);
    
    /**
     * selects row(s) by column name
     *
     * @param   string      $fieldname  column name
     * @param   mixed       $fieldvalue value to search by
     * @return  boolean|mysqli_result   false on failure, else returns a mysqli_result
     */
    public function selectByColName($fieldname, $fieldvalue);

    /**
     * selects row(s) LIKE column name
     *
     * @param   string      $fieldname  column name
     * @param   mixed       $fieldvalue value to search LIKE
     * @return  boolean|mysqli_result   false on failure, else returns a mysqli_result
     */
    public function selectLikeColName($fieldname, $fieldvalue);

    /**
     * selects all rows from table
     *
     * @return boolean|mysqli_result
     */
    public function selectAll();

    /**
     * verifies a primary key exists in the table
     *
     * @param   string      $pk         primary key
     * @return  boolean                 true on exists, false on does not exist or failed query
     */
    public function verifyPK($pk);

    /**
     * deletes a row based on primary key
     *
     * @param   string|mixed[] $pk      primary key or array of primary keys
     * @return  boolean                 true on success, false on failed query
     */
    public function deleteByPK($pk);

    /**
     * deletes row(s) by column name
     *
     * @param   string      $fieldname  name of column to search
     * @param   string      $fieldvalue value to delete by
     * @return  boolean                 true on success, false on failed query
     */
    public function deleteByColName($fieldname, $fieldvalue);

    /**
     * updates row based on row's primary key
     *
     * @param   mixed[]     $row        row to update
     * @return  boolean                 true on success, false on bad query
     */
    public function updateByPK($row);

    /**
     * updates row(s) based on column value
     *
     * @param   string      $fieldname  column name
     * @param   mixed[]     $row        values to update
     * @return  boolean                 true on success
     */
    public function updateByColName($fieldname, $row);
}

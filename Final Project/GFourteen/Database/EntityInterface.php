<?php

interface EntityInterface
{
    /**
     * returns a new object from table row
     *
     * @param   mixed|mixed[] $pk       primary key of row or array of composite primary keys
     * @return  Entity                  new child of Entity class
     */
    public static function open($pk);

    /**
     * saves object (row) to database
     * will update if the row already exists
     * or insert if it's a new row
     *
     * @return  boolean
     */
    public function save();

    /**
     * Returns primary key
     * or array of primary keys
     *
     * @return  mixed                   primary key
     */
    public function getPK();

    /**
     * magic method
     * returns the desired class property
     * PHP auto-calls this function
     * for example, $this->property will return __get('property')
     *
     * @param   string      $name       name of property
     * @return  mixed                   property
     */
    public function __get($name);

    /**
     * PHP calls this magic function when this
     * object is serialized.
     * in this case, all unset properties are not serialized
     * (because unserialized can be slow)
     *
     * @return mixed[]                  array of name of properties to serialize
     */
    public function __sleep();
}

<?php
// only define function once
if (!(function_exists('autoloadGFourteen'))) {

    /**
     * autoload function for GForuteen package.
     * automatically imports all necessary classes
     *
     * @param string $classname name of class to include
     */
    function autoloadGFourteen($classname)
    {
        $filename = '/home/GROUP14/GFourteen/Database/' . $classname . '.php';
        if (is_readable($filename)) {
            require $filename;
        }
    }
}

// if no functions registered or our autoloader is not in the registered functions
if (!spl_autoload_functions() || !in_array('autoloadGFourteen', spl_autoload_functions())) {
    spl_autoload_register('autoloadGFourteen');
}

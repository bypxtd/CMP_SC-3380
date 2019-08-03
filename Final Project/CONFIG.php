<?php

// open ini file as array
$config = parse_ini_file('/home/GROUP14/config.ini.php');

define('HOSTNAME', $config['hostname']);
define('DATABASE', $config['database']);
define('USERNAME', $config['username']);
define('PASSWORD', $config['password']);
define('ROOT_14', '/home/GROUP14/public_html');

unset($config);

$USERNAME = USERNAME;
$HOSTNAME = HOSTNAME;
$DATABASE = DATABASE;
$PASSWORD = PASSWORD;

?>

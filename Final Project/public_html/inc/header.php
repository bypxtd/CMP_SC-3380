<header>
<?php
require 'autoload.php';

// load person class from session
if ( isset($_SESSION['person']) ) {
    $person = unserialize($_SESSION['person']);
} else {
    $person = false;
}

// different header for internal
if (preg_match('/(internal)/', $_SERVER['REQUEST_URI'])) {
    // navbar
    include 'navbar_internal.php';

    echo "<h1>Missouri Rail - Employee Facing Content</h1>";
}
else {
    // navbar
    include 'navbar_store.php';

    echo "<h1>The Missouri Rail - Store</h1>";
}
?>
</header>

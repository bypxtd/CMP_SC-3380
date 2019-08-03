<nav>
    <ul>
        <li><a href="/~GROUP14/store/">Store Home</a></li>
        <li><a href="/~GROUP14/store/listings/">Listings</a></li>
        <li><a href="/~GROUP14/schedule.php">Train Schedule</a></li>
        <li><a href="/~GROUP14/stations.php">Stations</a></li>
        <li><a href="/~GROUP14/log.php">Log</a></li>
        <li class="home-link"><a href="/~GROUP14/">The Missouri Rail</a></li>
        <li id="userbox">
<?php
// if not (person set in session and able to unserialize person)
if (!$person) {
    // display un-authed box
    include 'userbox_store.php';
} elseif (get_parent_class($person) === 'Employee') {
    // display employee box
    include 'userbox_internal_authed.php';
} elseif (get_class($person) === 'Customer') {
    // display vendor box
    include 'userbox_store_authed.php';
} else {
    trigger_error(
        'Undefined person via navbar_store.php.  Make sure autoload.php is included.',
        E_USER_WARNING
    );
}
?>
        </li>
    </ul>
</nav>

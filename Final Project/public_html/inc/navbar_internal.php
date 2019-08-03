<nav>
    <ul>
        <li><a href="/~GROUP14/internal/">Internal Home</a></li>
        <li><a href="/~GROUP14/schedule.php">Train Schedule</a></li>
        <li><a href="/~GROUP14/stations.php">Stations</a></li>
        <li><a href="/~GROUP14/log.php">Log</a></li>
        <li><a href="/~GROUP14/img/erd.png">View ERD</a></li>
<?php
if ($person && get_class($person) === 'Administrator')
    echo '<li><a href="/~GROUP14/internal/admin">Admin Tools</a></li>';
?>
        <li class="home-link"><a href="/~GROUP14/">The Missouri Rail</a></li>
        <li id="userbox">
<?php
if ($person && get_parent_class($person) === 'Employee') {
    include 'userbox_internal_authed.php';
} else {
    include 'userbox_internal.php';
}
?>
        </li>
    </ul>
</nav>

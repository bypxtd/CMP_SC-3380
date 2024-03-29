<?php

require '../../../inc/autoload.php';
require '../adminCheck.php';

// stuff for AJAX
if (isset($_GET['showGraveyard']))
{
    // echo table
    list_users($_GET['showGraveyard']);
    exit;
}

// displays users in Person as a table
// argument toggles showing deleted users
function list_users($doGraveyard)
{
    include '../../../inc/utils.php';
    $mysqli = openDB();

    // query Administrator
    $query = "SELECT Administrator.UserID, FirstName, LastName
        FROM Administrator
        JOIN Person
        ON Person.UserID = Administrator.UserID";

    if (!$doGraveyard)
        $query = $query . " WHERE Graveyard=false";

    // function from utils:
    display_table($mysqli, $query, "Administrators");

    // new query for Conductor
    $query = "SELECT Conductor.UserID, FirstName, LastName, Status, Rank
        FROM Conductor
        JOIN Person
        ON Person.UserID = Conductor.UserID";

    if (!$doGraveyard)
        $query = $query . " WHERE Graveyard=false";

    display_table($mysqli, $query, "Conductors");

    // new query for Engineer
    $query = "SELECT Engineer.UserID, FirstName, LastName, Status, Rank, Hours
        FROM Engineer
        JOIN Person
        ON Person.UserID = Engineer.UserID";

    if (!$doGraveyard)
        $query = $query . " WHERE Graveyard=false";

    display_table($mysqli, $query, "Engineers");

    // new query for Customer
    $query = "SELECT Customer.UserID, FirstName, LastName, Customer.CompanyID
        FROM Customer
        JOIN Person
        ON Person.UserID = Customer.UserID";

    if (!$doGraveyard)
        $query = $query . " WHERE Graveyard=false";

    display_table($mysqli, $query, "Customers");

    // done
}

?>
<!DOCTYPE html>
<html lang="en">
    <head>
<?php include '../../../inc/meta.php'; ?>
        <title>Manage Users | Missouri Rail</title>
<script type="text/javascript">
<!--
// javascript for AJAX
function showGraveyard(g)
{
    // display loading until done
    document.getElementById("ajax-message").style.opacity = 1;

    xmlhttp=new XMLHttpRequest();
    xmlhttp.onreadystatechange=function()
    {
        if (this.readyState==XMLHttpRequest.DONE && this.status==200)
        {
            // set userlist div to xmlhttp's response
            document.getElementById("user-list").innerHTML = this.responseText;

            // done!
            setTimeout(function(){document.getElementById("ajax-message").style.opacity = 0;}, 50);
        }
    }

    // send request, appending passed value
    xmlhttp.open("GET","index.php?showGraveyard=" + g,true);
    xmlhttp.send();
}
//-->
</script>
    </head>
    <body>
<?php include '../../../inc/header.php'; ?>
        <main>
            <h1>Manage Users</h1>
            <aside><a href="../">&#8617;Back</a></aside>
            <input type="radio" onclick="showGraveyard(1)" name="showGraveyard" id="showYes">
            <label for="showYes">Show Deleted Users</label> <br>
            <input type="radio" onclick="showGraveyard('')" name="showGraveyard" id="showNo" checked>
            <label for="showNo">Hide Deleted Users</label>
            <span id="ajax-message" class="whirl" style="opacity: 0;">Loading...</span>
            <!-- this is the div changed by AJAX: -->
            <div id="user-list">
<?php
list_users(false);
?>
            </div>
        </main>
<?php include '../../../inc/footer.php'; ?>
    </body>
</html>

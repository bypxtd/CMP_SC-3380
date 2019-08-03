<?php

include "../../inc/autoload.php";
include "../../internal/login/loginCheck.php";
if($_SESSION['loggedin'] == false)  {
    //header("Location: ../../login/loginCheck.php;
    //exit;
    //dont know what to do here yet, may need it idk

}
else  {
}



function openDB()  {

    include "../../../CONFIG.php";

    $mysqli = new mysqli($HOSTNAME, $USERNAME, $PASSWORD, $DATABASE);

    if($mysqli->connect_errno)  {
        echo "Couldnt connect to the database";
        exit;
    }

    return $mysqli;

}

function makeQuery($sql, $mysqli, $loc, $count)  {

	$stmt = $mysqli->prepare($sql);
	if(!$stmt)  {
		echo "error preparing statement";
		return false;
	}
	
	
	if($count == 1)  {
		//echo"<br>Well it looks like we only got price";
		$stmt->bind_param("s", $_REQUEST['price']);
	}	
		
	else if($count == 2)  {
		//echo"<br>Well it looks like we only got type";
		$type = $_REQUEST['type'] . "%";
		$stmt->bind_param("s", $type );	
	}
	
	else if($count == 3)  {
		//echo"<br>Well it looks like we got both";
		$type = $_REQUEST['type'] . "%";
		$stmt->bind_param("ss", $_REQUEST['price'], $type);
		
	}
	
	if ($stmt->errno)  {
		echo "Error binding parameters: <br>";
		echo nl2br(print_r($stmt->error_list, true), false);
		return false;
	}
	
	
	if (!$stmt->execute())  {
		echo "Error executing query: <br>";
		echo nl2br(print_r($stmt->error_list, true), false);
		return false;
	}
	
	$result = $stmt->get_result();
	
    echo "<table><tr>";
	
    while($fieldInfo = mysqli_fetch_field($result))  {
        echo "<th>" . $fieldInfo->name . "</th>";
    }
    echo "<th>Location</th>";
    echo "<th></th>";
    echo "</tr>";
    $sentance = "";
    while($row = $result->fetch_array(MYSQLI_NUM))  {
        $sentance = "<tr>";
        foreach($row as $value)  {
            $sentance .= "<td>" . $value . "</td>";
        }
        
        //this part displays the location using the serial number
        $location = Equipment::findLocation($row[0]);
        if($location)  {
        	$sentance .= "<td>" . $location->name . "</td>";
        }
        else  {
        	$sentance .= "<td>N/A</td>";
        }
        
        $sentance .= "<td><form action='../car/carInfo.php' method='POST'>";
        $sentance .= "<input type='hidden' name='SerialNumber' value='" . $row[0] . "'>";
        $sentance .= "<input type='submit' name='select' value='select'></form></td>";
        
        $sentance .= "</tr>";
        
        //this allows the table to not include certain rows because of 
        //if($location && $loc != "")
        	//if(stripos($loc, $location->name) !== false)  {
        		//echo $loc . "<br>";
        		//echo $location->name;
        		echo $sentance;
        	//}
        		
        		
    }
    echo "</table>";
}

$string = "SELECT * FROM Equipment";

$count = 0;

if(isset($_REQUEST["price"]))  {
	$string .= " WHERE Price < ?";
	//$_REQUEST["price"];
	$count += 1;
}

	
if(isset($_REQUEST["type"]) && $_REQUEST["type"] != "")  {
	if($count == 1)  {
		$string .= " AND";
	}
	$string .= " Type LIKE ?";
	//$_REQUEST["type"];
	$count += 2;
}

	//echo "I aint got no type!";
	
	
if(isset($_REQUEST["loc"]))  {
	$loc = $_REQUEST["loc"];
}
else  {
	$loc = false;
}


$string .= ";";

//echo $loc . "<br>";
/*
echo $string . "<br>";
echo $_REQUEST["type"] . "<br>";
echo $_REQUEST["price"] . "<br>";
*/

$mysqli = openDB();

makeQuery($string, $mysqli, $loc, $count);


?>

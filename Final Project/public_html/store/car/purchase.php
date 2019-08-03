<?php
include "../../internal/login/loginCheck.php";

if($_SESSION['loggedin'] == false)  {
    //   header("Location: ../../login/loginCheck.php");
    //  exit;
}
?>
<!DOCTYPE html>
<html>
    <head>
        <?php include '../../inc/meta.php'; ?>
        <title>Purchase</title>
        <style>
            #f{
                float: left;
            }    
        </style>
    </head>
    <body>
<?php include '../../inc/header.php'; ?>
        <main>
<?php

if (isset($_POST['submit'])){
    $id = $_POST['SerialNumber'];
    include "../../../CONFIG.php";
    $mysqli = new mysqli($HOSTNAME, $USERNAME, $PASSWORD, $DATABASE);
            if ($mysqli->connect_errno){
	           echo "Connection failed.";
	           exit();
            }
    
    $sql = "SELECT * FROM Equipment WHERE SerialNumber = '$id'";
    $result = $mysqli->query($sql);
    $row = $result->fetch_array(MYSQLI_NUM);
    
    $sql2 = "SELECT * FROM Train";
    $result2 = $mysqli->query($sql2);
    
    $sql3 = "SELECT * FROM Customer";
    $result3 = $mysqli->query($sql3);
    
?>
        <h1>Please complete your information</h1>
        <form action="" method="post">
            <article><h3>CompanyID: <br></h3>
            <p><input name="UserID" type="text" required></p>
            <h3>Type of car: <br></h3>
            <p><input readonly name="Typeofcar" type="text" value= <?= $row[1] ?>><br></p>

            <h3>Number of car: <br></h3>
                <p><input readonly name="Numberofcar" type="text" value="1"><br></p></article>
            <article>
            <h3>Cargo: <br></h3>
            <p><input name="Cargo" type="text" required><br></p>

            <h3>SerialNumber: <br></h3>
        <input readonly name="SerialNumber" type="text" value= <?= $row[0] ?>><br>
            <h3>TrainNumber: <br></h3>
        <select name="TrainNumber" required>
<?php    while($row2 = $result2->fetch_array(MYSQLI_NUM)){ ?>
	       <option value=<?= $row2[0] ?>><?= $row2[0] ?></option> ;
<?php
    }
?>
            </select>
            </article>

        <article><?php echo "<h3>The total price will be: $".$row[2]*1.05." with tax.</h3>"; ?>
            <h2>press the button to confirm this order</h2>
            <noscript>You must enable JavaScript in your browser!!</noscript>
            <input type="submit" name="confirm" value="confirm">
            <img src="../../img/Missouri_Rail_Logo_Draft_Color.png" alt="Missouri_Rail_lOGO">
        </article>
        </form>
        <h2>press the button to cancel this order</h2>
        <form action="../listings/index.php" method="post">
			<input type="submit" name="cancel" value="cancel">
		</form>
<?php
    }
?>
        
<?php
        if (isset($_POST['confirm'])){
            include "../../../CONFIG.php";

            $mysqli = new mysqli($HOSTNAME, $USERNAME, $PASSWORD, $DATABASE);
            if ($mysqli->connect_errno){
	           echo "Connection failed.";
	           exit();
            }
        $query = "SELECT * FROM Customer WHERE UserID=?";
        $stmt = $mysqli->stmt_init();
        if (!$stmt->prepare($query)){
            exit();
        }
        $stmt->bind_param("s", $_POST['UserID']);
        $stmt->execute();
        $result = $stmt->get_result();
        $exist = $result->num_rows;
        if ($exist == 1){
        echo "Your UserID is: " . $_POST['UserID'];
        $query = "INSERT INTO Reservation VALUES(?,?,?,?)";
        $stmt = $mysqli->stmt_init();
        if (!$stmt->prepare($query)){
            exit();
        }
        $stmt->bind_param("ssss", $_POST['TrainNumber'], $_POST['SerialNumber'], $_POST['UserID'], $_POST['Cargo']);
        $stmt->execute();
        echo "<hr>Reservation complete.";
        }
        else {
            echo "Your UserID is not exist.";
        }
        $stmt->close();
        $mysqli->close();
        }
?>
		
		<p><span id="txtHint"></span></p>
        
        </main>
<?php include '../../inc/footer.php'; ?>
    </body>
</html>

<html>
<head>
<?php include '../../inc/meta.php'; ?>
<link rel="shortcut icon" href="../../img/MRR.ico" />
<title>purchase</title>
<style>
    #f{
        float: left;
    }    
</style>
</head>
<body>
<?php include '../../inc/header.php'; ?>
    <main>
        <h1>Here is Your Car!</h1>
        <?php

if (isset($_POST['select'])){
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
    
    ?>

    <form action="purchase.php" method="POST">
        SerialNumber: 
        <input readonly name="serialnumber" type="text" value= <?= $row[0] ?>>
        Type        : 
        <input readonly name="type" type="text" value= <?= $row[1] ?>>
        </form>
    <form action="purchase.php" method="POST">
        Price       : 
        <input readonly name="price" type="text" value= <?= $row[2] ?>>
        Manufacturer: 
        <input readonly name="manufacturer" type="text" value= <?= $row[2] ?>>
        <input name="submit" type="submit" value = "I want you">
        <input type="hidden" name="SerialNumber" value= <?= $row[0] ?>>
        </form>
        <form action="index.php" method="post">
			<input type="submit" name="research" value="Re-search by the type">
		</form>

<?php

}
        
?>
        
    </main>
    </body>
</html>
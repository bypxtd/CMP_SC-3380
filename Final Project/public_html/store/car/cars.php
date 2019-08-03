<?php include '../../inc/autoload.php';?>
<?php include '../../internal/login/loginCheck.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
<?php include '../../inc/meta.php'; ?>
	<title>Car Listings - Missouri Rail</title>
</head>
<body>
<?php include '../../inc/header.php'; ?>


<main>
    
<?php

include "../../../CONFIG.php";

$mysqli = new mysqli($HOSTNAME, $USERNAME, $PASSWORD, $DATABASE);
if ($mysqli->connect_errno){
	echo "Connection failed.";
	exit();
}

if($_GET['type'] == "autorack"){ 
$sql = "SELECT * FROM Equipment WHERE Type = 'autorack'";
$result = $mysqli->query($sql);

echo"<table>";
while($fieldinfo = mysqli_fetch_field($result)){
	echo"<th>".$fieldinfo->name."</th>";
}

while($row = $result->fetch_array(MYSQLI_NUM)){
	echo"<tr>";
	foreach($row as $data){
	echo"<td>". $data. "</td>";
}
?>
    <td>
    <form action="carInfo.php" method="POST">
        <input type="hidden" name="SerialNumber" value='<?= $row[0] ?>'>
        <input type="submit" name="select" value="select">
    </form>
    </td>
<?php
    echo "</tr>";
}
    $rows = $result->num_rows;
    echo "There are ".$rows." results.";
    echo "</table>";
}
if($_GET['type'] == "caboose"){ 
$sql = "SELECT * FROM Equipment WHERE Type = 'caboose'";
$result = $mysqli->query($sql);

echo"<table>";
while($fieldinfo = mysqli_fetch_field($result)){
	echo"<th>".$fieldinfo->name."</th>";
}

while($row = $result->fetch_array(MYSQLI_NUM)){
	echo"<tr>";
	foreach($row as $data){
	echo"<td>". $data. "</td>";
}
?>
    <td>
    <form action="carInfo.php" method="POST">
        <input type="submit" name="select" value="select">
        <input type="hidden" name="SerialNumber" value='<?= $row[0] ?>'>
    </form>
    </td>
<?php
    echo "</tr>";
}
    $rows = $result->num_rows;
    echo "There are ".$rows." results.";
    echo "</table>";
}
if($_GET['type'] == "flatcar"){ 
$sql = "SELECT * FROM Equipment WHERE Type = 'flatcar'";
$result = $mysqli->query($sql);

echo"<table>";
while($fieldinfo = mysqli_fetch_field($result)){
	echo"<th>".$fieldinfo->name."</th>";
}

while($row = $result->fetch_array(MYSQLI_NUM)){
	echo"<tr>";
	foreach($row as $data){
	echo"<td>". $data. "</td>";
}
?>
    <td>
    <form action="carInfo.php" method="POST">
        <input type="hidden" name="SerialNumber" value='<?= $row[0] ?>'>
        <input type="submit" name="select" value="select">
    </form>
    </td>
<?php
    echo "</tr>";
}
    $rows = $result->num_rows;
    echo "There are ".$rows." results.";
    echo "</table>";
}
if($_GET['type'] == "gondola"){ 
$sql = "SELECT * FROM Equipment WHERE Type = 'gondola'";
$result = $mysqli->query($sql);

echo"<table>";
while($fieldinfo = mysqli_fetch_field($result)){
	echo"<th>".$fieldinfo->name."</th>";
}

while($row = $result->fetch_array(MYSQLI_NUM)){
	echo"<tr>";
	foreach($row as $data){
	echo"<td>". $data. "</td>";
}
?>
    <td>
    <form action="carInfo.php" method="POST">
        <input type="hidden" name="SerialNumber" value='<?= $row[0] ?>'>
        <input type="submit" name="select" value="select">
    </form>
    </td>
<?php
    echo "</tr>";
}
    $rows = $result->num_rows;
    echo "There are ".$rows." results.";
    echo "</table>";
}
if($_GET['type'] == "hopper"){ 
$sql = "SELECT * FROM Equipment WHERE Type = 'hopper'";
$result = $mysqli->query($sql);

echo"<table>";
while($fieldinfo = mysqli_fetch_field($result)){
	echo"<th>".$fieldinfo->name."</th>";
}

while($row = $result->fetch_array(MYSQLI_NUM)){
	echo"<tr>";
	foreach($row as $data){
	echo"<td>". $data. "</td>";
}
?>
    <td>
    <form action="carInfo.php" method="POST">
        <input type="hidden" name="SerialNumber" value='<?= $row[0] ?>'>
        <input type="submit" name="select" value="select">
    </form>
    </td>
<?php
    echo "</tr>";
}
    $rows = $result->num_rows;
    echo "There are ".$rows." results.";
    echo "</table>";
}
if($_GET['type'] == "locomotive"){ 
$sql = "SELECT * FROM Equipment WHERE Type = 'locomotive'";
$result = $mysqli->query($sql);

echo"<table>";
while($fieldinfo = mysqli_fetch_field($result)){
	echo"<th>".$fieldinfo->name."</th>";
}

while($row = $result->fetch_array(MYSQLI_NUM)){
	echo"<tr>";
	foreach($row as $data){
	echo"<td>". $data. "</td>";
}
?>
    <td>
    <form action="carInfo.php" method="POST">
        <input type="hidden" name="SerialNumber" value='<?= $row[0] ?>'>
        <input type="submit" name="select" value="select">
    </form>
    </td>
<?php
    echo "</tr>";
}
    $rows = $result->num_rows;
    echo "There are ".$rows." results.";
    echo "</table>";
}
if($_GET['type'] == "spine car"){ 
$sql = "SELECT * FROM Equipment WHERE Type = 'spine car'";
$result = $mysqli->query($sql);

echo"<table>";
while($fieldinfo = mysqli_fetch_field($result)){
	echo"<th>".$fieldinfo->name."</th>";
}

while($row = $result->fetch_array(MYSQLI_NUM)){
	echo"<tr>";
	foreach($row as $data){
	echo"<td>". $data. "</td>";
}
?>
    <td>
    <form action="carInfo.php" method="POST">
        <input type="hidden" name="SerialNumber" value='<?= $row[0] ?>'>
        <input type="submit" name="select" value="select">
    </form>
    </td>
<?php
    echo "</tr>";
}
    $rows = $result->num_rows;
    echo "There are ".$rows." results.";
    echo "</table>";
}
if($_GET['type'] == "tank car"){ 
$sql = "SELECT * FROM Equipment WHERE Type = 'tank car'";
$result = $mysqli->query($sql);

echo"<table>";
while($fieldinfo = mysqli_fetch_field($result)){
	echo"<th>".$fieldinfo->name."</th>";
}

while($row = $result->fetch_array(MYSQLI_NUM)){
	echo"<tr>";
	foreach($row as $data){
	echo"<td>". $data. "</td>";
}
?>
    <td>
    <form action="carInfo.php" method="POST">
        <input type="hidden" name="SerialNumber" value='<?= $row[0] ?>'>
        <input type="submit" name="select" value="select">
    </form>
    </td>
<?php
    echo "</tr>";
}
    $rows = $result->num_rows;
    echo "There are ".$rows." results.";
    echo "</table>";
}
if($_GET['type'] == "boxcar"){ 
$sql = "SELECT * FROM Equipment WHERE Type = 'boxcar'";
$result = $mysqli->query($sql);

echo"<table>";
while($fieldinfo = mysqli_fetch_field($result)){
	echo"<th>".$fieldinfo->name."</th>";
}

while($row = $result->fetch_array(MYSQLI_NUM)){
	echo"<tr>";
	foreach($row as $data){
	echo"<td>". $data. "</td>";
}
?>
    <td>
    <form action="carInfo.php" method="POST">
        <input type="hidden" name="SerialNumber" value='<?= $row[0] ?>'>
        <input type="submit" name="select" value="select">
    </form>
    </td>
<?php
    echo "</tr>";
}
    $rows = $result->num_rows;
    echo "There are ".$rows." results.";
    echo "</table>";
}
?>
</main>
    <?php include '../../inc/footer.php'; ?>
</body>
</html>


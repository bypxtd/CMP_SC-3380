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
        <h1>Here is the Car you are searching for</h1>
        <h2>Input the Type of the car you are looking for</h2>
        <noscript>You must enable JavaScript in your browser!!</noscript>
		<form action="cars.php" method="get">
			<input type="text" name="type" value="">
		</form>
		
		<p><span id="txtHint"></span></p>
        
    </main>
<?php include '../../inc/footer.php'; ?>
</body>
</html>


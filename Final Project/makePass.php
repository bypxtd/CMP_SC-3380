<?php

	$pass = "";
 	$hash = password_hash($pass, PASSWORD_DEFAULT);
	
	echo $pass."\n";
	echo $hash."\n";

	if (password_verify($pass, $hash)) {
   	 echo 'Password is valid!' . "\r\n";
	} else {
   	 echo 'Invalid password.' . "\r\n";
	}
?>

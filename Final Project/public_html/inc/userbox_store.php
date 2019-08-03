<?php
// RegEx to not display login bar on certain pages
if (preg_match('/(verify.php)/', $_SERVER['REQUEST_URI']))
{
    echo time();
    return;
}
?>
<form action="/~GROUP14/store/verify/verify.php" method="POST">
    <input type="hidden" name="action" value="do_login">
    <input type="text" id="username" name="username" autofocus placeholder="Vendor?">
    <input type="text" id="CompanyID" name="CompanyID" placeholder="CompanyID">
    <input type="submit" name="submit" value="Submit">
</form> 

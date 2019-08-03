<?php
// the @ suppresses session warnings (we can print it later with error_get_last()
if(!@session_start())
{

    // special case if we're in a directory index
    if (preg_match('/[^(.php)]$/', $_SERVER['REQUEST_URI']))
    {
        // header() doesn't work when the file
        // is included in Apache's mod_autoindex
        // thus we simply return
        return;
    }

    // If the session couldn't start, present an error
    header("Location: /~GROUP14/internal/login/error.php");
    exit;
}

if (empty($_SESSION['loggedin']))
{
    $loggedIn = false;
    $_SESSION['loggedin'] = false;
}
else
{
    $loggedIn = $_SESSION['loggedin'];
}

// end script if they are admin and logged in
if ($loggedIn && ($_SESSION['roles'] == 'a'))
{
    return;
}
// else print 403
{
    // send 403 code to browser
    http_response_code(403);
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="refresh" content="2; url=/~GROUP14/">
        <meta charset="UTF-8">
        <title>403 Forbidden</title>
    </head>
    <body>
        <h1>403 Forbidden</h1>
        <p>You must be an administrator to access <?php echo $_SERVER['REQUEST_URI']; ?>.  Redirecting in 2 seconds...</p>
    </body>
</html>
<?php exit; ?>

<?php

if (session_status() !== PHP_SESSION_ACTIVE) {
    // the @ suppresses session warnings (we can print it later with error_get_last())
    if(!@session_start()) {

        // special case if we're in a directory index
        if (preg_match('/[^(.php)]$/', $_SERVER['REQUEST_URI'])) {
            // header() doesn't work when the file
            // is included in Apache's mod_autoindex
            // thus we simply return
            return;
        }

        // If the session couldn't start, present an error
        header("Location: /~GROUP14/internal/login/error.php");
        exit;
    }
}

if (empty($_SESSION['loggedin'])) {
    $loggedIn = false;
    $_SESSION['loggedin'] = false;
} elseif (empty($_SESSION['person'])) {
    $loggedIn = false;
    $_SESSION['loggedin'] = false;
} else {
    $loggedIn = true;
    $_SESSION['loggedin'] = true;
}

// redirect to change password if they have a change password warning
// use RegEx to make sure we don't infinite-loop
if (isset($_SESSION['warning']) && $_SESSION['warning'] == 'changePassword'
    && !preg_match("/(changePassword)/", $_SERVER['REQUEST_URI']))
{
    // trigger a php notice
    @trigger_error("You must change your password.");

    // redirect, but only if we're not on a mod_autoindex page
    if (preg_match("/(.php)$/", $_SERVER['REQUEST_URI']))
    {
        header("Location /~GROUP14/internal/user/changePassword.php");
    }
    return;
}

?>

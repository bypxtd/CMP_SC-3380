<?php require '/home/GROUP14/public_html/internal/login/loginCheck.php'; ?>
<!DOCTYPE html>
<html lang="en">
    <head>
<?php include "/home/GROUP14/public_html/inc/meta.php"; ?>
        <title>Index of <?php echo $_SERVER['REQUEST_URI']; ?></title>
    </head>
    <body>
<?php include "/home/GROUP14/public_html/inc/header.php"; ?>
        <main>
            <h1>Index of <?php echo $_SERVER['REQUEST_URI']; ?></h1>
<?php
// note: don't use this part for pages in general
if (error_get_last()) {
    echo <<<HTML
    <div class="alert alert-warning alert-dismissable fade in">
        <a href="#" class="close" aria-label="close">&times;</a>

HTML;
    echo nl2br(print_r(error_get_last(), true), false);
    echo '</div>';
}
?>

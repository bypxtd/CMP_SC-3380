<?php
require '../inc/autoload.php';
require '../internal/login/loginCheck.php';
?>
<!DOCTYPE html>
<html lang="en">
    <head>
<?php include '../inc/meta.php'; ?>
        <title>Store Landing</title>
    </head>
<?php include '../inc/header.php'; ?>
    <body>
        <main>
            <h1>Welcome To the Missouri Rail Store!</h1>
            <h2>Vision</h2>
            <p class="flow-text">We appreciate your business, valued customer. Missouri Rails has been in operation for countless years,
            	fighting the good fight to let people transport goods across the nation in a cheap and reliable way.
            	We have been working throughout the Midwest for over 200 years, with our roots tied to the Carnegie Family and their 
            	great rail empire. We cannot wait to do business with you.
            </p>
            <h2>Lets Build</h2>
            <p class="flow-text">Here you are able to...</p>
            <ul>
                <li>
                	<a href="/~GROUP14/store/listings/">Search the cars listings</a>
                	
                </li>
                <li>
                	<a href="/~GROUP14/store/car/">Make orders on cars</a></li>
                	
                <li>
                	<a href="/~GROUP14/schedule.php">View the current Train Schedule</a></li>
                <li>
                	<a href="/~GROUP14/stations.php">Search for any of our station Locations</a>
                	
                </li>
            </ul>
			<img src="../img/metal-sign.jpg" alt="train sign">
			<h2>Reviews</h2>
            <p class="flow-text">Take a look at what some of our critics had to say!</p>
            <ul>
        		<li>"It's right on time<br>
					It's right on time<br>
					It's right on time, it's right on time (it's right on time)<br>
					Lookin' fine, you're lookin' fine and get on nineteen ninety nine (it's right on time)"<br>
					<br>-Red Hot Chili Peppers, Californacation (1999)
				</li>
				<br>
				<li>"I said, train kept a-rolling all night long<br>
					Train kept a-rolling all night long<br>
					Train kept a-rolling all night long<br>
					Train kept a-rolling all night long<br>
					With a heave, and a ho"<br>
					<br>-Aerosmith, Get Your Wings (1979)
				</li>
				<br>
				<li>"Well, train, train, take me on out of this town<br>
					Train, train, Lord, take me on out of this town<br>
					Well, that woman I'm in love with, Lord, she's Memphis bound"<br>
					<br>-Blackfoot, Strikes (1979)
				</li>
			</ul>
        </main>
<?php include '../inc/footer.php'; ?>
    </body>
</html>

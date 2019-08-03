<?php require '../../internal/login/loginCheck.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
<?php include '../../inc/meta.php'; ?>
        <title>Car Listings - Missouri Rail</title>
<script>

function showHint() {

	
	
    
    var url = "listings.php?";
    
    var count = 0;
    
    if(document.getElementById("locLabel").checked)  {
    	url += "loc=" + document.getElementById("loc").value;
    	count++;
    }
    
    if(document.getElementById("typeLabel").checked)  {
    	if(count != 0)  {
    		url += "&";
    	}
    	url += "type=" + document.getElementById("type").value;
    	count++;
    }
    
    if(document.getElementById("priceLabel").checked)  {
    	if(count != 0)  {
    		url += "&";
    	}
    	url += "price=" + var priceData = document.getElementById("price").value;
    	document.getElementById("p").innerHTMl = "show Prices less than(<) " + priceData;
    }
    
    //alert(url);

	

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("txtHint").innerHTML = this.responseText;
        }
    };

    xmlhttp.open("GET", url, true);
    xmlhttp.send();
	
}


</script>
</head>
<body>
<?php include '../../inc/header.php'; ?>
    <main>
        <h1>Here you can search the Car Listings</h1>
        <img src="../../img/warning.jpg" alt="train sign">
        <noscript>You must enable JavaScript in your browser!!</noscript>
                <form action="" method="post">
                        <input type="hidden" name="action" value="select">
                        <div>
							<input type='text' id='loc' placeholder='Location' onkeyup='showHint()'>
							<br>
							<input type="checkbox" name="locLabel" value="L" id="locLabel" onchange="showHint()"><b>Search by Location</b><br>
						</div>
						<div>
							<input type='text' id='type' placeholder='Type' onkeyup='showHint()'>
							<br>
							<input type="checkbox" name="typeLabel" value="T" id="typeLabel" onchange="showHint()"><b>Search by Type</b><br>
						</div>
                        <div>
                        	<input type='range' id='price' min='0' max='1000' onchange='showHint()'>
                        	<br>
                        	<input type="checkbox" name="priceLabel" value="P" id="priceLabel" onchange="showHint()"><b id="p">Price</b><br>
                        </div>
                </form>
				
                <p><span id="txtHint"></span></p>

    </main>
<?php include '../../inc/footer.php'; ?>
</body>
</html>


<?php

include 'connection.php';

$POSTS = mysqli_query($CONN, "SELECT * FROM post");

?><!DOCTYPE html>
<html lang="en">

<head>
	<title>Project Anomaly</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<style>
html{
margin:30px;
color:#ECEFF4;
background-color:#222222;
font-family:monospace;
}
hr{
margin:40px;
}

a{
text-decoration:none;
color:#EBCB88;
}

small{
text-align:center;
}

h1{
text-align:center;
font-size:34px;
}
h2{
text-align:center;
color:#EBCB88;
}
p{
text-align:justify;
font-size:13px;
margin-left:30px;
margin-right:30px;
}

</style>
</head>

<body>
	
	<h1 style="text-align: center">Project Archive // Index</h1>
	<hr>
	
	<?php
	
	while($row = mysqli_fetch_array($POSTS)) {
	
		echo "<a href='post.php?id={$row['id']}'><h2>{$row['title']}</h2></a>";
		echo "<center><small>Date {$row['date_time']}</small></center>";
    echo "<hr>";
	}
	
	?>
		
<center><a href = "admin_login.php">ADMIN</a></center>
</body>

</html>

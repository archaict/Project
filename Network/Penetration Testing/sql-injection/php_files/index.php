<?php

include 'connection.php';

$POSTS = mysqli_query($CONN, "SELECT * FROM post");

?><!DOCTYPE html>
<html lang="en">

<head>
	<title>Project Anomaly</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
</head>

<body>
	
	<h1 style="text-align: center">Project Archive // Index</h1>
	<hr>
	
	<?php
	
	while($row = mysqli_fetch_array($POSTS)) {
	
		echo "<a href='post.php?id={$row['id']}'><h2>{$row['title']}</h2></a>";
		echo "<small>Date {$row['date_time']}</small>";
		echo "<hr>";
		
	}
	
	?>
	
</body>

</html>

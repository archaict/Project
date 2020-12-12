<?php

include 'connection.php';

$ID = $_GET['id'];
$QUINT  = mysqli_query($CONN, "SELECT * FROM post WHERE id = {$ID}") or die(mysqli_error($CONN));
$POST = mysqli_fetch_array($QUINT);

?><!DOCTYPE html>
<html lang="en">

<head>
	<title>Project Archive</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
</head>

<body>
	
	<h1 style="text-align: center">Project Archive</h1>
	<hr>
	
	<h2><?php echo $post['title'] ?></h2>
	<small>Date: <?php echo $post['date_time'] ?></small>
	
	<?php echo $post['content'] ?>
	
</body>

</html>

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
	
	<h1 style="text-align: center">Project Archive</h1>
	<hr>
	
	<h2 ><?php echo $POST['title'] ?></h2>
	<center><small style ="font-family:monospace;">Date: <?php echo $POST['date_time'] ?></small></center>
	
	<?php echo $POST['content'] ?>
	
</body>

</html>

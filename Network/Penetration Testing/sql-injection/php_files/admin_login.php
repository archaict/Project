<?php

session_start();
include 'connection.php';

if (isset($_POST['submit'])) {

	$USERNAME = $_POST['username'];
	$PASSWORD = $_POST['password'];
	
	$LOGIN = mysqli_query($CONN, "SELECT * FROM user WHERE username = '{$USERNAME}' AND password = '{$PASSWORD}'");

	if (mysqli_num_rows($LOGIN) == 0) {
		die("Agent code not found, please check your username and password.");
	} else {
		$_SESSION['admin'] = 1;
		header("Location: admin.php");
	}
	
}

?><!DOCTYPE html>
<html lang="en">

<head>
	<title>Project Archive // Administrator Login</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
</head>

<body>
	
	<h1 style="text-align: center">Project Archive // Administrator Login</h1>
	<hr>
	
	<form action="" method="post">
	
		<center><p>Username:</p>
		<input type="text" name="username">
		
		<p>Password:</p>
		<input type="password" name="password">
		
		<br>
		<br>
		<input type="submit" name="submit" value="Login">
	</center>
	</form>
	
</body>

</html>

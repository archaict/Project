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
text-align:center;
font-size:13px;
margin-left:30px;
margin-right:30px;
}

input[type=submit] {
background-color:#EBCB88;
border: none;
color:#2E3440;
padding: 15px 32px;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 16px;
}

input[type=text] {
background-color:#D8DEE9;
border: none;
color:#2E3440;
padding: 15px 25px;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 16px;
}

input[type=password] {
background-color:#D8DEE9;
border: none;
color:#2E3440;
padding: 15px 25px;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 16px;
}

</style>
</head>

<body>
	
	<h1 style="text-align: center">Project Administrator</h1>
	<hr>
	
	<form action="" method="post">
	
		<center><p1>Username:</p>
		<input type="text" name="username">
		
		<p>Password:</p>
		<input type="password" name="password">
		
		<br>
    <br>
    <br>
		<input type="submit" name="submit" value="Login">
	</center>
	</form>
	
</body>

</html>

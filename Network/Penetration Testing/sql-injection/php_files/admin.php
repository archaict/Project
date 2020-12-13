<?php

session_start();

if (!$_SESSION['admin']) {
	header("Location: admin_login.php");
}

?><!DOCTYPE html>
<html lang="en">

<head>
	<title>Administrator</title>
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
	
	<h1 style="text-align: center">Project Archive // Administrator</h1>
	<hr>
	
  <center><h3>Administration Project Archive // Code Number 0001</h3></center>

	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis tincidunt lectus. Quisque sit amet enim vel sem ultricies imperdiet quis id felis. Vestibulum nec metus lacinia, ornare odio vitae, varius mauris. Aliquam erat volutpat. Suspendisse potenti. Nulla at metus aliquet, hendrerit nibh at, faucibus quam. Morbi aliquam elit vulputate malesuada sollicitudin. Nulla facilisi. Aliquam nec est et est eleifend viverra eu in nisl. Duis vel enim in metus porttitor commodo. Curabitur posuere tempor fringilla. Curabitur efficitur mauris dui, at tincidunt mauris tincidunt sed. Vestibulum leo nibh, accumsan sed mauris id, interdum posuere leo. Praesent pellentesque posuere dui aliquam auctor. Aliquam erat volutpat. </p>
	
</body>

</html>

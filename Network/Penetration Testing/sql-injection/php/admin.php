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
</head>

<body>
	
	<h1 style="text-align: center">Project Archive // Administrator</h1>
	<hr>
	
  <h3>Administration Project Archive</h3>

	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis tincidunt lectus. Quisque sit amet enim vel sem ultricies imperdiet quis id felis. Vestibulum nec metus lacinia, ornare odio vitae, varius mauris. Aliquam erat volutpat. Suspendisse potenti. Nulla at metus aliquet, hendrerit nibh at, faucibus quam. Morbi aliquam elit vulputate malesuada sollicitudin. Nulla facilisi. Aliquam nec est et est eleifend viverra eu in nisl. Duis vel enim in metus porttitor commodo. Curabitur posuere tempor fringilla. Curabitur efficitur mauris dui, at tincidunt mauris tincidunt sed. Vestibulum leo nibh, accumsan sed mauris id, interdum posuere leo. Praesent pellentesque posuere dui aliquam auctor. Aliquam erat volutpat. </p>
	
</body>

</html>

<?php

$HOST = "localhost";
$USER = "project";
$PASS = "password";
$DB   = "Project";

$CONN = mysqli_connect($HOST, $USER, $PASS);
mysqli_select_db($CONN, $DB);

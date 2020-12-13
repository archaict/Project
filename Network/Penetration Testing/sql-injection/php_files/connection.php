<?php

$HOST = "127.0.0.1";
$USER = "root";
$PASS = "ralumentia";
$DB   = "Project";

$CONN = mysqli_connect($HOST, $USER, $PASS);
mysqli_select_db($CONN, $DB);

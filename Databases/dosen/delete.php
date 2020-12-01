<?php

include "koneksi.php";

$nip    = $_POST['nip'];

class emp{}

if (empty ($nip)){
  $response = new emp();
  $response->success = 0;
  $response->message = "Error hapus Data";
  die(json_encode($response));
} else {
  $query    =mysql_query("DELETE * FROM dosen WHERE nip= '".$nip."'");

  if  ($query) {
    $response = new emp();
    $response->success = 1;
    $response->message = "Data berhasil di hapus";
    die(json_encode($response));
  } else {
    $response = new emp();
    $response->success = 0;
    $response->message = "Error hapus Data";
    die(json_encode($response));
  }
}

?>

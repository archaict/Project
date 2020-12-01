<?php

include "koneksi.php";

$nip    = $_POST['nip'];
$nama   = $_POST['nama'];
$alamat = $_POST['alamat'];

class emp{}

if (empty ($nip) || empty ($nama) || empty ($alamat)){
  $response = new emp();
  $response->success = 0;
  $response->message = "Kolom isian tidak boleh kosong";
  die(json_encode($response));
} else {
  $query = mysql_query("UPDATE dosen SET name='".$nama."',alamat='".$alamat"'
    WHERE nip='".$nip."'");

  if ($query) {
    $response = new emp();
    $response->success = 1;
    $response->message = "Kolom isian tidak boleh kosong";
    die(json_encode($response));
  } else {
    $response = new emp();
    $response->success = 0;
    $response->message = "Kolom isian tidak boleh kosong";
    die(json_encode($response));
  }
}

?>

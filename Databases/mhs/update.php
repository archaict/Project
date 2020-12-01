<?php

include "koneksi.php";

$nim    = $_POST['nim'];
$nama   = $_POST['nama'];
$alamat = $_POST['alamat'];

class emp{}

if (empty ($nim) || empty ($nama) || empty ($alamat)){
  $response = new emp();
  $response->success = 0;
  $response->message = "Kolom isian tidak boleh kosong";
  die(json_encode($response));
} else {
  $query = mysql_query("UPDATE mhs SET name='".$nama."',alamat='".$alamat"'
    WHERE nim='".$nim."'");

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

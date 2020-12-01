<?php

include "koneksi.php";

$nip    = $_POST['nip'];

class emp{}

if (empty ($nip)) {
  $response = new emp();
  $response->success = 0;
  $response->message = "Kolom isian tidak boleh kosong";
  die(json_encode($response));
} else {
  $query    =mysql_query("SELECT * FROM dosen WHERE nip= '".$nip."'");
  $row      =mysql_fetch_array($query);
  if (!empty($row)){
    $response = new emp();
    $response->success = 1;
    $response->nip     = $row["nip"];
    $response->nama    = $row["nama"];
    $response->alamat  = $row["alamat"];
    die(json_encode($response));
  } else {
    $response = new emp();
    $response->success = 0;
    $response->message = "Error Mengambil Data";
    die(json_encode($response));
  }
}

?>

# Database Example

CRUD for University Project

**[koneksi.php]**

```
<?php
$server = "localhost";
$user = "root";
$password = "";
$database = "akademik";

$connect = mysql_connect($server, $user, $password) or die ("Koneksi gagal");
mysql_select_db($database) or die ("Database belum siap!");

?>
```


**[select.php]**

```
<?php

include "koneksi.php";
$query = mysql_query("SELECT * FROM dosen ORDER BY name ASC");
$json = array();
while($row = mysql_fetch_assoc($query)){
  $json[] = $row;
}

echo json_encode($json);
mysql_close($connect);

?>
```


**[update.php]**

```
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
```


**[edit.php]**

```
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
```


**[delete.php]**

```
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
```

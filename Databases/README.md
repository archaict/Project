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
$query = mysql_query("SELECT * FROM mhs ORDER BY name ASC");
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
```


**[edit.php]**

```
<?php

include "koneksi.php";

$nim    = $_POST['nim'];

class emp{}

if (empty ($nim)) {
  $response = new emp();
  $response->success = 0;
  $response->message = "Kolom isian tidak boleh kosong";
  die(json_encode($response));
} else {
  $query    =mysql_query("SELECT * FROM mhs WHERE nim= '".$nim."'");
  $row      =mysql_fetch_array($query);
  if (!empty($row)){
    $response = new emp();
    $response->success = 1;
    $response->nim     = $row["nim"];
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

$nim    = $_POST['nim'];

class emp{}

if (empty ($nim)){
  $response = new emp();
  $response->success = 0;
  $response->message = "Error hapus Data";
  die(json_encode($response));
} else {
  $query    =mysql_query("DELETE * FROM mhs WHERE nim= '".$nim."'");

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

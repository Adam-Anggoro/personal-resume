<?php

  require "config.php";

  if ($_SERVER ['REQUEST_METHOD'] == 'POST') {
    // code...

  $response = array();
  $IDuser = $_POST['IDuser'];

  $queryDelete = mysqli_query($conn, "DELETE FROM user WHERE id_user= '$IDuser'");

  if ($queryDelete) {
    // code...
    $response['value'] = 1;
    $response['message'] = "Yeay, data berhasil dihapus";
    echo json_encode($response);
  } else {
    // code...
    $response['value'] = 2;
    $response['message'] = "Oops, terjadi kesalahan";
    echo json_encode($response);
  }


}

 ?>

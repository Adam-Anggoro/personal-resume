<?php

	require "config.php";

	if ($_SERVER['REQUEST_METHOD'] == "POST") {
		# code...
		$response = array();
		$IDuser = $_POST['IDuser'];
    	$name = $_POST['name'];
		$email = $_POST['email'];
		$phone = $_POST['phone'];
		$address = $_POST['address'];


			# code...
			$queryInsert = mysqli_query($conn, "UPDATE user SET name='$name', email='$email', phone='$phone', address='$address' WHERE id_user='$IDuser'");
			if ($queryInsert) {
				# code...
				$response['value'] = 1;
				$response['message'] = "Yeay, perubahan pada data berhasil dilakukan";
				echo json_encode($response);
			} else {
				# code...
				$response['value'] = 2;
				$response['message'] = "Oops, terjadi kesalahan";
				echo json_encode($response);
			}

	}

?>

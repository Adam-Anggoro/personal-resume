<?php  

	require "config.php";

	if ($_SERVER['REQUEST_METHOD'] == "POST") {
		# code...
		$response = array();
		$name = $_POST['name'];
		$email = $_POST['email'];
		$phone = $_POST['phone'];
		$address = $_POST['address'];

		$queryCekData = mysqli_query($conn, "SELECT * FROM user WHERE email = '$email' || phone = '$phone'");

		$resultCekData = mysqli_fetch_array($queryCekData);

		if ($resultCekData) {
			# code...
			$response['value'] = 0;
			$response['message'] = "Oops, data tersebut telah terdaftar !";
			echo json_encode($response);
		} else {
			# code...
			$queryInsert = mysqli_query($conn, "INSERT INTO user VALUE('', '$name', '$email', '$phone', '$address', NOW())");
			if ($queryInsert) {
				# code...
				$response['value'] = 1;
				$response['message'] = "Yeay, data tersebut berhasil didaftarkan";
				echo json_encode($response);
			} else {
				# code...
				$response['value'] = 2;
				$response['message'] = "Oops, data tersebut gagal didaftarkan";
				echo json_encode($response);
			}
			
		}
		
	}

?>
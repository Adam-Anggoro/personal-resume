<?php  

	require "config.php";

	$response = array();

	$selectUser = mysqli_query($conn, "SELECT * FROM user");

	while ($row = mysqli_fetch_array($selectUser)) {
		# code...
		$key['userID'] = $row['id_user'];
		$key['name'] = $row['name'];
		$key['email'] = $row['email'];
		$key['phone'] = $row['phone'];
		$key['address'] = $row['address'];
		$key['createdDate'] = $row['created_date'];

		array_push($response, $key);
	}

	echo json_encode($response);

?>
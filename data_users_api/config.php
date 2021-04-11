<?php  

	$host = "localhost";
	$username = "root";
	$password = "";
	$dbName = "test";

	$conn = mysqli_connect($host, $username, $password, $dbName);

	if (!$conn) {
		# code...
		echo "Connection Failed !";
	}

?>
<?php

	include 'conn.php';

	
	$username = $_POST['username'];
	$password = $_POST['password'];
	$email = $_POST['email'];
	

	$connect->query("INSERT INTO users (username,password,email) VALUES ('".$username."','".$password."','".$email."')")
	
?>
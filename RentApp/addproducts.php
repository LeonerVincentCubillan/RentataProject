<?php

	include 'conn.php';

	
	$gadgetname = $_POST['gadgetname'];
	$gadgettype = $_POST['gadgettype'];
	$image = $_POST['image'];
	$price = $_POST['price'];
	$status = $_POST['status'];
	

	$connect->query("INSERT INTO allgadgets (gadgetname,gadgettype,image,price,status) VALUES ('".$gadgetname."','".$gadgettype."','".$image."','".$price."','".$status."')")
	
?>
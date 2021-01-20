<?php
include 'conn.php'; 
$gadgetid = $_POST['gadgetid'];
$gadgetname = $_POST['gadgetname'];
$gadgettype = $_POST['gadgettype'];
$image = $_POST['image'];
$price = $_POST['price'];
$status = $_POST['status'];


$queryResult=$connect->query("UPDATE allgadgets SET gadgetname='".$gadgetname."', gadgettype='".$gadgettype."',image='".$image."',price='".$price."',status='".$status."'  WHERE gadgetid='$gadgetid'");

// $result=array();
// while($fetchData=$queryResult->fetch_assoc()){
// 	$result[]=$fetchData;
// }
// echo json_encode($result);
?>
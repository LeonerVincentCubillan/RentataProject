<?php
include 'conn.php'; 

$status = $_POST['status'];
$gadgetid = $_POST['gadgetid'];


$queryResult=$connect->query("UPDATE allgadgets SET status='".$status."' WHERE gadgetid='$gadgetid'");

$result=array();
while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}
echo json_encode($result);
?>
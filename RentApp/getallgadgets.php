<?php
include 'conn.php'; 

$queryResult=$connect->query("SELECT * FROM allgadgets ");


$result=array();
while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}
// echo json_encode($queryResult);

echo json_encode($result);

?>
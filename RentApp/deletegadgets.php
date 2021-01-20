<?php
include 'conn.php'; 

$gadgetid = $_POST['gadgetid'];


$queryResult=$connect->query("DELETE FROM allgadgets WHERE gadgetid='$gadgetid'");


?>
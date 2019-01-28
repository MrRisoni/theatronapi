<?php

$zone = 4 ;

$conVariable = new mysqli('localhost', 'root', '', 'theatron');

	   mysqli_query($conVariable, "DELETE FROM seatfloor  WHERE scr_seatname LIKE '%ZONECP_%' AND scr_zone_id  = '".$zone."'");


$sql = "SELECT scr_top, scr_left FROM seatfloor WHERE scr_zone_id = ".$zone;
$result = mysqli_query($conVariable,$sql);
while ($row = mysqli_fetch_assoc($result)) {


	var_dump($row);

	
$transform = 475;

$theaterId =1;



      $left = $row['scr_left'] -$transform;
      $left = abs($left);
      $left += $transform;


$seatName = "ZONECP_".$row['scr_top'].$left;

	   $sql = " INSERT INTO `seatfloor`  ( `scr_top`, `scr_left`, `scr_zone_id`, `scr_theater_id`,`scr_seatname`) VALUES ('" . $row['scr_top'] . "','" . $left . "','" . $zone . "','" . $theaterId . "', '".$seatName."')";

	   mysqli_query($conVariable, $sql);
	   echo mysqli_error($conVariable);
  


}




?>
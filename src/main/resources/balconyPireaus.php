<?php

$conVariable = new mysqli('localhost', 'root', '', 'theatron');


        mysqli_query($conVariable, "DELETE FROM seatfloor WHERE scr_zone_id = 7");


$startTop = 450;
$startLeft =100;


for ($i =0; $i< 15; $i++) {


$zone = 7;
$theaterId  =1;


	       $seatName = "BACL_SDL_R".$startTop."C".$startLeft;
        $sql = " INSERT INTO `seatfloor`( `scr_top`, `scr_left`, `scr_zone_id`, `scr_theater_id`,`scr_seatname`) VALUES ('" . $startTop . "','" . $startLeft . "','" . $zone . "','" . $theaterId . "', '".$seatName."')";


        mysqli_query($conVariable, $sql);
                echo mysqli_error($conVariable);



$startTop -=14;
$startLeft +=6;

}



$startTop = 250;
$startLeft = 200;
for ($q = 0 ; $q < 20; $q++) {


		       $seatName = "BACL_SDL_R".$startTop."C".$startLeft;
        $sql = " INSERT INTO `seatfloor`( `scr_top`, `scr_left`, `scr_zone_id`, `scr_theater_id`,`scr_seatname`) VALUES ('" . $startTop . "','" . $startLeft . "','" . $zone . "','" . $theaterId . "', '".$seatName."')";


        mysqli_query($conVariable, $sql);
                echo mysqli_error($conVariable);
$startLeft += 14;
}












// copy








$sql = "SELECT scr_top, scr_left FROM seatfloor WHERE scr_zone_id = ".$zone;
$result = mysqli_query($conVariable,$sql);
while ($row = mysqli_fetch_assoc($result)) {


	var_dump($row);

	
$transform = 475;

$theaterId =1;



      $left = $row['scr_left'] -$transform;
      $left = abs($left);
      $left += $transform;


$seatName = "BALCKZONECP_".$row['scr_top'].$left;

	   $sql = " INSERT INTO `seatfloor`  ( `scr_top`, `scr_left`, `scr_zone_id`, `scr_theater_id`,`scr_seatname`) VALUES ('" . $row['scr_top'] . "','" . $left . "','" . $zone . "','" . $theaterId . "', '".$seatName."')";

	   mysqli_query($conVariable, $sql);
	   echo mysqli_error($conVariable);
  


}



?>
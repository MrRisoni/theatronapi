<?php


  $conVariable = new mysqli('localhost', 'root', '', 'theatron');



$top = 680;
$maxRows = 15;
$maxColsPerRow = 18;
$theaterId = 1;


$clear = "DELETE FROM seatfloor WHERE scr_theater_id = '".$theaterId."'";
               mysqli_query($conVariable , $clear);

for ($row = 1 ;$row < 15; $row++) {

$left = 95;


        for ($seat=1; $seat < $maxColsPerRow; $seat++) {

       

       $sql = " INSERT INTO `seatfloor`( `scr_top`, `scr_left`, `scr_zone_id`, `scr_theater_id`,`scr_rowid`) VALUES ('".$top."','".$left."',1,'".$theaterId."', '".$row."')";
$left += 15;
    
               mysqli_query($conVariable , $sql);
               echo mysqli_error($conVariable);
        }
  


// second part
  $left = 360;
        for ($seat=1; $seat < $maxColsPerRow; $seat++) {

       

       $sql = " INSERT INTO `seatfloor`( `scr_top`, `scr_left`, `scr_zone_id`, `scr_theater_id`,`scr_rowid`) VALUES ('".$top."','".$left."',1,'".$theaterId."', '".$row."')";
$left += 15;
    
               mysqli_query($conVariable , $sql);
               echo mysqli_error($conVariable);
        }
      
      $top -= 20;

}

?>
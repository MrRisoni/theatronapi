<?php


$conVariable = new mysqli('localhost', 'root', '', 'theatron');


$top = 680;
$maxRows = 15;
$maxColsPerRow = 18;
$theaterId = 1;

$zonesArr = [];
$sql = "SELECT  zon_id ,zon_title FROM zones WHERE zon_theater_id = '".$theaterId."' ";
$resultTheats =mysqli_query($conVariable, $sql);

while ($row = mysqli_fetch_assoc($resultTheats)) {
  $zonesArr[$row['zon_id']] = $row['zon_title'];
}


$clear = "DELETE FROM seatfloor WHERE scr_theater_id = '" . $theaterId . "'";
mysqli_query($conVariable, $clear);

for ($row = 1; $row < $maxRows; $row++) {

    $left = 400;

    if (($row % 2 == 0) && ($row > 2)) {
        $maxColsPerRow--;
    }


    $zone = 0;
    if ($row < 4) {
        $zone = 8;
    }
    if ($row >= 4) {
        $zone = 5;
    }
    if ($row > 11) {
        $zone = 6;
    }


    for ($seat = 1; $seat < $maxColsPerRow; $seat++) {

            $seatName = $zonesArr[$zone]."_SDL_R".$row."C".$seat;
        $sql = " INSERT INTO `seatfloor`( `scr_top`, `scr_left`, `scr_zone_id`, `scr_theater_id`,`scr_rowid`,`scr_colid`,`scr_seatname`) VALUES ('" . $top . "','" . $left . "','" . $zone . "','" . $theaterId . "', '" . $row . "','" . $seat . "', '".$seatName."')";
        $left -= 15;

        mysqli_query($conVariable, $sql);
      

    }


// second part

    $right = 450;

    for ($seat = 1; $seat < $maxColsPerRow; $seat++) {


            $seatName = $zonesArr[$zone]."_SDR_R".$row."C".$seat;

        $sql = " INSERT INTO `seatfloor`( `scr_top`, `scr_left`, `scr_zone_id`, `scr_theater_id`,`scr_rowid`,`scr_colid`,`scr_seatname`) VALUES ('" . $top . "','" . $right . "','" . $zone . "','" . $theaterId . "', '" . $row . "','" . $seat . "', '".$seatName."')";

        mysqli_query($conVariable, $sql);

        $right += 15;

         }


    $top -= 20;

}



$left = 250;

/// balcony and boxes
for ($lvl = 1; $lvl <= 2; $lvl++) {

    $top = 700;

    $left -= 130;

    for ($balcon = 1; $balcon < 10; $balcon++) {

        $seatTop = $top;
        $seatLeft = $left;

        for ($seatIdx = 0; $seatIdx < 2; $seatIdx++) {

            $seatTop -= 15;
            if ($seatIdx % 2 == 0) {
                $seatLeft -= 15;
            }

            $zone = 3;
            if ($lvl > 1) {
                $zone = 4;
            }

            $seatName = $zonesArr[$zone]."_LVL".$balcon."SID".$seatIdx;


            $sql = " INSERT INTO `seatfloor`( `scr_top`, `scr_left`, `scr_zone_id`, `scr_theater_id`,`scr_seatname`) VALUES ('" . $seatTop . "','" . $seatLeft . "','" . $zone . "','" . $theaterId . "', '".$seatName."')";

            
        mysqli_query($conVariable, $sql);
        echo $sql;
        echo mysqli_error($conVariable);
        echo PHP_EOL;    

        }

          $top -= 35;
    $left += 10;

    }

  

}


?>

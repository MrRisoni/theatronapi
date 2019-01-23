<?php


$conVariable = new mysqli('localhost', 'root', '', 'theatron');


$theaterId = 1;

for ($typ =1 ;$typ<5; $typ++) {
    for ($zon = 2; $zon<9 ;$zon++)
    {

        $sqlPrice = " INSERT INTO `pricing` ( `pri_performance_id`, `pri_seasonid`, `pri_zone_id`, `pri_type_id`, `pri_price`) VALUES (1,1,'".$zon."','".$typ."',25) ";

        mysqli_query($conVariable, $sqlPrice);
    }
}




?>

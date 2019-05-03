<?php
$n_max=$_POST["NMAX"];
$break_point=$n_max%3;

for($ii=$n_max; $ii>=$break_point; $ii-=3){ 
    echo "$ii<br>";
}

?>

<?php
$flag=1;
$n_max=$_POST["NMAX"];
$suma=0;
echo "</br>SERIE :</br>";
echo "<b>";
for ($ii=1; $ii<=$n_max; $ii+=2){
    if($flag%2==0){
        echo "- $ii";
        $suma -= $ii;
    }
    else{
        echo "+ $ii";
        $suma += $ii;
    }
    $flag++;
}
echo " = $suma";
echo "</b>";
echo "</br>";

?>

<?php
$n_max=$_POST["NMAX"];

$sum_carry=0;
$carry=0;
$auxfact=1;
$cont=0;
$cadena =" ";

echo "</br>Cantidad: $n_max</br> ";

for ($i=1; $cont<$n_max ; $i++) 
{ 
    if ($i%2!=0){
        $sum_carry = $sum_carry + $i;
        $cont = $cont + 1; 
        $cadena = $cadena.$i."!+";
        for ($j=1; $j<=$i; $j++){ 

            $auxfact=$auxfact*$j;
        }
        $carry=$carry+$auxfact;
        $auxfact=1;
    }
}
echo "</br>$cadena</br>";
echo "</br>SUMA FACTORIAL: </br><pre>      $carry</pre>";
?>

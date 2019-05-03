<?php 
$n_max = $_POST["NMAX"];
echo "Los primero $n_max numeros impares son: </br>";
$carry = 1;
for ($i=0; $i<$n_max; $i++) { 
    echo "  $carry";
    echo ",";
    $carry +=2;
}
echo "</br>";
?>

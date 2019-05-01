<?php 

$nombreB = "Coca Cola";
$nombreB2 = "Inka Kola";
$cantidadM1 = $_POST["CM1"];
$cantidadF1 = $_POST["CF1"];
$cantidadM2 = $_POST["CM2"];
$cantidadF2 = $_POST["CF1"];

$auxiliar1 = $cantidadM1+$cantidadF1;
$auxiliar2 = $cantidadM2+$cantidadF2;
echo "Datos Encuesta <br>";

if ($cantidadM1>$cantidadF1) {
    echo "el genero que consume mas ".$nombreB." es: MASCULINO <br>";
}
else{
    echo "el genero que consume mas ".$nombreB." es: FEMENINO <br>";
}
if ($cantidadM2>$cantidadF2) {
    echo "el genero que consume mas ".$nombreB2." es: MASCULINO <br>";
}
else{
    echo "el genero que consume mas ".$nombreB2." es: FEMENINO <br>";
}

if ($auxiliar1>$auxiliar2) {
    echo "la bebida que se consume mas es: ".$nombreB." <br>";
}
else{
    echo "la bebida que se consume mas es: ".$nombreB2." <br>";
}

echo "<br>";
?>


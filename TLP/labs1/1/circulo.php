<?php
$radio = $_POST["radio"];
$area = 3.14159265 * $radio * $radio;
$perimetro = 2 * 3.14159265 * $radio;

echo "</br></br>";
echo "\tArea\t\t:\t\t\t$area\n";
echo "</br></br>";
echo "\tPerimetro\t\t:\t\t\t$perimetro";

?>

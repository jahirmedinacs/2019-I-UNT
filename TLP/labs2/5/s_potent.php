<?php
$base = $_POST["N"];
$power = $_POST["M"];
$carry = 0;
for ($ii=0; $ii <=$power; $ii++) { 
    echo "$base<sup>$ii</sup> + ";
    $carry += pow($base, $ii);
}
echo "  = $carry</br>";
?>

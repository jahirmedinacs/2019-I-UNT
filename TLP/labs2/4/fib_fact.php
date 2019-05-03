<?php
$n_max=$_POST["NMAX"];

$current_val=1;
$prev_val=0;
$aux=1;
$suma=0;
$auxfact=1;
$output_string=" ";

for ($i=0; $i<$n_max; $i++) { 
    $output_string=$output_string.$current_val."!+";
    for ($j=1; $j <= $i ; $j++){ 
        $auxfact=$auxfact*$j;
    }
    $suma=$suma+$auxfact;
    $aux=$current_val;
    $current_val=$current_val+$prev_val;
    $prev_val=$aux;
}
echo "$output_string = </br><pre>     $suma</pre>";

?>

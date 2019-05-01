<?php
    $cant=$_POST["cantidad"];
    $first=1;
    $ant=0;
    $aux=1;
    $suma=0;
    $auxfact=1;
    $cadena=" ";
    for ($i=0; $i<$cant; $i++) { 
    	$cadena=$cadena.$first."!+";
    	for ($j=1; $j <= $i ; $j++) { 
            		
            	$auxfact=$auxfact*$j;
        }
        $suma=$suma+$auxfact;
    	$aux=$first;
    	$first=$first+$ant;
    	$ant=$aux;
    }
    echo "SERIE: ".$cadena;
    echo "<br>";
    echo "SUMA: ".$suma;

?>
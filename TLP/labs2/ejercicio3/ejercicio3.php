<?php
    $suma=0;
    $sumaf=0;
    $auxfact=1;
    $cont=0;
    $cadena =" ";
	$cant=$_POST["cantidad"];
	echo "Cantidad: ".$cant;
	for ($i=1; $cont<$cant ; $i++) 
	{ 
		if ($i % 2 <> 0) {
			$suma = $suma + $i;
			$cont = $cont + 1; 
            $cadena = $cadena.$i."!+";
            for ($j=1; $j <= $i ; $j++) { 
            		
            	$auxfact=$auxfact*$j;
            }
            $sumaf=$sumaf+$auxfact;
            $auxfact=1;
		}
	}
	echo "<br>";
	echo "CADENA:  ".$cadena."<br>";
	echo "SUMA FACTORIAL: ".$sumaf;
?>

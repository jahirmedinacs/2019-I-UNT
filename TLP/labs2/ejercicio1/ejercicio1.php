<?php 
	echo "Los primero n numeros son: <br>";
	$n1 = $_POST["variable"];
	$auxiliar = 1;
	for ($i=0; $i<$n1 ; $i++) { 
		echo " ".$auxiliar;

		$auxiliar +=2;
	}
	echo "<br>";
 ?>
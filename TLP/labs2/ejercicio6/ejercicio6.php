<?php
	 $numero=$_POST['numero'];
	 $limite=$numero%3;

	 if ($numero>100 || $numero<0) {
	 	echo "Debes ingresar un numero en el rango de 0-100";
	 }
	 else{
	 	for ($i=$numero; $i >= $limite ; $i=$i-3) { 
	 		echo $i."<br>";
	 	}
	 }
 ?>
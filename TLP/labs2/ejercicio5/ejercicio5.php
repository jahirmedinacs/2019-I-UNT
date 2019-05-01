<?php
	$base = $_POST['numero1'];
	$potencia = $_POST['potencia'];

	for ($i=0; $i <=$potencia; $i++) { 
		echo $base."^".$i."&nbsp"."&nbsp"."&nbsp"."&nbsp"."&nbsp"."&nbsp";
	}
 ?>
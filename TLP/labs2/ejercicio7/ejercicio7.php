<?php 
	$n = $_POST["valor"];
	$num = 1;
		echo"TRIANGULO  =>  n = ".$n."<br>"; 
	for ($j=0; $j<$n ; $j++) {
		for ($i=$j+1; $i<$n ; $i++) { 
			echo "&nbsp&nbsp";
		}
		echo "*";	
		for ($k=$j+1; $k<$j+$num ; $k++) { 
			echo "*";
		}
		echo "<br>";
		$num=$num+2;
	}
 ?>
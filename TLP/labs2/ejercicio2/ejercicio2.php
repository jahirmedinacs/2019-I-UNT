<?php
	$controlador=1;
	$valor_n=$_POST['cantida_numeros'];
	$suma=0;
	if($valor_n%2==0)
	{
		echo "Serie: ";
		for ($i=1; $i<=$valor_n*2 ; $i=$i+2) 
		{ 
			echo $i;
			if($controlador%2==1){
				echo "-";
			}
			else{
				echo "+";
			}
			$controlador=$controlador+1;
		}

		$suma=$suma + (-2)*$valor_n;
		echo "<br>La sumatoria es ". $suma/2;
	}
	else 
	{
		echo "Serie: ";
		for ($j=1; $j<=$valor_n*2 ; $j=$j+2) 
		{ 
			echo $j;
			if($controlador%2==1){
				echo "-";
				$suma=$suma+$j;
			}
			else{
				echo "+";
				$suma=$suma-$j;
			}
			$controlador=$controlador+1;
		}
		echo "<br>La sumatoria es ". $suma;
	}
?>
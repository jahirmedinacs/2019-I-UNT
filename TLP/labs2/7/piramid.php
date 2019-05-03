<?php 
$n_max = $_POST["NMAX"];
$carry = 1;
echo"Piramide de $n_max Filas</br></br>"; 

for ($jj=0; $jj<$n_max ; $jj++) {
    for ($ii=$jj+1; $ii<$n_max ; $ii++) { 
        echo " ";
    }
    echo "*";	
    for ($kk=$jj+1; $kk<$jj+$carry ; $kk++) { 
        echo "*";
    }
    echo "</br>";
    $carry=$carry+2;
}
?>

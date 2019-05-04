<?php
$name = $_POST["NAME"];
$email = $_POST["EMAIL"];
$password = $_POST["PASSWORD"];
$gend = $_POST["GEND"];
$file_path = $_POST["FILE"];
$message = $_POST["MESSAGE"];
$know = $_POST["KNOW"];
$subs = $_POST["SUBS"];
$days = $_POST["DAYS"];

echo "
Nombre $name </br>
 </br>
Email $email </br>
 </br>
Password $password </br>
 </br>
Genero $gend </br>
 </br>
Archivo $file_path </br>
 </br>
Mensaje </br>
\t $message </br>
</br>
 </br>
Cuanto Sabe de HTML $know </br>
 </br>
Se suscribio ? $subs </br>
 </br>
Por cuantos dias ? $days </br>
";
?>


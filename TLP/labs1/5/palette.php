<!DOCTYPE html>
<html>
<body>
<?php
//array["red","orange","yellow","green","blue","indigo","violet"];
$color_id= $_POST["submit"];
if ($color_id=="red") {
    echo "El color rojo, uno de los colores fundamentales en el modelo RGB";
}
if ($color_id=="orange") {
    echo "El color naranja, el cual fue nombrado segun la fruta, o la inversa, quien sabe";
}
if ($color_id=="green") {
    echo "Verde, identifica la vitalidad y la naturaleza, otro miembro del modelo RGB";
}
if ($color_id=="yellow") {
    echo "El color amarillo es parte del modelo de color YCKB , siendo fundamental";
    echo "</br>para dar brillo a los colores generados por este modelo";
}
if ($color_id=="blue") {
    echo "Color miembro del modelo RGB y uno de los colores del arcoiris";
}
if ($color_id=="indigo") {
    echo "Morado, color poco comun de la naturaleza y pesimo para interfaces";
}
if ($color_id=="violet") {
    echo "El color violeta no es para nada amigable con los ojos";
    echo "</br>";
    echo "pero bueno, es un color con nombre propio en CSS, asi que debe ser importante";
}
?>
</body>
</html>

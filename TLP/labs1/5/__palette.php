<!DOCTYPE html>
<html>
<body>
<?php

$color_id = (int)$_POST["COLORID"];
$color_val = (int)$_POST["COLORVAL"];
$rgb_ref = array(127,127,127);

for ($id_x = 0; $id_x < 3; $id_x++) {
    if ($color_id==$id_x) {
        $rgb_ref[$id_x]=$color_val;
    }
}

$step_size = 32;
echo "<center>";
    echo "<div id=\"bg_color\" style=\"background-color: gray;\">";
    echo "</br>";
    echo "</br>";
    echo "<p id=\"tcolor\" style=\"font-size:medium;\">";
    echo "Este Texto debe Cambiar de Color";
    echo "</p>";
    echo "</br>";
    echo "</br>";

    echo "<table border=\"1\">";
    echo "<caption>Selecciona un Color</caption>";
    echo "</br>";

    for ($id_x = 0; $id_x<256; $id_x=$id_x+$step_size){
        echo "<tr>";
        for ($id_y = 0; $id_y<256; $id_y=$id_y+$step_size){
            echo "<td>";
            if ($color_id==0) {
                $rgb_ref[1] = $id_x;
                $rgb_ref[2] = $id_y;
            }
            if ($color_id==1) {
                $rgb_ref[0] = $id_x;
                $rgb_ref[2] = $id_y;
            }
            if ($color_id==2) {
                $rgb_ref[0] = $id_x;
                $rgb_ref[1] = $id_y;
            }
            $red = $rgb_ref[0];
            $green = $rgb_ref[1];
            $blue = $rgb_ref[2];

            $id_name = strval($red).strval($green).strval($blue);

            echo "<div style=\"background-color:rgb($red,$green,$blue);\"";
            echo " id=\"color_$id_name\"";
            echo "onclick=\"getElementById('bg_color').style.color='rgb($red,$green,$blue)'\"";
            echo ">";
            echo "\tR:\t$red</br>\tG:\t$green</br>\tB:\t$blue";
            //echo "<button onclick=\"getElementById('foo').style.color='rgb($red,$green,$blue)'\">";
            echo "Pick</button>";
            echo "</div>";
            echo "</td>";
        }
        echo "</tr>";
    }
    echo "</table>";
    echo "</div>";
echo "</center>";
?>
</body>
</html>

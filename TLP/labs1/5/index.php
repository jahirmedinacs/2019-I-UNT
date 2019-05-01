<!DOCTYPE html>
<html>
    <!--TODO-->
    <head>
        <meta charset="UTF-8">
        <title>Paleta de Colores</title>
    </head>
    <body>
        <h2>Paleta de Colores HTML5</h2>
        <div>
            Seleccione un color (mouse), y observe toda la informacion
            relacionada a dicho color.
        </div>
        </br>
        </br>
    <form action="palette.php" method= post>
        <h4>Colores</h4>
        <ol>
            <li>
                <div style="background-color:red;" id="red" name="red" onclick="getElementById('tcolor').value='red'">
                Rojo
                </div>
            </li>
            <li>
                <div style="background-color:orange;" id="orange" name="orange" onclick="getElementById('tcolor').value='orange'">
                Anaranjado
                </div>
            </li>
            <li>
                <div style="background-color:yellow;" id="yellow" name="yellow" onclick="getElementById('tcolor').value='yellow'">
                Amarillo
                </div>
            </li>
            <li>
                <div style="background-color:green;" id="green" name="green" onclick="getElementById('tcolor').value='green'">
                Verde
                </div>
            </li>
            <li>
                <div style="background-color:blue;" id="blue" name="blue" onclick="getElementById('tcolor').value='blue'">
                Azul
                </div>
            </li>
            <li>
                <div style="background-color:indigo;" id="indigo" name="indigo" onclick="getElementById('tcolor').value='indigo'">
                Morado
                </div>
            </li>
            <li>
                <div style="background-color:violet;" id="violet" name="violet" onclick="getElementById('tcolor').value='violet'">
                Violeta
                </div>
            </li>
        </ol>
        <input id="tcolor" type= submit name="submit" value="Seleccione Un Color">
    </form>
    </body>
</html>


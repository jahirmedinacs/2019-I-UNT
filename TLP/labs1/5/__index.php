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
    <form action="__palette.php" method= post>
        <h4>Color Base de la Paleta</h4>
        <select id="Color" name="COLORID">
             <option value="0" name="REDID">Rojo</option>
             <option value="1" name="BLUEID">Azul</option>
             <option value="2" name="GREENID">Verde</option>
         </select>
        </br>
        </br>
        0 <input type="range" id="rangeInput" name="COLORVAL" min="0" max="255",
         value="127" oninput="amount.value=rangeInput.value"> 255
        <p>
        <output id="amount" name="amount" for="COLORVAL">127</output>
        </p>
        </br>
        </br>
        <input type= submit name="submit" value="Generar Paleta">
    </form>
    </body>
</html>

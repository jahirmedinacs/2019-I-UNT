<!DOCTYPE html>
<html lang="es">
<head>
    <title>Productos</title>
    <meta charset="utf-8">
</head>
<body>
    <h1>Productos</h1>
    <form name = "formulario" action="cotizacion.php" method="post">
        <table style="width:100%">
            <tr>
                <th>Producto</th>
                <th>Precio</th>
                <th>Cotizar</th>
            </tr>
            <?php
            $productos=array('Lapiz', 'Cuaderno', 'Borrador', 'Temperas', 'Papel A4');
            $precios=array(0.2,5,0.5,2,0.1);
            for ($ii=0; $ii<count($productos) ;$ii++){
                echo "<tr>";
                echo "<td>";
                echo $productos[$ii];
                echo "</td>";
                echo "<td>";
                echo $precios[$ii];
                echo "</td>";
                echo "<td>";
                echo "<input type=radio>";
                echo "</td>";
                echo "</tr>";
            }    
            ?>
        </table>  
    </br>
    </br>
    <input type="submit" name="boton" value="Cotizar">
    </form>
</body>
</html>

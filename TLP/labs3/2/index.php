<!DOCTYPE html>
<html lang="es">
<head>
    <title>Productos</title>
    <meta charset="utf-8">
</head>
<style>

    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }

    th {
        text-align: left;
    }
</style>
<script>
    function blockCantidad(refCheck, refInput){
    var refCheckbox =refCheck;
    var refInput = refInput;

    if (refCheckbox.checked == true){
        refInput.disabled = false; 
        }
    else{
        refInput.disabled = true;
        if (refInput.value == ""){
            refInput.value = 0;
            }
        }
    }
    
    function setInt(refInput){
    refInput.value = parseInt(refInput.value)
    }
</script>
<body>
    <h1>Productos</h1>
    <form name = "formulario" action="cotizacion.php" method="post">
    <center>
        <table style="width:80%; border-spacing: 5px;">
            <thead>
                <tr>
                    <th>Producto</th>
                    <th>Marca</th>
                    <th>Precio</th>
                    <th>Items Base</th>
                    <th>Cotizar</th>
                    <th>Cantidad</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $productos=array('Lapiz', 'Cuaderno', 'Borrador', 'Temperas', 'PapelA4');
                $precios=array(0.2,5,0.5,2,0.1);
                for ($ii=0; $ii<count($productos) ;$ii++){
                    echo "<tr>";

                        echo "<td> 
                            $productos[$ii]
                            </td>";

                        echo "<td>
                            Dummy Brand
                            </td>";

                        echo "<td>
                                $precios[$ii]
                            </td>";

                        echo "<td>
                            1
                            </td>";

                        echo "<td>
                            <input type=checkbox name=SELECT_".$productos[$ii]."
                                id = ID_CHECK_".$productos[$ii]."
                                onclick=\"blockCantidad(this, document.getElementById('ID_IN_".$productos[$ii]."'))\">
                            </td>";

                        echo "<td>
                            <input type=number value=0 max=100 min=0 
                                name=AMOUNT_".$ii."
                                id=ID_IN_".$productos[$ii]."
                                onfocusout=\"setInt(this)\"
                                disabled>
                            </td>";

                    echo "</tr>";
                }    
                ?>
            </tbody>
            <tfoot>
                <tr>
                    <th>Nombre Comercial</th>
                    <th>Marca Distruibidora</th>
                    <th>Precio por Items Base</th>
                    <th>Items por Precio</th>
                    <th>Marcar para Cotizar</th>
                    <th>Cantidad a Comprar</th>
                </tr>
            </tfoot>
        </table>  
    </br>
    </br>
    <input type="submit" name="boton" value="Cotizar" onclick="return confirm('ESTA POR ENVIAR EL FORMULARIO');">
    </center>
    </form>
</body>
</html>

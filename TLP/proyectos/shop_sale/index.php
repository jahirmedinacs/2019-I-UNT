<?php
session_start();
?>
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
        refInput.value = parseInt(refInput.value);
    }

    function hiddeTable(refChosser){
        for (ii = 0; ii < refChosser.length; ii++){
            var refId = refChosser.options[ii].value;
            var refTable = document.getElementById(refId);
            refTable.hidden = true;
        }
    }

    function updateTable(refChosser){
        hiddeTable(refChosser);
        var refId = refChosser.options[refChosser.selectedIndex].value;
        var refTable = document.getElementById(refId);
        refTable.hidden = false;
    }
</script>
<?php
$servername = "localhost";
$username = "tlp_query";
$password = "1234";
$dbname = "tlp_shop";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

//
// Recibiendo Familias
//
$tipos = array();

$sql = "SELECT * FROM tipo_clases";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_assoc($result)) {
        array_push($tipos, $row["tipo"]);
    }
} else {
    echo "0 results";
}

//
// Generando Productos por Familia
//

$productos = array();
foreach ($tipos as $sub_tipo){
    $sql = "SELECT * FROM inventario WHERE inventario.tipo='$sub_tipo'";
    $result = mysqli_query($conn, $sql);

    $sub_productos = array();
    if (mysqli_num_rows($result) > 0) {
        while($row = mysqli_fetch_assoc($result)) {
            array_push($sub_productos, $row);
        }
    } else {
        echo "0 results";
    }
    $productos[$sub_tipo] = $sub_productos;
}

mysqli_close($conn);

?>
<body>
    <h1>Productos</h1>
    <div align="left">
        <h3>Seleccion una Familia de Productos</h3>
        <select id="select_dropdown" onchange="updateTable(this)">
        <?php
            foreach ($tipos as $sub_tipo){
            echo "<option value=table_$sub_tipo>$sub_tipo</option>";
            }
        ?>
        </select>
    </div>
    <form name = "formulario" action="captcha.php" method="post">
    <center>
        <?php
        foreach ($tipos as $sub_tipo){
        ?>
            <table id=<?php echo "table_".$sub_tipo ?> style="width:80%; border-spacing: 5px;" hidden>
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
                $sub_productos = $productos[$sub_tipo];
                for ($ii=0; $ii<count($sub_productos) ;$ii++){
                    $ref_id = $sub_productos[$ii]["id"];
                    $ref_nombre = $sub_productos[$ii]["nombre"];
                    $ref_tipo = $sub_productos[$ii]["tipo"];
                    $ref_marca = $sub_productos[$ii]["marca"];
                    $ref_precio = $sub_productos[$ii]["precio"];
                    $ref_items = $sub_productos[$ii]["items"];
                    echo "<tr>";
                        echo "<td> 
                            $ref_nombre
                            </td>";
                        echo "<td>
                            $ref_marca
                            </td>";

                        echo "<td>
                            ".round($ref_precio, 3)."
                            </td>";

                        echo "<td>
                            $ref_items
                            </td>";

                        echo "<td>
                            <input type=checkbox name=SELECT_".$ref_id."
                                id = ID_CHECK_".$ref_id."
                                onclick=\"blockCantidad(this, document.getElementById('ID_IN_".$ref_id."'))\">
                            </td>";

                        echo "<td>
                            <input type=number value=0 max=99999 min=0
                                name=AMOUNT_".$ref_id."
                                id=ID_IN_".$ref_id."
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
        <?php
        }
        ?>
    </br>
    </br>
    <?php
        $_SESSION["CAPTCHA"] = exec('./generator_img.py');
    ?>
    <center>
        <h4>
            <?php
            echo $_SESSION["CAPTCHA"];
            ?>
        </h4>
        <img src="captcha.png" width="200" height="200"> 
    </center>
    <input type="submit" name="boton" value="Cotizar" onclick="return confirm('ESTA POR ENVIAR EL FORMULARIO');">
    </center>
    </form>
</body>
</html>

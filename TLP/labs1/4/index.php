<!DOCTYPE html>
<html>
<head>

<!-- metadata goes in head -->

	<title>My First Page</title>
</head>
<body>
<!-- content goes in the body -->
    <center>
        <h1>Tabla de Productos</h1>
        <form action="operacionesEnc.php" method= post>
            <table border="1">
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Genero</th>
                        <th>Cantidad</th>				
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td rowspan = 2> <img src="./cocacola.jpg" style="height: 150px;">
                        </td>
                        <td >Masculino</td>				
                        <td >
                            <input type="numero" name="CM1" placeholder="Ingrese una cantidad">
                        </td>					
                    </tr>
                    <tr>
                        <td rowspan= 1>Femenino</td>
                        <td rowspan= 1>
                            <input type="numero" name="CF1" placeholder="Ingrese una cantidad">
                        </td>
                    </tr>
                    <tr>
                        <td rowspan = 2> <img src="incacola.png" style="height: 150px;">					
                        </td>
                        <td >Masculino</td>				
                        <td >
                            <input type="numero" name="CM2" placeholder="Ingrese una cantidad">
                        </td>				
                    </tr>	
                    <tr>
                        <td >Femenino</td>
                        <td >
                            <input type="numero" name="CF2" placeholder="Ingrese una cantidad">
                        </td>
                    </tr>		
                </tbody>
            </table>
            </br>
            <input type= submit name="submit" value="Valorar Encuesta">
        </form>
    </center>
</body>
</html>

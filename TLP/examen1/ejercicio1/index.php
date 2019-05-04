<!DOCTYPE html>
<html>
<head>
	<title>My First Page</title>
</head>
<body>
    <center>
        <h1>Titulo de la Tabla</h1>
            <table border="1">
                <tbody>

<?php
for ($i=0; $i < 5; $i++) { 
if ($i==0) {
	echo "<tr>
                        <td rowspan = 2> tabla avanzada           </td>
                        <td colspan=2>cabecera multiples columnas</td>				
			
                    </tr>";
}
if ($i==1) {
     echo "<tr>
                        <td > primera col </td> 
                        <td> segunda col</td>   
                    </tr>";
}
if ($i==2) {
	echo"<tr>
                         <td>Fila1</td>
                        <td >fila1columna1</td>
                        <td>fila1columna2</td>				
                    </tr>";
}
if ($i==3) {
	echo "<tr>
	         <td>fila2</td>
             <td >fila2columna1</td>             
             <td > fila2columna2</td>
            </tr>";
}
if ($i==4) {
  echo "<tr>
         <td colspan=3>pie de tabla</td>
        </tr>";
}
}
?>
</tbody>
            </table>
            </br>        
    </center>
</body>
</html>
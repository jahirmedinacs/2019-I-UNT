<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <!-- Empieza codigo calculadora html-->
        <center>  
            <form name="calculadora" action="operaciones.php" method = "post">
                <h3>Calculadora</h3>
                <p>Haz algun calculo para ver el resultado.</p>
                <input type="textfield" name="resultado" value="">
                <table>
                    <caption>Teclado</caption>
                    <tr>
                        <td>
                        <input type="button" value="1" onClick="document.calculadora.resultado.value+='1'">
                        </td>
                        <td>
                        <input type="button" value="2" onClick="document.calculadora.resultado.value+='2'">
                        </td>
                        <td>
                        <input type="button" value="3" onClick="document.calculadora.resultado.value+='3'">
                        </td>
                        <td>
                        <input type="button" value="+" onClick="document.calculadora.resultado.value+='+'">
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <input type="button" value="4" onClick="document.calculadora.resultado.value+='4'">
                        </td>
                        <td>
                        <input type="button" value="5" onClick="document.calculadora.resultado.value+='5'">
                        </td>
                        <td>
                        <input type="button" value="6" onClick="document.calculadora.resultado.value+='6'">
                        </td>
                        <td>
                        <input type="button" value="-" onClick="document.calculadora.resultado.value+='-'">
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <input type="button" value="7" onClick="document.calculadora.resultado.value+='7'">
                        </td>
                        <td>
                        <input type="button" value="8" onClick="document.calculadora.resultado.value+='8'">
                        </td>
                        <td>
                        <input type="button" value="9" onClick="document.calculadora.resultado.value+='9'">
                        </td>
                        <td>
                        <input type="button" value="*" onClick="document.calculadora.resultado.value+='*'">
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <input type="button" value="0" onClick="document.calculadora.resultado.value+='0'">
                        </td>
                        <td>
                        <input type="reset" value="c">
                        </td>
                        <td>
                        <input type="button" value="/" onClick="document.calculadora.resultado.value+='/'">
                        </td>
                        <td>
                        <input type="button" value="=" onClick="document.calculadora.resultado.value=eval(document.calculadora.resultado.value)">
                        </td>
                    </tr>
                </table>
            </form>
        </center>
    </body>
</html>

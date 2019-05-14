
<?php
echo "<h1>Cotizacion</h1>";
echo "<center>";
    echo "<ul>";

$productos=array('Lapiz', 'Cuaderno', 'Borrador', 'Temperas', 'PapelA4');                                           
$precios=array(0.2,5,0.5,2,0.1);

$__temp = array_pop($_POST);

$ref_keys = array_keys($_POST);

$total = 0;
for ($ii=0; $ii<count($_POST); $ii++){
    $temp_ref = $ref_keys[$ii]; 
    
    if (($ii + 1) % 2 == 0){
        $prod_amount = $_POST[$temp_ref];
        $ref_id = str_replace("AMOUNT_", "", $temp_ref);
        $ref_prod = $productos[$ref_id];
        $ref_prec = $precios[$ref_id];

        $sub_total = $ref_prec * $prod_amount;
        
        echo "<li>";
        echo "<b>$prod_amount</b>\t\t<b>$ref_prod</b>'s
            \ta\t<b>$ref_prec</b> la unidad, cuesta
            \t<b>$sub_total</b>";
        echo "</li>";

        $total += $sub_total;
    }
}
    echo "</ul>";
echo "</center>";
echo "<h2>";
echo "</br></br><b>Total :\t $total Soles</b>";
echo "</h2>";
?>

<!--
echo var_dump($_POST);
echo "\n\n";
foreach ($_POST as $ref){
    echo "$ref\n";
} 
-->
<!--
$amount = $_POST["TIMES"];
$base = $_POST["BASE"];
$factor = range(1, $amount);
$output = [];

foreach ($factor as $ii){
    array_push($output, $base * $ii);
}

$rows_ref = $amount * 2 + 5;
echo "<textarea rows=\"$rows_ref\" cols=\"30\">";
echo "\n\n\n";
echo var_dump($output);
echo "</textarea>";

-->

<?php
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

?>

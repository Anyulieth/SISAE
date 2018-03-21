<?php
require '../conexion.php';

$sql1= "CALL VerificarAsis($_GET[busqueda])";
$query = $con->query($sql1);
?>


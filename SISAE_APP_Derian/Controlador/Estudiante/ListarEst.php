<?php 
require '../Controlador/conexion.php';
$result = $con->query("CALL PaEstTb03_ListarActivos()");
?>
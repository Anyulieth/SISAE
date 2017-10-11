<?php 
require '../Controlador/conexion.php';
$result = $con->query("CALL PaEncTb05_Listar()");
?>
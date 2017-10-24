<?php 
require '../Modelo/conexion.php';
$result = $con->query("CALL PaAsistClaseTb18_Listar()");
?>
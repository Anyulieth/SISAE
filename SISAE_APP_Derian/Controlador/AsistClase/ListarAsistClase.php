<?php 
require '../Controlador/conexion.php';
$result = $con->query("CALL PaAsistClaseTb18_Listar()");
?>
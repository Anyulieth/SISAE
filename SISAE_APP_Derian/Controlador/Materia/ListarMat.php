<?php 
require '../Controlador/conexion.php';
$result = $con->query("CALL PaMateriaTb17_Listar()");
?>
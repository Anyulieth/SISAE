<?php
require '../Controlador/conexion.php';
$result = $con -> query("CALL PaProfTb04_ListarActivos()");
?>
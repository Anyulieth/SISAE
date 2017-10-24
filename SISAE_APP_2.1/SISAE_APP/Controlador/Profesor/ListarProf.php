<?php
include "C:/xampp/htdocs/SISAE_APP/Modelo/conexion.php";
$result = $con -> query("CALL PaProfTb04_Listar()");
?>
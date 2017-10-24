<?php 
require 'C:/xampp/htdocs/SISAE_APP/Modelo/conexion.php';
$result = $con->query("CALL PaEncTb05_Listar()");
?>
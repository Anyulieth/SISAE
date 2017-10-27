<?php
require 'conexion.php';
$result = $con -> query("CALL PaGradoTb13_Listar()");
?>
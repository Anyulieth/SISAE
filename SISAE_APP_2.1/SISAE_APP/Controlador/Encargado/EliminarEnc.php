<?php
if (!empty($_GET)) {
require 'C:/xampp/htdocs/SISAE_APP/Modelo/conexion.php';

	$sql = "call PaEncTb05_Eliminar(\"$_GET[ced]\")" ;
	$query = $con -> query($sql);
	if (!$con) {print "Fallo";
	}
}
?>
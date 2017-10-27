<?php
if (!empty($_GET)) {
	include "../conexion.php";

	$sql = "CALL PaEspecialidadTb16_EliminarEspecialidad(\"$_GET[IdEs]\")";
	$query = $con -> query($sql);
	if (!$con) {print "Fallo";
	}
}
?>
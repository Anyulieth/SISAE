<?php
if (!empty($_GET)) {
	include "../conexion.php";

	$sql = "call PaEncTb05_Eliminar(\"$_GET[ced]\")" ;
	$query = $con -> query($sql);
	if (!$con) {print "Fallo";
	}
}
?>
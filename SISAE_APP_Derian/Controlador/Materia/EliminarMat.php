<?php
if (!empty($_GET)) {
	include "../conexion.php";

	$sql = "CALL PaMateriaTb17_EliminarMateria(\"$_GET[idm]\")";
	$query = $con -> query($sql);
	if (!$con) {print "Fallo";
	}
}
?>
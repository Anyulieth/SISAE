<?php
if (!empty($_GET)) {
	include "../conexion.php";

	$sql = "CALL PaAsistColeTb08_EliminarAsistCole(\"$_GET[IdAsisCole]\")";
	$query = $con -> query($sql);
	if (!$con) {print "Fallo";
	}
}
?>
<?php
if (!empty($_GET)) {
	include "../conexion.php";

	$sql = "CALL PaEstTb03_BorrarEst(\"$_GET[ced]\")";
	$query = $con -> query($sql);
	if (!$con) {print "Fallo";
	}
}
?>
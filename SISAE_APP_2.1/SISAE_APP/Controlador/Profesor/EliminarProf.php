<?php
if (!empty($_GET)) {
	include "C:/xampp/htdocs/SISAE_APP/Modelo/conexion.php";

	$sql = "CALL PaProfTb04_BorrarProf(\"$_GET[ced]\")";
	$query = $con -> query($sql);
	if (!$con) {print "Fallo";
	}
}
?>
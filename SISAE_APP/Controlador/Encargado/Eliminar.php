<?php
if (!empty($_GET)) {
	include "../conexion.php";

	$sql = "call PaEncTb05Eliminar()" . $_GET["id"];
	$query = $con -> query($sql);
	if ($query != null) {
		print "<script>alert(\"Eliminado exitosamente.\");window.location='../Controlador/Encargado/Ver.php';</script>";
	} else {
		print "<script>alert(\"No se pudo eliminar.\");window.location='../Controlador/Encargado/Ver.php';</script>";
	}
}
?>
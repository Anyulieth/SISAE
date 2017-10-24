<?php
	include "C:/xampp/htdocs/SISAE_APP/Modelo/conexion.php";

if (!empty($_POST)) {
	if (isset($_POST["cedula"]) && isset($_POST["nombre"])) {
		if ($_POST["cedula"] != "" && $_POST["nombre"] != "" && $_POST['Apellido1'] != "" && $_POST['Apellido2'] != "" && $_POST['clave'] != "") {
			$cons = $con -> query("CALL PaFunTb06_GuardarFunc(\"$_POST[cedula]\",\"$_POST[fecha_nac]\",\"$_POST[clave]\",\"$_POST[estado]\",\"$_POST[nombre]\",\"$_POST[Apellido1]\",\"$_POST[Apellido2]\",\"$_POST[direccion]\",\"$_POST[genero]\",\"$_POST[telefono]\",\"$_POST[email]\")");
			if (!$cons) {print "Fallo";
			}
		}
	}
}
?>

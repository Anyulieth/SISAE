<?php
include "C:/xampp/htdocs/SISAE_APP/Modelo/conexion.php";

if (!empty($_POST)) {
	if (isset($_POST["cedula"]) && isset($_POST["fecha_nac"]) && isset($_POST["estado"]) && isset($_POST["nombre"]) && isset($_POST["Apellido1"]) && isset($_POST["Apellido2"]) && isset($_POST["direccion"]) && isset($_POST["genero"]) && isset($_POST["telefono"]) && isset($_POST["email"])) 
	{
		if ($_POST['cedula'] != "" && $_POST['fecha_nac'] != "" && $_POST['estado'] != "" && $_POST['nombre'] != "" && $_POST['Apellido1'] != "" && $_POST['Apellido2'] != "" && $_POST['direccion'] != "" && $_POST['genero'] != "" && $_POST['telefono'] != "" && $_POST['email'] != "") 
		{
			$cons = $con -> query("CALL PaEstTb03_GuardarEst(\"$_POST[cedula]\",\"$_POST[fecha_nac]\",\"$_POST[Adecuacion]\",\"$_POST[estado]\",\"$_POST[Id_Especialidad]\",\"$_POST[nombre]\",\"$_POST[Apellido1]\",\"$_POST[Apellido2]\",\"$_POST[direccion]\",\"$_POST[genero]\",\"$_POST[telefono]\",\"$_POST[email]\")");
			print $cons;
		}
	}
}
?>
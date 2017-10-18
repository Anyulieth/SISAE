<?php
require '../conexion.php';

if (!empty($_POST)) {
	if (isset($_POST["Cedula"]) && isset($_POST["Fecha_Nac"]) && isset($_POST["Adecuacion"]) && isset($_POST["Id_Especialidad"]) && isset($_POST["Nombre"]) && isset($_POST["Apellido1"]) && isset($_POST["Apellido2"]) && isset($_POST["Direccion"]) && isset($_POST["Telefono"]) && isset($_POST["Email"])) 
	{
		if ($_POST['Cedula'] != "" && $_POST['Fecha_Nac'] != "" && $_POST['Adecuacion'] != "" && $_POST['Id_Especialidad'] != "" && $_POST['Nombre'] != "" && $_POST['Apellido1'] != "" && $_POST['Apellido2'] != "" && $_POST['Direccion'] != ""  && $_POST['Telefono'] != "" && $_POST['Email'] != "") 
		{
			$sql = "CALL PaEstTb03_ActualizarEst(\"$_POST[Cedula]\",\"$_POST[Fecha_Nac]\",\"$_POST[Adecuacion]\",\"$_POST[Id_Especialidad]\",\"$_POST[Nombre]\",\"$_POST[Apellido1]\",\"$_POST[Apellido2]\",\"$_POST[Direccion]\",\"$_POST[Telefono]\",\"$_POST[Email]\")";
			$query = $con->query($sql);
			if (!$cons) 
			{
				print "Fallo";
			}
		}
	}
}
?>
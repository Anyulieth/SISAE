<?php
include "../conexion.php";

if(!empty($_POST)){
	if(isset($_POST["Cedula"]) && isset($_POST["Nombre"]) && isset($_POST["Apellido1"]) && isset($_POST["Apellido2"]) && isset($_POST["Direccion"]) && isset($_POST["Telefono"]) && isset($_POST["Email"]))
	{
		if($_POST['Cedula']!="" && $_POST['Nombre']!="" && $_POST['Apellido1']!="" && $_POST['Apellido2']!="" && $_POST['Direccion']!="" && $_POST['Telefono']!="" &&$_POST['Email']!="")
		{			
			$sql = "call PaEncTb05_ActualizarEnc(\"$_POST[Cedula]\",\"$_POST[Nombre]\",\"$_POST[Apellido1]\",\"$_POST[Apellido2]\",\"$_POST[Direccion]\",\"$_POST[Telefono]\", \"$_POST[Email]\")";
			$query = $con->query($sql);
			if(!$query){ print 'No se pudo actualizar!!'; }	
		}
	}
}
?>
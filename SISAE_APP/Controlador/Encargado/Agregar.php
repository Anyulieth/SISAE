<?php
$nuevo = new EncCl01(); 

		/*	$id = $_POST["Cedula"];
			$nombre = $_POST["Nombre"];
			$apell1 = $_POST["Apellido1"];
			$apell2 = $_POST["Apellido2"];
			$direccion = $_POST["Direccion"];
			$sexo = $_POST["Genero"];
			$telefono = $_POST["Telefono"];
			$email = $_POST["Email"];
			$clave = md5($_POST["Clave"]);*/
			
if (!empty($_POST)) {
	if (isset($_POST["Cedula"]) && isset($_POST["Nombre"]) && isset($_POST["Apellido1"]) && isset($_POST["Apellido2"]) && isset($_POST["Direccion"]) && isset($_POST["Genero"]) && isset($_POST["Telefono"]) && isset($_POST["Email"]) && isset($_POST["Clave"])) 
	{
		if($_POST["Cedula"]!=""&& $_POST["Nombre"]!=""&& $_POST["Apellido1"]!=""&& $_POST["Apellido2"]!=""&& $_POST["Direccion"]!=""&& $_POST["Genero"]!=""&& $_POST["Telefono"]!=""&&$_POST["Email"]!=""&& $_POST["Clave"]!="")
		{
		include "../Controlador/conexion.php";
	
	$nuevo->GuardarEnc($_POST["Cedula"], $_POST["Nombre"], $_POST["Apellido1"], $_POST["Apellido2"], $_POST["Direccion"], $_POST["Genero"], $_POST["Telefono"],$_POST["Email"],$_POST["Clave"]);
			if ($query != null) 
			{
				print "<script>alert(\"Agregado exitosamente.\");window.location='../ver.php';</script>";
			} else {
				print "<script>alert(\"No se pudo agregar.\");window.location='../ver.php';</script>";
			}
		}
	}
}
?>
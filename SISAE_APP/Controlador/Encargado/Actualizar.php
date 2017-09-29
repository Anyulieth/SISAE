<?php

if(!empty($_POST)){
	if(isset($_POST["Cedula"]) &&isset($_POST["Nombre"]) &&isset($_POST["Apellido1"]) &&isset($_POST["Apellido2"]) &&isset($_POST["Direccion"]) &&isset($_POST["Genero"]) &&isset($_POST["Telefono"]) &&isset($_POST["Email"]) &&isset($_POST["Clave"]))
	{
		if($_POST["Cedula"]!=""&& $_POST["Nombre"]!=""&& $_POST["Apellido1"]!=""&& $_POST["Apellido2"]!=""&& $_POST["Direccion"]!=""&& $_POST["Genero"]!=""&& $_POST["Telefono"]!=""&&$_POST["Email"]!=""&& $_POST["Clave"]!="")
		{
			include "../Controlador/conexion.php";
			
			$sql = "call PaEncTb05_ActualizarEnc() where id=".$_POST["Cedula"];
			$query = $con->query($sql);
			if($query!=null)
			{
				print "<script>alert(\"Actualizado exitosamente.\");window.location='../ver.php';</script>";
			}else{
				print "<script>alert(\"No se pudo actualizar.\");window.location='../ver.php';</script>";
			}
		}
	}
}
?>
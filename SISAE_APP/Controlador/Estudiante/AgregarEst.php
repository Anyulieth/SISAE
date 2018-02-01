<?php
require_once '../../Modelo/EstCl02.php';

if (!empty($_POST)) {
	if (isset($_POST["cedula"]) && isset($_POST["fecha_nac"]) && isset($_POST["Adecuacion"]) && isset($_POST["estado"]) && isset($_POST["Id_Especialidad"]) && isset($_POST["nombre"]) && isset($_POST["Apellido1"]) && isset($_POST["Apellido2"]) && isset($_POST["direccion"]) && isset($_POST["genero"]) && isset($_POST["telefono"]) && isset($_POST["email"])) 
	{
		if ($_POST['cedula'] != "" && $_POST['fecha_nac'] != "" && $_POST['Adecuacion'] != "" && $_POST['estado'] != "" && $_POST['Id_Especialidad'] != "" && $_POST['nombre'] != "" && $_POST['Apellido1'] != "" && $_POST['Apellido2'] != "" && $_POST['direccion'] != "" && $_POST['genero'] != "" && $_POST['telefono'] != "" && $_POST['email'] != "") 
		{
			$ced = $_POST['cedula'];
			$fech = $_POST['fecha_nac'];
			$ade = $_POST['Adecuacion'];
			$est = $_POST['estado'];
			$esp = $_POST['Id_Especialidad'];
			$nom = $_POST['nombre'];
			$ape1 = $_POST['Apellido1'];
			$ape2 = $_POST['Apellido2']; 
			$dir = $_POST['direccion'];
			$gen = $_POST['genero'];
			$tel = $_POST['telefono'];
			$ema = $_POST['email'];		

			$est = new EstCl02();
			$result = $est->EstCl02_AddEst($ced,$fech,$ade,$est,$esp,$nom,$ape1,$ape2,$dir,$gen,$tel,$ema); 
			if ($reg) 
			{
				print $reg;
			}
		}
	}
}
?>
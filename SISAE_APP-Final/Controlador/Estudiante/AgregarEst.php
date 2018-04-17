<?php
require_once '../../Modelo/EstCl02.php';

if (!empty($_POST)) {
	if (isset($_POST["Cedula"]) && isset($_POST["Fecha_nac"]) && isset($_POST["Adecuacion"]) && isset($_POST["Estado"]) && isset($_POST["Nombre"]) && isset($_POST["Apellido1"]) && isset($_POST["Apellido2"]) && isset($_POST["Direccion"]) && isset($_POST["Genero"]) && isset($_POST["Telefono"]) && isset($_POST["Email"])) 
	{
		if ($_POST['Cedula'] != "" && $_POST['Fecha_nac'] != "" && $_POST['Adecuacion'] != "" && $_POST['Estado'] != "" && $_POST['Nombre'] != "" && $_POST['Apellido1'] != "" && $_POST['Apellido2'] != "" && $_POST['Direccion'] != "" && $_POST['Genero'] != "" && $_POST['Telefono'] != "" && $_POST['Email'] != "") 
		{

			$ced = $_POST['Cedula'];
			$fech = $_POST['Fecha_nac'];
			$ade = $_POST['Adecuacion'];
			$estu = $_POST['Estado'];
			$nom = $_POST['Nombre'];
			$ape1 = $_POST['Apellido1']; 
			$ape2 = $_POST['Apellido2']; 
			$dir = $_POST['Direccion'];
			$gen = $_POST['Genero'];
			$tel = $_POST['Telefono'];
			$ema = $_POST['Email'];		

			$est = new EstCl02();
			$reg = $est->EstCl02_AddEst($ced,$fech,$ade,$estu,$nom,$ape1,$ape2,$dir,$gen,$tel,$ema);
			if ($reg) 
			{
				print $reg;
			}
		}
	}
}
?>
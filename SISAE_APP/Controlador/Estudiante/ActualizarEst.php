<?php
require_once '../../Modelo/EstCl02.php';

if(!empty($_POST)){
	if(isset($_POST["cedula"]) && isset($_POST["fecha_nac"]) && isset($_POST["nombre"]) && isset($_POST["Apellido1"]) && isset($_POST["Apellido2"]) && isset($_POST["direccion"]) && isset($_POST["telefono"]) && isset($_POST['email'])) 
	{
		if($_POST['cedula']!="" && $_POST['fecha_nac']!="" &&  $_POST['nombre']!="" && $_POST['Apellido1']!="" && $_POST['Apellido2']!="" && $_POST['direccion']!="" && $_POST['telefono']!="" && $_POST['email']!="") 
		{

			$ced = $_POST['cedula'];
			$fec = $_POST['fecha_nac'];
 			$nom = $_POST['nombre'];
 			$ap1 = $_POST['Apellido1']; 
 			$ap2 = $_POST['Apellido2'];
 			$dir = $_POST['direccion'];
 			$tel = $_POST['telefono'];
 			$ema = $_POST['email'];
 
			$est = new EstCl02();
			$reg = $est->EstCl02_EditEst($ced,$fec,$nom,$ap1,$ap2,$dir,$tel,$ema);
			if ($reg) 
			{
				print $reg;
			}	
		}
	} 
}
?>
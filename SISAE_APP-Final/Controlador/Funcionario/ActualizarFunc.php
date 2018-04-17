<?php
require_once '../../Modelo/FunCl05.php';
if(!empty($_POST)){
	if(isset($_POST["nombre"]) && isset($_POST["fecha_nac"]) && isset($_POST['clave']) && isset($_POST["Apellido1"]) && isset($_POST["Apellido2"]) && isset($_POST["direccion"]) && isset($_POST["telefono"]) && isset($_POST['email'])) 
	{
		if($_POST['nombre']!="" && $_POST['fecha_nac']!="" && $_POST['clave']!="" && $_POST['Apellido1']!="" && $_POST['Apellido2']!="" && $_POST['direccion']!="" && $_POST['telefono']!="" && $_POST['email']!="") 
		{			
			$ced = $_POST['cedula'];
			$fec = $_POST['fecha_nac'];
			$cla = $_POST['clave'];
 			$nom = $_POST['nombre'];
 			$ap1 = $_POST['Apellido1'];
 			$ap2 = $_POST['Apellido2'];
 			$dir = $_POST['direccion'];
 			$tel = $_POST['telefono'];
 			$ema = $_POST['email'];

			$fun = new FunCl05();
			$reg = $fun->FunCl05_EditFun($ced,$fec,$cla,$nom,$ap1,$ap2,$dir,$tel,$ema);
			if ($reg) 
			{
				print $reg;
			} 
		}
	}
}
?>
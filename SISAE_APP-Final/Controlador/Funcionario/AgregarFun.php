<?php
require_once '../../Modelo/FunCl05.php';
if(!empty($_POST)){
	if(isset($_POST["cedula"]) && isset($_POST["fecha_nac"]) && isset($_POST['clave']) && isset($_POST['estado']) 
		&& isset($_POST['nombre'])&& isset($_POST["Apellido1"]) && isset($_POST["Apellido2"]) && isset($_POST["direccion"]) && isset($_POST["telefono"]) && isset($_POST['email'])) 
	{
		if($_POST['cedula']!="" && $_POST['fecha_nac']!="" && $_POST['clave']!="" && $_POST['estado']!=""  && $_POST['nombre']!=""  
			&& $_POST['Apellido1']!="" && $_POST['Apellido2']!="" && $_POST['direccion']!="" && $_POST['telefono']!="" && $_POST['email']!="") 
		{	
			$ced = $_POST['cedula'];
			$cla = $_POST['clave'];
 			$fenac = $_POST['fecha_nac'];
 			$est = $_POST['estado'];
 			$nom = $_POST['nombre'];
 			$ap1 = $_POST['Apellido1'];
 			$ap2 = $_POST['Apellido2'];
 			$dir = $_POST['direccion'];
 			$sex = $_POST['genero'];
 			$tel = $_POST['telefono'];
 			$ema = $_POST['email'];
 			
			$fun = new FunCl05();
			$reg = $fun->FunCl05_AddFun($ced,$cla,$fenac,$est,$nom,$ap1,$ap2,$dir,$sex,$tel,$ema);
			if ($reg) 
			{
				print $reg;
			}
		}
	} 
}
?>

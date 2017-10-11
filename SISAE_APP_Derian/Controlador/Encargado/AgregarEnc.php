<?php
require '../conexion.php';
/*require '../EncCl04.php';
$nuevo = new EncCl04(); */
			
if (!empty($_POST)) {
	if (isset($_POST["Cedula"]) && isset($_POST["Nombre"]) && isset($_POST["Apellido1"]) && isset($_POST["Apellido2"]) && isset($_POST["Direccion"]) && isset($_POST["Genero"]) && isset($_POST["Telefono"]) && isset($_POST["Email"]) && isset($_POST["Clave"])) 
	{
		if($_POST['Cedula']!=""&& $_POST['Nombre']!=""&& $_POST['Apellido1']!=""&& $_POST['Apellido2']!=""&& $_POST['Direccion']!=""&& $_POST['Genero']!=""&& $_POST['Telefono']!=""&&$_POST['Email']!=""&& $_POST['Clave']!="")
		{
			$cons = $con -> query("CALL PaEncTb05_GuardarEnc(\"$_POST[Cedula]\",\"$_POST[Nombre]\",\"$_POST[Apellido1]\",\"$_POST[Apellido2]\",\"$_POST[Direccion]\",\"$_POST[Genero]\",\"$_POST[Telefono]\",\"$_POST[Email]\",\"$_POST[Clave]\")");
			if (!$cons) 
			{
				print "Fallo";
			}
	
	/*$nuevo->GuardarEnc($_POST["Cedula"], $_POST["Nombre"], $_POST["Apellido1"], $_POST["Apellido2"], $_POST["Direccion"], $_POST["Genero"], $_POST["Telefono"],$_POST["Email"],$_POST["Clave"]);
			if ($query != null) 
	*/		
		}
	}
}
?>
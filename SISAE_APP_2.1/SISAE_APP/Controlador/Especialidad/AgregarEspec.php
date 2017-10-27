<?php
require '../conexion.php';

if (!empty($_POST)) {
	if (isset($_POST["IdEsp"]) && isset($_POST["NomEsp"]) && isset($_POST["Cupo"])) 
	{
		if ($_POST['IdEsp'] != "" && $_POST['NomEsp'] != "" && $_POST['Cupo'] != "")
		{
			$cons = $con -> query("CALL PaEspecialidadTb16_GuardarEspecialidad(\"$_POST[IdEsp]\",\"$_POST[NomEsp]\",\"$_POST[Cupo]\",)";
			if (!$cons)
			{
				print "Fallo";
			}
		}
	}
}
?>
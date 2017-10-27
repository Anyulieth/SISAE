<?php
require '../conexion.php';

if (!empty($_POST)) {
	if (isset($_POST["IdAsistCole"]) && isset($_POST["HoraEntrada"]) && isset($_POST["FechaEntrada"]) && isset($_POST["HoraSalida"]) && isset($_POST["FechaSalida"]) && isset($_POST["IdEstudiante"])) 
	{
		if ($_POST['IdAsistCole'] != "" && $_POST['HoraEntrada'] != "" && $_POST['FechaEntrada'] != "" && $_POST['HoraSalida'] != "" && $_POST['FechaSalida'] != "" && $_POST['IdEstudiante'] != "")
		{
			$cons = $con -> query("CALL PaAsistColeTb08_GuardarAsistCole(\"$_POST[IdAsistCole]\",\"$_POST[HoraEntrada]\",\"$_POST[FechaEntrada]\",\"$_POST[HoraSalida]\",\"$_POST[FechaSalida]\",\"$_POST[IdEstudiante]\",)";
			if (!$cons)
			{
				print "Fallo";
			}
		}
	}
}
?>
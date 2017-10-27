<?php
include "../conexion.php";

if(!empty($_POST)){
	if(isset($_POST["IdAsistCole"]) && isset($_POST["HoraEntrada"]) && isset($_POST["FechaEntrada"]) && isset($_POST["HoraSalida"]) && isset($_POST["FechaSalida"]) && isset($_POST["IdEstudiante"]))  
	{
		if($_POST['IdAsistCole']!="" && $_POST['HoraEntrada']!="" && $_POST['FechaEntrada']!="" && $_POST['HoraSalida']!="" && $_POST['FechaSalida']!="" && $_POST['IdEstudiante']!="") 
		{			
			$sql = "CALL PaAsistColeTb08_ActualizarAsistCole(\"$_POST[IdAsistCole]\",\"$_POST[HoraEntrada]\",\"$_POST[FechaEntrada]\",\"$_POST[HoraSalida]\",\"$_POST[FechaSalida]\",\"$_POST[FechaSalida]\",)";
			$query = $con->query($sql);
			if(!$query)
			{
				print 'No se pudo actualizar!!';
			}
		}
	}
}
?>
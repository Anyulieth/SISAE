<?php
include "../conexion.php";

if(!empty($_POST)){
	if(isset($_POST["IdEsp"]) && isset($_POST["NomEsp"]) && isset($_POST["Cupo"]))  
	{
		if($_POST['IdEsp']!="" && $_POST['NomEsp']!="" && $_POST['Cupo']!="") 
		{			
			$sql = "CALL PaEspecialidadTb16_ActualizarEspecialidad(\"$_POST[IdEsp]\",\"$_POST[NomEsp]\",\"$_POST[Cupo]\",)";
			$query = $con->query($sql);
			if(!$query)
			{
				print 'No se pudo actualizar!!';
			}
		}
	}
}
?>
<?php
require_once '../../Modelo/EspecialidadCl15.php';

if(!empty($_POST)){
	if(isset($_POST["Id"]) && isset($_POST["Nombre"]) && isset($_POST["Cupo"])) 
	{
		if($_POST['Id']!="" && $_POST['Nombre']!="" && $_POST['Cupo']!="") 
		{
			$id = $_POST['Id'];
			$nom = $_POST['Nombre'];
			$cupo = $_POST['Cupo'];
            
			$esp = new EspecialidadCl15();
			$reg = $esp->EspecialidadCl15_EditEsp($id,$nom,$cupo);
			if ($reg) 
			{
				print $reg;
			}	
		}
	} 
}
?> 
<?php
require_once '../../Modelo/HorarioCl27.php';

if(!empty($_POST)){
	if(isset($_POST['Dia']) && isset($_POST['Hora_Inicio']) && isset($_POST['Hora_Fin']))
	{
		if($_POST['Dia']!="" && $_POST['Hora_Inicio']!="" && $_POST['Hora_Fin']!="") 
		{	
			$dia = $_POST['Dia'];	
			$hora_ini = $_POST['Hora_Inicio'];
			$hora_fin = $_POST['Hora_Fin'];

			$ho = new HorarioCl27();
			$reg = $ho->HorarioCl27_AddHo($dia,$hora_ini,$hora_fin);
			if ($reg) 
			{
				print $reg;
			}
		}
	}
}
?>
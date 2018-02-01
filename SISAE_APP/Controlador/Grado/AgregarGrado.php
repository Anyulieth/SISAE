<?php
require_once '../../Modelo/GradoCl12.php';

if (!empty($_POST)) {
	if ( isset($_POST["nombre"]) && isset($_POST["idbachi"])) 
	{
		if ( $_POST['nombre'] != "" && $_POST['idbachi'] != "") 
		{
			$nom = $_POST['nombre'];
			$bac = $_POST['idbachi'];

			$gra = new GradoCl12();
			$reg = $gra->GradoCl12_AddGra($nom,$bac);
			if ($reg) 
			{
				print $reg;
			}
		}
	}
}
?>
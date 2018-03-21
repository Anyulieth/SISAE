<?php
require_once '../../Modelo/MateriaCl16.php';

if (!empty($_POST)) {
	if ( isset($_POST["nombre"])) 
	{
		if ( $_POST['nombre'] != "") 
		{
 			$nom = $_POST['nombre'];

			$mat = new MateriaCl16();
			$reg = $mat->MateriaCl16_AddMat($nom);
			if ($reg) 
			{
				print $reg;
			}
		}
	}
}
?>
<?php
require_once '../../Modelo/MateriaCl16.php';

if(!empty($_POST)){
	if(isset($_POST["id"]) && isset($_POST["nombre"])) 
	{
		if($_POST['id']!="" && $_POST['nombre']!="") 
		{			
			$id = $_POST['id'];
 			$nom = $_POST['nombre'];

			$mat = new MateriaCl16();
			$reg = $mat->MateriaCl16_EditMat($id,$nom);
			if ($reg) 
			{
				print $reg;
			}
		}
	}
}
?> 
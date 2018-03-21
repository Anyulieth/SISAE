<?php
require_once '../../Modelo/BachillerCl13.php'; 

if(!empty($_POST)){
	if(isset($_POST["id"])  && isset($_POST['NomB'])) 
	{
		if($_POST['id']!=""  && $_POST['NomB']!="") 
		{			
			$id = $_POST['id'];
			$nom = $_POST['NomB'];

			$bac = new BachillerCl13(); 
			$reg = $bac->BachillerCl13_EditBac($id,$nom);
			if ($reg) 
			{
				print $reg;
			}
		}
	}
}
?> 
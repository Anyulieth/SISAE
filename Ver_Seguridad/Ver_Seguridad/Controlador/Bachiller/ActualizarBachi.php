<?php
require_once '../../Modelo/BachillerCl13.php'; 

if(!empty($_POST)){
	if(isset($_POST["IdB"])  && isset($_POST['NomB'])) 
	{
		if($_POST['IdB']!=""  && $_POST['NomB']!="") 
		{			
			$id = $_POST['IdB'];
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
<?php
require_once '../../Modelo/SeccionCl19.php';
if(!empty($_POST)){
	if(isset($_POST["Grado"]) &&isset($_POST["cupo"]) &&isset($_POST["num_grupo"])) {
		if($_POST["Grado"]!=""&&$_POST["cupo"]!="" && $_POST['num_grupo']!='')
		 {
			$gra=$_POST['Grado']; 
 			$cupo = $_POST['cupo'];
 			$num = $_POST['num_grupo'];

			$sec = new SeccionCl19();
			$reg = $sec->SeccionCl19_AddSec($cupo,$num,$gra);
			if ($reg) 
			{
				print $reg;
			}	
		}
	}
}
?>
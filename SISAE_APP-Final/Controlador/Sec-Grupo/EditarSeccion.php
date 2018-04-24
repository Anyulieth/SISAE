<?php
require_once '../../Modelo/SeccionCl19.php';
if(!empty($_POST))
{
	if(isset($_POST["id"]) && isset($_POST["cupo"]) &&isset($_POST["num_grupo"])) 
	{
		if($_POST["id"]!="" && $_POST["cupo"]!="" && $_POST['num_grupo']!="") 
		{
			$idg = $_POST["id"];
			$cup = $_POST["cupo"];
			$num = $_POST["num_grupo"];
			$sec = new SeccionCl19();
			$reg = $sec->SeccionCl19_EditSec($idg,$cup,$num);
			if ($reg) 
			{
				print $reg;
			}
		}
	} 
}
?>
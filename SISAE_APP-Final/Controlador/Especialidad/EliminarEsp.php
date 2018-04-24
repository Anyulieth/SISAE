<?php
require_once '../../Modelo/EspecialidadCl15.php';
if(isset($_GET)){
	 $eli = $_GET['Id'];
	 $esp =new EspecialidadCl15();
	 $reg = $esp->EspecialidadCl15_BorraEsp($eli);	 
	 if ($reg) 
			{
				print $reg;
			}
}
?>
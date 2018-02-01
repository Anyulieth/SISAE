<?php
require_once '../../Modelo/BachillerCl13.php'; 
if(isset($_GET)){
	 $eli = $_GET['id'];
	 $bac = new BachillerCl13(); 
	 $reg = $bac->BachillerCl13_BorraBac($eli);	 
	 if ($reg) 
			{
				print $reg;
			}
}
?>
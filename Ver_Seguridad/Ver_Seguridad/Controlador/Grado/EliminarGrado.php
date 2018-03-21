<?php
require_once '../../Modelo/GradoCl12.php';
if(isset($_GET)){
	 $eli = $_GET['id'];
	 $gra = new GradoCl12();
	 $reg = $gra->GradoCl12_BorraGra($eli);	 
	 if ($reg) 
			{
				print $reg;
			}
}
?>
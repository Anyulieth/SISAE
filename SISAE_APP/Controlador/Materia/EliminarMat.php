<?php
require_once '../../Modelo/MateriaCl16.php';
if(isset($_GET)){
	 $eli = $_GET['idm'];
	 $mat = new MateriaCl16();
	 $reg = $mat->MateriaCl16_BorraMat($eli);	 
	 if ($reg) 
			{
				print $reg;
			}
}
?>
<?php
require_once '../../Modelo/EstCl02.php';
if(isset($_GET)){
	 $eli = $_GET['ced'];
	 $est =new EstCl02();
	 $reg = $est->EstCl02_BorraEst($eli);	 
	 if ($reg) 
			{
				print $reg;
			}
}
?>
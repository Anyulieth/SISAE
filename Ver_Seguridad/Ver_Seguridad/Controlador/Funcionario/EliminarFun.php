<?php
require_once '../../Modelo/FunCl05.php';
if(isset($_GET)){
	 $eli = $_GET['ced'];
	 $fun = new FunCl05();
	 $reg = $fun->FunCl05_BorraFun($eli);	 
	 if ($reg) 
			{
				print $reg;
			}
}
?> 
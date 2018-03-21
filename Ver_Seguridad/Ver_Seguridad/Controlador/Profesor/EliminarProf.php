<?php
require_once '../../Modelo/ProfCl03.php';
if(isset($_GET)){
	 $eli = $_GET['ced'];
	 $prof =new ProfCl03();
	 $reg = $prof->ProfCl03_BorraProf($eli);	 
	 if ($reg) 
			{
				print $reg;
			}
}
?>
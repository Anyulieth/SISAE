<?php
require_once '../../Modelo/EncCl04.php';
if(isset($_GET)){
	 $eli = $_GET['ced'];
	 $enc =new EncCl04();
	 $reg = $enc->EncCl04_BorraEnc($eli);	 
	 if ($reg) 
			{
				print $reg;
			}
}
?>
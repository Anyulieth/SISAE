<?php
require_once '../../Modelo/HorarioCl27.php';
if(isset($_GET)){
	 $eli = $_GET['idH'];
	 $ho = new HorarioCl27();
	 $reg = $ho->HorarioCl27_BorraHo($eli);	 
	 if ($reg) 
			{
				print $reg;
			}
}
?>
<?php
require_once '../../Modelo/SeccionCl19.php';
if(!empty($_GET)){
			$eli = $_GET['Id_sec'];
			$sec = new SeccionCl19();
			$query = $sec->SeccionCl19_BorraSec($eli);
			 if ($query) 
			{
				print $query;
			}
}
?>
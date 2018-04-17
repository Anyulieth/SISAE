<?php
require_once '../../Modelo/BachillerCl13.php';

if (!empty($_POST)) {
	if (isset($_POST["NomB"])) {
		if ($_POST['NomB'] != "") {
			$nom = $_POST['NomB'];

			$bac = new BachillerCl13();
			$reg = $bac -> BachillerCl13_AddBac($nom);
			if ($reg) {
				print $reg;
			}
		}
	}
}
?>
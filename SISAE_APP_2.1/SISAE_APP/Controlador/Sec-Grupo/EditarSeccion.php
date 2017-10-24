<?php
include "C:/xampp/htdocs/SISAE_APP/Modelo/conexion.php";
if(!empty($_POST)){
	if(isset($_POST["id_grupo"]) &&isset($_POST["cupo"]) &&isset($_POST["num_grupo"])) {
		if($_POST["id_grupo"]!=""&&$_POST["cupo"]!="" && $_POST['num_grupo']!='') {
			
			$sql = "CALL PaSeccionTb20_ActualizarSeccion(\"$_POST[id_grupo]\",\"$_POST[cupo]\",\"$_POST[num_grupo]\")";
			$query = $con->query($sql);
			print $query;
		}
	}
}



?>
<?php

if(!empty($_GET)){
			include "C:/xampp/htdocs/SISAE_APP/Modelo/conexion.php";
			
			$query = $con->query("CALL PaSeccionTb20_Borrar_Seccion(\"$_GET[id_sec]\")");
			print $query;
}

?>
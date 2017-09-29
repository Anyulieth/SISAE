<?php

if(!empty($_GET)){
			include "conexion.php";
			
			$query = $con->query("CALL PaProfTb04_BorrarProf(\"$_GET[ced]\")");
			if(!$con){print "Fallo";}
}

?>
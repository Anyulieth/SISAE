<?php
include "../conexion.php";

if(!empty($_POST)){
	if(isset($_POST["id"]) && isset($_POST["nombre"])) 
	{
		if($_POST['id']!="" && $_POST['nombre']!="") 
		{			
			$sql = "CALL PaMateriaTb17_ActualizarMateria(\"$_POST[id]\",\"$_POST[nombre]\")";
			$query = $con->query($sql);
			if(!$query){print 'No se pudo actualizar!!';}
		}
	}
}
?>
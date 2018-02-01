<?php 
include "../../Modelo/conexion.php";
$con = new conexion();
$query = $con->query("CALL PaAsigmateriaTb19_Asignar(\"$_GET[idm]\",\"$_GET[idp]\")");
if(!$query){print 'Falló!!';} 
else{print 'Se asignó con éxito!!';}
 ?>
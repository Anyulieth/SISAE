<?php 
include "../../Modelo/conexion.php";
$con = new conexion();
$query = $con->query("CALL PaSeccionprofTb27_Asignar(\"$_GET[ids]\",\"$_GET[idp]\")");
if(!$query){print 'Falló!!';} 
else{print 'Se asignó con éxito!!';}
 ?>
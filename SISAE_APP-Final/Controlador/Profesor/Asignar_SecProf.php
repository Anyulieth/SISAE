<?php 
include "../../Modelo/conexion.php";
$con = new conexion();
$query = $con->query("CALL PaSeccionprofTb27_Asignar(\"$_GET[idGra]\",\"$_GET[idSec]\",\"$_GET[idProf]\")");
if(!$query){print 'Falló!!';} 
else{print 'Se asignó con éxito!!';}
 ?>
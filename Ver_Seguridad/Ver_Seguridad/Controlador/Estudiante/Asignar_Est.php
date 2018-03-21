<?php 
require_once '../../Modelo/conexion.php';
$con = new conexion();
$query = $con->query("CALL PaEstEncTb07_AsignarEstEn(\"$_GET[idenc]\",\"$_GET[idest]\")");
if(!$query){print 'Fallo!!';}
else{print 'Se asigno con exito!!';}
 ?>
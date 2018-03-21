<?php 
require_once '../../Modelo/conexion.php';
$con = new conexion();
$query = $con->query("CALL PaEstTb03_Matricula(\"$_GET[idEst]\",\"$_GET[idMat]\",\"$_GET[idGra]\",\"$_GET[idSec]\")");
if(!$query){print 'Falló!!';}
else{print 'Se asignó con exito!!';}
 ?>
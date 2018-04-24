<?php 
require_once '../../Modelo/conexion.php';
$idPer = $_REQUEST['idPer'];
$idEsp = $_REQUEST['idEsp'];
$idEst = $_REQUEST['idEst'];
$idGra = $_REQUEST['idGra']; 
$idSec = $_REQUEST['idSec'];
$con = new conexion();
$query = $con->query("CALL PaEstTb03_Matricula(\"$_GET[idPer]\",\"$_GET[idEsp]\",\"$_GET[idEst]\",\"$_GET[idGra]\",\"$_GET[idSec]\")");
if(!$query){print 'Falló!!';}
else{print 'Se asignó con exito!!';}
 ?>
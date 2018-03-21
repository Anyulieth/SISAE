<?php 
require_once '../../Modelo/conexion.php';
/*$idHo = $_REQUEST['idHo'];
$idPer = $_REQUEST['idPer'];
$idMat = $_REQUEST['idMat'];
$idProf = $_REQUEST['idProf'];
$idGra = $_REQUEST['idGra']; 
$idSec = $_REQUEST['idSec'];*/
$con = new conexion();
$query = $con->query("CALL PaProfTb04_Matricula(\"$_GET[idPer]\",\"$_GET[idMat]\",\"$_GET[idGra]\",\"$_GET[idSec]\",\"$_GET[idHo]\",\"$_GET[idProf]\")");
if(!$query){echo "Error";}
else{echo "exito";}
 ?>
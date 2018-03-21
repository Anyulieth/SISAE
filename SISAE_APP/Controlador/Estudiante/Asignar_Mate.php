<?php
require_once '../../Modelo/conexion.php';
$con = new conexion();
$idM = $_REQUEST['idM'];
$idEst = $_REQUEST['idEst'];
$mat = $con->query("CALL PaEstTb03_MatriculaMat(\"$_GET[idEst]\",\"$_GET[idM]\")");
?>
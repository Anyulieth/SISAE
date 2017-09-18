<?php
$host = "localhost";
$usuario = "root";
$clave = "root";
$db = "SISAE";
$conectarBD = new mysqli($host, $usuario, $clave, $db);

if ($conectarBD->connect_errno)
{
	echo "No hay conexion con la BD: (" . $conectarBD->connect_errno . ") " . $conectarBD->connect_error;
} else {
	echo "BD no existe";
}
?>
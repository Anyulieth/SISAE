<?php
 $host = "localhost";
 $usuario = "root";
 $clave = "root";
 $db = "sisae";
 $con = new mysqli($host, $usuario, $clave, $db);

 if ($con -> connect_errno)
 {
 echo "No hay conexion con la BD: (" . $con -> connect_errno . ") " . $con -> connect_error;
 }

 /*Clase conexion*/
/*class conexion {
	private $host = 'localhost';
	private $usuario = 'root';
	private $clave = 'root';
	private $db = 'sisae';

 public function conectar()
 {
 	 $con = new mysqli($host, $usuario, $clave, $db);
	 if ($con -> connect_errno)
 {
 echo "No hay conexion con la BD: (" . $con -> connect_errno . ") " . $con -> connect_error;
 }
 }*/
?>
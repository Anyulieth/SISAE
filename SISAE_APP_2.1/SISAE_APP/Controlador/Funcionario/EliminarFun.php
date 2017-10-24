
<?php
if(!empty($_GET)){
			include "C:/xampp/htdocs/SISAE_APP/Modelo/conexion.php";
			
			$result = $con->query("CALL PaFunTb06_Borrar_Func(\"$_GET[ced]\")");
			$query = $con->query($result);
			if($query!=null){
				print "<script>alert(\"Eliminado exitosamente.\");window.location='../ver.php';</script>";
			}else{
				print "<script>alert(\"No se pudo eliminar.\");window.location='../ver.php';</script>";

			}
}
?>

<?php
if(!empty($_GET)){
			include "conexion.php";
			
			$result = $con->query("CALL PaFunTb06_BorrarFunc()");
			$query = $con->query($result);
			if($query!=null){
				print "<script>alert(\"Eliminado exitosamente.\");window.location='../ver.php';</script>";
			}else{
				print "<script>alert(\"No se pudo eliminar.\");window.location='../ver.php';</script>";

			}
}
?>
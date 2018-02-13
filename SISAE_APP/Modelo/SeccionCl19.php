<?php
require_once 'conexion.php';

class SeccionCl19 extends conexion
{
	private $PInCl19_IdSeccion;
    private $PInCl17_Cupo;
    private $PInCl17_Num_Grupo;
	
	public function __construct()
	{
		$con = new conexion();
	}

	public function SeccionCl19_AddSec($PInCl17_Cupo, $PInCl17_Num_Grupo, $grado)
	{
		$con = new conexion();
		$sql = "CALL PaSeccionTb20_Guardar_Seccion('".$PInCl17_Cupo."', '".$PInCl17_Num_Grupo."', '".$grado."');";
		$add = $con->query($sql);
		if($add){
		return $add;
	    }
	}

	public function SeccionCl19_EditSec($PStCl19_IdSeccion,$PInCl17_Cupo,$PInCl19_Num_grupo)
	{
		$con = new conexion();
		$sql = "CALL PaSeccionTb20_ActualizarSeccion('".$PStCl19_IdSeccion."','".$PInCl17_Cupo."','".$PInCl19_Num_grupo."');";
		$edit = $con->query($sql);
		return $edit;
	}

 	public function SeccionCl19_BorraSec($PStCl19_IdSeccion)
	{
		$con = new conexion();
		$sql = "CALL PaSeccionTb20_Borrar_Seccion('".$PStCl19_IdSeccion."');";
		$r = $con->query($sql);
		if($r)
		{
		 return $r;
		}
	}

	public function SeccionCl19_BuscaSec($PStCl19_IdSeccion)
	{
		$con = new conexion();
		$sql = "CALL PaSeccionTb20_BuscarSeccionD('".$PStCl19_IdSeccion."');";
		$result = $con->query($sql);
		$r = $result->fetch_all(MYSQLI_ASSOC);
		if ($r) 
		{
		 return $r;
		}
	}

	public function SeccionCl19_ListaSec($inicio,$por_pagina)
	{
		$con = new conexion();
		$sql = "CALL PaSeccionTb20_Listar($inicio,$por_pagina);";
		$result = $con->query($sql);
		return $result;
	}

	public function SeccionCl19_ListaTodo()
	{
		$con = new conexion();
		$sql = "CALL PaSeccionTb20_Listar_Todos();";
		$result = $con->query($sql);
		return $result;
	}
	
	public function SeccionCl19_Cantidad()
	{
		$con = new conexion();
 	$consulta = $con -> query("select count(*) as cantidad from SeccionTb20");
	$cant = $consulta -> fetch_array();
	return $cant["cantidad"];
 	}

 	public function SeccionCl19_AsignaSec($prof,$sec)
 	{
 		$con = new conexion();
 		$sql = "CALL PaProfTb04_Asigna_SecProf('".$prof."','".$sec."')";
 		$result = $con->query($sql);
 		if($result){
		return $result;
	    }
 	}

 	public function SeccionCl19_Asignacion()
	{
		$con = new conexion();
		$sql = "CALL PaProfTb04_Listar_Asigna();";
		$result = $con->query($sql);
		return $result;
	}
	
	public function SeccionCl19_ListaNumSec()
	{
		$con = new conexion();
		$sql = "CALL PaSeccionTb20_ListaNumSec();";
		$result = $con->query($sql);
		return $result;
	}
	
	public function SeccionCl19_ListaEstSec($gra,$sec)
	{
		$con = new conexion();
		$sql = "CALL PaEstTb03_VerPorSeccion('".$gra."','".$sec."');";
		$result = $con->query($sql);
		return $result;
	}
	
	public function SeccionCl19_BuscaSecCompleta($PStCl19_NumGrado,$PStCl19_NumSeccion)
	{
		$con = new conexion();
		$sql = "CALL PaSeccionTb20_BuscarSecCompleta('".$PStCl19_NumGrado."','".$PStCl19_NumSeccion."');";
		$result = $con->query($sql);
		$r = $result->fetch_all(MYSQLI_ASSOC);
		if ($r) 
		{
		 return $r;
		}
	}
}
?>
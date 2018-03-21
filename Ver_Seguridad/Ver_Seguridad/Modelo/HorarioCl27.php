<?php
require_once 'conexion.php';

class HorarioCl27 extends conexion
{
	private $PInHorariosTb29_IdHorario;
	private $PStHorariosTb29_Dia;
	private $PTmHorariosTb29_Hora_Inicio;
	private $PTmHorariosTb29_Hora_Final;
	
	public function __construct()
	{
		$con = new conexion();
	}	

	public function HorarioCl27_AddHo()
	{
		$con = new conexion();
		$sql = "CALL PaEstTb03_GuardarEst('".$PStCl03_IdEst."','".$PDtCl03_FechaNac."','".$PStCl03_Adecuacion."',
		'".$PStCl03_Estado."','".$PStCl03_IdEspecialidad."','".$PStCl01_Nombre."','".$PStCl01_Apellido1."',
		'".$PStCl01_Apellido2."','".$PStCl01_Direccion."','".$PCrCl01_Sexo."','".$PStCl01_Telefono."','".$PStCl01_Email."');";
		$add = $con->query($sql);
		if($add){
		return $add;
	    }
	}

	public function HorarioCl27_EditEHo()
	{
		$con = new conexion();
		$sql = "CALL PaEstTb03_ActualizarEst('".$PStCl03_IdEst."','".$PDtCl03_FechaNac."','".$PStCl03_IdEspecialidad."','".$PStCl01_Nombre."','".$PStCl01_Apellido1."','".$PStCl01_Apellido2."','".$PStCl01_Direccion."','".$PStCl01_Telefono."','".$PStCl01_Email."';);";
		$edit = $con->query($sql);
		return $edit;
	}
	
	public function HorarioCl27_BorraHo($PStCl03_IdEst)
	{
		$con = new conexion();
		$sql = "CALL PaEstTb03_BorrarEst('".$PStCl03_IdEst."');";
		$r = $con->query($sql);
		if($r)
		{
		 return $r;
		}
	}

	public function HorarioCl27_BuscaHo($PStCl03_IdEst)
	{
		$con = new conexion();
		$sql = "CALL PaEstTb03_BuscarEstD('".$PStCl03_IdEst."');";
		$result = $con->query($sql);
		$r = $result->fetch_all(MYSQLI_ASSOC);
		if ($r) 
		{
		 return $r;
		}
	}
	
	public function HorarioCl27_ListaHo($inicio,$por_pagina)
	{
		$con = new conexion();
		$sql = "CALL PaEstTb03_Listar($inicio,$por_pagina);";
		$result = $con->query($sql);
		return $result;
	}

	function HorarioCl27_cantidad() 
	{
		$con = new conexion();
		$consulta = $con -> query("select count(*) as cantidad from HorarioSTb29");
		$cant = $consulta -> fetch_array();
		return $cant["cantidad"];
	}
}
?>
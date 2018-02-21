<?php
require_once 'conexion.php';

class EspecialidadCl15 extends conexion
{
	private $PStCl15_IdEspecialidad;
	private $PStCl15_Nombre;
    private  $PInCl15_Cupo;
	
	public function __construct()
	{
		$con = new conexion();
	}	
	
	public function setPStCl15_IdEspecialidad($IdE)
	{
		$this->PStCl15_IdEspecialidad = $IdE;
	}
	public function getPStCl15_IdEspecialidad()
	{
		return $this->PStCl15_IdEspecialidad;
	}
	
	public function setPStCl15_Nombre($Nom)
	{
		$this->PStCl15_Nombre = $Nom;
	}
	public function getPStCl15_Nombre()
	{
		return $this->PStCl15_Nombre;
	}
	
	public function setPInCl15_Cupo($Cupo)
	{
		$this->PInCl15_Cupo = $Cupo;
	}
	public function getPInCl15_Cupo()
	{
		return $this->PInCl15_Cupo;
	}

	
	public function EspecialidadCl15_AddEsp($PStCl15_Nombre,$PInCl15_Cupo)
	{
		$con = new conexion();
		$sql = "CALL PaEspecialidadTb16_GuardarEspecialidad('".$PStCl15_Nombre."','".$PInCl15_Cupo."');";
		$add = $con->query($sql);
		$r= $add->execute();

		if($r)
		{
		 print $r;
		}
	}
	
	public function EspecialidadCl15_EditEsp($PInCl15_IdEspecialidad,$PStCl15_Nombre,$PInCl15_Cupo)
	{
		$con = new conexion();
		$sql = "CALL PaEspecialidadTb16_ActualizarEspecialidad('".$PInCl15_IdEspecialidad."',
		'".$PStCl15_Nombre."','".$PInCl15_Cupo."');";
		$edit = $con->query($sql);
		return $edit;
	}

	public function EspecialidadCl15_BorraEsp($PStCl15_IdEspecialidad)
	{
		$con = new conexion();
		$sql = "CALL PaEspecialidadTb16_EliminarEspecialidad('".$PStCl15_IdEspecialidad."');";
		$r = $con->query($sql);
		if($r)
		{
		 return $r;
		}
	}
	
	public function EspecialidadCl15_BuscaEsp($PStCl15_IdEspecialidad)
	{
		$con = new conexion();
		$sql = "CALL PaEspecialidadTb16_BuscarEspecialidadD('".$PStCl15_IdEspecialidad."');";
		$result = $con->query($sql);
		$r = $result->fetch_all(MYSQLI_ASSOC);
		if ($r) 
		{
		 return $r;
		}
	}

	public function EspecialidadCl15_Busca($PStCl15_IdEspecialidad)
	{
		$con = new conexion();
		$sql = "CALL PaEspecialidadTb16_BuscarEspecialidad('".$PStCl15_IdEspecialidad."');";
		$result = $con->query($sql);
		$r = $result->fetch_all(MYSQLI_ASSOC);
		if ($r) 
		{
		 return $r;
		}
	}

	public function EspecialidadCl15_ListaEsp($inicio,$por_pagina)
	{
		$con = new conexion(); 
		$sql = "CALL PaEspecialidadTb16_Listar($inicio,$por_pagina);";
		$result = $con->query($sql);
		return $result;
	}

	public function EspecialidadCl15_ListaTodo()
	{
		$con = new conexion();
		$sql = "CALL PaEspecialidadTb16_Listar_Todos();";
		$result = $con->query($sql);
		return $result;
	} 

	function EspecialidadCl15_Cantidad()
	{
		$con = new conexion();
		$consulta = $con -> query("select count(*) as cantidad from EspecialidadTb16");
		$cant = $consulta -> fetch_array();
		return $cant["cantidad"];
	}
}

?>
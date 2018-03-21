<?php
require_once 'conexion.php';
require_once 'UsuCl01.php';

class EstCl02 extends UsuCl01
{
	private $PStCl03_IdEst;
	private $PDtCl03_FechaNac;
	private $PStCl03_Adecuacion;
	private $PStCl03_Estado;
	private $PStCl03_IdEspecialidad;
	
	public function __construct()
	{
		$con = new conexion();
	}	
	
	public function setPStCl03_IdEst($IdEst)
	{
		$this->PStCl03_IdEst = $IdEst;
	}
	public function getPStCl03_IdEst()
	{
		return $this->PStCl03_IdEst;
	}
	
	public function setPDtCl03_FechaNac($FeN)
	{
		$this->PDtCl03_FechaNac = $FeN;
	}
	public function getPDtCl03_FechaNac()
	{
		return $this->PDtCl03_FechaNac;
	}
	
	public function setPStCl03_Adecuacion($Ad)
	{
		$this->PStCl03_Adecuacion = $Ad;
	}
	public function getPStCl03_Adecuacion()
	{
		return $this->PStCl03_Adecuacion;
	}
	
	public function setPStCl03_Estado($Est)
	{
		$this->PStCl03_Estado = $Est;
	}
	public function getPStCl03_Estado()
	{
		return $this->PStCl03_Estado;
	}
	
	public function setPStCl03_IdEspecialidad($IdEs)
	{
		$this->PStCl03_IdEspecialidad = $IdEs;
	}
	public function getPStCl03_IdEspecialidad()
	{
		return $this->PStCl03_IdEspecialidad;
	}

	public function EstCl02_AddEst($PStCl03_IdEst,$PDtCl03_FechaNac,$PStCl03_Adecuacion,$PStCl03_Estado,$PStCl03_IdEspecialidad,
		$PStCl01_Nombre,$PStCl01_Apellido1,$PStCl01_Apellido2,$PStCl01_Direccion,$PCrCl01_Sexo,$PStCl01_Telefono,$PStCl01_Email)
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

	public function EstCl02_EditEst($PStCl03_IdEst,$PDtCl03_FechaNac,$PStCl03_IdEspecialidad,$PStCl01_Nombre,$PStCl01_Apellido1,
		$PStCl01_Apellido2,$PStCl01_Direccion,$PStCl01_Telefono,$PStCl01_Email)
	{
		$con = new conexion();
		$sql = "CALL PaEstTb03_ActualizarEst('".$PStCl03_IdEst."','".$PDtCl03_FechaNac."','".$PStCl03_IdEspecialidad."','".$PStCl01_Nombre."','".$PStCl01_Apellido1."','".$PStCl01_Apellido2."','".$PStCl01_Direccion."','".$PStCl01_Telefono."','".$PStCl01_Email."';);";
		$edit = $con->query($sql);
		return $edit;
	}
	
	public function EstCl02_BorraEst($PStCl03_IdEst)
	{
		$con = new conexion();
		$sql = "CALL PaEstTb03_BorrarEst('".$PStCl03_IdEst."');";
		$r = $con->query($sql);
		if($r)
		{
		 return $r;
		}
	}

	public function EstCl02_BuscaEst($PStCl03_IdEst)
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
	
	public function EstCl02_ListaEst($inicio,$por_pagina)
	{
		$con = new conexion();
		$sql = "CALL PaEstTb03_Listar($inicio,$por_pagina);";
		$result = $con->query($sql);
		return $result;
	}

	public function EstCl02_ListaEstu()
	{
		$con = new conexion();
		$sql = "CALL PaEstTb03_ListarActivos();";
		$result = $con->query($sql);
		return $result;
	}

	function EstCl02_cantidad() 
	{
		$con = new conexion();
		$consulta = $con -> query("select count(*) as cantidad from EstTb03");
		$cant = $consulta -> fetch_array();
		return $cant["cantidad"];
	}

	function EstCl02_ListaAsignacion() 
	{
		$con = new conexion();
		$sql = "CALL PaEncTb05_ListarAsigna();";
		$result = $con->query($sql);
		return $result;
	}

	public function EstCl02_InfoEst($PStCl03_IdEst)
	{
		$con = new conexion();
		$sql = "CALL PaEstTb03_Info('".$PStCl03_IdEst."');";
		$result = $con->query($sql);
		$r = $result->fetch_all(MYSQLI_ASSOC);
		if ($r) 
		{
		 return $r;
		}
	}
}
?>
<?php
require_once 'conexion.php';

class GradoCl12 extends conexion
{
	private $PInCl12_IdGrado;
    private $PStCl12_NombreGrado;
    private $PStCl12_IdBachiller;
	 
	public function __construct()
	{
		$con = new conexion();
	}	

	public function setPInCl12_IdGrado($IdG)
	{
		$this->PInCl12_IdGrado = $IdG;
	}
	public function getPInCl12_IdGrado()
	{
		return $this->PInCl12_IdGrado;
	}
	
	public function setPStCl12_NombreGrado($NomG)
	{
		$this->PStCl12_NombreGrado = $NomG;
	}
	public function getPStCl12_NombreGrado()
	{
		return $this->PStCl12_NombreGrado;
	}
	
	public function setPStCl12_IdBachiller($IdB)
	{
		$this->PStCl12_IdBachiller = $IdB;
	}
	public function getPStCl12_IdBachiller()
	{
		return $this->PStCl12_IdBachiller;
	}

	public function GradoCl12_AddGra($PStCl12_NombreGrado,$PStCl12_IdBachiller)
	{
		$con = new conexion();
		$sql = "CALL PaGradoTb13_GuardarGrado('".$PStCl12_NombreGrado."','".$PStCl12_IdBachiller."');";
		$add = $con->query($sql);
		if($add){
		return $add;
	    }
	}
	
	public function GradoCl12_EditGra($PInCl12_IdGrado,$PStCl12_NombreGrado,$PStCl12_IdBachiller)
	{
		$con = new conexion();
		$sql = "CALL PaGradoTb13_ActualizarGrado('".$PInCl12_IdGrado."','".$PStCl12_NombreGrado."','".$PStCl12_IdBachiller."');";
		$edit = $con->query($sql);
		return $edit;
	}
	
	public function GradoCl12_BorraGra($PInCl12_IdGrado)
	{
		$con = new conexion();
		$sql = "CALL PaGradoTb13_BorrarGrado('".$PInCl12_IdGrado."');";
		$r = $con->query($sql);
		if($r)
		{
		 return $r;
		}
	}
	
	public function GradoCl12_BuscaGraD($PInCl12_IdGrado)
	{
		$con = new conexion();
		$sql = "CALL PaGradoTb13_BuscarGradoD('".$PInCl12_IdGrado."');";
		$result = $con->query($sql);
		$r = 	$result->	fetch_all(MYSQLI_ASSOC);
		if ($r) 
		{
		 return $r;
		}
	}
	
	public function GradoCl12_ListaGra($inicio,$por_pagina)
	{
		$con = new conexion();
		$sql = "CALL PaGradoTb13_Listar($inicio,$por_pagina);";
		$result = $con->query($sql);
		return $result;
	}

	public function GradoCl12_ListaTodo()
	{
		$con = new conexion();
		$sql = "CALL PaGradoTb13_Listar_Todo();";
		$result = $con->query($sql);
		return $result;
	}
	
	public function GradoCl12_Cantidad()
	{
	$con = new conexion();
 	$consulta = $con -> query("select count(*) as cantidad from GradoTb13");
	$cant = $consulta -> fetch_array();
	return $cant["cantidad"];
 	}

 	public function GradoCl12_Prof($PStProfCl03_IdProfesor)
	{
		$con = new conexion();
		$sql = "CALL PaGradoTb13_Prof('".$PStProfCl03_IdProfesor."');";
		$result = $con->query($sql);
		return $result;
	}
}
?>
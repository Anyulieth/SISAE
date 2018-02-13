<?php
require_once 'conexion.php';

class MateriaCl16 extends conexion
{ 
	private $PInCl16_IdMateria;
    private $PStCl16_Nombre;
	
	public function __construct()
	{
		$con = new conexion();
	}	
	
	public function setPInCl16_IdMateria($IdM)
	{
		$this->PInCl16_IdMateria = $IdM;
	}
	public function getPInCl16_IdMateria()
	{
		return $this->PInCl16_IdMateria;
	}
	
	public function setPStCl16_Nombre($Nom)
	{
		$this->PStCl16_Nombre = $Nom;
	}
	public function getPStCl16_Nombre()
	{
		return $this->PStCl16_Nombre;
	}

	public function MateriaCl16_AddMat($PStCl16_Nombre)
	{
		$con = new conexion();
		$sql = "CALL PaMateriaTb17_GuardarMateria('".$PStCl16_Nombre."');";
		$add = $con->query($sql);
		if($add){
		return $add;
	    }
	}

	public function MateriaCl16_EditMat($PInCl16_IdMateria,$PStCl16_Nombre)
	{
		$con = new conexion();
		$sql = "CALL PaMateriaTb17_ActualizarMateria('".$PInCl16_IdMateria."','".$PStCl16_Nombre."');";
		$edit = $con->query($sql);
		if($edit){
		return $edit;
		}
	}

	public function MateriaCl16_BorraMat($PInCl16_IdMateria)
	{
		$con = new conexion();
		$sql = "CALL PaMateriaTb17_EliminarMateria('".$PInCl16_IdMateria."');";
		$r = $con->query($sql);
		if($r)
		{
		 return $r;
		}
	}

	public function MateriaCl16_BuscaMat($PInCl16_IdMateria)
	{
		$con = new conexion();
		$sql = "CALL PaMateriaTb17_BuscarMateriaD('".$PInCl16_IdMateria."');";
		$result = $con->query($sql);
		$r = 	$result->	fetch_all(MYSQLI_ASSOC);
		if ($r) 
		{
		 return $r;
		}
	}
	
	public function MateriaCl16_ListaMat($inicio,$por_pagina)
	{
		$con = new conexion();
		$sql = "CALL PaMateriaTb17_Listar($inicio,$por_pagina);";
		$result = $con->query($sql);
		return $result;
	}

	public function MateriaCl16_ListaTodo()
	{
		$con = new conexion();
		$sql = "CALL PaMateriaTb17_Listar_Todos();";
		$result = $con->query($sql);
		return $result;
	}
	
	public function MateriaCl16_Cantidad()
	{
	$con = new conexion();
 	$consulta = $con -> query("select count(*) as cantidad from MateriaTb17");
	$cant = $consulta -> fetch_array();
	return $cant["cantidad"];
 	}

	public function MateriaCl16_ListaAsignacion()
	{
		$con = new conexion();
		$sql = "CALL PaMateriaTb17_ListarA();";
		$result = $con->query($sql);
		return $result;
	}
	
	public function MateriaCl16_Asignacion()
	{
		$con = new conexion();
		$sql = "CALL PaMateriaTb17_Listar_Asigna();";
		$result = $con->query($sql);
		return $result;
	}
}
?>
<?php
require_once 'conexion.php';
require_once 'UsuCl01.php';

class EncCl04 extends UsuCl01
{
	private $PStEncCl04_IdEncargado;
	private $PStEncCl04_Clave;

	public function __construct()
	{
		$con = new conexion();
	}	

	public function setPStCPStEncCl04_IdEncargado($id)
	{
		$this->PStEncCl04_IdEncargado = ucfirst(strtolower($id));//Pone en minuscula
	}

	public function getPStEncCl04_IdEncargado()
	{
		return $this->PStEncCl04_IdEncargado;
	}

	public function setPStEncCl04_Clave($PStEncCl04_Clave)
	{
			$this->PStEncCl04_Clave = ucfirst(strtolower($PStEncCl04_Clave));
	}

	public function getPStEncCl04_Clave()
	{
		return $this->PStEncCl04_Clave;
	}
	
	public function EncCl04_AddEnc($PStEncCl04_IdEncargado,$PStCl01_Nombre,$PStCl01_Apellido1,
		$PStCl01_Apellido2,$PStCl01_Direccion,$PCrCl01_Sexo,$PStCl01_Telefono,
		$PStCl01_Email,$PStEncCl04_Clave)
	{
		$con = new conexion();
		$sql = "CALL PaEncTb05_GuardarEnc('".$PStEncCl04_IdEncargado."','".$PStCl01_Nombre."','".$PStCl01_Apellido1."',
		'".$PStCl01_Apellido2."','".$PStCl01_Direccion."','".$PCrCl01_Sexo."','".$PStCl01_Telefono."',
		'".$PStCl01_Email."','".$PStEncCl04_Clave."');";
		$add = $con->query($sql);
		if($add){
		return $add;
	    }
	}
	
	public function EncCl04_EditEnc($PStEncCl04_IdEncargado,$PStCl01_Nombre,$PStCl01_Apellido1,
		$PStCl01_Apellido2,$PStCl01_Direccion,$PStCl01_Telefono,
		$PStCl01_Email)
	{
		$con = new conexion();
		$sql = "CALL PaEncTb05_ActualizarEnc('".$PStEncCl04_IdEncargado."','".$PStCl01_Nombre."','".$PStCl01_Apellido1."',
		'".$PStCl01_Apellido2."','".$PStCl01_Direccion."','".$PStCl01_Telefono."',
		'".$PStCl01_Email."');";
		$edit = $con->query($sql);
		if($edit){
		return $edit;
		}
	}
	
	public function EncCl04_BorraEnc($PStEncCl04_IdEncargado)
	{
		$con = new conexion();
		$sql = "CALL PaEncTb05_EliminarEnc('".$PStEncCl04_IdEncargado."');";
		$r = $con->query($sql);
		if($r)
		{
		 return $r;
		}
	}
	
	public function EncCl04_BuscaEnc($PStEncCl04_IdEncargado)
	{
		$con = new conexion();
		$sql = "CALL PaEncTb05_BuscarEncD('".$PStEncCl04_IdEncargado."');";
		$result = $con->query($sql);
		$r = 	$result->	fetch_all(MYSQLI_ASSOC);
		if ($r) 
		{
		 return $r;
		}
	}
	
	public function EncCl04_ListaEnc()
	{
		$con = new conexion();
		$sql = "CALL PaEncTb05_ListarA();";
		$result = $con->query($sql);
		return $result;
	}
	
	public function EncCl04_Cantidad()
	{
	$con = new conexion();
 	$consulta = $con -> query("select count(*) as cantidad from EncTb05");
	$cant = $consulta -> fetch_array();
	return $cant["cantidad"];
 	}

	public function EncCl04_ListaEst($PStEncCl04_IdEncargado)
	{
		$con = new conexion();
		$sql = "CALL PaEstEncTb07_Ver($PStEncCl04_IdEncargado);";
		$result = $con->query($sql);
		return $result;
	}
} 
?>
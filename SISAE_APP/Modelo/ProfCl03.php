<?php
require_once 'conexion.php';
require_once 'UsuCl01.php';

class ProfCl03 extends UsuCl01
{
	private $PStCl03_IdProfesor;
	private $PStCl03_Clave;
	private $PStCl03_FechaNac;  
	private $PStCl03_Estado;
	
	public function __construct()
	{
		$con = new conexion();
	}
	
	public function setPStCl03_IdProfesor($IdP)
	{
		$this->PStCl03_IdProfesor = $IdP;
	}
	public function getPStCl03_IdProfesor()
	{
		return $this->PStCl03_IdProfesor;
	}
	
	public function setPStCl03_Clave($Cla)
	{
		$this->PStCl03_Clave = $Cla;
	}
	public function getPStCl03_Clave()
	{
		return $this->PStCl03_Clave;
	}
	
	public function setPStCl03_FechaNac($FeN)
	{
		$this->PStCl03_FechaNac = $FeN;
	}
	public function getPStCl03_FechaNac()
	{
		return $this->PStCl03_FechaNac;
	}
	
	public function setPStCl03_Estado($Est)
	{
		$this->PStCl03_Estado = $Est;
	}
	public function getPStCl03_Estado()
	{
		return $this->PStCl03_Estado;
	}

	public function ProfCl03_AddProf($PStProfCl03_IdProfesor,$PStCl03_FechaNac,$PStProfCl03_Clave,$PStCl03_Estado,$PStCl01_Nombre,$PStCl01_Apellido1,
		$PStCl01_Apellido2,$PStCl01_Direccion,$PCrCl01_Sexo,$PStCl01_Telefono,$PStCl01_Email)
	{
		$con = new conexion();
		$sql = "CALL PaProfTb04_GuardarProf('".$PStProfCl03_IdProfesor."','".$PStCl03_FechaNac."','".$PStProfCl03_Clave."','".$PStCl03_Estado."',
		'".$PStCl01_Nombre."','".$PStCl01_Apellido1."','".$PStCl01_Apellido2."','".$PStCl01_Direccion."','".$PCrCl01_Sexo."','".$PStCl01_Telefono."',
		'".$PStCl01_Email."');";
		$add = $con->query($sql);
		if($add){
		return $add;
	    }
	}

	public function ProfCl03_EditProf($PStProfCl03_IdProfesor,$PStProfCl03_FechaNac,$PStProfCl03_Clave,$PStCl01_Nombre,$PStCl01_Apellido1,$PStCl01_Apellido2,$PStCl01_Direccion,$PStCl01_Telefono, $PStCl01_Email)
	{
		$con = new conexion();
		$sql = "CALL PaProfTb04_ActualizarProf('".$PStProfCl03_IdProfesor."','".$PStProfCl03_FechaNac."','".$PStProfCl03_Clave."','".$PStCl01_Nombre."','".$PStCl01_Apellido1."',
		'".$PStCl01_Apellido2."','".$PStCl01_Direccion."','".$PStCl01_Telefono."',
		'".$PStCl01_Email."');";
		$edit = $con->query($sql);
		return $edit;
	}

	public function ProfCl03_BorraProf($PStProfCl03_IdProfesor)
	{
		$con = new conexion();
		$sql = "CALL PaProfTb04_BorrarProf('".$PStProfCl03_IdProfesor."');";
		$r = $con->query($sql);
		if($r)
		{
		 return $r;
		}
	}

	public function ProfCl03_BuscaProf($PStProfCl03_IdProfesor)
	{
		$con = new conexion();
		$sql = "CALL PaProfTb04_BuscarProfD('".$PStProfCl03_IdProfesor."');";
		$result = $con->query($sql);
		$r = $result->fetch_all(MYSQLI_ASSOC);
		if ($r) 
		{
		 return $r;
		}
	}

	public function ProfCl03_ListaProf($inicio,$por_pagina)
	{
		$con = new conexion();
		$sql = "CALL PaProfTb04_Listar($inicio,$por_pagina);";
		$result = $con->query($sql);
		return $result;
	}

	public function ProfCl03_Cantidad()
	{
		$con = new conexion();
 		$consulta = $con -> query("select count(*) as cantidad from ProfTb04");
		$cant = $consulta -> fetch_array();
		return $cant["cantidad"];
 	} 

 	public function ProfCl03_ListaMatProf($PStProfCl03_IdProfesor)
	{
		$con = new conexion();
		$sql = "CALL PaProfTb04_ListarMatProf($PStProfCl03_IdProfesor);";
		$result = $con->query($sql);
		return $result;
	}

	public function ProfCl03_ListaProfs()
	{
		$con = new conexion();
		$sql = "CALL PaProfTb04_Listar_Asigna();";
		$result = $con->query($sql);
		return $result;
	}

	public function ProfCl03_InfoProf($PStProfCl03_IdProfesor)
	{
		$con = new conexion();
		$sql = "CALL PaProfTb04_Info('".$PStProfCl03_IdProfesor."');";
		$result = $con->query($sql);
		$r = $result->fetch_all(MYSQLI_ASSOC);
		if ($r) 
		{
		 return $r;
		}
	}

	public function ProfCl03_SecProf($PStProfCl03_IdProfesor, $idGra)
	{
		$con = new conexion();
		$sql = "CALL PaProfTb04_ListarSecProf('".$PStProfCl03_IdProfesor."','".$idGra."');";
		$result = $con->query($sql);
		return $result;
	}

	public function ProfCl03_ListaMatri($PStProfCl03_IdProfesor)
	{
		$con = new conexion();
		$sql = "CALL PaProfTb04_ListarMatri('".$PStProfCl03_IdProfesor."');";
		$result = $con->query($sql);
		$r = $result->fetch_all(MYSQLI_ASSOC);
		if ($r) 
		{
		 return $r;
		}
	}
}
?>
<?php
include "../Controlador/conexion.php";
include "../Modelo/UsuCl01.php";

class EncCl04 extends UsuCl01
{
	private $PStEncCl04_IdEncargado;
	private $PStEncCl04_Clave;
	
	public function EncCl04($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema,
	$IdEnc, $Cla)
	{		
		parent::UsuCl01($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema);
		$this->PStEncCl04_IdEncargado = $IdEnc;
		$this->PStEncCl04_Clave = $Cla; 
	}
	
	/*public function __construct($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema,
	$IdEnc, $Cla)
	{
		parent::UsuCl01($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema);
		$this->PStEncCl04_IdEncargado = $IdEnc;
		$this->PStEncCl04_Clave = $Cla; 		
	}	*/

	public function setPStEncCl04_IdEncargado($IdEnc)
	{
		$this->PStEncCl04_IdEncargado = $IdEnc;
	}
	public function getPStEncCl04_IdEncargado()
	{
		return $this->PStEncCl04_IdEncargado;
	}
	
	public function setPStEncCl04_Clave($Cla)
	{
		$this->PStEncCl04_Clave = $Cla;
	}
	public function getPStEncCl04_Clave()
	{
		return $this->PStEncCl04_Clave;
	}
	
	public function AddEnc()
	{
		 /*Con Clase conexion*/				
		/*$conectar = new conexion();
		$this->PStEncCl04_IdEncargado = $_POST['Cedula'];
		$this->$PStCL01_Nombre = $_POST['Nombre'];
		$this->PStCL01_Apellido1 = $_POST['Apellido1'];
		$this->PStCL01_Apellido2 = $_POST['Apellido2'];
		$this->PStCL01_Direccion = $_POST['Direccion'];
		$this->PCrCL01_Sexo = $_POST['Genero'];
		$this->PStCL01_Telefono = $_POST['Telefono'];
		$this->PStCL01_Email = $_POST['Email'];
		$this->PStEncCl04_Clave = $_POST['Clave'];
		$sql = "CALL PaEncTb05_GuardarEnc($this->PStEncCl04_IdEncargado,$this->$PStCL01_Nombre,$this->PStCL01_Apellido1,
		$this->PStCL01_Apellido2,$this->PStCL01_Direccion,$this->PCrCL01_Sexo,
		$this->PStCL01_Telefono,$this->PStCL01_Email ,$this->PStEncCl04_Clave);";
		$conectar->query($sql);*/	

		$sql = "CALL PaEncTb05_GuardarEnc()";
		$r = $con->query($sql);
		$r->bind_param('sssssssss',$this->PStEncCl04_IdEncargado,$this->$PStCL01_Nombre,$this->PStCL01_Apellido1,
		$this->PStCL01_Apellido2,$this->PStCL01_Direccion,$this->PCrCL01_Sexo,
		$this->PStCL01_Telefono,$this->PStCL01_Email ,$this->PStEncCl04_Clave);
		$r->execute();
	}
	
	public function EditEnc()
	{
		$sql = "CALL PaEncTb05_ActualizarEnc($this->PStEncCl04_IdEncargado,$this->$PStCL01_Nombre,$this->PStCL01_Apellido1,
		$this->PStCL01_Apellido2,$this->PStCL01_Direccion,$this->PCrCL01_Sexo,
		$this->PStCL01_Telefono,$this->PStCL01_Email ,$this->PStEncCl04_Clave)";
		$con->query($sql);
	}
	
	public function BorraEnc()
	{
		$sql = "CALL PaEncTb05_EliminarEnc($this->PStEncCl04_IdEncargado)";
		$con->query($sql);
	}
	
	public function BuscaEnc()
	{
		$sql = "CALL PaEncTb05_BuscarEnc($this->PStEncCl04_IdEncargado)";
		$con->query($sql);
	}
	
	public function ListaEnc()
	{
		$sql = "CALL PaEncTb05_Listar()";
		$r = $con->query($sql);
	}
} 
?>
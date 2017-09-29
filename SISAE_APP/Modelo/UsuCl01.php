<?php
include "../Controlador/conexion.php";

class UsuCl01 
{
	protected $PStCl01_Cedula;
	protected $PStCL01_Nombre;
	protected $PStCL01_Apellido1;
	protected $PStCL01_Apellido2;
	protected $PStCL01_Direccion;
	protected $PCrCL01_Sexo;
	protected $PStCL01_Telefono;
	protected $PStCL01_Email;

	function __construct($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema)
	{
		$this->PStCl01_Cedula = $ced;
		$this->PStCL01_Nombre = $Nom;
		$this->PStCL01_Apellido1 = $Ap1;
		$this->PStCL01_Apellido2 = $Ap2;
		$this->PStCL01_Direccion = $Dir;
		$this->PCrCL01_Sexo = $Sex;
		$this->PStCL01_Telefono = $Tel;
		$this->PStCL01_Email = $Ema;
	}
	function __construct(){}
	
	public function setPStCL01_Cedula($Ced)
	{
		$this->PStCl01_Cedula = $Ced;
	}
	public function getPStCL01_Cedula()
	{
		return $this->PStCl01_Cedula;	 
	}
	
	public function setPStCL01_Nombre($Nom)
	{
		$this->PStCL01_Nombre = $Nom;
	}
	public function getPStCL01_Nombre()
	{
		return $this->PStCL01_Nombre;
	}
	
	public function setPStCL01_Apellido1($Ap1)
	{
		$this->PStCL01_Apellido1 = $Ap1;
	}
	public function getPStCL01_Apellido1()
	{
		return $this->PStCL01_Apellido1;
	}
	
	public function setPStCL01_Apellido2($Ap2)
	{
		$this->PStCL01_Apellido2 = $Ap2;
	}
	public function getPStCL01_Apellido2()
	{
		return $this->PStCL01_Apellido2;
	}
	
	public function setPStCL01_Direccion($Dir)
	{
		$this->PStCL01_Direccion = $Dir;
	}
	public function getPStCL01_Direccion()
	{
		return $this->PStCL01_Direccion;
	}
	
	public function setPCrCL01_Sexo($Sex)
	{
		$this->PCrCL01_Sexo = $Sex;
	}
	public function getPCrCL01_Sexo()
	{
		return $this->PCrCL01_Sexo;
	}
	
	public function setPStCL01_Telefono($Tel)
	{
		$this->PStCL01_Telefono = $Tel;
	}
	public function getPStCL01_Telefono()
	{
		return $this->PStCL01_Telefono;
	}
	
	public function setPStCL01_Email($Ema)
	{
		$this->PStCL01_Email = $Ema;
	}
	public function getPStCL01_Email()
	{
		return $this->PStCL01_Email;
	}
}
?>
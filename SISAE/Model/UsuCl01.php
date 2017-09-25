<?php
include 'Conexion.php';

class UsuCl01 
{
	protected $PStCl01_Cedula;
	protected $PStCl01_Nombre;
	protected $PStCl01_Apellido1;
	protected $PStCl01_Apellido2;
	protected $PStCl01_Direccion;
	protected $PCrCl01_Sexo;
	protected $PStCl01_Telefono;
	protected $PStCl01_Email;

	public function UsuCl01($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema)
	{
		$this->PStCl01_Cedula = $ced;
		$this->PStCl01_Nombre = $Nom;
		$this->PStCl01_Apellido1 = $Ap1;
		$this->PStCl01_Apellido2 = $Ap2;
		$this->PStCl01_Direccion = $Dir;
		$this->PCrCl01_Sexo = $Sex;
		$this->PStCl01_Telefono = $Tel;
		$this->PStCl01_Email = $Ema;
	}
	public function UsuCl01()
	{
	}
	
	public function setPStCl01_Cedula($Ced)
	{
		$this->PStCl01_Cedula = $Ced;
	}
	public function getPStCl01_Cedula()
	{
		return $this->PStCl01_Cedula;	 
	}
	
	public function setPStCl01_Nombre($Nom)
	{
		$this->PStCl01_Nombre = $Nom;
	}
	public function getPStCl01_Nombre()
	{
		return $this->PStCl01_Nombre;
	}
	
	public function setPStCl01_Apellido1($Ap1)
	{
		$this->PStCl01_Apellido1 = $Ap1;
	}
	public function getPStCl01_Apellido1()
	{
		return $this->PStCl01_Apellido1;
	}
	
	public function setPStCl01_Apellido2($Ap2)
	{
		$this->PStCl01_Apellido2 = $Ap2;
	}
	public function getPStCl01_Apellido2()
	{
		return $this->PStCl01_Apellido2;
	}
	
	public function setPStCl01_Direccion($Dir)
	{
		$this->PStCL01_Direccion = $Dir;
	}
	public function getPStCl01_Direccion()
	{
		return $this->PStCl01_Direccion;
	}
	
	public function setPCrCl01_Sexo($Sex)
	{
		$this->PCrCl01_Sexo = $Sex;
	}
	public function getPCrCl01_Sexo()
	{
		return $this->PCrCl01_Sexo;
	}
	
	public function setPStCl01_Telefono($Tel)
	{
		$this->PStCL01_Telefono = $Tel;
	}
	public function getPStCl01_Telefono()
	{
		return $this->PStCl01_Telefono;
	}
	
	public function setPStCl01_Email($Ema)
	{
		$this->PStCl01_Email = $Ema;
	}
	public function getPStCl01_Email()
	{
		return $this->PStCl01_Email;
	}
}
?>

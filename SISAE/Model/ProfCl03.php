<?php
include 'Conexion.php';
include 'UsuCl01.php';

class ProfCl03
{
	private $PStCl03_IdProfesor;
	private $PStCl03_Clave;
	private $PStCl03_FechaNac;  
	private $PStCl03_Estado;
	
	public function ProfCl03($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema,
	$IdP, $Cla, $FeN, $Est)
	{
		parent::UsuCl01($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema);
		$this->PStCl03_IdProfesor = $IdP;
		$this->PStCl03_Clave = $Cla;
		$this->PStCl03_FechaNac = $FeN;
		$this->PStCl03_Estado = $Est;
	}
	
	public function ProfCl03()
	{
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
}
?>
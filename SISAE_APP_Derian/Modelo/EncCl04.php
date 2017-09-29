<?php
include 'Conexion.php';
include 'UsuCl01.php';

class EncCl04
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
	
	public function EncCL04()
	{
	}
	
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
}
?>
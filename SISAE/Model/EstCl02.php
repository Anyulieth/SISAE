<?php
include 'Conexion.php';
include 'UsuCl01.php';

class EstCl02 extends UsuCl01
{
	private $PStCl03_IdEst;
	private $PDtCl03_FechaNac;
	private $PStCl03_Adecuacion;
	private $PStCl03_Estado;
	private $PStCl03_IdGrado;
	private $PStCl03_IdEspecialidad;
	
	public function EstCl03 ($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema,
	$IdE, $FeN, $Ade, $Est, $IdG, $IdE)
	{
	parent::UsuCl01($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema);
		$this->PStCl03_IdEst = $IdE;
		$this->PDtCl03_FechaNac = $FeN;
		$this->PStCl03_Adecuacion = $Ade;
		$this->PStCl03_Estado = $Est;
		$this->PStCl03_IdGrado = $IdG;
		$this->PStCl03_IdEspecialidad = $IdE;
	}
	public function EstCl03 ()
	{		
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
	
	public function setPStCl03_IdGrado($IdG)
	{
		$this->PStCl03_IdGrado = $IdG;
	}
	public function getPStCl03_IdGrado()
	{
		return $this->PStCl03_IdGrado;
	}
	
	public function setPStCl03_IdEspecialidad($IdEs)
	{
		$this->PStCl03_IdEspecialidad = $IdEs;
	}
	public function getPStCl03_IdEspecialidad()
	{
		return $this->PStCl03_IdEspecialidad;
	}
}
?>
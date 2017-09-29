<?php
include 'Conexion.php';

class AsistClaseCl17
{
	private $PStCl17_IdAsistClase;
    private $PDtCl17_Fecha;
	private $PTmCl17_Hora;
    private $PStCl17_Estado;
    private $PStCl17_IdMateria;
	
	public function AsistClaseCl17($IdA, $Fec, $Hora, $Est, $IdM)
	{
			$this->PStCl17_IdAsistClase = $IdA;
			$this->PDtCl17_Fecha = $Fec;
			$this->PTmCl17_Hora = $Hora;
			$this->PStCl17_Estado = $Est;
			$this->PStCl17_IdMateria = $IdM;
	}
	
	public function AsistClaseCl17()
	{	
	}
	
	public function setPStCl17_IdAsistClase($IdA)
	{
		$this->PStCl17_IdAsistClase = $IdA;
	}
	public function getPStCl17_IdAsistClase()
	{
		return $this->PStCl17_IdAsistClase;
	}
	
	public function setPDtCl17_Fecha($Fec)
	{
		$this->PDtCl17_Fecha = $Fec;
	}
	public function getPDtCl17_Fecha()
	
	{
		return $this->PDtCl17_Fecha;
	}
	
	public function setPTmCl17_Hora($Hora)
	{
		$this->PTmCl17_Hora = $Hora;
	}
	public function getPTmCl17_Hora()
	{
		return $this->PTmCl17_Hora;
	}
	
	public function setPStCl17_Estado($Est)
	{
		$this->PStCl17_Estado = $Est;
	}
	public function getPStCl17_Estado()
	{
		return 	$this->PStCl17_Estado;
	}
	
	public function setPStCl17_IdMateria($IdM)
	{
		$this->PStCl17_IdMateria = $IdM;
	}
	public function getPStCl17_IdMateria()
	{
		return $this->PStCl17_IdMateria;
	}
}
?>
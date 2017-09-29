<?php
include 'Conexion.php';

class SeccionCl19
{
	private $PStCl19_IdSeccion;
    private $PInCl17_Cupo;
	
	public function SeccionCl19($IdS, $Cupo)
	{
		$this->PStCl19_IdSeccion = $IdS;
		$this->PInCl17_Cupo = $Cupo;	
	}
	
	public function SeccionCl19()
	{	
	}
	
	public function setPStCl19_IdSeccion($IdS)
	{
		$this->PStCl19_IdSeccion = $IdS;
	}
	public function getPStCl19_IdSeccion()
	{
		return $this->PStCl19_IdSeccion;
	}
	
	public function setPInCl17_Cupo($Cupo)
	{
		$this->PInCl17_Cupo = $Cupo;
	}
	public function getPInCl17_Cupo()
	{
		return $this->PInCl17_Cupo;
	}
}
?>
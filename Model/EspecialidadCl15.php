<?php
include 'Conexion.php';

class EspecilidadCl15
{
	private $PStCl15_IdEspecialidad;
	private $PStCl15_Nombre;
    private  $PInCl15_Cupo;
	
	public function EspecilidadCl15($IdE, $Nom, $Cupo)
	{
		$this->PStCl15_IdEspecialidad = $IdE;
		$this->PStCl15_Nombre = $Nom;
		$this->PInCl15_Cupo = $Cupo;
	}
	
	public function EspecilidadCl15()
	{	
	}
	
	public function setPStCl15_IdEspecialidad($IdE)
	{
		$this->PStCl15_IdEspecialidad = $IdE;
	}
	public function getPStCl15_IdEspecialidad()
	{
		return $this->PStCl15_IdEspecialidad;
	}
	
	public function setPStCl15_Nombre($Nom)
	{
		$this->PStCl15_Nombre = $Nom;
	}
	public function getPStCl15_Nombre()
	{
		return $this->PStCl15_Nombre;
	}
	
	public function setPInCl15_Cupo($Cupo)
	{
		$this->PInCl15_Cupo = $Cupo;
	}
	public function getPInCl15_Cupo()
	{
		return $this->PInCl15_Cupo;
	}
}
?>
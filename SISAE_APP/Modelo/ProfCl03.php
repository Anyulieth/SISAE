<?php
include "../Controlador/conexion.php";
include "../Modelo/UsuCl01.php";

class ProfCl03 extends UsuCl01
{
	private $PStCl03_IdProfesor;
	private $PStCl03_Clave;
	private $PStCl03_FechaNac;  
	private $PStCl03_Estado;
	
	public function __construct($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema,
	$IdP, $Cla, $FeN, $Est)
	{
		parent::__construct($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema);
		$this->PStCl03_IdProfesor = $IdP;
		$this->PStCl03_Clave = $Cla;
		$this->PStCl03_FechaNac = $FeN;
		$this->PStCl03_Estado = $Est;
	}
	
	public function __construct()
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
	public function PStCl03_GuardarProf(){
		if(!$query = $con->prepare("CALL PaProfTb04_GuardarProf(?,?,?,?,?,?,?,?,?,?,?)")){
			$query->bind_param("sbsssssssss",$id,$fecha,$clave,$estado,$nombre,$apell1,$apell2,$direccion,$sexo,$telefono,$email);
			$id = $IdP;
			$fecha = $FeN;
			$clave = $Cla;
			$estado = $Est;
			$nombre = $Nom;
			$apell1 = $Ap1;
			$apell2 = $Ap2;
			$direccion = $Dir;
			$sexo = $Sex;
			$telefono = $Tel;
			$email = $Ema;
			$query->execute();
		}else{print "<script>alert(\"No se pudo agregar.\");window.location='C:/xampp/htdocs/SISAE/Vista/Profesor.php';</script>";}
	}
}
?>
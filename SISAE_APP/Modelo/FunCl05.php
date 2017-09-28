<?php
include 'Conexion.php';
include 'UsuCl01.php';

class FunCl05
{
	private $PStCl05_IdFuncionario;
	private $PStCl05__Clave;
	private $PDtCl05__FechaNac;
    private $PStCl05__Estado;
	
	public function FunCl05($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema,
	$IdFunc, $Cla, $FeN, $Est)
	{
		parent::UsuCl01($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema);
		$this->PStCl05_IdFuncionario = $IdFunc;
		$this->PStCl05__Clave = $Cla;
		$this->PDtCl05__FechaNac = $FeN;
		$this->PStCl05__Estado = $Est;
	}
	
	public function FunCl05()
	{
	}
	
	public function setPStCl05_IdFuncionario($IdFunc)
	{
		$this->PStCl05_IdFuncionario = $IdFunc;
	}
	public function getPStCl05_IdFuncionario()
	{
		return $this->PStCl05_IdFuncionario;
	}
	
	public function setPStCl05__Clave($Cla)
	{
		$this->PStCl05__Clave = $Cla;
	}
	public function getPStCl05__Clave()
	{
		return $this->PStCl05__Clave;
	}
	
	public function setPDtCl05__FechaNac($FecN)
	{
		$this->PDtCl05__FechaNac = $FecN;
	}
	public function getPDtCl05__FechaNac()
	{
		return $this->PDtCl05__FechaNac;
	}
	
	public function setPStCl05__Estado($Est)
	{
		$this->PStCl05__Estado = $Est;
	}
	public function getPStCl05__Estado()
	{
		return $this->PStCl05__Estado;
	}
	public function FunCl05_GuardarFun(){
		if(!$query = $con->prepare("CALL PaFunTb06_GuardarFunc(?,?,?,?,?,?,?,?,?,?,?)")){
			$query->bind_param("sbsssssssss",$id,$fecha,$clave,$estado,$nombre,$apell1,$apell2,$direccion,$sexo,$telefono,$email);
			$id = $IdFunc;
			$fecha = $FeN;
			$clave = $Cla;
			$estado = $ESt;
			$nombre = $Nom;
			$apell1 = $Ap1;
			$apell2 = $Ap2;
			$direccion = $Dir;
			$sexo = $Sex;
			$telefono = $Tel;
			$email = $Ema;
			$query->execute();
		}else{print "<script>alert(\"No se pudo agregar.\");window.location='C:/xampp/htdocs/SISAE/Vista/Funcionario.php';</script>";}
	}

}
?>
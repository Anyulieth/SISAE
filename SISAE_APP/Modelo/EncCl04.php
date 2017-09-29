<?php
include "../Controlador/conexion.php";
include "../Modelo/UsuCl01.php";

class EncCl04 extends UsuCl01
{
	private $PStEncCl04_IdEncargado;
	private $PStEncCl04_Clave;
	
	public function __construct($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema,
	$IdEnc, $Cla)
	{
		parent::__construct($ced, $Nom, $Ap1, $Ap2, $Dir, $Sex, $Tel, $Ema);
		$this->PStEncCl04_IdEncargado = $IdEnc;
		$this->PStEncCl04_Clave = $Cla; 
	}	
	function __construct(){}
	
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
	
	public function GuardarEnc(){	
		
	if(!$query = $con->prepare("call PaEncTb05_GuardarEnc(?,?,?,?,?,?,?,?,?)")){
	 $query->bind_param("sssssssss",$id,$nombre,$apell1,$apell2,$direccion,$sexo,$telefono,$email,$clave);
			$id = $IdEnc;
			$nombre = $Nom;
			$apell1 = $Ap1;
			$apell2 = $Ap2;
			$direccion = $Dir;
			$sexo = $Sex;
			$telefono = $Tel;
			$email = $Ema;
			$clave = $Cla;
			$query->execute();
		}else{print "<script>alert(\"No se pudo agregar.\");window.location='../Vista/Encargado.php';</script>";}
	
		 
/*try 
		{
		$sql = "call PaEncTb05_GuardarEnc(?,?,?,?,?,?,?,?,?)";
		$re= $con->prepare($sql)->execute(
				array(
                    $obj->$PStEncCl04_IdEncargado,
                    $obj->$PStCL01_Nombre, 
                    $obj->$PStCL01_Apellido1, 
                    $obj->$PStCL01_Apellido2,
                    $obj->$PStCL01_Direccion,
                    $obj->$PCrCL01_Sexo,
                    $obj->$PStCL01_Telefono,
                    $obj->$PStCL01_Email,
                    $obj->$PStEncCl04_Clave
                )
			);
		} catch (Exception $e) 
		{
			die($e->getMessage());
		}		*/
		
		/*	$stmt=$con->prepare("callPaEncTb05_GuardarEnc(?,?,?,?,?,?,?,?,?)");
			$stmt=bind_param('sssssssss',
			'$PStEncCl04_IdEncargado','$PStCL01_Nombre',
			'$PStCL01_Apellido1','$PStCL01_Apellido2','$PStCL01_Direccion',
			'$PCrCL01_Sexo','$PStCL01_Telefono','$PStCL01_Email','$PStEncCl04_Clave');
			$stmt->execute();*/		
			
		/*	$consulta=$con->query("callPaEncTb05_GuardarEnc('$PStEncCl04_IdEncargado','$PStCL01_Nombre',
			'$PStCL01_Apellido1','$PStCL01_Apellido2','$PStCL01_Direccion',
			'$PCrCL01_Sexo','$PStCL01_Telefono','$PStCL01_Email','$PStEncCl04_Clave')"); */
}
public function Editar()
{
	if(!$query = $con->prepare("call PaEncTb05_ActualizarEnc(?,?,?,?,?,?,?,?,?)")){
	 $query->bind_param("sssssssss",$id,$nombre,$apell1,$apell2,$direccion,$sexo,$telefono,$email,$clave);
			$id = $IdEnc;
			$nombre = $Nom;
			$apell1 = $Ap1;
			$apell2 = $Ap2;
			$direccion = $Dir;
			$sexo = $Sex;
			$telefono = $Tel;
			$email = $Ema;
			$clave = $Cla;
			$query->execute();
		}else{print "<script>alert(\"No se pudo agregar.\");window.location='../Vista/Encargado.php';</script>";
	}
}
} 

?>
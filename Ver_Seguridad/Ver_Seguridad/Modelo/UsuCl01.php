<?php
require_once 'conexion.php';

class UsuCl01 extends conexion
{
	protected $PStCl01_Cedula;
	protected $PStCl01_Nombre;
	protected $PStCl01_Apellido1;
	protected $PStCl01_Apellido2;
	protected $PStCl01_Direccion;
	protected $PCrCl01_Sexo;
	protected $PStCl01_Telefono;
	protected $PStCl01_Email;
	//private $con;

	public function __construct()
	{
		$con = new conexion();
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
	public function getPStCL01_Direccion()
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
		$this->PStCl01_Telefono = $Tel;
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
	
	public function UsuCl01_ListaUsu()
	{
		$con = new conexion();
		$sql = "CALL PaUsuTb01_ListarUsuarios();";
		$result = $con->query($sql);
		return $result;
	}
	public function UsuCl01_Lista_Privilegios($inicio,$final)
	{
		$con = new conexion();
		$sql = "CALL PaSegusuTb32_Listar_Privilegios($inicio,$final);";
		$result = $con->query($sql);
		return $result;
	}
	public function UsuCl01_Cantidad()
		{
		$con = new conexion();
 		$consulta = $con -> query("select count(*) as cantidad from SegusuarioTb32");
		$cant = $consulta -> fetch_array();
		return $cant["cantidad"];
 	} 
	public function Listar_Priv_Admin($Ced){
		$con = new conexion();
		$sql = 'CALL PaSegusuTb32_Listar_Priv_Admin('.$Ced.');';
		$consulta = $con -> query($sql);
		return $consulta;
	}
	public function Listar_Priv_Prof($Ced){
		$con = new conexion();
		$sql = 'CALL PaSegusuTb32_Listar_Priv_Prof('.$Ced.');';
		$consulta = $con -> query($sql);
		return $consulta;
	}
	public function Listar_Priv_Func(){

	}
	public function Listar_Priv_Enc(){

	}

	public function ActualizarPrivilegios($Ced,$Id,$Est){
		$con = new conexion();
		$sql = 'CALL PaSegusuarioTb32_Actualizar('.$Ced.','.$Id.','.$Est.');';
		$consulta = $con-> query($sql);
		return $consulta;
	}
}
?>
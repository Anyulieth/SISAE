<?php
require_once 'conexion.php';

class BachillerCl13 extends conexion {
	private $PInCl13_IdBachiller;
	private $PStCl13_NombreBachiller;

	public function __construct() {
		$con = new conexion();
	}

	public function setPInCl13_IdBachiller($IdB) {
		$this -> PInCl13_IdBachiller = $IdB;
	}

	public function getPInCl13_IdBachiller() {
		return $this -> PInCl13_IdBachiller;
	}

	public function setPStCl13_NombreBachiller($NomB) {
		$this -> PStCl13_NombreBachiller = $NomB;
	}

	public function getPStCl13_NombreBachiller() {
		return $this -> PStCl13_NombreBachiller;
	}

	public function BachillerCl13_AddBac($PStCl13_NombreBachiller) {
		$con = new conexion();
		$sql = "CALL PaBachillerTb14_GuardarBachiller('" . $PStCl13_NombreBachiller . "');";
		$add = $con -> query($sql);
		if ($add) {
			return $add;
		}
	}

	public function BachillerCl13_EditBac($PInCl13_IdBachiller, $PStCl13_NombreBachiller) {
		$con = new conexion();
		$sql = "CALL PaBachillerTb14_ActualizarBachiller('" . $PInCl13_IdBachiller . "','" . $PStCl13_NombreBachiller . "');";
		$edit = $con -> query($sql);
		return $edit;
	}

	public function BachillerCl13_BorraBac($PInCl13_IdBachiller) {
		$con = new conexion();
		$sql = "CALL PaBachillerTb14_EliminarBachiller('" . $PInCl13_IdBachiller . "');";
		$r = $con -> query($sql);
		if ($r) {
			return $r;
		}
	}

	public function BachillerCl13_BuscaBac($PInCl13_IdBachiller) {
		$con = new conexion();
		$sql = "CALL PaBachillerTb14_BuscarBachillerD('" . $PInCl13_IdBachiller . "');";
		$result = $con -> query($sql);
		$r = $result -> fetch_all(MYSQLI_ASSOC);
		if ($r) {
			return $r;
		}
	}

	public function BachillerCl13_ListaBac() {
		$con = new conexion();
		$sql = "CALL PaBachillerTb14_Listar();";
		$result = $con -> query($sql);
		return $result;
	}

	public function BachillerCl13_ListaTodo() {
		$con = new conexion();
		$sql = "CALL PaBachillerTb14_Listar_Todos();";
		$result = $con -> query($sql);
		return $result;
	}

	public function BachillerCl13_Cantidad() {
		$con = new conexion();
		$consulta = $con -> query("select count(*) as cantidad from BachillerTb14");
		$cant = $consulta -> fetch_array();
		return $cant["cantidad"];
	}
}
?>
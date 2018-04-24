<?php
require_once 'conexion.php';

class HorarioCl27 extends conexion {
	private $PInHorariosTb29_IdHorario;
	private $PStHorariosTb29_Dia;
	private $PTmHorariosTb29_Hora_Inicio;
	private $PTmHorariosTb29_Hora_Final;

	public function __construct() {
		$con = new conexion();
	}

	public function HorarioCl27_AddHo($PStHorariosTb29_Dia, $PTmHorariosTb29_Hora_Inicio, $PTmHorariosTb29_Hora_Final) {
		$con = new conexion();
		$sql = "CALL PaHorariosTb29_AgregarHorario('" . $PStHorariosTb29_Dia . "','" . $PTmHorariosTb29_Hora_Inicio . "','" . $PTmHorariosTb29_Hora_Final . "');";
		$add = $con -> query($sql);
		if ($add) {
			return $add;
		}
	}

	public function HorarioCl27_EditHo($PInHorariosTb29_IdHorario, $PStHorariosTb29_Dia, $PTmHorariosTb29_Hora_Inicio, $PTmHorariosTb29_Hora_Final) {
		$con = new conexion();
		$sql = "CALL PaHorariosTb29_ActualizarHorario('" . $PInHorariosTb29_IdHorario . "','" . $PStHorariosTb29_Dia . "','" . $PTmHorariosTb29_Hora_Inicio . "','" . $PTmHorariosTb29_Hora_Final . "');";
		$edit = $con -> query($sql);
		return $edit;
	}

	public function HorarioCl27_BorraHo($PInHorariosTb29_IdHorario) {
		$con = new conexion();
		$sql = "CALL PaHorarioTb29_EliminarHorario('" . $PInHorariosTb29_IdHorario . "');";
		$r = $con -> query($sql);
		if ($r) {
			return $r;
		}
	}

	public function HorarioCl27_BuscaHoD($PInHorariosTb29_IdHorario) {
		$con = new conexion();
		$sql = "CALL PaHorariosTb29_BuscarHorarioD('" . $PInHorariosTb29_IdHorario . "');";
		$result = $con -> query($sql);
		$r = $result -> fetch_all(MYSQLI_ASSOC);
		if ($r) {
			return $r;
		}
	}

	public function HorarioCl27_BuscaHo($PInHorariosTb29_IdHorario) {
		$con = new conexion();
		$sql = "CALL PaHorariosTb29_BuscarHorario('" . $PInHorariosTb29_IdHorario . "');";
		$result = $con -> query($sql);
		$r = $result -> fetch_all(MYSQLI_ASSOC);
		if ($r) {
			return $r;
		}
	}

	public function HorarioCl27_ListaHo($inicio, $por_pagina) {
		$con = new conexion();
		$sql = "CALL PaHorariosTb29_Listar($inicio,$por_pagina);";
		$result = $con -> query($sql);
		return $result;
	}

	function HorarioCl27_cantidad() {
		$con = new conexion();
		$consulta = $con -> query("select count(*) as cantidad from HorarioSTb29");
		$cant = $consulta -> fetch_array();
		return $cant["cantidad"];
	}
}
?>
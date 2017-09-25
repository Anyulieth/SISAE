<?php
session_start();
require '../Model/Conexion.php';

# Leemos las variables enviadas mediante Ajax
$user = $_POST['u'];
$clave = md5($_POST['p']);

#Administrador
$sql1 = mysqli_query($conectarBD, "SELECT * FROM AdmTb02 WHERE vcAdmTb02_IdAdmin='$user'");
if ($f1 = mysqli_fetch_array($sql1)) {
	if ($clave == $f1['vcAdmTb02_Clave']) {
		$_SESSION['user'] = $f1['user']; #Obtener el nombre del usuario de la bd
		echo "<script>location.href='../dashboard_SISAE/Administrador.php'</script>";
	}else {
	echo '<script>alert("ESTE USUARIO NO EXISTE, POR FAVOR COMUNIQUESE CON LA INSTITUCION")</script> ';
	echo "<script>location.href='Login.html'</script>";
}}

#Encargado
$sql2 = mysqli_query($conectarBD, "SELECT * FROM EncTb05 WHERE VcEncTb05_IdEncargado='$user'");
if ($f2 = mysqli_fetch_array($sql2)) {
	if ($pass == $f2['vcEncTb05_Clave']) {
		$_SESSION['user'] = $f2['user']; #Obtener el nombre del usuario de la bd
		header("Location: Encargado.php");
	} else {
		echo '<script>alert("CONTRASEÑA INCORRECTA")</script> ';
		echo "<script>location.href='Login.html'</script>";
	}
} else {
	echo '<script>alert("ESTE USUARIO NO EXISTE, POR FAVOR COMUNIQUESE CON LA INSTITUCION")</script> ';
	echo "<script>location.href='Login.html'</script>";
}

#Profesor
$sql3 = mysqli_query($conectarBD, "SELECT * FROM ProfTb04 WHERE vcProfTb04_IdProfesor='$user'");
if ($f3 = mysqli_fetch_array($sql3)) {
	if ($clave == $f3['vcProfTb04_Clave']) {
		$_SESSION['user'] = $f3['user']; #Obtener el nombre del usuario de la bd

		echo "<script>location.href='../dashboard_SISAE/Profesor.php'</script>";
	} else {
		echo '<script>alert("ESTE USUARIO NO EXISTE, POR FAVOR COMUNIQUESE CON LA INSTITUCION")</script> ';
		echo "<script>location.href='Login.html'</script>";
	}
}

#Funcionario
$sql4 = mysqli_query($conectarBD, "SELECT * FROM FunTb06 WHERE vcFunTb06_IdFuncionario='$user'");
if ($f4 = mysqli_fetch_array($sql4)) {
	if ($clave == $f4['vcFunTb06_Clave']) {
		$_SESSION['user'] = $f4['user']; #Obtener el nombre del usuario de la bd

		echo "<script>location.href='../dashboard_SISAE/Funcionario.php'</script>";
	} else {
		echo '<script>alert("ESTE USUARIO NO EXISTE, POR FAVOR COMUNIQUESE CON LA INSTITUCION")</script> ';
		echo "<script>location.href='Login.html'</script>";
	}
}

# Verificamos que los campos no esten vacios
if (empty($user) || empty($clave)) {
	echo "Por favor ingrese los datos";
}
?>

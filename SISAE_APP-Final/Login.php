<?php session_start();
session_destroy();
?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!--Responsive-->
		<link rel="stylesheet" href="Public/css/Log.css" >
		<link rel="stylesheet" href="assets/Bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/Bootstrap/css/styles.css">
		<link rel="stylesheet" href="assets/jquery-ui/jquery-ui.css" >
		<link rel="stylesheet" href="assets/SweetAlert/css/sweetalert2.css" >
		<link rel="stylesheet" href="assets/SweetAlert/css/sweetalert2.min.css" >
	</head>
	<body> <br><br>
		 <font face="Bookman Old Style" color="#4040a1">
		<h1>SISTEMA ASISTENCIA DE ESTUDIANTES</h1>
		</font>
		<div class="contenedorLogin" style="text-align:center;">
			<img src="Public/img/user.png" class="user" />
			<form method="post" action="index.php" id="log">
				<br><input type="text" name="u" placeholder="Ingresa Usuario" autocomplete="off" required="required"/><br><br>
				<input type="password" name="p" placeholder="Ingresa Contraseña" autocomplete="off" required="required"/>
				<br><br><br><input type="submit" name="Ingresar" value="Ingresar" class="btn-login" />
			</form>
		</div>
		<script type="text/javascript"></script>
		<script src="assets/Bootstrap/js/jquery.min.js"></script>
		<script src="assets/jquery-ui/jquery-ui.js"></script>
		<script src="assets/Bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/SweetAlert/js/sweetalert2.js"></script>
		<script src="assets/SweetAlert/js/sweetalert2.min.js"></script>
	</body>
</html>
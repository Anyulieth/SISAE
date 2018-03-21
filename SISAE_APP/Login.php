<?php session_start();
session_destroy();
?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> <!--Responsive-->
		<link rel="stylesheet" href="Public/css/Login.css" >
		<link rel="stylesheet" href="assets/Bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/Bootstrap/css/styles.css">
		<link rel="stylesheet" href="Public/css/dash.css" >
		<link rel="stylesheet" href="assets/jquery-ui/jquery-ui.css" >
		<link rel="stylesheet" href="assets/SweetAlert/css/sweetalert2.css" >
		<link rel="stylesheet" href="assets/SweetAlert/css/sweetalert2.min.css" >
	</head>

	<body>
		<div class="container" style="text-align:center;">
			<div class="login">
				<h1>LOGIN</h1>
				<form method="post" action="index.php" id="log">
					<!--<label for="u"><span class="glyphicon glyphicon-user"></span> Usuario</label>-->
					<input type="text" name="u" placeholder="Usuario" required="required"/>
					<!--<label for="p"><span class="glyphicon glyphicon-eye-open"></span> Contraseña</label>-->
					<input type="password" name="p" placeholder="Contraseña" required="required" />
					<hr>
					<button type="submit" class="btn btn-primary">
						Ingresar
					</button>
				</form>
			</div>
		</div>

		<script type="text/javascript"></script>
		<script src="assets/Bootstrap/js/jquery.min.js"></script>
		<script src="assets/jquery-ui/jquery-ui.js"></script>
		<script src="assets/Bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/SweetAlert/js/sweetalert2.js"></script>
		<script src="assets/SweetAlert/js/sweetalert2.min.js"></script>
	</body>
</html>
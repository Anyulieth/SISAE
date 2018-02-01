<?php 
require_once 'Modelo/conexion.php';
session_start();
if (!isset($_POST['u']) || !isset($_POST['p'])) {
	if (!isset($_SESSION['usuario']) || !isset($_SESSION['contraseña'])) {header('Location:Login.php');
	}
} else {$_SESSION['usuario'] = $_POST['u'];
	$_SESSION['contraseña'] = $_POST['p'];
}
$query = "CALL PaSeguridadTb31_Validar_Usu(\"$_SESSION[usuario]\",\"$_SESSION[contraseña]\")";
$con = new conexion();
$result = $con -> query($query);
$funciones = array();
$iconos = array();
$sidenav = array();
while ($r = $result -> fetch_array()) {
	$funciones[] = $r['Funcion'];
	$iconos[] = $r['Iconos'];
	$sidenav[] = $r['SideNav'];
}
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> <!--Responsive-->
		<title>SISAE</title>
		<link rel="stylesheet" href="assets/Bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/Bootstrap/css/styles.css">
		<link rel="stylesheet" href="Public/css/dash.css" >
		<link rel="stylesheet" href="assets/jquery-ui/jquery-ui.css" >
		<link rel="stylesheet" href="assets/SweetAlert/css/sweetalert2.css" >
		<link rel="stylesheet" href="assets/SweetAlert/css/sweetalert2.min.css" >
		<script type="text/javascript"><?php
foreach ($funciones as $fun) {
	echo $fun;
}
?></script>
	</head>
	
	<body onload="principal();">
		<div id="header"> 
			<a href="Login.php" data-toggle="tooltip" data-placement="bottom" title="Cerrar Sesión" class="glyphicon glyphicon-log-out"></a>
			<p>
				Bienvenido
			</p>
		</div>

		<div class="sidebar" style="background-color:#1a2127;">
			<span style="font-size:30px;cursor:pointer;color:white;right:5px;" id="hamb" onclick="openNav()">&#9776;</span>
			<div>
				<?php
				foreach ($iconos as $icon) {
					echo $icon;
				}
				?>
			</div>
		</div>
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<?php
			foreach ($sidenav as $sid) {
				echo $sid;
			}
			?>
		</div>
		<div id="contenido"></div>
		<script src="assets/Bootstrap/js/jquery.min.js"></script>
		<script src="assets/jquery-ui/jquery-ui.js"></script>
		<script src="assets/Bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/SweetAlert/js/sweetalert2.js"></script>
		<script src="assets/SweetAlert/js/sweetalert2.min.js"></script>
	</body>
	
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "200px";
			document.getElementById("contenido").style.marginLeft = "150px";

		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("contenido").style.marginLeft = "0";
			document.getElementById("hamb").style.display = "block";
		}

		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
		
		/* Pasa por todos los botones desplegables para alternar entre ocultarse y mostrar su contenido desplegable: 
		 * esto permite que el usuario tenga varias listas desplegables sin ningún conflicto */
		var dropdown = document.getElementsByClassName("dropdown-btn");
		var i;

		for ( i = 0; i < dropdown.length; i++) {
			dropdown[i].addEventListener("click", function() {
				/*this.classList.toggle("active");*/
				var dropdownContent = this.nextElementSibling;
				if (dropdownContent.style.display === "block") {
					dropdownContent.style.display = "none";
				} else {
					dropdownContent.style.display = "block";
				}
			});
		}
	</script>
</html>
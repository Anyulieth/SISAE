<?php

// Eliminamos la sesion
session_start();
if ($_SESSION['u']) {
	session_destroy();
	header("location:Login.html");
} else {
	header("location:Login.html");
}
?>

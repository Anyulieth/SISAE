<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require '../../../assets/vendor/autoload.php';

require_once '../../../Modelo/conexion.php';
$con = new conexion();
$id = $_POST['Id'];
$result = $con -> query("CALL PaCorreoProfTb36_BuscaEmail('" . $id . "')");
  if($result){



if (!empty($_POST)) {
	if (isset($_POST["email"]) && isset($_POST["subject"]) && isset($_POST["mensaje"])) {
		if ($_POST['email'] != "" && $_POST['subject'] != "" && $_POST['mensaje'] != "") {
			$correo = $_POST['email'];
			$subj = $_POST['subject']; 
			$msj = $_POST['mensaje'];
			$prof = $_SESSION['usuario'];
			

			// $archivo = $_FILES['adjunto'];

			$mail = new PHPMailer(true);
			try {
				//Server settings
				$mail -> SMTPDebug = 2;
				$mail -> isSMTP();
				$mail -> SMTPAuth = true;
				$mail -> CharSet = 'UTF-8';				// Disponible SMTP autenticación
				//Consultar datos de configuración con servidor contratado
				//GMAIL
				$mail -> Host = 'smtp.gmail.com';	// Servidor	
				$mail -> Username = 'websisae@gmail.com';		
				$mail -> Password = 'sisae2017';	// SMTP clave	
				$mail -> SMTPSecure = 'tls';	// Encriptación
				$mail -> Port = 587;	// TCP puerto
				$mail -> setFrom('websisae@gmail.com', 'SISAE SistemaAsistencia de Estudiantes');  //Direcci�n correo saliente (Remitente)
				$mail -> addAddress($correo, 'Encargado');  // Dirección a enviar correo (Destinatario)

				//Attachments
				//$mail->addAttachment($archivo['tmp_name'], $archivo['name']);             // Adjuntos

					//Content
				$body = $subj;
				$mail -> isHTML(true); // Email formato HTML
				$mail -> Subject = $subj;
				$mail -> AltBody = $msj;
				$mail -> msgHTML($body);

				if ($mail -> send()) {
						$Estado = 'Enviado';
						echo 'Enviado';
						require_once '../../../Modelo/conexion.php';
						$con = new conexion();
						$query = $con -> query("CALL PaCorreoProfTb36_EditarEmail('" . $id . "','" . $prof . "','" . $correo . "','" . $subj . "','" . $msj . "','" . $Estado . "')");
						if (!$query) {print 'Falló!!';
						} else {print 'Éxito!!';
						}
					}
			} catch (Exception $e) {
				echo 'Fallido', $mail -> ErrorInfo;
			}
		}
	}
}
}
?>
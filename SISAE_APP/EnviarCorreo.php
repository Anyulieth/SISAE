<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require 'assets/vendor/autoload.php';

if (!empty($_POST)) {
    if (isset($_POST["email"]) && isset($_POST["subject"]) && isset($_POST["mensaje"])) 
    {
        if ($_POST['email'] != "" && $_POST['subject'] != "" && $_POST['mensaje'] != "") 
        {
            $correo = $_POST['email'];
            $subj = $_POST['subject'];
            $msj = $_POST['mensaje'];

$mail = new PHPMailer(true);                              // Passing `true` enables exceptions
try {
    //Server settings
    $mail->SMTPDebug = 2;                                 // Enable verbose debug output
    $mail->isSMTP();                                      // Set mailer to use SMTP
    $mail->SMTPAuth = true;                               // Disponible SMTP autenticación
    //Consultar datos de configuración con servidor contratado
    //GMAIL
    $mail->Host = 'smtp.gmail.com';                      // Servidor        
    $mail->Username = 'websisae@gmail.com';               // SMTP usuario
    $mail->Password = 'sisae2017';                        // SMTP clave
    $mail->SMTPSecure = 'tls';                            // Encriptación
    $mail->Port = 587;                                    // TCP puerto   
    $mail->setFrom('websisae@gmail.com', 'Administrador');      //Dirección correo saliente (Remitente)

    //HOTMAIL
   /* $mail->Host = 'smtp.live.com';                      // Servidor        
    $mail->Username = 'websisae@hotmail.com';               // SMTP usuario
    $mail->Password = 'sisae2017';                        // SMTP clave
    $mail->SMTPSecure = 'tls';                            // Encriptación
    $mail->Port = 587;                                    // TCP puerto
    $mail->setFrom('websisae@hotmail.com', 'Administrador');      //Dirección correo saliente (Remitente)*/
    $mail->addAddress($correo, 'Anyu');     // Dirección a enviar correo (Destinatario)

    //Attachments
   // $mail->addAttachment('/var/tmp/file.tar.gz');             // Adjuntos

    //Content
    $mail->isHTML(true);                                        // Email formato HTML
    $mail->Subject = $subj;
    $mail->Body    = $msj;
    //$mail->AltBody = $msj;

    $mail->send();
    echo 'Correo Enviado';
} catch (Exception $e) {
    echo 'Correo No Enviado. Error: ', $mail->ErrorInfo;
}
        }
    }
}
?>
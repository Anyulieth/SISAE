<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require '../../../assets/vendor/autoload.php';

if (!empty($_POST)) {
    if (isset($_POST["email"]) && isset($_POST["subject"]) && isset($_POST["mensaje"])) 
    {
        if ($_POST['email'] != "" && $_POST['subject'] != "" && $_POST['mensaje'] != "") 
        {

            $correo = $_POST['email'];
            $subj = $_POST['subject'];
            $msj = $_POST['mensaje'];
            $encargado = $_POST['encargado'];
           // $archivo = $_FILES['adjunto'];

$mail = new PHPMailer(true);                              // Passing `true` enables exceptions
try {
    //Server settings
    $mail->SMTPDebug = 2;                                 // Enable verbose debug output
    $mail->isSMTP();                                      // Set mailer to use SMTP
    $mail->SMTPAuth = true;                               // Disponible SMTP autenticación
    $mail->CharSet = 'UTF-8'; 
    //Consultar datos de configuración con servidor contratado
    //GMAIL
    $mail->Host = 'smtp.gmail.com';                      // Servidor        
    $mail->Username = 'websisae@gmail.com';               // SMTP usuario
    $mail->Password = 'sisae2017';                        // SMTP clave
    $mail->SMTPSecure = 'tls';                            // Encriptación
    $mail->Port = 587;                                    // TCP puerto   
    $mail->setFrom('websisae@gmail.com', 'SISAE Sistema Asistencia de Estudiantes');      //Dirección correo saliente (Remitente)
    $body = file_get_contents('Content_Email.html');

    //HOTMAIL
   /* $mail->Host = 'smtp.live.com';                      // Servidor        
    $mail->Username = 'websisae@hotmail.com';               // SMTP usuario
    $mail->Password = 'sisae2017';                        // SMTP clave
    $mail->SMTPSecure = 'tls';                            // Encriptación
    $mail->Port = 587;                                    // TCP puerto
    $mail->setFrom('websisae@hotmail.com', 'Administrador');      //Dirección correo saliente (Remitente)*/
    $mail->addAddress($correo, $encargado);     // Dirección a enviar correo (Destinatario)

    //Attachments
    //$mail->addAttachment($archivo['tmp_name'], $archivo['name']);             // Adjuntos

    //Content
    $mail->isHTML(true);                                        // Email formato HTML
    $mail->Subject = $subj;
    $mail->AltBody = $msj;
    $mail->msgHTML($body);

    $mail->send();  //Envía correo
    //Guardar en BD
    

    echo 'Correo Enviado';
    $mail->ClearAddresses(); // Limpia los "Address" cargados previamente para volver a cargar uno.
} catch (Exception $e) {
    echo 'Correo No Enviado. Error: ', $mail->ErrorInfo;
}
        }
    }
}
?>

<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require '../../assets/vendor/autoload.php';
require_once '../../Modelo/AsistClaseCl17.php';
$idM= $_GET['idM']; 
$IdS= $_GET['idS']; 
 $asist = new AsistClaseCl17(); 
  $result = $asist->AsistClaseCl17_BuscaEst($idS,$idM);
if($result){


// Import PHPMailer classes into the global namespace
// These must be at the top of your script, not inside a function
/*require_once "../../Modelo/conexion.php";
$con = new conexion();
$result = $con->query("CALL PaEstTb03_VerificarAsis(\"22\",\"2\")");
if($result){*/
?>

<?php echo 'si hay result: '; 
$mail = new PHPMailer(true);                              // Passing `true` enables exceptions
try {
    //Server settings
    $mail->SMTPDebug = 2;                                 // Enable verbose debug output
    $mail->isSMTP();    	// Set mailer to use SMTP
    //GMAIL
	$mail->Host = 'smtp.gmail.com';  // Specify main and backup SMTP servers
	$mail->Username = 'websisae@gmail.com';
	$mail->Password = 'sisae2017';                           // SMTP password
    $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
    $mail->Port = 587;						// TCP port to connect to
	$mail->SMTPAuth = true;                               // Enable SMTP authentication     
 $body = file_get_contents('contents.html');
  $mail->CharSet = 'UTF-8'; 
    //Recipients

      // Add a recipient

    //Content
    while($row = $result->fetch_assoc()){  echo $row["Cedula"]; 
         $CedEst=$row['CedulaEst'];
         $NomEst=$row['NombreEst'];
         $ApEst1=$row['Apellido1'];
         $ApEst2=$row['Apellido2'];
         $CedEnc=$row['CedulaEnc'];
         $NomEnc=$row['NombreEnc'];
         $ApEnc1=$row['Apellido1Enc'];
         $ApEnc2=$row['Apellido2Enc'];
         $Email=$row['CorrEnc']; 

                   
    $mail->isHTML(true);                                  // Set email format to HTML
    $mail->Subject = 'Notificación de Asistencia a Clases';
    /*$mail->Body    = "El estudiante <?php echo $NomEst; ?> <?php echo $ApeEst1; ?> no se encuentra en la clase correspondiente agradezco su verificación.</b>";*/

            $mail->setFrom('websisae@gmail.com', 'Administrador');
            $mail->AltBody = 'Para ver el menasje, please use un  visor de email compatible con HTML';
            $mail->msgHTML($body);
            $mail->addAddress($Email, $NomEnc); 
             if (!$mail->send()) {
        echo "Mailer Error:" . $mail->ErrorInfo . "<br />";
        break; //forzamos la salida del bucle en caso de error
    } 
            echo 'Correo Enviado';
            $mail->ClearAddresses(); // Limpia los "Address" cargados previamente para volver a cargar uno.
    }
} catch (Exception $e) {
    echo 'Correo No Enviado. Error: ', $mail->ErrorInfo;
}
?>    
<?php
}?>

    
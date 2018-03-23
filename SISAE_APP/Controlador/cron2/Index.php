
<?php
require_once '../../Modelo/AsistClaseCl17.php';
$busq= $_GET['Id_Est'];
 $asist = new AsistClaseCl17(); 
  $result = $asist->AsistClaseCl17_BuscaEst($busq);
if($result){
?>

<?php
// Import PHPMailer classes into the global namespace
// These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

//Load Composer's autoloader
require 'vendor/autoload.php';

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

    //pulse.com
	/*$mail->Host = 'smtp-pulse.com';
	$mail->Username = 'websisae@sisae.ga';
	$mail->Password = 'sisae2017web';                           // SMTP password
    $mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
    $mail->Port = 465; 
	$mail->setFrom('websisae@sisae.ga', 'Administrador');*/    

    //Recipients
	$mail->setFrom('websisae@gmail.com', 'Administrador');
    $mail->addAddress('chepe352014@gmail.com', 'José');     // Add a recipient

    //Attachments
   // $mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
   // $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

    //Content
/*    
    while($row = $result->fetch_assoc()){
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
    $mail->Subject = "Se le notifica que el estudiante <?php echo $NomEst; ?> no está en clases!";
    $mail->Body    = "El estudiante <?php echo $NomEst; ?> <?php echo $ApeEst1; ?> no se encuentra en la clase correspondiente agradezco su verificación.</b>";
        
        $mail->send();
    echo 'Correo Enviado';
    }*/
    
             $mail->isHTML(true);                                  // Set email format to HTML
    $mail->Subject = "Se le notifica que el estudiante  no está en clases!";
    $mail->Body    = "El estudiante  no se encuentra en la clase correspondiente agradezco su verificación.</b>";
        
        $mail->send();
    echo 'Correo Enviado';

} catch (Exception $e) {
    echo 'Correo No Enviado. Error: ', $mail->ErrorInfo;
}
?>    
<?php
}?>

    
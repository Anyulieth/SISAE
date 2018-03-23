<?php
$busq= "CALL VerificarAsis($_GET[busqueda])";
 $est = new AsistClaseCl17(); 
  $result = $est->AsistClaseCl17_BuscaEst($busq);
?>

<?php 
//Libreria PHPMailer
require 'PHPMailer/src/PHPMailer.php'

$mail = new PHPMailer();
 
// Activamos el servicio SMTP
$mail->isSMTP();
// Activamos / Desactivamos el "debug" de SMTP 
// 0 = Apagado 
// 1 = Mensaje de Cliente 
// 2 = Mensaje de Cliente y Servidor 
$mail->SMTPDebug = 2; 
 
// Log del debug SMTP en formato HTML 
$mail->Debugoutput = 'html'; 
 
// Servidor SMTP (para este ejemplo utilizamos gmail) 
$mail->Host = 'smtp.gmail.com'; 
 
// Puerto SMTP 
$mail->Port = 587; 
 
// Tipo de encriptacion SSL ya no se utiliza se recomienda TSL 
$mail->SMTPSecure = 'tls'; 
 
// Si necesitamos autentificarnos 
$mail->SMTPAuth = true; 
 
// Usuario del correo desde el cual queremos enviar, para Gmail recordar usar el usuario completo (usuario@gmail.com) 
$mail->Username = "chepe352013@gmail.com"; 
 
// Contraseña 
$mail->Password = "deusexmachine"; 
 
// Creamos la sentencias SQL 
while($row=mysqli_fetch_array($result)){
            
         $CedEst=$row['CedulaEst'];
         $NomEst=$row['NombreEst'];
         $ApEst1=$row['Apellido1'];
         $ApEst2=$row['Apellido2'];
         $CedEnc=$row['CedulaEnc'];
         $NomEnc=$row['NombreEnc'];
         $ApEnc1=$row['Apellido1Enc'];
         $ApEnc2=$row['Apellido2Enc'];
         $Email=$row['CorrEnc'];
			

//$result = $db->query("SELECT * FROM personas");
 
// Iniciamos el "bucle" para enviar multiples correos. 
 
while($row = $result->fetch_assoc()) { 
    //Añadimos la direccion de quien envia el corre, en este caso Codejobs, primero el correo, luego el nombre de quien lo envia. 
 
 
    $mail->setFrom('chepe352013@gmail.com', 'José Molina Cascante'); 
    $mail->addAddress($Email, $NomEnc); 
 
    //La linea de asunto 
    $mail->Subject = 'Se le notifica que el estudiante !'; 
 
    // La mejor forma de enviar un correo, es creando un HTML e insertandolo de la siguiente forma, PHPMailer permite insertar, imagenes, css, etc. (No se recomienda el uso de Javascript) 
 
    $mail->msgHTML(file_get_contents('contenido.html'), dirname(__FILE__)); 
 
    // Enviamos el Mensaje 
    $mail->send(); 
 
    // Borramos el destinatario, de esta forma nuestros clientes no ven los correos de las otras personas y parece que fuera un único correo para ellos. 
    $mail->ClearAddresses(); 
}  
?>


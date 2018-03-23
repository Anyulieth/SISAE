<?php /*
$idEst= $_GET['ced']; 
require_once '../../../Modelo/EstCl02.php';
$est = new EstCl02();
$result = $est->EstCl02_ListaEmailEnc($idEst);
  if($result){ 
 foreach ($result as $r):*/ ?> 
      <div class="panel-group">
   <div class="panel panel-default">
    <div class="panel-heading"></div>
    <div class="panel-body"> 
        <form id="enviar"  method="POST">
           <div class="form-group">
              <label>Para: </label> 
              <input type="email" id="email"  name="email" class="form-control" ><!--readonly      value="<?php// echo $r["Email"]; ?>"   --> 
           </div> 
           <div class="form-group">
               <label>Asunto: </label>
               <input type="text" id="subject" name="subject" class="form-control" >
           </div>
           <div class="form-group">
                <label>Mensaje: </label>
                <textarea name="mensaje" id="mensaje" class="form-control" rows="8"></textarea>
           </div>                        
           <div class="form-group">
                <input type="submit" name="submit" class="btn btn-primary btn-lg" value="Enviar" />
           </div>                      
         </form>   
       </div>
     </div>
   </div>

    
    <script type="text/javascript">
      $('#enviar').submit(function(e) {
        e.preventDefault();
        $.post('EnviarCorreo.php', $('#enviar').serialize(), function(data) {
          if (!data) {
            swal('Ups...', 'Algo salió mal!', 'error');
          } else {
            swal('Enviado!', 'El correo fue enviado.', 'success')
          }
        }); 
      });
    </script>
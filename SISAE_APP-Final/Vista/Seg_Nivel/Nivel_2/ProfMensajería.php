<?php
require_once '../../../Modelo/ProfCl03.php';
session_start();
$prof = new ProfCl03();
$result = $prof -> ProfCl03_ListaEmail($_SESSION['usuario']);
?>

<div class="container" style="font-size:13px;">
<h2 class="page-header" style="background-color:#6b6bec;color:white;">MENSAJERÍA</h2>
 <div class="panel-group" id="h">
  <?php  
               foreach ($result as $r)
                {  
                ?> 
<div class="panel panel-default">
    <div class="panel-heading">
      <a href="#<?php echo $r["Id"]; ?>" data-toggle="collapse" data-parent="#h">#<?php echo $r["Id"]; ?>    Destinatario: <?php echo $r["Destinatario"]; ?></a>
    </div>
<div id="<?php echo $r["Id"]; ?>" class="panel-collapse collapse">
    <div class="panel-body">  
        <form role="form" id="reenviar"  method="POST">       
           	<label name="fecha" style="float:right">Fecha de envío: <?php echo $r["Fecha"]; ?></label>  <br>        
            <label id="email" name="email">Para: </label> <?php echo $r["Destinatario"]; ?> <br>         
            <label name="prof">De: </label> <?php echo $r["Prof"]; ?> <br>            
            <label id="subject" name="subject" >Asunto: </label> <?php echo $r["Asunto"]; ?> <br>         
            <label id="mensaje" name="mensaje">Mensaje: </label> <?php echo $r["Mensaje"]; ?> <br><br>             
            <label name="Estado" >Estado: </label> <?php echo $r["Estado"]; ?> <br>
    		<input type="button"  style="display:none;" data-id="<?php echo $r["Id"]; ?>" id="btnReenviar" class="btn btn-info pull-right btn-md" value="<?php echo $r['Estado'];?>"Reenviar /><!--Boton oculto-->       
         </form>  
       </div>	<!--PANEL-BODY--> 
</div>
     </div>	<!--PANEL-DEFAULT--> 
     <?php } ?>  
   </div>  <!--PANEL-GROUP-->
</div>  

<script type="text/javascript">
	function mostrar() {
		if (document.getElementById('btnReenviar').value == 'Fallido') {
			document.getElementById('btnReenviar').style.display = 'block';
		} else {//oculta el div
			document.getElementById('btnReenviar').style.display = 'none';
		}
	}

	mostrar();

$("#reenviar").click(function() {
      id = $(this).data("id");
      $.get("Vista/Seg_Nivel/Nivel_2/ReenvioManual.php", "id=" + id, function(data) {
        $("#tabla-reenvio").html(data);
      });
      $('#Modal_CorreoR').modal('show');
    }); 

 /* $('#reenviar').submit(function(e) {
    e.preventDefault();
    $.post('Vista/Seg_Nivel/Nivel_2/CorreoProf.php', $('#reenviar').serialize(), function(data) {
      if (!data) {
        swal('Ups...', 'Algo salió mal!', 'error');
      } else {
        swal('Enviado!', 'El correo fue enviado.', 'success')
      }
    });
  });

	$('#reenviar').submit(function(e) {
		e.preventDefault();
		var param = {
			'email' : $('#email').val(),
			'subject' : $('#subject').val(),
			'mensaje' : $('#mensaje').val()
		};
		$.ajax({
			url : 'Vista/Seg_Nivel/Nivel_2/ReenvioCorreo.php',
			data : param,
			success : function(data) {
				//swal('Enviado!', 'El correo fue enviado.', 'success')
			}
		});
	});*/
</script> 
  <div class="modal fade" id="Modal_CorreoR" role="dialog" >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Enviar Comunicado a Encargado de Familia REENVIAR</h4>
        </div>
        <div class="modal-body">
        <div id="tabla-reenvio"></div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
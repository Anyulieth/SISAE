<?php
require_once '../../../Modelo/conexion.php';
$con = new conexion();
session_start();
$result = $con -> query("CALL PaCorreoProfTb36_ListarEmailEnc($_SESSION['usuario'])");
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
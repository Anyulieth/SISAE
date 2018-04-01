<?php require_once '../../../Modelo/ProfCl03.php'; 
session_start();
$prof = new ProfCl03();
$result = $prof->ProfCl03_ListaEmail($_SESSION['usuario']);
?>

<div class="container">
<h2 class="page-header" style="background-color:#6b6bec;color:white;">MENSAJERÍA</h2>
<table class="table table-hover" style="font-size:13px;">
<thead>
  <th>#</th><th>Email Encargado</th>
</thead>
<?php foreach($result as $r):?>
	<tbody>
		<tr data-toggle="collapse" data-target="#accordion" class="clickable">
			<td>
				<?php echo $r["Id"];?>
			</td>
			<td>
				<?php echo $r["Destinatario"];?>
			</td>
		</tr>
		<tr>
            <td colspan="2">
                <div id="accordion" class="collapse">
 <div class="panel-group">
   <div class="panel panel-default">
    <div class="panel-heading"></div>
    <div class="panel-body"> 
        <form id="reenviar"  method="POST">
           <div class="form-group">
           	<label name="fecha" style="float:right">Fecha de envío: <?php echo $r["Fecha"]; ?></label>  <br>
           </div>
              <div class="form-group">
              	<label name="email">Para: </label> <?php echo $r["Destinatario"]; ?> <br>
              </div>
               <div class="form-group">
               	<label name="prof">De: </label> <?php echo $r["Prof"]; ?> <br>
               </div>
              <div class="form-group">
              <label name="subject" >Asunto: </label> <?php echo $r["Asunto"]; ?> <br>
              </div>
              <div class="form-group">
              	<label name="mensaje">Mensaje: </label> <?php echo $r["Mensaje"]; ?> <br><br>
              </div>
              <div class="container">
               <div class="panel panel-warning" style="width:500px;">
    <div class="panel-heading" > Estado de envío del correo</div>
    <div class="panel-body" > 
<label name="Estado" >Estado: </label> <?php echo $r["Estado"]; ?> <br>
    	
    	<div id="btnReenviar"><input type="hidden" name="id" value="<?php echo  $r["Id"]; ?>">
    	<button type="submit"  class="btn btn-info pull-right btn-md disabled">Reenviar</button> </div>
           </div>    </div>    </div>    <!--CONTAINER-->        
         </form>   
       </div>	<!--PANEL-BODY-->
     </div>	<!--PANEL-DEFAULT-->
   </div>  <!--PANEL-GROUP-->
                </div> <!--ACCORDION-->
            </td>
        </tr>
	</tbody>

<?php endforeach;?>
</table>
</div>	   
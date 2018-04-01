<?php require_once '../../../Modelo/conexion.php'; 
$id_sec = $_REQUEST['secc'];
$mater = $_REQUEST['idma'];
$con = new conexion();
$resultado = $con->query("CALL PaSecEstTb28_Listar_Asist(\"$id_sec\")");
$cont = 0;
?>
<table class="table table-bordered table-hover" style="font-size:13px;">
<thead>
  <th>P</th>
  <th>A</th>
  <th>J</th>
  <th>Nombre</th>
  <th>1° Apellido</th>
  <th>2° Apellido</th>
  <th>Cédula</th>
  <th>Comunicado</th>
</thead>
<?php while ($r=$resultado->fetch_array()):?>
<tr>
	  <?php $cont++;?>
   <td><label class="cont"><input type="radio" value="Presente:<?php echo $r['Cedula'];?>" id="" name="<?php echo $cont;?>"><span class="checkmark"></span></label></td>
   <td><label class="cont"><input type="radio" value="Ausente:<?php echo $r['Cedula'];?>" id="" name="<?php echo $cont;?>"><span class="checkmark"></span></label></td>
   <td><label class="cont"><input type="radio" value="Justificado:<?php echo $r['Cedula'];?>" id="" name="<?php echo $cont;?>"><span class="checkmark"></span></label></td>
  <td><?php echo $r["Nombre"]; ?></td>
  <td><?php echo $r["Apellido1"]; ?></td>
  <td><?php echo $r["Apellido2"]; ?></td>
  <td><?php echo $r["Cedula"]; ?></td>
  <td style="width:50px;">
    <a href="#" data-id="<?php echo $r["Cedula"];?>" style="width:80px" class="btn btn-correo btn-sm btn-success">Encargado</a>
    <script>
$(".btn-correo").click(function(){
  id = $(this).data("id");
   $.get("Vista/Seg_Nivel/Nivel_2/CorreoProf.php","ced="+id,function(data){
        $("#tabla-correo").html(data); 
      });
      $('#Modal_Correo').modal('show'); 
});
</script>
  </td>
</tr>
<?php endwhile;?>
</table>

<button class="btn btn-success" id="proce">Procesar</button>

<script type="text/javascript">
	$('#proce').click(function(){
    var param='';
    swal({
        title: '¿Está seguro?',
        text: "Se guardará la lista!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Guardar!',
        }).then(function(){
          for(var i=1;i<= <?php echo $cont;?>;i++){
            param += $("input:radio[name="+i+"]:checked").val()+';';
          }
            var env = {'est':param, 'idma':'<?php echo $mater;?>'}
           $.ajax({
            url:'Vista/Seg_Nivel/Nivel_2/GuardarAsistencia.php',
            data:env,
            success:function(data){
              if(data!=1){swal('Algo salió mal','No se pudo guardar','error');}
              else if(data=1){swal('Guardada!','La lista se guardó exitosamente','success');
              $('#tabla').html('');
            }
            }
            })/*.done(function(){
              var idp = {'idM':<?php echo $mater;?>, 'idS':$id_sec };
$.ajax({      
      url:"Controlador/cron2/Index.php",
        data: idp,
        success:function(data){ 
        }
}); 
    swal('Agregado!', 'El registro fue agregado.', 'success');
        });*/
  }); });
</script>

  <div class="modal fade" id="Modal_Correo" role="dialog" >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Enviar Comunicado a Encargado de Familia</h4>
        </div>
        <div class="modal-body">
        <div id="tabla-correo"></div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
<?php include "C:/xampp/htdocs/SISAE_APP/Controlador/Sec-Grupo/ListarSeccion.php";
if($result->num_rows>0):?>
<table class="table table-bordered table-hover">
<thead>
  <th>ID Seccion</th>
  <th>Grado</th>
  <th>Numero de grupo</th>
  <th>Cupo</th>
  <th></th>
</thead>
<?php while ($r=$result->fetch_array()):?>
<tr>
  <td><?php echo $r["ID_Seccion"]; ?></td>
  <td><?php echo $r["Grado"]; ?></td>
  <td><?php echo $r["Num_grupo"]; ?></td>
  <td><?php echo $r["cupo"]; ?></td>
  
  <td style="width:150px;">
    <a data-id="<?php echo $r["ID_Seccion"];?>" class="btn btn-edit btn-sm btn-warning" style="width:60px">Editar</a>
    <a href="#" id="bor-<?php echo $r["ID_Seccion"];?>" class="btn btn-sm btn-danger" style="width:60px">Eliminar</a>
    <script>
    $('#bor-'+<?php echo $r['ID_Seccion']?>).click(function(e){
      e.preventDefault();
      p = confirm('Esta Seguro??');
      if(p){$.get('Controlador/Sec-Grupo/EliminarSeccion.php','id_sec='+<?php echo $r['ID_Seccion']?>,function(data){
        if(!data){alert('Se produjo un error');}
        else{
        $('#tabla').html('');
        CargarTabla();
        }
      });}
    });
</script>
      </td>
</tr>
<?php endwhile;?>
</table>
<?php else:?>
  <p class="alert alert-warning">No hay resultados</p>
<?php endif;?>
<script>
$(".btn-edit").click(function(){
      id = $(this).data("id");
      $.get("Controlador/Sec-Grupo/Formulario_Edit_Sec.php","id_sec="+id,function(data){
        $("#form-Editar").html(data);
      });
      $('#Modal_Editar').modal('show');
    });
</script>

<div class="modal fade" id="Modal_Editar" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Actualizar</h4>
        </div>
        <div class="modal-body">
        <div id="form-Editar"></div>
        </div>

      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
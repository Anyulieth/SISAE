<?php
require_once '../../Modelo/HorarioCl27.php';
  $busq =$_GET['busqueda'];
  $por_pagina = 10;
  $inicio = 0;
  $ho = new HorarioCl27(); 
  $result = $ho->HorarioCl27_BuscaHoD($busq);
  $total = count($result);
  $total_botones = ceil($total/$por_pagina);
  if($result){ 
  ?> 
 
  <?php if($total>$por_pagina):?>
<div class="table-pagination pull-right">
  <div class="scrollmenu" style="overflow:auto;white-space:nowrap;max-width:140px;">
  <?php for($i=1;$i<=$total_botones;$i++):?>
    <a type="submit" class="btn btn-pag btn-xs btn-default" style="font-size:10px;" data-id="<?php echo $i;?>"><?php echo $i;?>
    </a>  
  <?php endfor;?>
</div>
</div>
<?php endif;?>

<label style="float:right;margin-right:8px;">Total <?php echo $total;?></label>

<table class="table table-bordered table-hover" style="font-size:13px;">
<thead>
<thead>
  <th>Id</th>
  <th>Día</th>
  <th>Hora Inicio</th>
  <th>Hora Fin</th>
  <th>Opciones</th>
<tbody>
<?php foreach ($result as $r){ ?>
<tr>
  <td><?php echo $r["Id"]; ?></td>
  <td><?php echo $r["Dia"]; ?></td>
  <td><?php echo $r["Hora_Inicio"]; ?></td>
  <td><?php echo $r["Hora_Fin"]; ?></td>
  <td style="width:270px;">
    <a data-id="<?php echo $r["Id"];?>" class="btn btn-edit btn-sm btn-warning" style="width:60px">Editar</a>
    <a href="#" id="bor-<?php echo $r["Id"];?>" class="btn btn-sm btn-danger" style="width:60px">Eliminar</a>
    <a href="#" data-id="<?php echo $r["Id"];?>" style="width:60px" class="btn btn-asig btn-sm btn-success">Asignar</a>
     <a href="#" data-id="<?php echo $r["Id"];?>" style="width:60px" class="btn btn-Ver btn-sm btn-info">Ver</a>
    <script>
      $('#bor-'+<?php echo $r['Id']?>).click(function(e){
       e.preventDefault();
      swal({
        title: '¿Está seguro?',
        text: "No se puede recuperar el dato!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, Eliminar',
        }).then(function () {
          swal({
  title: 'Procesando',
  text: 'Su petición se esta procesando',
  imageUrl: './Public/img/Loading.gif',
  showConfirmButton:false,
  imageWidth: 130,
  animation:false,
});
          //ELIMINA
      $.ajax({
      url:'./Controlador/Horarios/EliminarHo.php',
      type:'GET',
      data:'idH='+<?php echo $r['Id']?>,
      success:function(data){
    if(data!=1){swal('Ups...', 'Algo salió mal!', 'error')}
    else{
    $('#tabla').html('');
    swal('Eliminado!','El registro fue eliminado.','success')    
              } 
      }
    });
   });
  });
    </script>
      </td>
</tr>
 <?php
               }?>       
     </tbody>

</table>    
     <?php
}else {?>
<p class="alert alert-warning">No hay resultados</p>
<?php 
}
?>

<script>
$(".btn-edit").click(function(){
      id = $(this).data("id");
      $.get("Controlador/Horarios/Formulario_Editar_Horario.php","idH="+id,function(data){
        $("#form-Editar").html(data); 
      });
      $('#Modal_Editar').modal('show');      
    }); 

$(".btn-pag").click(function(e){
  pg = $(this).data("id");
  CargarTabla(pg);
});

$(".btn-asig").click(function(){
  idH = $(this).data("id");
   $.get("Controlador/Horarios/Tabla_Asigna_ProfHora.php","idH="+idH,function(data){
      $("#tabla-matri").html(data);
    });
    $('#Modal_Matri').modal('show');
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

  <div class="modal fade" id="Modal_Matri" role="dialog" >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Asignar Horario a Profesor</h4>
        </div>
        <div class="modal-body">
          <div id="tabla-matri"></div>
        </div><div class="modal-footer">
        <button type="button" class="btn btn-primary guardar" data-dismiss="modal">Guardar</button>
      </div>
      </div><!-- /.modal-content -->  
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
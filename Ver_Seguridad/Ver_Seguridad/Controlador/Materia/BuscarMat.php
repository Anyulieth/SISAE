<?php
require_once '../../Modelo/MateriaCl16.php';

  $busq =$_GET['busqueda'];
  $por_pagina = 10;
  $inicio = 0;
 $mat = new MateriaCl16();  
  $result = $mat->MateriaCl16_BuscaMat($busq);
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
	<th>Id</th>
	<th>Nombre</th>
	<th>Opciones</th>
</thead>
<tbody>
<?php foreach ($result as $r){ ?>
<tr>
	<td><?php echo $r["Id"]; ?></td>
	<td><?php echo $r["Nombre"]; ?></td>
	<td style="width:280px;">
    <a data-id="<?php echo $r["Id"]; ?>" class="btn btn-edit btn-sm btn-warning" style="width:60px">Editar</a>
    <a href="#" id="bor-<?php echo $r["Id"]; ?>" class="btn btn-sm btn-danger" style="width:60px">Eliminar</a>
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
      url:'./Controlador/Materia/EliminarMat.php',
      type:'GET',
      data:'idm='+<?php echo $r['Id']?>,
      success:function(data){
    if(data!=1){swal('Ups...', 'Algo salió mal!', 'error')}
    else{
    $('#tabla').html('');
    CargarTabla(<?php echo $pagina; ?>);
    swal('Eliminado!','El registro fue eliminado.','success')    
          } 
      }
    });
   });
  });
    </script>
      <a href="#" data-id="<?php echo $r["Id"];?>" style="width:130px" class="btn btn-asig btn-md btn-success">Asignar Profesor</a>
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
	$(".btn-edit").click(function() {
		id = $(this).data("id");
      $.get("Controlador/Materia/Formulario_Editar_Mat.php","idm=" + id,function(data){
        $("#form-Editar").html(data);
		});
		$('#Modal_Editar').modal('show');
	});

  $(".btn-pag").click(function(e){
  pg = $(this).data("id");
  CargarTabla(pg);
});

  $(".btn-asig").click(function(){
  idma = $(this).data("id");
   $.get("Controlador/Materia/Tabla_Asignar_Prof.php","idm="+idma,function(data){
        $("#tabla-asignar").html(data); 
      });
      $('#Modal_Asigna').modal('show'); 
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
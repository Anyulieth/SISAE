<?php require_once '../../../Modelo/UsuCl01.php';
$pagina = $_REQUEST['pagina'];
$por_pagina = 10;
$inicio = ($pagina -1)*$por_pagina;
$usu = new UsuCl01(); 
$result = $usu->UsuCl01_Lista_Privilegios($inicio,$por_pagina);
$total = $usu->UsuCl01_Cantidad();
$total_botones = ceil($total/$por_pagina);
$total_botones = ceil($total/$por_pagina);
if($total>$por_pagina):?>
<div class="table-pagination pull-right">
  <div class="scrollmenu" style="overflow:auto;white-space:nowrap;max-width:140px;">
  <?php for($i=1;$i<=$total_botones;$i++):?>
    <a type="submit" class="btn btn-pag btn-xs btn-default" style="font-size:10px;" data-id="<?php echo $i; ?>"><?php echo $i; ?>
    </a>  
  <?php endfor; ?>
</div> 
</div>
<?php endif; ?>
<label style="float:right;margin-right:8px;">Total <?php echo $total; ?></label>

<table class="table table-bordered table-hover" style="font-size:13px;">
<thead>
  <th>Cedula</th>
  <th>Nombre</th>
  <th>1° Apellido</th>
  <th>2° Apellido</th>
  <th>Roles</th>
  <th>Privilegios</th>
   <th>Opciones</th>
</thead>
<tbody>
  <?php 
  while ($r = $result->fetch_array()) {
  ?>
<tr>
  <td><?php echo $r["Cedula"]; ?></td>
  <td><?php echo $r["Nombre"]; ?></td>
  <td><?php echo $r["Apellido1"]; ?></td>
  <td><?php echo $r["Apellido2"]; ?></td>
  <td><?php $arr = str_split($r["Rol"]); foreach($arr as $rol){if($rol==1){echo 'Administrador ';}elseif($rol==2){echo 'Profesor ';}elseif($rol==3){echo 'Funcionario ';}else{echo 'Encargado ';} }?></td>
  <td><?php echo $r["Detalle"]; ?></td>
  <td style="width:150px;">
    <a data-id="<?php echo $r["Cedula"]; ?>" class="btn btn-edit btn-sm btn-success" style="width:140px">Editar Privilegios</a>
      </td>
</tr>

 <?php
}
          ?>
     </tbody>
</table>

<script>
	$(".btn-edit").click(function() {
		id = $(this).data("id");
		$.get("Controlador/Usuario/EditarPrivilegios.php", "ced=" + id, function(data) {
			$("#form-Editar").html(data);
		});
		$('#Modal_Editar').modal('show');
	});

	$(".btn-pag").click(function(e) {
		pg = $(this).data("id");
		CargarTabla(pg);
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
        </div>
        <div id="form-Editar">
        </div>
        <div class="modal-footer"> </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
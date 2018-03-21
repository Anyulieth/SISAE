<!DOCTYPE html>
<html>
<head>

</head>
<body>
<!--
      <form class="form-inline" role="search" id="buscar" style="float:left;">
        <div class="form-group">
          <input type="text" name="busqueda" class="form-control" placeholder="Buscar" onkeyup="bus();" id="busc">
        </div>
        <button type="submit" class="btn btn-default">
          &nbsp;<i class="glyphicon glyphicon-search"></i>&nbsp;
        </button>
      </form> -->
</body>
</html>


<?php require_once '../../Modelo/EstCl02.php';
$est = new EstCl02();
$result = $est->EstCl02_ListaAsignacion();
$iden= $_GET['ced']; 
if($result->num_rows>0):?>
<table class="table table-bordered table-hover" style="font-size:13px;">
<thead> 
	<th>Cédula</th>
	<th>Nombre</th>
  <th>1° Apellido</th>
  <th>2° Apellido</th>
	<th>Opciones</th>
</thead>
<?php while ($r=$result->fetch_array()):?>
<tr>
	<td><?php echo $r["Cedula"]; ?></td>
	<td><?php echo $r["Nombre"]; ?></td>
  <td><?php echo $r["Apellido1"]; ?></td>
  <td><?php echo $r["Apellido2"]; ?></td>
  <td><a href="#" data-id="<?php echo $r["Cedula"];?>" class="btn btn-agre btn-md btn-success" style="width:80px;">Asignar</a></td>
</tr>
<?php endwhile;?>
</table>
<?php else:?>
  <p class="alert alert-warning">No hay resultados</p>
<?php endif;?>

<script type="text/javascript">
$('.btn-agre').click(function(){
idest = $(this).data('id');
var parametros = {"idenc":"<?php echo $iden;?>","idest":idest};
$.ajax({
    url:"Controlador/Estudiante/Asignar_Est.php",
    data: parametros,
    success:function(data){
       $('#Modal_Asigna').modal('hide');
       $('body').removeClass('modal-open');
       $('.modal-backdrop').remove();
       swal('Agregado!', 'El registro fue agregado.', 'success');
    }
});
});

      function bus() {
        var par = {
          'busqueda' : $('#busc').val(), "idenc":"<?php echo $iden;?>"
        };
        $.ajax({
          url : "Controlador/Estudiante/Buscar.php",
          data : par,
          success : function(data) {
            $('#tabla-asignar').html(data);
          }
        }) 
      }
</script>
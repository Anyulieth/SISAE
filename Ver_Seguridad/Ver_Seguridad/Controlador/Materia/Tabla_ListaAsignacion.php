<?php require_once '../../Modelo/MateriaCl16.php';
//require_once '../../Vista/Seg_Nivel/Nivel_1/TablaMat.php';
//$id_Materia = $_GET['idm']; 
$mat = new MateriaCl16();
$result = $mat->MateriaCl16_ListaAsignacion();
if($result):?>
<table class="table table-bordered table-hover" style="font-size:13px;">
<thead> 
  <th>Id</th>
  <th>Materia</th>
  <th>Cédula</th>
  <th>Profesor Asignado</th>
	<th></th>
</thead>
<?php foreach ($result as $r):?>
<tr>
	<td><?php echo $r["Id"]; ?></td>
  <td><?php echo $r["Materia"]; ?></td>
  <td><?php echo $r["Cedula"]; ?></td>
  <td><?php echo $r["Asignado"]; ?></td>
  <td><a href="#" data-id="<?php echo $r["Cedula"];?>" class="btn btn-agre btn-md btn-success" style="width:80px;">Asignar</a></td>
</tr>
<?php endforeach;?>
</table>
<?php else:?>
  <p class="alert alert-warning">No hay resultados</p>
<?php endif;?>

<script type="text/javascript">
$(".btn-agre").click(function(){
  idp = $(this).data("id");
   $.get("Controlador/Materia/Tabla_Asignar_Prof.php","idm="+idm,function(data){
        $("#tabla-lista").html(data); 
      });
      $('#ModalA').modal('show'); 
});

</script>
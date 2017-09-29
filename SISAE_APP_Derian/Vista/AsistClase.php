
     <div class="col-sm-6 col-sm-offset-4 col-md-11 col-md-offset-1">
          <h1 class="page-header" style="background-color:blue;color:white; ">Asistencia Clase</h1>

         <form class="form-inline" role="search" id="buscar">
      <div class="form-group">
        <input type="text" name="s" class="form-control" placeholder="Buscar">
      </div>
      <button type="submit" class="btn btn-default">&nbsp;<i class="glyphicon glyphicon-search"></i>&nbsp;</button>
  <a data-toggle="modal" href="#newModal" class="btn btn-default">Agregar</a>
    </form>

<br>
  <!-- Modal -->
 <!-- Modal -->
  <div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="newModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h4 class="modal-title">Agregar</h4> 
        </div>
				<div class="modal-body">
					<form role="form" id="agregar" method="post">
						<div class="form-group">
							<label for="IdAC">Id</label>
							<input type="text" class="form-control" name=""">
						</div>
						<div class="form-group">
							<label for="Fecha">Fecha</label>
							<input type="text" class="form-control" name="Fecha" >
						</div>
						<div class="form-group">
							<label for="Hora">Hora</label>
							<input type="text" class="form-control" name="Hora">
						</div>
						<div class="form-group">
							<label for="Estado">Estado</label>
							<input type="text" class="form-control" name="Estado">
						</div>
						<div class="form-group">
							<label for="IdMateria">Id Materia</label>
							<input type="text" class="form-control" name="IdMateria">
						</div>

						<div class="modal-footer">
							<button type="submit" class="btn btn-success">
								Agregar
							</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">
								Cancelar
							</button>
						</div>
					</form>
				</div>

			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<div id="tabla">

	</div>
	
<?php include "../Controlador/AsistClase/ListarAsistClase.php";
if($result->num_rows>0):?>
<table class="table table-bordered table-hover">
<thead>
  <th>Id</th>
  <th>Fecha</th>
  <th>Hora</th>
  <th>Estado</th>
  <th>Id Materia</th>
  <th></th>
</thead>
<?php while ($r=$result->fetch_array()):?>
<tr>
  <td><?php echo $r["Id"]; ?></td>
  <td><?php echo $r["Fecha"]; ?></td>
  <td><?php echo $r["Hora"]; ?></td>  
  <td><?php echo $r["Estado"]; ?></td>
  <td><?php echo $r["Id_Materia"]; ?></td>
  
 <td style="width:150px;">
    <a data-id="<?php echo $r["id"]; ?>" class="btn btn-edit btn-sm btn-warning">Editar</a>
    <a href="#" id="del-<?php echo $r["VcAsistClaseTb18_IdAsistClase"]; ?>" class="btn btn-sm btn-danger">Eliminar</a>
    <script>
  			$("#del-"+<?php echo $r["VcAsistClaseTb18_IdAsistClase"]; ?>).click(function(){
    e=confirm("Esta seguro??");
    if(e){$.get("../Controlador/AsistClase/EliminarAsistClase.php","id="+<?php echo $r["VcAsistClaseTb18_IdAsistClase"]; ?>
		);}
		});
</script>
      </td>
</tr>
<?php endwhile; ?>
</table>
<?php else: ?>
  <p class="alert alert-warning">No hay resultados</p>
<?php endif; ?>
</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
   
<script>
	function loadTabla() {
		$('#editModal').modal('hide');
		$("#tabla").html(data); })
	}

	$("#agregar").submit(function(e) {
		e.preventDefault();
		$.post("../Controlador/AsistClase/AgregarAsistClase.php",$("#agregar").serialize(),function(status){alert(status)});
  		$('#agregar')[0].reset();
  		$('#newModal').modal('hide');
  		loadTabla();
	});
	
	$("#buscar").submit(function(e) {
		e.preventDefault();
		$.get("./Controlador/AsistClase/BusquedaAsistClase.php", $("#buscar").serialize(), function(data) {
		$("#tabla").html(data);
		$("#buscar")[0].reset(); });
	});
	
	$(".btn-edit").click(function(){
  		id = $(this).data("id");
  		$.get("../Controlador/AsistClase/Formulario.php","id="+id,function(data){
  			$("#form-edit").html(data);
  		});
  		$('#editModal').modal('show');
  	});

</script>
  </body>
</html>
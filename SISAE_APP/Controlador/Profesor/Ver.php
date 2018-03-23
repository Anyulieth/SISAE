<?php
$idprof= $_GET['ced']; 
require_once '../../Modelo/ProfCl03.php';
$prof = new ProfCl03();
$result = $prof->ProfCl03_ListaMatri($idprof);

  if($result){ ?>
<?php foreach ($result as $r): ?> 
<div class="panel-group">
	 <div class="panel panel-default">
	 	<div class="panel-heading">Profesor: <?php echo $r["Cedula"];?></div>
	 	<div class="panel-body">
<form role="form"  method="post">
	<div class="form-group">
		<label for="nombre">Nombre Completo</label>
		<input type="text" class="form-control" name="nombre" value="<?php echo $r["Profesor"]; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="Periodo">Periodo</label>
		<input type="text" class="form-control" name="Periodo" value="<?php echo $r["Periodo"]; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="Fecha">Fecha Matrícula</label>
		<input type="text" class="form-control" name="Fecha" value="<?php echo $r["Fecha"]; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="Seccion">Sección</label>
		<input type="text" class="form-control" name="Seccion" value="<?php echo $r["Seccion"]; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="Materia">Materias</label>
		<input type="text" class="form-control" name="Materia" value="<?php echo $r["Materia"]; ?>" readonly>
	</div>
	<div class="form-group">
		<label for="Horario">Horario</label>
		<input type="text" class="form-control" name="Horario" value="<?php echo $r["Horario"]; ?>" readonly>
	</div>
	<input type="hidden" name="cedula" value="<?php echo $r['Cedula']; ?>">
</form>
</div></div>
</div>
</div>
<?php endforeach ?>     
<?php
}
?>
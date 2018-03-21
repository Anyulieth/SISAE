<?php 
require_once '../../Modelo/UsuCl01.php';
$usu = new UsuCl01();
$ced = $_GET['ced'];
$admin = $usu->Listar_Priv_Admin($ced);
$cont = 1;
 ?>
<div class="container col-lg-12">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="pill" href="#Administrador">Administrador</a></li>
    <li><a data-toggle="pill" href="#Profesor">Profesor</a></li>
    <li><a data-toggle="pill" href="#Funcionario">Funcionario</a></li>
    <li><a data-toggle="pill" href="#Encargado">Encargado</a></li>
  </ul>
  <div class="tab-content" style="height:500px">
    <div id="Administrador" class="tab-pane fade in active">
      <h3>Administrador</h3>
     <?php foreach($admin as $ad) {if($ad['Estado']=='Activo'&&$ad['Tipo']==1){ echo "<input type=\"checkbox\" value=\"$ad[Id]\" name=\"$cont\" checked>$ad[Detalle]<br>"; $cont++;}
     elseif($ad['Estado']=='Inactivo'&&$ad['Tipo']==1){ echo "<input type=\"checkbox\" value=\"$ad[Id]\" name=\"$cont\">$ad[Detalle]<br>"; $cont++;
     	} } ?>
    </div>
    <div id="Profesor" class="tab-pane fade">
      <h3>Profesor</h3>
      <?php foreach($admin as $ad) {if($ad['Estado']=='Activo'&&$ad['Tipo']==2){ echo "<input type=\"checkbox\" value=\"$ad[Id]\" name=\"$cont\" checked>$ad[Detalle]<br>"; $cont++;}
     elseif($ad['Estado']=='Inactivo'&&$ad['Tipo']==2){ echo "<input type=\"checkbox\" value=\"$ad[Id]\" name=\"$cont\">$ad[Detalle]<br>"; $cont++;
      } } ?>
    </div>
    <div id="Funcionario" class="tab-pane fade">
      <h3>Funcionario</h3>
      <p></p>
    </div>
    <div id="Encargado" class="tab-pane fade">
      <h3>Encargado</h3>
      <p></p>
    </div>
    <button class="btn btn-success" style="float:right" id="Gu-Priv">
          Guardar
    </button>
    <button type="button" class="btn btn-danger" style="float:right;margin-right:10px;" data-dismiss="modal" aria-hidden="true">Cancelar</button>
  </div>
</div>
<script type="text/javascript">
  
  $("#Gu-Priv").click(function(){
    var param='';
    swal({
        title: '¿Está seguro?',
        text: "Se guardarán los privilegios!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Guardar!',
        }).then(function(){
          var param = "";
          for(var i = 1;i< <?php echo $cont;?>;i++){
            if($("input:checkbox[name="+i+"]").prop('checked')){
              param += $("input:checkbox[name="+i+"]").val()+","+"Activo"+";";
            }else{param += $("input:checkbox[name="+i+"]").val()+","+"Inactivo"+";";}
          }
          var env = {'priv':param,'ced':'<?php echo $ced;?>'}
          $.ajax({
            url:"Controlador/Usuario/GuardarPrivilegios.php",
            data:env,
            success:function(data){if(data!=1){swal('Algo salió mal','No se pudo guardar','error');}}
          });

        });
  });

</script>
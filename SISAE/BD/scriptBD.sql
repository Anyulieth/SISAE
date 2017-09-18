use SISAE;

		/* EstTb03 */
/* Guardar Estudiante */
delimiter $
create procedure PaEstTb03_GuardarEst (in IdEst varchar(20),  in FecNacEst date, in Adecuacion varchar(20), in Estado varchar(20), in IdEspecialidad varchar(20),
in NomEst varchar(20), in Ape1 varchar(20), in Ape2 varchar(20), in Direccion varchar(20), 
in Sexo char(1), in Telefono varchar(8), in Email varchar(100))
begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdEst, NomEst, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
     insert into EstTb03 (VcEstTb03_IdEstudiante, DtEstTb03_FechaNac, VcEstTb03_Adecuacion, VcEstTb03_Estado, VcEspecialidadTb16_IdEspecialidad)
    values (IdEst, FecNacEst, Adecuacion, Estado, IdEspecialidad);
end $ 

drop procedure PaEstTb03_GuardarEst

call PaEstTb03_GuardarEst('504070202','1995/10/12','No','A','1234','Derian','Esquivel','Venegas',
'Hojancha','M','60918664','deresquivel@outlook.com')


/* Eliminar Estudiante */
delimiter $
create procedure PaEstTb03_EliminarEst(in IdEst varchar(20))
begin
	delete UsuTb01,estenctb07,gradoesptb15,asistcoletb08,inscmateriatb11,estreptb22,asistesttb23,EstTb03 from EstTb03
    inner join usutb01 on esttb03.VcEstTb03_IdEstudiante = usutb01.VcUsuTb01_Cedula
    inner join estenctb07 on esttb03.VcEstTb03_IdEstudiante = estenctb07.VcEstTb03_IdEstudiante
    inner join gradoesptb15 on esttb03.VcEstTb03_IdEstudiante = VcEstTb03_IdEstudiante
    inner join asistcoletb08 on esttb03.VcEstTb03_IdEstudiante = asistcoletb08.VcEstTb03_IdEstudiante
    inner join inscmateriatb11 on esttb03.VcEstTb03_IdEstudiante = inscmateriatb11.VcEstTb03_IdEstudiante
    inner join estreptb22 on esttb03.VcEstTb03_IdEstudiante = estreptb22.VcEstTb03_IdEstudiante
    inner join asistesttb23 on esttb03.VcEstTb03_IdEstudiante = asistesttb23.VcEstTb03_IdEstudiante
    where estt.VcEstTb03_IdEstudiante = idEst;
end $

/* Borrar Estudiante*/
delimiter $
create procedure PaEstTb03_BorrarEst(in IdEst varchar(20))
begin
update esttb03 set VcEstTb03_Estado = 'I' where VcEstTb03_IdEstudiante = IdEst;
end $




/* Actualizar Estudiante */
delimiter $
create procedure PaEstTb03_ActualizarEst(in IdEst varchar(20), in FecNacEst Date, in Adecuacion varchar(20),
in Estado varchar(20),in IdEspecialidad varchar(20),in NomEst varchar(20), 
in Ape1 varchar(20), in Ape2 varchar(20), in Direccion varchar(100), in Sexo char(1), in Telefono varchar(8), in Email varchar(100))
begin
	update usutb01,esttb03
    set usutb01.VcUsuTb01_Nombre = NomEst,
    usutb01.VcUsuTb01_Ape1 = Ape1,usutb01.VcUsuTb01_Ape2 = Ape2,usutb01.VcUsuTb01_Direccion = Direccion,usutb01.CrUsuTb01_Sexo = sexo,
    usutb01.VcUsuTb01_Telefono = Telefono,usutb01.VcUsuTb01_Email = Email,esttb03.DtEstTb03_FechaNac = FecNacEst,esttb03.VcEstTb03_Adecuacion = Adecuacion,
    esttb03.VcEstTb03_Estado = Estado,esttb03.VcEspecialidadTb16_IdEspecialidad = IdEspecialidad
    where esttb03.VcEstTb03_IdEstudiante = IdEst and usutb01.VcUsuTb01_Cedula = IdEst;
end $;


/* Buscar Estudiante */
delimiter $
create procedure PaEsrTb03_BuscarEst(in cedula varchar(20))
begin
	select u.VcUsuTb01_Cedula as 'Cedula',u.VcUsuTb01_Nombre as 'Nombre',u.VcUsuTb01_Ape1 as '1° Apellido',
    u.VcUsuTb01_Ape2 as '2° Apellido',u.VcUsuTb01_Direccion as 'Direccion',u.CrUsuTb01_Sexo as 'Sexo',
    u.VcUsuTb01_Telefono as 'Telefono',u.VcUsuTb01_Email as 'Correo electronico',e.DtEstTb03_FechaNac as 'Fecha de nacimiento',
    e.VcEstTb03_Adecuacion as 'Adecuacion',e.VcEstTb03_Estado as 'Estado',c.VcEspecialidadTb16_Nombre as 'Especialidad',
    l.VcGradoTb13_NombreGrado as 'Grado'
    from esttb03 as e inner join usutb01 as u on e.VcEstTb03_IdEstudiante = u.VcUsuTb01_Cedula
    inner join especialidadtb16 as c on e.VcEspecialidadTb16_IdEspecialidad = c.VcEspecialidadTb16_IdEspecialidad
    inner join gradotb13 as l on VcGradoTb13_IdGrado = l.VcGradoTb13_IdGrado join graesttb26 as g on e.VcEstTb03_IdEstudiante = g.VcEstTb03_IdEstudiante
    where e.VcEstTb03_IdEstudiante = cedula;
end $

drop procedure PaEsrTb03_BuscarEst

call PaEsrTb03_BuscarEst('504070202');

		/* ProfTb04 */



		/* EncTb05 */
/* Guardar Encargado */
delimiter $
create procedure PaEncTb05_GuardarEnc(in IdEnc varchar(20), in Clave varchar(20),in NomEnc varchar(20), in Ape1 varchar(20), in Ape2 varchar(20), in Direccion varchar(100), 
in Sexo char(1), in Telefono varchar(8), in Email varchar(100))
begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdEnc, NomEnc, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
	insert into EncTb05(VcEncTb05_IdEncargado, VcEncTb05_Clave)
    values (IdEnc, Clave);
end $


call PaEncTb05_GuardarEnc('402370069','1234','Fernanda','Herrera','Villalobos','Hojancha','F','62001746',
'nose@gmail.com');

/* Eliminar Encargado */
delimiter $
create procedure PaEncTb05_EliminarEnc(in IdEnc varchar(20))
begin
	delete usutb01,encreptb09,enctb05,estenctb07 from EncTb05 
    inner join usutb01 on EncTb05.VcEncTb05_IdEncargado = usutb01.VcUsuTb01_Cedula
    inner join estenctb07 on EncTb05.VcEncTb05_IdEncargado = estenctb07.VcEncTb05_IdEncargado
    inner join encreptb09 on EncTb05.VcEncTb05_IdEncargado = encreptb09.VcEncTbo5_IdEncargado
    where EncTb05.VcEncTb05_IdEncargado = IdEnc;
end $

/* Actualizar Encargado */
delimiter $
create procedure PaEncTb05_ActualizarEnc( in IdEnc varchar(20), in Clave varchar(20),in NomEnc varchar(20), 
in Ape1 varchar(20), in Ape2 varchar(20), in Direccion varchar(100), in Sexo char(1), in Telefono varchar(8), in Email varchar(100))
begin
	update enctb05,usutb01
    set Clave = enctb05.VcEncTb05_Clave,NomEnc = usutb01.VcUsuTb01_Nombre,Ape1 = usutb01.VcUsuTb01_Ape1,Ape2 = usutb01.VcusuTb01_Ape2,
    Direccion = usutb01.VcUsutb01_Direccion,Sexo = usutb01.CrUsuTb01_Sexo,Telefono = usutb01.VcUsuTb01_Telefono,
    Email = usutb01.VcUsuTb01_Email
    where IdEnc = enctb05.VcEncTb05_IdEncargado and IdEnc = usutb01.VcUsuTb01_Cedula;
end $




		/* FunTb06 */
/* Guardar Funcionario */
delimiter $
create procedure PaFunTb06_GuardarFunc(in IdFun varchar(20), in Clave varchar(20), in FechaNac date, in Estado varchar(20),
in NomFun varchar(20), in Ape1 varchar(20), in Ape2 varchar(20), in Direccion varchar(20), 
in Sexo char(1), in Telefono varchar(8), in Email varchar(20))
begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdFun, NomFun, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
    insert into EstEncTb07 ( VcFunTb06_IdFuncionario,VcFunTb06_Clave, DtFunTb06_FechaNac, VcFunTb06_Estado)
    values (IdFun, Clave, FechaNac, Estado);
end $

/* Eliminar Funcionario */
delimiter $
create procedure PaFunTb06_EliminarFunc(in IdFun varchar(20))
begin
	delete funtb06,funcreptb21,usutb01 from FunTb06
    inner join usutb01 on funtb06.VcFunTb06_IdFuncionario = usutb01.VcUsuTb01_Cedula
    inner join funcreptb21 on FunTb06.VcFunTb06_IdFuncionario = funcreptb21.VcFuncTb06_IdFuncionario
    where funtb06.VcFunTb06_IdFuncionario = IdFun;
end $

/* Borrar funcionario*/

delimiter $
create procedure PaFunTb06_BorrarFunc(in IdFun varchar(20))
begin
update funtb06
set VcFunTb06_Estado = 'I' where VcFunTb06_IdFuncionario = IdFun;
end $


/* Actualizar Funcionario */
delimiter $
create procedure PaFunTb06_ActualizarFunc(in IdFun varchar(20), in Clave varchar(20), in FechaNac date, in Estado varchar(20),
in NomFun varchar(20),in Ape1 varchar(20), in Ape2 varchar(20), in Direccion varchar(100),
in Sexo char(1), in Telefono varchar(8), in Email varchar(100))
begin
	update FunTb06,usutb01
    set Clave = funtb06.VcFunTb06_Clave, FechaNac = funtb06.DtFunTb06_FechaNac, Estado = FunTb06.VcFunTb06_Estado,
    NomFun = usutb01.VcUsuTb01_Nombre,Ape1 = usutb01.VcUsuTb01_Ape1,Ape2 = usutb01.VcusuTb01_Ape2,
    Direccion = usutb01.VcUsutb01_Direccion,Sexo = usutb01.CrUsuTb01_Sexo,Telefono = usutb01.VcUsuTb01_Telefono,
    Email = usutb01.VcUsuTb01_Email
	where IdFun = funtb06.VcFunTb06_IdFuncionario and IdFun = usutb01.VcUsuTb01_Cedula;
end $

		/* EstEncTb07 */
/* Guardar Estudiante encargado */
delimiter $
create procedure PaEstEncTb07_GuardarEstEnc(in IdEncargado varchar(20), in IdEstudiante varchar(20))
begin
	insert into estenctb07(VcEstTb03_IdEstudiante,VcEncTb05_IdEncargado)
    select e.VcEstTb03_IdEstudiante,o.VcEncTb05_IdEncargado
    from esttb03 as e,enctb05 as o
    where e.VcEstTb03_IdEstudiante = IdEstudiante and o.VcEncTb05_IdEncargado = IdEncargado; 
end $

drop procedure PaEstEncTb07_GuardarEstEnc

/* Eliminar Estudiante encargado */
delimiter $
create procedure PaEstEncTb07_EliminarEstEnc(in IdEst varchar(20))
begin
	delete estenctb07 from EstEncTb07 where VcEstEncTb07_IdEstudiante = IdEst;
end $

/* Actualizar Estudiante encargado */
delimiter $
create procedure PaEstEncTb07_ActualizarEstEnc( in IdEnc varchar(20), in IdEst varchar(20))
begin
	update EstEncTb07
    set IdEnc = VcEstEncTb07_IdEncargado, IdEst = VcEstEncTb07_IdEstudiante
    where IdEnc = VcEstEncTb07_IdEncargado;
end $

/* Buscar Estudiante encargado */
delimiter $
create procedure PaEstEncTb07_BuscarEstEnc_Est(in IdEst varchar(20))
begin
	select u.VcUsuTb01_Cedula as 'Cedula',u.VcUsuTb01_Nombre as 'Nombre',u.VcUsuTb01_Ape1 as '1° Apellido',
    u.VcUsuTb01_Ape2 as '2° Apellido',u.VcUsuTb01_Direccion as 'Direccion',u.CrUsuTb01_Sexo as 'Sexo',
    u.VcUsuTb01_Telefono as 'Telefono',u.VcUsuTb01_Email as 'Correo electronico'
    from usutb01 as u inner join enctb05 as e on u.VcUsuTb01_Cedula = e.VcEncTb05_IdEncargado
    inner join estenctb07 as l on e.VcEncTb05_IdEncargado = l.VcEncTb05_IdEncargado
     where l.VcEstTb03_IdEstudiante = IdEst;
end $

drop procedure PaEstEncTb07_BuscarEstEnc_Est

call PaEstEncTb07_BuscarEstEnc_Est('504070202');

/* Buscar Encargado estudiante */
delimiter $
create procedure PaEstEncTb07_BuscarEstEnc_Enc(in IdEnc varchar(20))
begin
	select u.VcUsuTb01_Cedula as 'Cedula',u.VcUsuTb01_Nombre as 'Nombre',u.VcUsuTb01_Ape1 as '1° Apellido',
    u.VcUsuTb01_Ape2 as '2° Apellido',u.VcUsuTb01_Direccion as 'Direccion',u.CrUsuTb01_Sexo as 'Sexo',
    u.VcUsuTb01_Telefono as 'Telefono',u.VcUsuTb01_Email as 'Correo electronico', e.DtEstTb03_FechaNac as 'Fecha de nacimiento',
    e.VcEstTb03_Adecuacion as 'Adecuacion',e.VcEstTb03_Estado as 'Estado',c.VcEspecialidadTb16_Nombre as 'Especialidad',
    l.VcGradoTb13_NombreGrado as 'Grado'
    from usutb01 as u inner join esttb03 as e on u.VcUsuTb01_Cedula = e.VcEstTb03_IdEstudiante
    join estenctb07 as p on e.VcEstTb03_IdEstudiante = p.VcEstTb03_IdEstudiante
    inner join especialidadtb16 as c on e.VcEspecialidadTb16_IdEspecialidad = c.VcEspecialidadTb16_IdEspecialidad
    inner join gradotb13 as l on VcGradoTb13_IdGrado = l.VcGradoTb13_IdGrado join graesttb26 as g on e.VcEstTb03_IdEstudiante = g.VcEstTb03_IdEstudiante
     where p.VcEncTb05_IdEncargado = IdEnc;
end $

drop procedure PaEstEncTb07_BuscarEstEnc_Enc

call PaEstEncTb07_BuscarEstEnc_Enc('402370069');



/* Listar Estudiante encargado */
delimiter $
CREATE PROCEDURE PaEstEncTb07_Listar ()
begin
	select u.VcUsuTb01_Cedula as 'Cedula',u.VcUsuTb01_Nombre as 'Nombre',
    u.VcUsuTb01_Ape1 as '1° Apellido',u.VcUsuTb01_Ape2 as '2° Apellido' from usutb01 as u
    inner join estenctb07 as e on u.VcUsuTb01_Cedula = e.VcEstTb03_IdEstudiante and u.VcUsuTb01_Cedula = e.VcEncTb05_IdEncargado
	order by e.VcEstTb03_IdEstudiante;
end $

drop procedure PaEstEncTb07_Listar

call PaEstEncTb07_Listar();










		/* AsistColeTb08*/
/* Guardar Asistencia colegio */
delimiter $
create procedure PaAsistColeTb08_GuardarAsistCole(in IdAsistCole varchar(20), in HoraEntrada time, in FechaEntrada date,
in HoraSalida time, in FechaSalida date, in IdEstudiante varchar(20))
begin
	insert into AsistColeTb08 (VcAsistColeTb08_IdAsistCole, TmAsistColeTb08_HoraEntrada, DtAsistColeTb08_FechaEntrada,
    TmAsistColeTb08_HoraSalida, DtAsistColeTb08_FechaSalida, VcEstTb03_IdEstudiante)
    values (IdAsistCole, HoraEntrada, FechaEntrada, HoraSalida, FechaSalida, IdEstudiante);
end $

/* Eliminar Asistencia colegio */
delimiter $
create procedure PaAsistColeTb08_EliminarAsistCole(in IdAsisCole varchar(20))
begin
	delete from AsistColeTb08 where VcAsistColeTb08_IdAsistCole = IdAsisCole;
end $

/* Actualizar Asistencia colegio */
delimiter $
create procedure PaAsistColeTb08_ActualizarAsistCole(in IdAsistCole varchar(20), in HoraEntrada time, in FechaEntrada date,
in HoraSalida time, in FechaSalida date, in IdEstudiante varchar(20))
begin
	update AsistColeTb08
    set IdAsistCole = VcAsistColeTb08_IdAsistCole, HoraEntrada = TmAsistColeTb08_HoraEntrada, FechaEntrada = DtAsistColeTb08_FechaEntrada,
    HoraSalida = TmAsistColeTb08_HoraSalida, FechaSalida = DtAsistColeTb08_FechaSalida, IdEstudiante = VcEstTb03_IdEstudiante;
	where IdAsistCole = VcAsistColeTb08_IdAsistCole;
end $

/* Buscar Asistencia colegio */
delimiter $
create procedure PaAsistColeTb08_BuscarAsistCole(in IdAsistCole varchar(20))
begin
	select * from AsistColeTb08
     where VcAsistColeTb08_IdAsistCole = IdAsistCole;
end $

/* Listar Asistencia colegio */
CREATE PROCEDURE PaAsistColeTb08_Listar ()
begin
	select * from AsistColeTb08
	order by VcAsistColeTb08_IdAsistCole;
end $

		/* EncRepTb09 */
/* Guardar Encargado reporte */
delimiter $
create procedure PaEncRepTb09_GuardarEncRep(in IdEnc varchar(20), in IdRep varchar(20))
begin
	insert into EncRepTb09 (VcEncTb05_IdEncargado, VcRepTb10_IdReporte)
    values (IdEnc, IdRep);
end $

/* Eliminar Encargado reporte */
delimiter $
create procedure PaEncRepTb09_EliminarEncRep(in IdEnc varchar(20))
begin
	delete from EncRepTb09 where VcEncTb05_IdEncargado = IdEnc;
end $

/* Actualizar Encargado reporte */
delimiter $
create procedure PaEncRepTb09_ActualizarEncRep(in IdEnc varchar(20), in IdRep varchar(20))
begin
	update EncRepTb09
    set IdEnc = VcEncTb05_IdEncargado, IdRep = VcRepTb10_IdReporte;
    where IdEnc = VcEncTb05_IdEncargado;
end $

/* Buscar Encargado reporte */
delimiter $
create procedure PaEncRepTb09_BuscarEncRep( in IdEncRep varchar(20))
begin
	select * from EncRepTb09
     where VcEncTb05_IdEncargado = IdEncRep;
end $

/* Listar Encargado reporte */
CREATE PROCEDURE PaEncRepTb09_Listar ()
begin
	select * from EncRepTb09
	order by VcEncTb05_IdEncargado;
end $

		/* RepTb10 */
/* Guardar Reporte */
delimiter $
create procedure PaRepTb10_GuardarRep(in IdRep varchar(20), in FecRep date, in HoRep time, in IdAsiCla varchar(20))
begin
	insert into RepTb10 (VcRepTb10_IdReporte, DtRepTb10_FechaReporte, TmRepTb10_HoraReporte, VcAsistClaseTb18_IdAsistClase)
    values (IdRep, FecRep, HoRep, IdAsiCla);
end $

/* Eliminar Reporte */
delimiter $
create procedure PaRepTb10_EliminarRep(in IdRep varchar(20))
begin
	delete from RepTb10 where VcRepTb10_IdReporte = IdRep;
end $

/* Actualizar Reporte */
delimiter $
create procedure PaRepTb10_ActualizarRep(in IdRep varchar(20), in FecRep date, in HoRep time, in IdAsiCla varchar(20))
begin
	update RepTb10
    set IdRep = VcRepTb10_IdReporte, FecRep = DtRepTb10_FechaReporte,  HoRep= TmRepTb10_HoraReporte, IdAsiCla = VcAsistClaseTb18_IdAsistClase;
	where IdRep = VcRepTb10_IdReporte;
end $

/* Buscar Reporte */
delimiter $
create procedure PaRepTb10_BuscarRep(in IdRep varchar(20))
begin
	select * from RepTb10
     where VcRepTb10_IdReporte = IdRep;
end $

/* Listar Reporte */
CREATE PROCEDURE PaRepTb10_Listar ()
begin
	select * from RepTb10
	order by VcRepTb10_IdReporte;
end $

		/* InscMateriaTb11 */
/* Guardar Inscrito materia */
delimiter $
create procedure PaInscMateriaTb11_GuardarInscMat(in IdEst varchar(20), in IdMat varchar(20))
begin
	insert into InscMateriaTb11 (VcEstTb03_IdEstudiante, VcInscMateriaTb17_IdMateria)
    values (IdEst, IdMat);
end $

/* Eliminar Inscrito materia */
delimiter $
create procedure PaInscMateriaTb11_EliminarInscMat(in IdMat varchar(20))
begin
	delete from InscMateriaTb11 where VcInscMateriaTb17_IdMateria = IdMat;
end $

/* Actualizar Inscrito materia */
delimiter $
create procedure PaInscMateriaTb11_ActualizarInscMat(in IdEst varchar(20), in IdMat varchar(20))
begin
	update InscMateriaTb11
    set IdEst = VcEstTb03_IdEstudiante, IdMat = VcInscMateriaTb17_IdMateria;
    where IdEst = VcEstTb03_IdEstudiante;
end $

/* Buscar Inscrito materia */
delimiter $
create procedure PaInscMateriaTb11_BuscarInscMat(in IdMat varchar(20))
begin
	select * from InscMateriaTb11
     where VcInscMateriaTb17_IdMateria = IdMat;
end $

/* Listar Inscrito materia */
CREATE PROCEDURE PaInscMateriaTb11_Listar ()
begin
	select * from InscMateriaTb11
	order by VcInscMateriaTb17_IdMateria;
end $

		/* AsigGradoTb12 */
/* Guardar Asigna grado */
delimiter $
create procedure PaAsigGradoTb12_GuardarInscMat(in IdGra varchar(20), in IdProf varchar(20))
begin
	insert into AsigGradoTb12 (VcGradoTb13_IdGrado, VcProfTb04_IdProf)
    values (IdGra, IdProf);
end $

/* Eliminar Asigna grado */
delimiter $
create procedure PaAsigGradoTb12_EliminarInscMat(in IdMat varchar(20))
begin
	delete from AsigGradoTb12 where VcInscMateriaTb17_IdMateria = IdMat;
end $

/* Actualizar Asigna grado */
delimiter $
create procedure PaAsigGradoTb12_ActualizarInscMat(in IdGra varchar(20), in IdProf varchar(20))
begin
	update AsigGradoTb12
    set IdGra = VcGradoTb13_IdGrado, IdProf = VcProfTb04_IdProf;
    where IdGra = VcGradoTb13_IdGrado;
end $

/* Buscar Asigna grado */
delimiter $
create procedure PaAsigGradoTb12_BuscarInscMat(in IdGra varchar(20))
begin
	select * from AsigGradoTb12
     where VcGradoTb13_IdGrado = IdGra;
end $

/* Listar Asigna grado */
CREATE PROCEDURE PaAsigGradoTb12_Listar ()
begin
	select * from AsigGradoTb12
	order by VcGradoTb13_IdGrado;
end $
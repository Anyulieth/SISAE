use sisae;
/**************************************************************************************************************************************************************/
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
/*call PaEstTb03_GuardarEst('504070289','1995/10/12','No','Activo','E01','Derian','Esquivel','Venegas',
'Hojancha','M','60918664','deresquivel@outlook.com')*/

/* Buscar Estudiante */


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
/*call PaEstTb03_ActualizarEst('504070289','1995/10/12','No','Activo','E01','Sofia','Esquivel','Venegas',
'Hojancha','F','60918664','deresquivel@outlook.com')*/

/* Listar Estudiante */
delimiter $
CREATE PROCEDURE PaEstTb03_Listar ()
begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as '1° Apellido',
 UsuTb01.VcUsuTb01_Ape2  as '2° Apellido', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email', EstTb03.VcEstTb03_IdEstudiante as 'Id Estudiante',
 EstTb03.DtEstTb03_FechaNac as 'Fecha Nac', EstTb03.VcEstTb03_Adecuacion as 'Adecuacion', EstTb03.VcEstTb03_Estado as 'Estado', 
EstTb03.VcEspecialidadTb16_IdEspecialidad as 'Especialidad'
    from UsuTb01, EstTb03
    where EstTb03.VcEstTb03_IdEstudiante = UsuTb01.VcUsuTb01_Cedula
	order by EstTb03.VcEstTb03_IdEstudiante;
end $
call PaEstTb03_Listar();


/* Eliminar Estudiante */


/* Borrar Estudiante*/
delimiter $
create procedure PaEstTb03_BorrarEst(in IdEst varchar(20))
begin
update esttb03 set VcEstTb03_Estado = 'Inactivo' where VcEstTb03_IdEstudiante = IdEst;
end $
/*call PaEstTb03_BorrarEst('504070289');*/


/**************************************************************************************************************************************************************/
	/* ProfTb04 */
/* Guardar Profesor */
delimiter $
create procedure PaProfTb04_GuardarProf(in IdProf varchar(20),  in FecNacProf date, in Clave varchar(20), in Estado varchar(20),
in NomEst varchar(20), in Ape1 varchar(20), in Ape2 varchar(20), in Direccion varchar(20), 
in Sexo char(1), in Telefono varchar(8), in Email varchar(100))
begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, 
    CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdProf, NomEst, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
     insert into ProfTb04 (VcProfTb04_IdProfesor, VcProfTb04_Clave, DtProfTb04_FechaNac, VcProfTb04_Estado)
    values (IdProf, Clave, FecNacProf, Estado);
end $ 
/*call PaProfTb04_GuardarProf('116000070','1990/10/12','1234','Activo','Jose','Lopez','Venegas',
'Hojancha','M','60918664','deresquivel@outlook.com')*/

/* Buscar Profesor */
delimiter $
create procedure PaProfTb04_BuscarProf(in cedula varchar(20))
begin
	select u.VcUsuTb01_Cedula as 'Cedula', u.VcUsuTb01_Nombre as 'Nombre', u.VcUsuTb01_Ape1 as '1° Apellido',
    u.VcUsuTb01_Ape2 as '2° Apellido', u.VcUsuTb01_Direccion as 'Direccion', u.CrUsuTb01_Sexo as 'Sexo',
    u.VcUsuTb01_Telefono as 'Telefono', u.VcUsuTb01_Email as 'Correo electronico',
    p.VcProfTb04_IdProfesor as 'Id Profesor', p.DtProfTb04_FechaNac as 'Fecha de nacimiento',
    p.VcProfTb04_Clave as 'Clave', p.VcProfTb04_Estado as 'Estado'
    from ProfTb04 as p inner join usutb01 as u on p.VcProfTb04_IdProfesor = u.VcUsuTb01_Cedula
  where p.VcProfTb04_IdProfesor = cedula;
end $
/*call PaProfTb04_BuscarProf('116000070');*/

/* Actualizar Profesor */
delimiter $
create procedure PaProfTb04_ActualizarProf(in IdProf varchar(20),  in FecNac Date, in Clave varchar(20),
in Estado varchar(20),in Nom varchar(20), 
in Ape1 varchar(20), in Ape2 varchar(20), in Direccion varchar(100), in Sexo char(1), in Telefono varchar(8), in Email varchar(100))
begin
	update usutb01, ProfTb04
    set usutb01.VcUsuTb01_Nombre = Nom,
    usutb01.VcUsuTb01_Ape1 = Ape1,usutb01.VcUsuTb01_Ape2 = Ape2,usutb01.VcUsuTb01_Direccion = Direccion,usutb01.CrUsuTb01_Sexo = sexo,
    usutb01.VcUsuTb01_Telefono = Telefono,usutb01.VcUsuTb01_Email = Email,
    ProfTb04.VcProfTb04_IdProfesor = IdProf, ProfTb04.VcProfTb04_Clave = Clave,
    ProfTb04.DtProfTb04_FechaNac = FecNac, ProfTb04.VcProfTb04_Estado = Estado
    where ProfTb04.VcProfTb04_IdProfesor = IdProf and usutb01.VcUsuTb01_Cedula = IdProf;
end $;
/*call PaProfTb04_ActualizarProf('116000070','1987/10/12','4567','Activo','Jose','Lopez','Zuñiga',
'Nicoya','M','60918664','jlopez@outlook.com');*/

/* Listar Profesor */
delimiter $
CREATE PROCEDURE PaProfTb04_Listar ()
begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as '1° Apellido',
 UsuTb01.VcUsuTb01_Ape2  as '2° Apellido', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email', 
 ProfTb04.VcProfTb04_IdProfesor as 'Id Profesor', ProfTb04.VcProfTb04_Clave as 'Clave', 
 ProfTb04.DtProfTb04_FechaNac as 'Fecha Nac', ProfTb04.VcProfTb04_Estado as 'Estado'
    from UsuTb01, ProfTb04
    where ProfTb04.VcProfTb04_IdProfesor = UsuTb01.VcUsuTb01_Cedula
	order by ProfTb04.VcProfTb04_IdProfesor;
end $
/*call PaProfTb04_Listar();*/


/**************************************************************************************************************************************************************/
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
/*call PaEncTb05_GuardarEnc('402370069','1234','Fernanda','Herrera','Villalobos','Hojancha','F','62001746',
'nose@gmail.com');*/

/* Actualizar Encargado */
delimiter $
create procedure PaEncTb05_ActualizarEnc( in IdEnc varchar(20), in Clave varchar(20),in NomEnc varchar(20), 
in Ape1 varchar(20), in Ape2 varchar(20), in Direccion varchar(100), in Sexo char(1), in Telefono varchar(8), in Email varchar(100))
begin
	update enctb05,usutb01
    set enctb05.VcEncTb05_Clave = Clave, usutb01.VcUsuTb01_Nombre = NomEnc, usutb01.VcUsuTb01_Ape1 = Ape1, usutb01.VcusuTb01_Ape2 = Ape2,
    usutb01.VcUsutb01_Direccion = Direccion, usutb01.CrUsuTb01_Sexo = Sexo, usutb01.VcUsuTb01_Telefono = Telefono,
	usutb01.VcUsuTb01_Email = Email
    where enctb05.VcEncTb05_IdEncargado = IdEnc  and IdEnc = usutb01.VcUsuTb01_Cedula;
end $
/*call PaEncTb05_ActualizarEnc('402370069','1233','Fernanda','Gonzalez','Villalobos','Samara','F','62001746',
'fer@gmail.com');*/


/**************************************************************************************************************************************************************/
		/* FunTb06 */
/* Guardar Funcionario */
delimiter $
create procedure PaFunTb06_GuardarFunc(in IdFun varchar(20), in Clave varchar(20), in FechaNac date, in Estado varchar(20),
in NomFun varchar(20), in Ape1 varchar(20), in Ape2 varchar(20), in Direccion varchar(20), 
in Sexo char(1), in Telefono varchar(8), in Email varchar(20))
begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdFun, NomFun, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
    insert into FunTb06 ( VcFunTb06_IdFuncionario,VcFunTb06_Clave, DtFunTb06_FechaNac, VcFunTb06_Estado)
    values (IdFun, Clave, FechaNac, Estado);
end $
/*call PaFunTb06_GuardarFunc('50230569','1234','1978/03/06', 'Activo', 'Francisco','Perez','Soto','Samara','M','88674699',
'franc@gmail.com');*/

/* Actualizar Funcionario */
delimiter $
create procedure PaFunTb06_ActualizarFunc(in IdFun varchar(20), in Clave varchar(20), in FechaNac date, in Estado varchar(20),
in NomFun varchar(20),in Ape1 varchar(20), in Ape2 varchar(20), in Direccion varchar(100),
in Sexo char(1), in Telefono varchar(8), in Email varchar(100))
begin
	update FunTb06,usutb01
    set funtb06.VcFunTb06_Clave = Clave, funtb06.DtFunTb06_FechaNac = FechaNac, FunTb06.VcFunTb06_Estado = Estado,
	usutb01.VcUsuTb01_Nombre = NomFun, usutb01.VcUsuTb01_Ape1 = Ape1, usutb01.VcusuTb01_Ape2 = Ape2,
	usutb01.VcUsutb01_Direccion = Direccion, usutb01.CrUsuTb01_Sexo = Sexo, usutb01.VcUsuTb01_Telefono = Telefono,
	usutb01.VcUsuTb01_Email = Email
	where funtb06.VcFunTb06_IdFuncionario = IdFun and usutb01.VcUsuTb01_Cedula = IdFun;
end $
/*call PaFunTb06_ActualizarFunc('50230569','1212','1976/03/06', 'Activo', 'Francisco','Perez','Soto','Nosara','M','88674699',
'franc@gmail.com');*/

/* Borrar funcionario*/
delimiter $
create procedure PaFunTb06_BorrarFunc(in IdFun varchar(20))
begin
update funtb06
set VcFunTb06_Estado = 'Inactivo' where VcFunTb06_IdFuncionario = IdFun;
end $
/*call PaFunTb06_BorrarFunc('50230569');*/

/**************************************************************************************************************************************************************/
		/* EstEncTb07 */
/* Guardar Estudiante encargado */
delimiter $
create procedure PaEstEncTb07_GuardarEstEnc(in IdEncargado varchar(20), in IdEstudiante varchar(20))
begin
	insert into estenctb07(VcEstTb03_IdEstudiante,VcEncTb05_IdEncargado)
    select e.VcEstTb03_IdEstudiante, o.VcEncTb05_IdEncargado
    from esttb03 as e,enctb05 as o
    where e.VcEstTb03_IdEstudiante = IdEstudiante and o.VcEncTb05_IdEncargado = IdEncargado; 
end $
/*call PaEstEncTb07_GuardarEstEnc('402370069', '504070289');*/

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
/*call PaEstEncTb07_BuscarEstEnc_Est('504070289');*/

/* Buscar Encargado estudiante */
delimiter $
create procedure PaEstEncTb07_BuscarEstEnc_Enc(in IdEnc varchar(20))
begin
	select u.VcUsuTb01_Cedula as 'Cedula',u.VcUsuTb01_Nombre as 'Nombre',u.VcUsuTb01_Ape1 as '1° Apellido',
    u.VcUsuTb01_Ape2 as '2° Apellido',u.VcUsuTb01_Direccion as 'Direccion',u.CrUsuTb01_Sexo as 'Sexo',
    u.VcUsuTb01_Telefono as 'Telefono',u.VcUsuTb01_Email as 'Correo electronico', e.DtEstTb03_FechaNac as 'Fecha de nacimiento',
    e.VcEstTb03_Adecuacion as 'Adecuacion',e.VcEstTb03_Estado as 'Estado'
    from usutb01 as u inner join esttb03 as e on u.VcUsuTb01_Cedula = e.VcEstTb03_IdEstudiante
    join estenctb07 as p on e.VcEstTb03_IdEstudiante = p.VcEstTb03_IdEstudiante
    where p.VcEncTb05_IdEncargado = IdEnc;
end $
/*call PaEstEncTb07_BuscarEstEnc_Enc('402370069');*/

/**************************************************************************************************************************************************************/
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
/*call PaAsistColeTb08_GuardarAsistCole('AI01', '8:00', '2016/07/12', '4:00', '2016/07/12', '504070289');*/

/* Actualizar Asistencia colegio */
delimiter $
create procedure PaAsistColeTb08_ActualizarAsistCole(in IdAsistCole varchar(20), in HoraEntrada time, in FechaEntrada date,
in HoraSalida time, in FechaSalida date, in IdEstudiante varchar(20))
begin
	update AsistColeTb08
    set VcAsistColeTb08_IdAsistCole = IdAsistCole, TmAsistColeTb08_HoraEntrada = HoraEntrada  , DtAsistColeTb08_FechaEntrada = FechaEntrada,
	TmAsistColeTb08_HoraSalida = HoraSalida, DtAsistColeTb08_FechaSalida = FechaSalida, VcEstTb03_IdEstudiante = IdEstudiante
	where VcAsistColeTb08_IdAsistCole = IdAsistCole;
end $
/*call PaAsistColeTb08_ActualizarAsistCole('AI01', '7:00', '2016/08/11', '2:00', '2016/07/12', '504070289');*/

/* Buscar Asistencia colegio */
delimiter $
create procedure PaAsistColeTb08_BuscarAsistCole(in IdAsistCole varchar(20))
begin
	select * from AsistColeTb08
     where VcAsistColeTb08_IdAsistCole = IdAsistCole;
end $
/*call PaAsistColeTb08_BuscarAsistCole('AI01');*/

/* Listar Asistencia colegio */ 
delimiter $
CREATE PROCEDURE PaAsistColeTb08_Listar ()
begin
	select * from AsistColeTb08
	order by VcAsistColeTb08_IdAsistCole;
end $
/*call PaAsistColeTb08_Listar();*/

/* Eliminar Asistencia colegio */
delimiter $
create procedure PaAsistColeTb08_EliminarAsistCole(in IdAsisCole varchar(20))
begin
	delete from AsistColeTb08 where VcAsistColeTb08_IdAsistCole = IdAsisCole;
end $
/*call PaAsistColeTb08_EliminarAsistCole('AI01');*/

/**************************************************************************************************************************************************************/
 	/* GradoTb13 */
/* Guardar Grado */
delimiter $
create procedure PaGradoTb13_GuardarGrado(in IdGrado varchar(20), in NombreGrado varchar(20), in IdBachiller varchar(20))
begin
	insert into GradoTb13(VcGradoTb13_IdGrado, VcGradoTb13_NombreGrado, VcBachillerTb14_IdBachiller)
    values (IdGrado, NombreGrado, IdBachiller);
end $
/*call sisae.PaGradoTb13_GuardarGrado('11', 'Undecimo', '11');*/

/* Buscar Grado */
delimiter $
create procedure PaGradoTb13_BuscarGrado(in IdGrado varchar(20))
begin
	select * from GradoTb13
     where VcGradoTb13_IdGrado = IdGrado;
end $
/*call sisae.PaGradoTb13_BuscarGrado('11');*/

/* Listar Grado */
delimiter $
CREATE PROCEDURE PaGradoTb13_Listar()
begin
	select * from GradoTb13
	order by VcGradoTb13_IdGrado;
end $  
/*call sisae.PaGradoTb13_Listar();*/

/* Actualizar Grado */
delimiter $
create procedure PaGradoTb13_ActualizarGrado(in IdGrado varchar(20), in NombreGrado varchar(20), in IdBachiller varchar(20))
begin
	update GradoTb13
    set   VcGradoTb13_NombreGrado = NombreGrado, VcBachillerTb14_IdBachiller = IdBachiller 
    where VcGradoTb13_IdGrado = IdGrado;
end $
/*call sisae.PaGradoTb13_ActualizarGrado('11', 'Quinto', '11');*/

/**************************************************************************************************************************************************************/
	/* BachillerTb14 */
/* Guardar Bachiller */
delimiter $
create procedure PaBachillerTb14_GuardarBachiller(in IdBac varchar(20), in NomBac varchar(20))
begin
	insert into BachillerTb14 (VcBachillerTb14_IdBachiller, VcBachillerTb14_NombreBachiller)
    values (IdBac, NomBac);
end $
/*call sisae.PaBachillerTb14_GuardarBachiller('11', 'Duodecimo');*/

/* Buscar Bachiller */
delimiter $
create procedure PaBachillerTb14_BuscarBachiller(in IdBac varchar(20))
begin
	select * from BachillerTb14
     where VcBachillerTb14_IdBachiller = IdBac;
end $
/*call sisae.PaBachillerTb14_BuscarBachiller('11');*/

/* Actualizar Bachiller */
delimiter $
create procedure PaBachillerTb14_ActualizarBachiller(in IdBac varchar(20), in NomBac varchar(20))
begin
	update BachillerTb14
    set   bachillertb14.VcBachillerTb14_NombreBachiller = NomBac
    where   bachillertb14.VcBachillerTb14_IdBachiller = IdBac;
end $
/*call sisae.PaBachillerTb14_ActualizarBachiller('11', 'Nacional');*/

/* Listar Bachiller */
delimiter $
CREATE PROCEDURE PaBachillerTb14_Listar()
begin
	select * from BachillerTb14
	order by bachillertb14.VcBachillerTb14_IdBachiller;
end $
/*call sisae.PaBachillerTb14_Listar();*/

/* Eliminar Bachiller */
delimiter $
create procedure PaBachillerTb14_EliminarBachiller(in IdBac varchar(20))
begin
	delete from BachillerTb14 where bachillertb14.VcBachillerTb14_IdBachiller = IdBac;
end $
/*call sisae.PaBachillerTb14_EliminarBachiller('11');*/


/**************************************************************************************************************************************************************/
	/* EspecialidadTb16 */
/* Guardar Especialidad */
delimiter $
create procedure PaEspecialidadTb16_GuardarEspecialidad(in IdEsp varchar(20), in NomEsp varchar(20), in Cupo int)
begin
	insert into EspecialidadTb16 (VcEspecialidadTb16_IdEspecialidad, VcEspecialidadTb16_Nombre, InEspecialidadTb16_Cupo)
    values (IdEsp, NomEsp, Cupo);
end $
/*call sisae.PaEspecialidadTb16_GuardarEspecialidad('E01', 'Informatica', 30);*/

/* Buscar Especialidad */
delimiter $
create procedure PaEspecialidadTb16_BuscarEspecialidad(in IdEsp varchar(20))
begin
	select * from EspecialidadTb16
     where VcEspecialidadTb16_IdEspecialidad = IdEsp;
end $
/*call sisae.PaEspecialidadTb16_BuscarEspecialidad('E01');*/

/* Actualizar Especialidad */
delimiter $
create procedure PaEspecialidadTb16_ActualizarEspecialidad(in IdEsp varchar(20), in NomEsp varchar(20), in Cupo int)
begin
	update EspecialidadTb16
    set   especialidadtb16.VcEspecialidadTb16_Nombre = NomEsp, especialidadtb16.InEspecialidadTb16_Cupo = Cupo
    where especialidadtb16.VcEspecialidadTb16_IdEspecialidad = IdEsp;
end $
/*call sisae.PaEspecialidadTb16_ActualizarEspecialidad('E01', 'Administracion', '20');*/

/* Listar Especialidad */
delimiter $
CREATE PROCEDURE PaEspecialidadTb16_Listar()
begin
	select * from especialidadtb16
	order by especialidadtb16.VcEspecialidadTb16_IdEspecialidad;
end $
/*call sisae.PaEspecialidadTb16_Listar();*/

/* Eliminar Especialidad */
delimiter $
create procedure PaEspecialidadTb16_EliminarEspecialidad(in IdEs varchar(20))
begin
	delete from EspecialidadTb16 where especialidadtb16.VcEspecialidadTb16_IdEspecialidad = IdEs;
end $
/*call sisae.PaEspecialidadTb16_EliminarEspecialidad('E01');*/

/**************************************************************************************************************************************************************/
	/* MateriaTb17 */
/* Guardar Materia */
delimiter $
create procedure PaMateriaTb17_GuardarMateria(in IdMat varchar(20), in NomMat varchar(20))
begin
	insert into MateriaTb17 (VcMateriaTb17_IdMateria, VcMateriaTb17_Nombre)
    values (IdMat, NomMat);
end $
/*call sisae.PaMateriaTb17_GuardarMateria('M01', 'Matematicas');*/

/* Buscar Materia */
delimiter $
create procedure PaMateriaTb17_BuscarMateria(in IdMat varchar(20))
begin
	select * from MateriaTb17
     where VcMateriaTb17_IdMateria = IdMat;
end $
/*call sisae.PaMateriaTb17_BuscarMateria('M01');*/

/* Actualizar Materia */
delimiter $
create procedure PaMateriaTb17_ActualizarMateria(in IdMat varchar(20), in NomMat varchar(20))
begin
	update MateriaTb17
    set   materiatb17.VcMateriaTb17_Nombre = NomMat
    where materiatb17.VcMateriaTb17_IdMateria = IdMat;
end $
/*call sisae.PaMateriaTb17_ActualizarMateria('M01', 'Ciencias');*/

/* Listar Materia */
delimiter $
CREATE PROCEDURE PaMateriaTb17_Listar()
begin
	select * from MateriaTb17
	order by materiatb17.VcMateriaTb17_IdMateria;
end $
/*call sisae.PaMateriaTb17_Listar();*/

/* Eliminar Materia */
delimiter $
create procedure PaMateriaTb17_EliminarMateria(in IdMat varchar(20))
begin
	delete from MateriaTb17 where materiatb17.VcMateriaTb17_IdMateria = IdMat;
end $
/*call sisae.PaMateriaTb17_EliminarMateria('M01');*/

/**************************************************************************************************************************************************************/
	/* AsistClaseTb18 */
/* Guardar Asistencia Clase */
delimiter $
create procedure PaAsistClaseTb18_GuardarAsistClase(in IdAsist varchar(20), in Fec date, in Hora time, in Estado varchar(20), in IdMa varchar(20))
begin
	insert into AsistClaseTb18 (VcAsistClaseTb18_IdAsistClase, DtAsistClaseTb18_Fecha, TmAsistClaseTb18_Hora, VcAsistClaseTb18_Estado, VcMateriaTb17_IdMateria)
    values (IdAsist, Fec, Hora, Estado, IdMa);
end $
/*call sisae.PaAsistClaseTb18_GuardarAsistClase('AC03', '2017/07/05', '8:00', 'Presente', 'M01');*/

/* Buscar Asistencia Clase */
delimiter $
create procedure PaAsistClaseTb18_BuscarAsistClase(in IdAsis varchar(20))
begin
	select * from AsistClaseTb18
     where asistclasetb18.VcAsistClaseTb18_IdAsistClase = IdAsis;
end $
/*call sisae.PaAsistClaseTb18_BuscarAsistClase('AC03');*/

/* Actualizar Asistencia Clase */
delimiter $
create procedure PaAsistClaseTb18_ActualizarAsistClase(in IdAsist varchar(20), in Fec date, 
in Hora time, in Estado varchar(20), in IdMa varchar(20))
begin
	update AsistClaseTb18
    set   asistclasetb18.DtAsistClaseTb18_Fecha = Fec, asistclasetb18.TmAsistClaseTb18_Hora = Hora, 
    asistclasetb18.VcAsistClaseTb18_Estado = Estado, asistclasetb18.VcMateriaTb17_IdMateria = IdMa
    where asistclasetb18.VcAsistClaseTb18_IdAsistClase = IdAsist;
end $
/*call sisae.PaAsistClaseTb18_ActualizarAsistClase('AC02', '2017/12/09', '12:00', 'Tardia', 'M01');*/

/* Listar Asistencia Clase */
delimiter $
CREATE PROCEDURE PaAsistClaseTb18_Listar()
begin
	select * from AsistClaseTb18
	order by asistclasetb18.VcAsistClaseTb18_IdAsistClase;
end $
/*call sisae.PaAsistClaseTb18_Listar();*/

/* Eliminar Asistencia Clase */
delimiter $
create procedure PaAsistClaseTb18_EliminarAsistClase(in IdAsi varchar(20))
begin
	delete from AsistClaseTb18 where asistclasetb18.VcAsistClaseTb18_IdAsistClase = IdAsi;
end $
/*call sisae.PaAsistClaseTb18_EliminarAsistClase('AC01');*/

/**************************************************************************************************************************************************************/
	/* SeccionTb20 */
/* Guardar Seccion */
delimiter $
create procedure PaSeccionTb20_GuardarSeccion(in IdSec varchar(20), in Cupo varchar(20))
begin
	insert into SeccionTb20 (VcSeccionTb20_IdSeccion, InSeccionTb20_Cupo)
    values (IdSec, Cupo);
end $
/*call sisae.PaSeccionTb20_GuardarSeccion('7-1', '15');*/

/* Buscar Seccion */
delimiter $
create procedure PaSeccionTb20_BuscarSeccion(in IdSec varchar(20))
begin
	select * from SeccionTb20
     where SeccionTb20.VcSeccionTb20_IdSeccion = IdSec;
end $
/*call sisae.PaSeccionTb20_BuscarSeccion('7-1');*/

/* Actualizar Seccion */
delimiter $
create procedure PaSeccionTb20_ActualizarSeccion(in IdSec varchar(20), in Cupo varchar(20))
begin
	update SeccionTb20
    set   secciontb20.InSeccionTb20_Cupo = Cupo
    where SeccionTb20.VcSeccionTb20_IdSeccion = IdSec;
end $
/*call sisae.PaSeccionTb20_ActualizarSeccion('7-1', '10');*/

/* Listar Seccion */
delimiter $
CREATE PROCEDURE PaSeccionTb20_Listar()
begin
	select * from SeccionTb20
	order by SeccionTb20.VcSeccionTb20_IdSeccion;
end $
/*call sisae.PaSeccionTb20_Listar();*/

/* Eliminar Seccion */
delimiter $
create procedure PaSeccionTb20_EliminarSeccion(in IdSec varchar(20))
begin
	delete from SeccionTb20  where SeccionTb20.VcSeccionTb20_IdSeccion = IdSec;
end $
/*call sisae.PaSeccionTb20_EliminarSeccion('7-1');*/

/**************************************************************************************************************************************************************/




/**************************************************************************************************************************************************************/


/**************************************************************************************************************************************************************/


/**************************************************************************************************************************************************************/


/**************************************************************************************************************************************************************/


/**************************************************************************************************************************************************************/


/**************************************************************************************************************************************************************/

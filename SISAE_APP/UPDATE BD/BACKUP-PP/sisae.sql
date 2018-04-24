-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2018 at 05:53 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sisae`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsigmateriaTb19_Asignar` (IN `IdMat` INT, IN `IdProf` VARCHAR(20))  begin
	insert into asigmateriatb19(InMateriaTb17_IdMateria,VcProfTb04_IdProfesor) 
    values(IdMat,IdProf);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsigmateriaTb19_Profe_Materia` (IN `IdProf` VARCHAR(20))  begin
	select materiatb17.InMateriaTb17_IdMateria as 'Id_Materia', materiatb17.VcMateriaTb17_Nombre as 'nombre' 
    from materiatb17 inner join asigmateriatb19 on materiatb17.InMateriaTb17_IdMateria = asigmateriatb19.InMateriaTb17_IdMateria 
    where asigmateriatb19.VcProfTb04_IdProfesor = IdProf;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistClaseTb18_ActualizarAsistClase` (IN `IdAsist` INT, IN `Fec` DATE, IN `Hora` TIME, IN `Estado` VARCHAR(20), IN `IdMa` INT)  begin
	update AsistClaseTb18
    set   asistclasetb18.DtAsistClaseTb18_Fecha = Fec, asistclasetb18.TmAsistClaseTb18_Hora = Hora, 
    asistclasetb18.VcAsistClaseTb18_Estado = Estado, asistclasetb18.InMateriaTb17_IdMateria = IdMa
    where asistclasetb18.InAsistClaseTb18_IdAsistClase = IdAsist;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistClaseTb18_BuscarAsistClase` (IN `IdAsis` INT)  begin
	select InAsistClaseTb18_IdAsistClase AS 'Id', DtAsistClaseTb18_Fecha as 'Fecha', 
    TmAsistClaseTb18_Hora as 'Hora', VcAsistClaseTb18_Estado as 'Estado', InMateriaTb17_IdMateria as 'Id_Materia' 
    from AsistClaseTb18
     where asistclasetb18.InAsistClaseTb18_IdAsistClase = IdAsis;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistClaseTb18_EliminarAsistClase` (IN `IdAsi` INT)  begin
	delete from AsistClaseTb18 where asistclasetb18.InAsistClaseTb18_IdAsistClase = IdAsi;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistClaseTb18_GuardarAsistClase` (IN `Fec` DATE, IN `Hora` TIME, IN `Estado` VARCHAR(20), IN `IdMa` INT)  begin
	insert into AsistClaseTb18 (DtAsistClaseTb18_Fecha, TmAsistClaseTb18_Hora, VcAsistClaseTb18_Estado, InMateriaTb17_IdMateria)
    values (Fec, Hora, Estado, IdMa);
end$$

CREATE DEFINER=`'root'`@`'localhost'` PROCEDURE `PaAsistClaseTb18_GuardarAsistClase-2` (IN `Fec` DATE, IN `Hora` TIME, IN `Estado` VARCHAR(20), IN `IdMa` INT)  BEGIN
	insert into AsistClaseTb182 (DtAsistClaseTb18_Fecha, TmAsistClaseTb18_Hora, 				VcAsistClaseTb18_Estado, InMateriaTb17_IdMateria)
    values (Fec, Hora, Estado, IdMa);
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistClaseTb18_Listar` (IN `inicio` INT, IN `final` INT)  begin
	select iNAsistClaseTb18_IdAsistClase as 'Id',DtAsistClaseTb18_Fecha as 'Fecha', TmAsistClaseTb18_Hora as 'Hora',
    VcAsistClaseTb18_Estado as 'Estado', InMateriaTb17_IdMateria as 'Id_Materia' 
    from AsistClaseTb18
	order by 'date added' limit inicio,final;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistColeTb08_ActualizarAsistCole` (IN `IdAsistCole` INT, IN `HoraEntrada` TIME, IN `FechaEntrada` DATE, IN `HoraSalida` TIME, IN `FechaSalida` DATE, IN `IdEstudiante` VARCHAR(20))  begin
	update AsistColeTb08
    set InAsistColeTb08_IdAsistCole = IdAsistCole, TmAsistColeTb08_HoraEntrada = HoraEntrada  , DtAsistColeTb08_FechaEntrada = FechaEntrada,
	TmAsistColeTb08_HoraSalida = HoraSalida, DtAsistColeTb08_FechaSalida = FechaSalida, VcEstTb03_IdEstudiante = IdEstudiante
	where InAsistColeTb08_IdAsistCole = IdAsistCole;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistColeTb08_BuscarAsistCole` (IN `IdAsistCole` INT)  begin
	select InAsistColeTb08_IdAsistCole, TmAsistColeTb08_HoraEntrada, DtAsistColeTb08_FechaEntrada,
    TmAsistColeTb08_HoraSalida, DtAsistColeTb08_FechaSalida, VcEstTb03_IdEstudiante
    from AsistColeTb08
     where InAsistColeTb08_IdAsistCole = IdAsistCole;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistColeTb08_BuscarAsistColeD` (IN `dato` INT)  begin
	select InAsistColeTb08_IdAsistCole, TmAsistColeTb08_HoraEntrada, DtAsistColeTb08_FechaEntrada,
    TmAsistColeTb08_HoraSalida, DtAsistColeTb08_FechaSalida, VcEstTb03_IdEstudiante
    from AsistColeTb08
     where InAsistColeTb08_IdAsistCole like concat('%',dato,'%')
     or TmAsistColeTb08_HoraEntrada like concat('%',dato,'%')
     or DtAsistColeTb08_FechaEntrada like concat('%',dato,'%')
     or TmAsistColeTb08_HoraSalida like concat('%',dato,'%')
     or DtAsistColeTb08_FechaSalida like concat('%',dato,'%')
     or VcEstTb03_IdEstudiante like concat('%',dato,'%');
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistColeTb08_EliminarAsistCole` (IN `IdAsisCole` INT)  begin
	delete from AsistColeTb08 where InAsistColeTb08_IdAsistCole = IdAsisCole;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistColeTb08_GuardarAsistCole` (IN `HoraEntrada` TIME, IN `FechaEntrada` DATE, IN `HoraSalida` TIME, IN `FechaSalida` DATE, IN `IdEstudiante` VARCHAR(20))  begin
	insert into AsistColeTb08 (TmAsistColeTb08_HoraEntrada, DtAsistColeTb08_FechaEntrada,
    TmAsistColeTb08_HoraSalida, DtAsistColeTb08_FechaSalida, VcEstTb03_IdEstudiante)
    values (HoraEntrada, FechaEntrada, HoraSalida, FechaSalida, IdEstudiante);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistColeTb08_Listar` (IN `inicio` INT, IN `final` INT)  begin
	select InAsistColeTb08_IdAsistCole as 'Id Asistencia', TmAsistColeTb08_HoraEntrada as 'Hora Entrada', 
    DtAsistColeTb08_FechaEntrada as 'Fecha Entrada', TmAsistColeTb08_HoraSalida as 'Hora Salida', 
    DtAsistColeTb08_FechaSalida as 'Fecha Salida', VcEstTb03_IdEstudiante as 'Estudiante'
    from AsistColeTb08
	order by 'date added' limit inicio,final;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistEstTb23_Listar` (IN `idSec` INT, IN `IdMater` VARCHAR(20))  BEGIN
select usutb01.VcUsuTb01_Cedula as 'Cedula',usutb01.VcUsuTb01_Nombre as 'Nombre',
usutb01.VcUsuTb01_Ape1 as 'Apellido1',usutb01.VcUsuTb01_Ape2 as 'Apellido2',
asistclasetb18.VcAsistClaseTb18_Estado as 'Estado',asistclasetb18.TmAsistClaseTb18_Hora as 'Hora',
asistclasetb18.DtAsistClaseTb18_Fecha as 'Fecha' 
from usutb01 inner join esttb03 on usutb01.VcUsuTb01_Cedula = esttb03.VcEstTb03_IdEstudiante 
join asistesttb23 on esttb03.VcEstTb03_IdEstudiante = asistesttb23.VcEstTb03_IdEstudiante 
join secesttb28 on esttb03.VcEstTb03_IdEstudiante = secesttb28.VcEstTb03_IdEstudiante 
join asistclasetb18 on asistesttb23.InAsistClaseTb18_IdAsistClase = asistclasetb18.InAsistClaseTb18_IdAsistClase 
where asistclasetb18.InMateriaTb17_IdMateria = IdMater and secesttb28.InSeccionTb20_IdSeccion = idSec 
order by asistclasetb18.DtAsistClaseTb18_Fecha desc;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistEstTb23_Listar_Est` (IN `IdEst` VARCHAR(20))  BEGIN
select asistclasetb18.VcAsistClaseTb18_Estado as 'Estado',asistclasetb18.TmAsistClaseTb18_Hora as 'Hora',
asistclasetb18.DtAsistClaseTb18_Fecha as 'Fecha',materiatb17.VcMateriaTb17_Nombre as 'Materia' 
from asistclasetb18 inner join asistesttb23 on asistclasetb18.InAsistClaseTb18_IdAsistClase = asistesttb23.InAsistClaseTb18_IdAsistClase 
join materiatb17 on asistclasetb18.InMateriaTb17_IdMateria = materiatb17.InMateriaTb17_IdMateria 
where asistesttb23.VcEstTb03_IdEstudiante = IdEst;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaBachillerTb14_ActualizarBachiller` (IN `IdBac` INT, IN `NomBac` VARCHAR(20))  begin
	update BachillerTb14
    set   bachillertb14.VcBachillerTb14_NombreBachiller = NomBac
    where   bachillertb14.InBachillerTb14_IdBachiller = IdBac;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaBachillerTb14_BuscarBachiller` (IN `IdBac` INT)  begin
	select InBachillerTb14_IdBachiller as 'Id', VcBachillerTb14_NombreBachiller as 'Bachiller' 
    from BachillerTb14 
     where InBachillerTb14_IdBachiller = IdBac;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaBachillerTb14_BuscarBachillerD` (IN `dato` VARCHAR(20))  begin
	select InBachillerTb14_IdBachiller as 'Id', VcBachillerTb14_NombreBachiller as 'Bachiller' 
    from BachillerTb14 
     where InBachillerTb14_IdBachiller like concat('%',dato,'%')
     or VcBachillerTb14_NombreBachiller like concat(dato,'%');
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaBachillerTb14_EliminarBachiller` (IN `IdBac` INT)  begin
	delete from BachillerTb14 where bachillertb14.InBachillerTb14_IdBachiller = IdBac;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaBachillerTb14_GuardarBachiller` (IN `NomBac` VARCHAR(20))  begin
	insert into BachillerTb14 (VcBachillerTb14_NombreBachiller)
    values (NomBac);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaBachillerTb14_Listar` (IN `inicio` INT, IN `final` INT)  begin
	select InBachillerTb14_IdBachiller as 'Id', VcBachillerTb14_NombreBachiller as 'Bachiller' 
    from BachillerTb14
	order by 'date added' limit inicio,final;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaBachillerTb14_Listar_Todos` ()  begin
	select InBachillerTb14_IdBachiller as 'Id', VcBachillerTb14_NombreBachiller as 'Bachiller' 
    from BachillerTb14;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_ActualizarEnc` (IN `IdEnc` VARCHAR(20), IN `NomEnc` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(100), IN `Telefono` VARCHAR(8), IN `Email` VARCHAR(100))  begin
	update enctb05,usutb01
    set usutb01.VcUsuTb01_Nombre = NomEnc, usutb01.VcUsuTb01_Ape1 = Ape1, usutb01.VcusuTb01_Ape2 = Ape2,
    usutb01.VcUsutb01_Direccion = Direccion, usutb01.VcUsuTb01_Telefono = Telefono,
	usutb01.VcUsuTb01_Email = Email
    where enctb05.VcEncTb05_IdEncargado = IdEnc  and usutb01.VcUsuTb01_Cedula=IdEnc;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_BuscarEnc` (IN `cedula` VARCHAR(20))  begin
	select u.VcUsuTb01_Cedula as 'Cedula', u.VcUsuTb01_Nombre as 'Nombre', u.VcUsuTb01_Ape1 as 'Apellido1',
    u.VcUsuTb01_Ape2 as 'Apellido2', u.VcUsuTb01_Direccion as 'Direccion', u.CrUsuTb01_Sexo as 'Genero',
    u.VcUsuTb01_Telefono as 'Telefono', u.VcUsuTb01_Email as 'Email', e.VcEncTb05_Clave as 'Clave'
    from EncTb05 as e inner join usutb01 as u on e.VcEncTb05_IdEncargado = u.VcUsuTb01_Cedula
  where e.VcEncTb05_IdEncargado = cedula;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_BuscarEncD` (IN `dato` VARCHAR(20))  begin
	select u.VcUsuTb01_Cedula as 'Cedula', u.VcUsuTb01_Nombre as 'Nombre', u.VcUsuTb01_Ape1 as 'Apellido1',
    u.VcUsuTb01_Ape2 as 'Apellido2', u.VcUsuTb01_Direccion as 'Direccion', u.CrUsuTb01_Sexo as 'Genero',
    u.VcUsuTb01_Telefono as 'Telefono', u.VcUsuTb01_Email as 'Email', e.VcEncTb05_Clave as 'Clave'
    from EncTb05 as e inner join usutb01 as u on e.VcEncTb05_IdEncargado = u.VcUsuTb01_Cedula
  where e.VcEncTb05_IdEncargado like concat('%',dato,'%') 
  or u.VcUsuTb01_Nombre like concat('%',dato,'%') 
  or u.VcUsuTb01_Ape1 like concat('%',dato,'%')
  or u.VcUsuTb01_Ape2 like concat('%',dato,'%') 
  or u.VcUsuTb01_Direccion like concat('%',dato,'%') 
  or u.CrUsuTb01_Sexo like concat(dato,'%')
  or u.VcUsuTb01_Email like concat('%',dato,'%') ;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_EliminarEnc` (IN `id` VARCHAR(20))  begin
	delete from enctb05 where VcEncTb05_IdEncargado = id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_GuardarEnc` (IN `IdEnc` VARCHAR(20), IN `NomEnc` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(100), IN `Sexo` CHAR(1), IN `Telefono` VARCHAR(8), IN `Email` VARCHAR(100), IN `Clave` VARCHAR(20))  begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdEnc, NomEnc, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
	insert into EncTb05(VcEncTb05_IdEncargado, VcEncTb05_Clave)
    values (IdEnc, Clave);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_Listar` (IN `inicio` INT, IN `fin` INT)  begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email', 
 enctb05.Vcenctb05_IdEncargado as 'Id Encargado', enctb05.Vcenctb05_Clave as 'Clave'
    from UsuTb01, enctb05
    where enctb05.VcEncTb05_IdEncargado = UsuTb01.VcUsuTb01_Cedula
	order by 'date added' limit inicio,fin;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_ListarA` ()  begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email', 
 enctb05.Vcenctb05_IdEncargado as 'Id Encargado', enctb05.Vcenctb05_Clave as 'Clave'
    from UsuTb01, enctb05
    where enctb05.VcEncTb05_IdEncargado = UsuTb01.VcUsuTb01_Cedula
	order by VcEncTb05_IdEncargado;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_ListarAsigna` ()  begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', 
 UsuTb01.VcUsuTb01_Ape1  as 'Apellido1', UsuTb01.VcUsuTb01_Ape2  as 'Apellido2' 
    from UsuTb01 inner join esttb03 on usutb01.VcUsuTb01_Cedula = esttb03.VcEstTb03_IdEstudiante
	order by 'date added';
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_ActualizarEspecialidad` (IN `IdEsp` INT, IN `NomEsp` VARCHAR(20), IN `Cupo` INT)  begin
	update EspecialidadTb16
    set   especialidadtb16.VcEspecialidadTb16_Nombre = NomEsp, especialidadtb16.InEspecialidadTb16_Cupo = Cupo
    where especialidadtb16.InEspecialidadTb16_IdEspecialidad = IdEsp;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_BuscarEspecialidad` (IN `IdEsp` INT)  begin
	select InEspecialidadTb16_IdEspecialidad as 'Id_Especialidad', VcEspecialidadTb16_Nombre as 'Nom_Especialidad',
    InEspecialidadTb16_Cupo as 'Cupo_Especialidad'
    from EspecialidadTb16
     where InEspecialidadTb16_IdEspecialidad = IdEsp;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_BuscarEspecialidadD` (IN `dato` VARCHAR(20))  begin
	select InEspecialidadTb16_IdEspecialidad as 'Id_Especialidad', VcEspecialidadTb16_Nombre as 'Nom_Especialidad',
    InEspecialidadTb16_Cupo as 'Cupo_Especialidad'
    from EspecialidadTb16
     where InEspecialidadTb16_IdEspecialidad like concat('%',dato,'%')
     or VcEspecialidadTb16_Nombre like concat('%',dato,'%')
     or InEspecialidadTb16_Cupo like concat('%',dato,'%');
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_EliminarEspecialidad` (IN `IdEs` INT)  begin
	delete from EspecialidadTb16 
    where especialidadtb16.InEspecialidadTb16_IdEspecialidad = IdEs;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_GuardarEspecialidad` (IN `NomEsp` VARCHAR(20), IN `Cupo` INT)  begin
	insert into EspecialidadTb16 ( VcEspecialidadTb16_Nombre, InEspecialidadTb16_Cupo)
    values (NomEsp, Cupo);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_Listar` (IN `inicio` INT, IN `final` INT)  begin
	select InEspecialidadTb16_IdEspecialidad as 'Id', VcEspecialidadTb16_Nombre as 'Nombre',InEspecialidadTb16_Cupo  as 'Cupo' 
    from especialidadtb16
	order by 'date added' limit inicio,final;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_Listar_Todos` ()  begin
	select InEspecialidadTb16_IdEspecialidad as 'Id', VcEspecialidadTb16_Nombre as 'Nombre',InEspecialidadTb16_Cupo  as 'Cupo' 
    from especialidadtb16
	order by InEspecialidadTb16_IdEspecialidad;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstEncTb07_ActualizarEstEnc` (IN `IdEnc` VARCHAR(20), IN `IdEst` VARCHAR(20))  begin
	update EstEncTb07
    set VcEstEncTb07_IdEncargado = IdEnc, VcEstEncTb07_IdEstudiante = IdEst
    where VcEstEncTb07_IdEncargado = IdEnc;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstEncTb07_AsignarEstEn` (IN `IdEnc` VARCHAR(20), IN `IdEst` VARCHAR(20))  begin
	insert into estenctb07(VcEncTb05_IdEncargado,VcEstTb03_IdEstudiante)
    values(IdEnc,IdEst);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstEncTb07_BuscarEstEnc_Enc` (IN `IdEnc` VARCHAR(20))  begin
	select u.VcUsuTb01_Cedula as 'Cedula',u.VcUsuTb01_Nombre as 'Nombre',u.VcUsuTb01_Ape1 as '1° Apellido',
    u.VcUsuTb01_Ape2 as '2° Apellido',u.VcUsuTb01_Direccion as 'Direccion',u.CrUsuTb01_Sexo as 'Sexo',
    u.VcUsuTb01_Telefono as 'Telefono',u.VcUsuTb01_Email as 'Correo electronico', e.DtEstTb03_FechaNac as 'Fecha de nacimiento',
    e.VcEstTb03_Adecuacion as 'Adecuacion',e.VcEstTb03_Estado as 'Estado'
    from usutb01 as u inner join esttb03 as e on u.VcUsuTb01_Cedula = e.VcEstTb03_IdEstudiante
    join estenctb07 as p on e.VcEstTb03_IdEstudiante = p.VcEstTb03_IdEstudiante
    where p.VcEncTb05_IdEncargado = IdEnc;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstEncTb07_BuscarEstEnc_Est` (IN `IdEst` VARCHAR(20))  begin
	select u.VcUsuTb01_Cedula as 'Cedula',u.VcUsuTb01_Nombre as 'Nombre',u.VcUsuTb01_Ape1 as '1° Apellido',
    u.VcUsuTb01_Ape2 as '2° Apellido',u.VcUsuTb01_Direccion as 'Direccion',u.CrUsuTb01_Sexo as 'Sexo',
    u.VcUsuTb01_Telefono as 'Telefono',u.VcUsuTb01_Email as 'Correo electronico'
    from usutb01 as u inner join enctb05 as e on u.VcUsuTb01_Cedula = e.VcEncTb05_IdEncargado
    inner join estenctb07 as l on e.VcEncTb05_IdEncargado = l.VcEncTb05_IdEncargado
     where l.VcEstTb03_IdEstudiante = IdEst;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstEncTb07_CargarEst` (IN `IdEnc` VARCHAR(20))  begin
	select e.VcEstTb03_IdEstudiante as 'Cedula'
    from esttb03 as e inner join estenctb07 as p on e.VcEstTb03_IdEstudiante = p.VcEstTb03_IdEstudiante
    where p.VcEncTb05_IdEncargado = IdEnc;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstEncTb07_GuardarEstEnc` (IN `IdEncargado` VARCHAR(20), IN `IdEstudiante` VARCHAR(20))  begin
	insert into estenctb07(VcEstTb03_IdEstudiante,VcEncTb05_IdEncargado)
    select e.VcEstTb03_IdEstudiante, o.VcEncTb05_IdEncargado
    from esttb03 as e,enctb05 as o
    where e.VcEstTb03_IdEstudiante = IdEstudiante and o.VcEncTb05_IdEncargado = IdEncargado; 
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstEncTb07_ListarEstEn` (IN `IdEst` VARCHAR(20))  BEGIN
  SELECT UsuTb01.VcUsuTb01_Cedula AS 'Cedula',
  concat(usutb01.VcUsuTb01_Nombre , ' ' , 
    usutb01.VcUsuTb01_Ape1, ' ' , usutb01.VcUsuTb01_Ape2) as 'Nombre Completo',
 UsuTb01.VcUsuTb01_Direccion AS 'Direccion', UsuTb01.CrUsuTb01_Sexo AS 'Genero', UsuTb01.VcUsuTb01_Telefono AS 'Telefono', 
 UsuTb01.VcUsuTb01_Email AS 'Email', EstTb03.DtEstTb03_FechaNac AS 'FechaNac',EstTb03.VcEstTb03_Adecuacion AS 'Adecuacion', EstTb03.VcEstTb03_Estado AS 'Estado'
   
 FROM usutb01 INNER JOIN estenctb07 ON  usutb01.VcUsuTb01_Cedula = estenctb07.VcEstTb03_IdEstudiante
 JOIN esttb03 ON EstTb03.VcEstTb03_IdEstudiante = usutb01.VcUsuTb01_Cedula
    WHERE estenctb07.VcEstTb03_IdEstudiante = IdEst;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_ActualizarEst` (IN `cedula` VARCHAR(20), IN `FechaNac` DATE, IN `idesp` INT(11), IN `Nombre` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(100), IN `Telefono` VARCHAR(20), IN `email` VARCHAR(20))  BEGIN
update esttb03,usutb01 set esttb03.DtEstTb03_FechaNac = FechaNac,usutb01.VcUsuTb01_Nombre = Nombre,usutb01.VcUsuTb01_Ape1 = Ape1,
usutb01.VcUsuTb01_Ape2 = Ape2,esttb03.InEspecialidadTb16_IdEspecialidad = idesp ,usutb01.VcUsuTb01_Direccion = Direccion,
usutb01.VcUsuTb01_Telefono = Telefono,usutb01.VcUsuTb01_Email = email
where usutb01.VcUsuTb01_Cedula = cedula and esttb03.VcEstTb03_IdEstudiante = cedula;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_BorrarEst` (IN `IdEst` VARCHAR(20))  begin
update esttb03 set VcEstTb03_Estado = 'I' where VcEstTb03_IdEstudiante = IdEst;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_BuscarEst` (IN `cedula` VARCHAR(20))  begin
	select u.VcUsuTb01_Cedula as 'Cedula', u.VcUsuTb01_Nombre as 'Nombre', u.VcUsuTb01_Ape1 as 'Apellido1',
    u.VcUsuTb01_Ape2 as 'Apellido2', s.VcEspecialidadTb16_Nombre as 'Especialidad', u.VcUsuTb01_Direccion as 'Direccion',
    u.CrUsuTb01_Sexo as 'Genero', u.VcUsuTb01_Telefono as 'Telefono', u.VcUsuTb01_Email as 'Email', 
    e.DtEstTb03_FechaNac as 'Fecha_Nac', e.VcEstTb03_Adecuacion as 'Adecuacion', e.VcEstTb03_Estado as 'Estado'
  from esttb03 as e inner join usutb01 as u on e.VcEstTb03_IdEstudiante = u.VcUsuTb01_Cedula 
  join especialidadtb16 as s on e.InEspecialidadTb16_IdEspecialidad = s.InEspecialidadTb16_IdEspecialidad
  where e.VcEstTb03_IdEstudiante = cedula;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_BuscarEstD` (IN `dato` VARCHAR(20))  begin
	select u.VcUsuTb01_Cedula as 'Cedula', u.VcUsuTb01_Nombre as 'Nombre', u.VcUsuTb01_Ape1 as 'Apellido1',
    u.VcUsuTb01_Ape2 as 'Apellido2', s.VcEspecialidadTb16_Nombre as 'Especialidad', u.VcUsuTb01_Direccion as 'Direccion', u.CrUsuTb01_Sexo as 'Genero',
    u.VcUsuTb01_Telefono as 'Telefono', u.VcUsuTb01_Email as 'Email', e.DtEstTb03_FechaNac as 'Fecha_Nac',
	e.VcEstTb03_Adecuacion as 'Adecuacion', e.VcEstTb03_Estado as 'Estado'
  from esttb03 as e inner join usutb01 as u on e.VcEstTb03_IdEstudiante = u.VcUsuTb01_Cedula 
  join especialidadtb16 as s on e.InEspecialidadTb16_IdEspecialidad = s.InEspecialidadTb16_IdEspecialidad
  where e.VcEstTb03_IdEstudiante like concat('%',dato,'%') 
  or u.VcUsuTb01_Nombre like concat('%',dato,'%')
  or u.VcUsuTb01_Ape1 like concat('%',dato,'%')
  or  u.VcUsuTb01_Ape2 like concat('%',dato,'%')
  or s.VcEspecialidadTb16_Nombre like concat('%',dato,'%')
  or u.VcUsuTb01_Direccion like concat('%',dato,'%')
  or u.VcUsuTb01_Telefono like concat('%',dato,'%')
  or u.VcUsuTb01_Email like concat('%',dato,'%')
  or  e.DtEstTb03_FechaNac like concat('%',dato,'%')
  or e.VcEstTb03_Adecuacion like concat('%',dato,'%')
  or e.VcEstTb03_Estado ;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_GuardarEst` (IN `IdEst` VARCHAR(20), IN `FecNacEst` DATE, IN `Adecuacion` VARCHAR(20), IN `Estado` VARCHAR(20), IN `IdEspecialidad` INT, IN `NomEst` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(20), IN `Sexo` CHAR(1), IN `Telefono` VARCHAR(8), IN `Email` VARCHAR(100))  begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdEst, NomEst, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
     insert into EstTb03 (VcEstTb03_IdEstudiante, DtEstTb03_FechaNac, VcEstTb03_Adecuacion, VcEstTb03_Estado, InEspecialidadTb16_IdEspecialidad)
    values (IdEst, FecNacEst, Adecuacion, Estado, IdEspecialidad);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_Info` (IN `IdEst` VARCHAR(20))  BEGIN
	select esttb03.VcEstTb03_IdEstudiante as 'Cedula', 
    concat(usutb01.VcUsuTb01_Nombre , ' ' , usutb01.VcUsuTb01_Ape1, ' ' , usutb01.VcUsuTb01_Ape2) as 'Nombre_Est',
    usutb01.VcUsuTb01_Direccion as 'Direccion',usutb01.CrUsuTb01_Sexo as 'Genero',
    usutb01.VcUsuTb01_Telefono AS 'Telefono',
    usutb01.VcUsuTb01_Email AS 'Email', 
    esttb03.DtEstTb03_FechaNac AS 'Nacimiento',
    esttb03.VcEstTb03_Adecuacion AS 'Adecuacion',
    esttb03.VcEstTb03_Estado AS 'Estado',
    enctb05.VcEncTb05_IdEncargado as 'Encargado'
    FROM 
    usutb01 INNER JOIN EstTb03 ON usutb01.VcUsuTb01_Cedula = esttb03.VcEstTb03_IdEstudiante
    join estenctb07 ON esttb03.VcEstTb03_IdEstudiante = estenctb07.VcEstTb03_IdEstudiante
    join enctb05 on estenctb07.VcEncTb05_IdEncargado = enctb05.VcEncTb05_IdEncargado
    WHERE estenctb07.VcEstTb03_IdEstudiante = IdEst;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_Listar` (IN `inicio` INT, IN `final` INT)  begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', especialidadtb16.VcEspecialidadTb16_Nombre as 'Especialidad', 
 UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', UsuTb01.VcUsuTb01_Telefono as 'Telefono', 
 UsuTb01.VcUsuTb01_Email as 'Email', EstTb03.DtEstTb03_FechaNac as 'FechaNac',EstTb03.VcEstTb03_Adecuacion as 'Adecuacion', EstTb03.VcEstTb03_Estado as 'Estado'
    from UsuTb01, EstTb03,especialidadtb16
    where EstTb03.VcEstTb03_IdEstudiante = UsuTb01.VcUsuTb01_Cedula and esttb03.InEspecialidadTb16_IdEspecialidad = especialidadtb16.InEspecialidadTb16_IdEspecialidad
	order by 'date added' limit inicio,final;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_ListarActivos` ()  begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', EspecialidadTb16.VcEspecialidadTb16_Nombre as 'Especialidad', 
 UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', UsuTb01.VcUsuTb01_Telefono as 'Telefono', 
 UsuTb01.VcUsuTb01_Email as 'Email', EstTb03.DtEstTb03_FechaNac as 'FechaNac', EstTb03.VcEstTb03_Adecuacion as 'Adecuacion', EstTb03.VcEstTb03_Estado as 'Estado'
    from UsuTb01, EstTb03, EspecialidadTb16
    where EstTb03.VcEstTb03_IdEstudiante = UsuTb01.VcUsuTb01_Cedula and esttb03.VcEstTb03_Estado = 'A' and EspecialidadTb16.InEspecialidadTb16_IdEspecialidad = EstTb03.InEspecialidadTb16_IdEspecialidad
	order by EstTb03.VcEstTb03_IdEstudiante;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_Matricula` (IN `idEst` VARCHAR(20), IN `mat` INT, IN `gra` INT, IN `sec` INT)  BEGIN
insert into graesttb26 (VcEstTb03_IdEstudiante, InGradoTb13_IdGrado)
values (idEst, gra);
insert into secesttb28 (VcEstTb03_IdEstudiante,InSeccionTb20_IdSeccion)
values (idEst, sec);
insert into inscmateriatb11 (VcEstTb03_IdEstudiante,InMateriaTb17_IdMateria)
values (idEst, mat); 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_VerPorSeccion` (IN `idGra` INT, IN `idSec` INT)  BEGIN
SELECT concat(gradotb13.VcGradoTb13_NombreGrado, '-',secciontb20.InSeccionTb20_Num_Grupo) as 'Seccion',
usutb01.VcUsuTb01_Cedula AS 'Cedula', 
concat(usutb01.VcUsuTb01_Nombre, ' ',usutb01.VcUsuTb01_Ape1, ' ', usutb01.VcUsuTb01_Ape2) AS 'Estudiante',
e.VcEspecialidadTb16_Nombre AS 'Especialidad'
from 
especialidadtb16 as e inner join esttb03 as es on e.InEspecialidadTb16_IdEspecialidad = es.InEspecialidadTb16_IdEspecialidad
join usutb01 on es.VcEstTb03_IdEstudiante = usutb01.VcUsuTb01_Cedula
join graesttb26 on es.VcEstTb03_IdEstudiante = graesttb26.VcEstTb03_IdEstudiante
join gradotb13 on graesttb26.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
join secesttb28 on es.VcEstTb03_IdEstudiante = secesttb28.VcEstTb03_IdEstudiante
join secciontb20 on secesttb28.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion
    where gradotb13.InGradoTb13_IdGrado = idGra and secciontb20.InSeccionTb20_IdSeccion = idSec;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_ActualizarFunc` (IN `IdFun` VARCHAR(20), IN `FechaNac` DATE, IN `Clave` VARCHAR(20), IN `NomFun` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(100), IN `Telefono` VARCHAR(8), IN `Email` VARCHAR(100))  begin
	update FunTb06,usutb01
    set funtb06.VcFunTb06_Clave = Clave, funtb06.DtFunTb06_FechaNac = FechaNac, 
	usutb01.VcUsuTb01_Nombre = NomFun, usutb01.VcUsuTb01_Ape1 = Ape1, usutb01.VcusuTb01_Ape2 = Ape2,
	usutb01.VcUsutb01_Direccion = Direccion, usutb01.VcUsuTb01_Telefono = Telefono, usutb01.VcUsuTb01_Email = Email
	where funtb06.VcFunTb06_IdFuncionario = IdFun and usutb01.VcUsuTb01_Cedula = IdFun;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_BorrarFunc` (IN `cedula` VARCHAR(20))  begin
update funtb06
set VcFunTb06_Estado = 'I' where VcFunTb06_IdFuncionario = cedula;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_BuscarFunc` (IN `cedula` VARCHAR(20))  begin
select usutb01.VcUsuTb01_Cedula as 'Cedula',usutb01.VcUsuTb01_Nombre as 'Nombre',usutb01.VcUsuTb01_Ape1 as 'Apellido1',
usutb01.VcUsuTb01_Ape2 as 'Apellido2',usutb01.VcUsuTb01_Direccion as 'Direccion',usutb01.CrUsuTb01_Sexo as 'Sexo',
usutb01.VcUsuTb01_Telefono as 'Telefono',usutb01.VcUsuTb01_Email as 'Email',funtb06.VcFunTb06_Clave as 'Clave',
funtb06.DtFunTb06_FechaNac as 'Fecha_Nac',funtb06.VcFunTb06_Estado as 'Estado' 
from usutb01 inner join funtb06 on usutb01.VcUsuTb01_Cedula = funtb06.VcFunTb06_IdFuncionario 
where funtb06.VcFunTb06_IdFuncionario = cedula;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_BuscarFuncD` (IN `dato` VARCHAR(20))  begin
select usutb01.VcUsuTb01_Cedula as 'Cedula',usutb01.VcUsuTb01_Nombre as 'Nombre',usutb01.VcUsuTb01_Ape1 as 'Apellido1',
usutb01.VcUsuTb01_Ape2 as 'Apellido2',usutb01.VcUsuTb01_Direccion as 'Direccion',usutb01.CrUsuTb01_Sexo as 'Sexo',
usutb01.VcUsuTb01_Telefono as 'Telefono',usutb01.VcUsuTb01_Email as 'Email',funtb06.VcFunTb06_Clave as 'Clave',
funtb06.DtFunTb06_FechaNac as 'Fecha_Nac',funtb06.VcFunTb06_Estado as 'Estado' 
from usutb01 inner join funtb06 on usutb01.VcUsuTb01_Cedula = funtb06.VcFunTb06_IdFuncionario 
where funtb06.VcFunTb06_IdFuncionario like concat('%',dato,'%')
or usutb01.VcUsuTb01_Nombre like concat('%',dato,'%')
or usutb01.VcUsuTb01_Ape1 like concat('%',dato,'%')
or usutb01.VcUsuTb01_Ape2 like concat('%',dato,'%')
or usutb01.VcUsuTb01_Direccion like concat('%',dato,'%')
or usutb01.CrUsuTb01_Sexo like concat('%',dato,'%')
or usutb01.VcUsuTb01_Email like concat('%',dato,'%');
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_GuardarFunc` (IN `IdFun` VARCHAR(20), IN `Clave` VARCHAR(20), IN `FechaNac` DATE, IN `Estado` VARCHAR(20), IN `NomFun` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(20), IN `Sexo` CHAR(1), IN `Telefono` VARCHAR(8), IN `Email` VARCHAR(20))  begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, 
    CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdFun, NomFun, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
    insert into FunTb06 (VcFunTb06_IdFuncionario,VcFunTb06_Clave, DtFunTb06_FechaNac, VcFunTb06_Estado)
    values (IdFun, Clave, FechaNac, Estado);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_Listar` (IN `inicio` INT, IN `final` INT)  begin
select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email', funtb06.VcFunTb06_Clave as 'Clave', 
 funtb06.DtFunTb06_FechaNac as 'Fecha_Nac', funtb06.VcFunTb06_Estado as 'Estado'
    from UsuTb01, funtb06
    where funtb06.VcFunTb06_IdFuncionario = usutb01.VcUsuTb01_Cedula
	order by 'date added' limit inicio,final;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaGradoTb13_ActualizarGrado` (IN `IdGrado` INT, IN `NombreGrado` VARCHAR(20), IN `IdBachiller` INT)  begin
	update GradoTb13
    set   VcGradoTb13_NombreGrado = NombreGrado, InBachillerTb14_IdBachiller = IdBachiller 
    where InGradoTb13_IdGrado = IdGrado;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaGradoTb13_BorrarGrado` (IN `id` INT)  begin
	delete from gradotb13 where InGradoTb13_IdGrado = id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaGradoTb13_BuscarGrado` (IN `IdGrado` INT)  begin
	select gradotb13.InGradoTb13_IdGrado as 'id_grado' , gradotb13.VcGradoTb13_NombreGrado as 'Nombre', 
    bachillertb14.InBachillerTb14_IdBachiller as 'IdBachiller'
    from gradotb13 inner join bachillertb14 
    on bachillertb14.InBachillerTb14_IdBachiller = gradotb13.InBachillerTb14_IdBachiller
     where InGradoTb13_IdGrado = IdGrado;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaGradoTb13_BuscarGradoD` (IN `dato` VARCHAR(20))  begin
	select gradotb13.InGradoTb13_IdGrado as 'id_grado' , gradotb13.VcGradoTb13_NombreGrado as 'Nombre', 
    bachillertb14.VcBachillerTb14_NombreBachiller as 'Bachiller'
    from gradotb13 inner join bachillertb14 
    on bachillertb14.InBachillerTb14_IdBachiller = gradotb13.InBachillerTb14_IdBachiller
     where InGradoTb13_IdGrado like concat('%',dato,'%')
     or VcGradoTb13_NombreGrado like concat('%',dato,'%')
     or  bachillertb14.VcBachillerTb14_NombreBachiller like concat('%',dato,'%');
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaGradoTb13_GuardarGrado` (IN `NombreGrado` VARCHAR(20), IN `IdBachiller` INT)  begin
	insert into GradoTb13(VcGradoTb13_NombreGrado, InBachillerTb14_IdBachiller)
    values (NombreGrado, IdBachiller);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaGradoTb13_Listar` (IN `inicio` INT, IN `final` INT)  begin
	select gradotb13.InGradoTb13_IdGrado as 'id_grado' , gradotb13.VcGradoTb13_NombreGrado as 'Nombre', 
    bachillertb14.VcBachillerTb14_NombreBachiller as 'Bachiller'
    from gradotb13 inner join bachillertb14 on bachillertb14.InBachillerTb14_IdBachiller = gradotb13.InBachillerTb14_IdBachiller
    order by 'date addeed' limit inicio,final;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaGradoTb13_Listar_Todo` ()  begin
	select gradotb13.InGradoTb13_IdGrado as 'id_grado' , gradotb13.VcGradoTb13_NombreGrado as 'Nombre', 
    bachillertb14.VcBachillerTb14_NombreBachiller as 'Bachiller'
    from gradotb13 inner join bachillertb14 on bachillertb14.InBachillerTb14_IdBachiller = gradotb13.InBachillerTb14_IdBachiller
    order by InGradoTb13_IdGrado;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaHorariosTb29_ActualizarHorario` (IN `Dia` VARCHAR(20), IN `HoraIni` TIME, IN `HoraFin` TIME)  begin
	update HorariosTb29 h
    set  h.VcHorariosTb29_Dia = Dia, h.TmHorariosTb29_Hora_Inicio = HoraIni, h.TmHorariosTb29_Hora_Final = HoraFin
    where h.InHorariosTb29_IdHorario = IdHorario;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaHorariosTb29_AgregarHorario` (IN `dia` VARCHAR(20), IN `ini` TIME, IN `fin` TIME)  BEGIN
	insert into horariostb29 (VcHorariosTb29_Dia, TmHorariosTb29_Hora_Inicio, TmHorariosTb29_Hora_Final)
    values (dia, ini, fin);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaHorariosTb29_AsignarHorario` (IN `idsec` INT, IN `idHo` INT, IN `idmat` INT, IN `idprof` VARCHAR(20))  BEGIN
	insert into matriculatb30 (InSeccionTb20_IdSeccion,InHorariosTb29_IdHorario,
    InMateriaTb17_IdMateria,VcProfTb04_IdProfesor)
    values(idsec, idHo, idmat, idprof);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaHorariosTb29_BuscarHorario` (IN `IdHo` INT)  begin
	select h.InHorariosTb29_IdHorario as 'Id', h.InMateriaTb17_IdMateria as 'Id_Materia', 
    h.VcHorariosTb29_Dia as 'Dia', h.TmHorariosTb29_Hora_Inicio as 'Hora_Inicio', 
    h.TmHorariosTb29_Hora_Final as 'Hora_Fin' 
    from HorariosTb29 h
	where h.InHorariosTb29_IdHorario = IdHo;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaHorarioTb28_EliminarHorario` (IN `IdHo` INT)  begin
	delete from HorariosTb29  
    where HorariosTb29.InHorarioTb28_IdHorario = IdHo;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_ActualizarMateria` (IN `IdMat` INT, IN `NomMat` VARCHAR(20))  begin
	update MateriaTb17
    set   materiatb17.VcMateriaTb17_Nombre = NomMat
    where materiatb17.InMateriaTb17_IdMateria = IdMat;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_BuscarMateria` (IN `IdMat` INT)  begin
	select InMateriaTb17_IdMateria as 'Id', VcMateriaTb17_Nombre as 'Nombre' 
    from MateriaTb17
     where InMateriaTb17_IdMateria = IdMat;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_BuscarMateriaD` (IN `dato` VARCHAR(20))  begin
	select InMateriaTb17_IdMateria as 'Id', VcMateriaTb17_Nombre as 'Nombre' 
    from MateriaTb17
     where InMateriaTb17_IdMateria like concat('%',dato,'%')
     or VcMateriaTb17_Nombre like concat('%',dato,'%');
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_EliminarMateria` (IN `IdMat` INT)  begin
	delete from MateriaTb17 where materiatb17.InMateriaTb17_IdMateria = IdMat;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_GuardarMateria` (IN `NomMat` VARCHAR(20))  begin
	insert into MateriaTb17 (VcMateriaTb17_Nombre)
    values (NomMat);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_Listar` (IN `inicio` INT, IN `final` INT)  BEGIN
	SELECT InMateriaTb17_IdMateria AS 'Id', VcMateriaTb17_Nombre AS 'Nombre'
    FROM  MateriaTb17
    ORDER BY 'date added' LIMIT inicio,final;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_ListarA` ()  BEGIN
	SELECT m.InMateriaTb17_IdMateria AS 'Id', m.VcMateriaTb17_Nombre AS 'Materia',  usutb01.VcUsuTb01_Cedula AS 'Cedula',
   concat(usutb01.VcUsuTb01_Nombre, ' ' ,usutb01.VcUsuTb01_Ape1, ' ', usutb01.VcUsuTb01_Ape2) as 'Asignado'
    FROM asigmateriatb19 as a inner join  usutb01 on  usutb01.VcUsuTb01_Cedula = a.VcProfTb04_IdProfesor
    join MateriaTb17 as m on a.InMateriaTb17_IdMateria = m.InMateriaTb17_IdMateria
    ORDER BY 'date added';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_Listar_Asigna` ()  BEGIN
	SELECT usutb01.VcUsuTb01_Cedula AS 'Cedula',usutb01.VcUsuTb01_Nombre AS 'Nombre',
    usutb01.VcUsuTb01_Ape1 AS 'Apellido1',usutb01.VcUsuTb01_Ape2 AS 'Apellido2' 
    FROM usutb01 INNER JOIN proftb04 ON usutb01.VcUsuTb01_Cedula = proftb04.VcProfTb04_IdProfesor 
    ORDER BY 'date added';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_Listar_Todos` ()  begin
	select InMateriaTb17_IdMateria as 'Id', VcMateriaTb17_Nombre as 'Nombre' 
    from MateriaTb17;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMatriculaTb30_CargarSeccion` (IN `idMater` INT, IN `idProf` VARCHAR(20))  BEGIN
select secciontb20.InSeccionTb20_IdSeccion as 'Id_Seccion',gradotb13.VcGradoTb13_NombreGrado as 'Grado' ,secciontb20.InSeccionTb20_Num_Grupo as 'num_grupo'
from secciontb20 inner join secgradotb25 on secciontb20.InSeccionTb20_IdSeccion = secgradotb25.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado 
join matriculatb30 on secciontb20.InSeccionTb20_IdSeccion = matriculatb30.InSeccionTb20_IdSeccion 
where matriculatb30.InMateriaTb17_IdMateria = idMater and matriculatb30.VcProfTb04_IdProfesor = idProf;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMatriculaTb30_MatriculaProf` (IN `sec` INT, IN `horario` INT, IN `mat` INT, IN `prof` VARCHAR(20))  BEGIN
	insert into matriculatb30 (InSeccionTb20_IdSeccion,InHorariosTb29_IdHorario,InMateriaTb17_IdMateria,VcProfTb04_IdProfesor)
    values(sec, horario, mat, prof);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_ActualizarProf` (IN `IdProf` VARCHAR(20), IN `FecNac` DATE, IN `Clave` VARCHAR(20), IN `Nom` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(100), IN `Telefono` VARCHAR(8), IN `Email` VARCHAR(100))  begin
	update usutb01, ProfTb04
    set usutb01.VcUsuTb01_Nombre = Nom,
    usutb01.VcUsuTb01_Ape1 = Ape1,usutb01.VcUsuTb01_Ape2 = Ape2,usutb01.VcUsuTb01_Direccion = Direccion,
    usutb01.VcUsuTb01_Telefono = Telefono,usutb01.VcUsuTb01_Email = Email,
    ProfTb04.VcProfTb04_IdProfesor = IdProf, ProfTb04.VcProfTb04_Clave = Clave,
    ProfTb04.DtProfTb04_FechaNac = FecNac
    where ProfTb04.VcProfTb04_IdProfesor = IdProf and usutb01.VcUsuTb01_Cedula = IdProf;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_Asigna_SecProf` (IN `IdProf` VARCHAR(20), IN `IdSec` INT)  BEGIN
insert into seccionproftb27(VcProfTb04_IdProfesor,InSeccionTb20_IdSeccion) 
    values(IdProf, IdSec);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_BorrarProf` (IN `IdProf` VARCHAR(20))  begin
update proftb04 set VcProfTb04_Estado = 'I' where VcProfTb04_IdProfesor = IdProf;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_BuscarProf` (IN `cedula` VARCHAR(20))  begin
	select u.VcUsuTb01_Cedula as 'Cedula', u.VcUsuTb01_Nombre as 'Nombre', u.VcUsuTb01_Ape1 as 'Apellido1',
    u.VcUsuTb01_Ape2 as 'Apellido2', u.VcUsuTb01_Direccion as 'Direccion', u.CrUsuTb01_Sexo as 'Sexo',
    u.VcUsuTb01_Telefono as 'Telefono', u.VcUsuTb01_Email as 'Correo_Electronico',
    p.VcProfTb04_IdProfesor as 'Id_Profesor', p.DtProfTb04_FechaNac as 'Fecha_Nac',
    p.VcProfTb04_Clave as 'Clave', p.VcProfTb04_Estado as 'Estado'
    from ProfTb04 as p inner join usutb01 as u on p.VcProfTb04_IdProfesor = u.VcUsuTb01_Cedula
  where p.VcProfTb04_IdProfesor = cedula;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_BuscarProfD` (IN `dato` VARCHAR(20))  begin
	select u.VcUsuTb01_Cedula as 'Cedula', u.VcUsuTb01_Nombre as 'Nombre', u.VcUsuTb01_Ape1 as 'Apellido1',
    u.VcUsuTb01_Ape2 as 'Apellido2', u.VcUsuTb01_Direccion as 'Direccion', u.CrUsuTb01_Sexo as 'Sexo',
    u.VcUsuTb01_Telefono as 'Telefono', u.VcUsuTb01_Email as 'Correo_Electronico',
    p.VcProfTb04_IdProfesor as 'Id_Profesor', p.DtProfTb04_FechaNac as 'Fecha_Nac',
    p.VcProfTb04_Clave as 'Clave', p.VcProfTb04_Estado as 'Estado'
    from ProfTb04 as p inner join usutb01 as u on p.VcProfTb04_IdProfesor = u.VcUsuTb01_Cedula
  where p.VcProfTb04_IdProfesor like concat('%',dato,'%') 
  or u.VcUsuTb01_Nombre like concat('%',dato,'%')
  or u.VcUsuTb01_Ape1 like concat('%',dato,'%')
  or  u.VcUsuTb01_Ape2 like concat('%',dato,'%')
  or u.VcUsuTb01_Direccion like concat('%',dato,'%')
  or u.CrUsuTb01_Sexo like concat('%',dato,'%')
  or u.VcUsuTb01_Email like concat('%',dato,'%');
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_GuardarProf` (IN `IdProf` VARCHAR(20), IN `FecNacProf` DATE, IN `Clave` VARCHAR(20), IN `Estado` VARCHAR(20), IN `NomProf` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(100), IN `Sexo` CHAR(1), IN `Telefono` VARCHAR(8), IN `Email` VARCHAR(100))  begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, 
    CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdProf, NomProf, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
     insert into ProfTb04 (VcProfTb04_IdProfesor, DtProfTb04_FechaNac, VcProfTb04_Clave, VcProfTb04_Estado)
    values (IdProf, FecNacProf, Clave, Estado);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_Listar` (IN `inicio` INT, IN `final` INT)  begin
select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email',ProfTb04.VcProfTb04_Clave as 'Clave', 
 ProfTb04.DtProfTb04_FechaNac as 'Fecha_Nac', ProfTb04.VcProfTb04_Estado as 'Estado'
    from UsuTb01, ProfTb04
    where ProfTb04.VcProfTb04_IdProfesor = UsuTb01.VcUsuTb01_Cedula and proftb04.VcProfTb04_Estado = 'A'
	order by 'date added' limit inicio,final;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_ListarA` ()  begin
select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email',ProfTb04.VcProfTb04_Clave as 'Clave', 
 ProfTb04.DtProfTb04_FechaNac as 'Fecha_Nac', ProfTb04.VcProfTb04_Estado as 'Estado'
    from UsuTb01, ProfTb04
    where ProfTb04.VcProfTb04_IdProfesor = UsuTb01.VcUsuTb01_Cedula and proftb04.VcProfTb04_Estado = 'A'
	order by VcProfTb04_IdProfesor;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_Listar_Asigna` ()  BEGIN
	SELECT usutb01.VcUsuTb01_Cedula AS 'Cedula',
    concat(usutb01.VcUsuTb01_Nombre, ' ' ,usutb01.VcUsuTb01_Ape1, ' ', usutb01.VcUsuTb01_Ape2) as 'Profesor'
    FROM usutb01 INNER JOIN proftb04 ON usutb01.VcUsuTb01_Cedula = proftb04.VcProfTb04_IdProfesor 
    ORDER BY usutb01.VcUsuTb01_Cedula ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionprofTb27_Asignar` (IN `ids` INT, IN `idp` VARCHAR(20))  BEGIN
insert into seccionproftb27(InSeccionTb20_IdSeccion,VcProfTb04_IdProfesor) 
    values(ids,idp);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_ActualizarSeccion` (IN `id_grupo` INT, IN `cupo` INT, IN `num_grupo` INT)  begin
	update secciontb20 set InSeccionTb20_Num_Grupo = num_grupo,InSeccionTb20_Cupo = cupo 
    where InSeccionTb20_IdSeccion = id_grupo;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_Borrar_Seccion` (IN `id_seccion` INT)  begin
	delete from SeccionTb20 where InSeccionTb20_IdSeccion = id_seccion;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_BuscarSeccion` (IN `id_sec` INT)  begin
select secciontb20.InSeccionTb20_IdSeccion as 'ID_Seccion',secciontb20.InSeccionTb20_Cupo as 'cupo',
secciontb20.InSeccionTb20_Num_Grupo as 'Num_grupo',gradotb13.VcGradoTb13_NombreGrado as 'Grado' 
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
where secciontb20.InSeccionTb20_IdSeccion = id_sec;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_BuscarSeccionD` (IN `dato` VARCHAR(20))  begin
select secciontb20.InSeccionTb20_IdSeccion as 'ID_Seccion',secciontb20.InSeccionTb20_Cupo as 'cupo',
secciontb20.InSeccionTb20_Num_Grupo as 'Num_grupo',gradotb13.VcGradoTb13_NombreGrado as 'Grado' 
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
where secciontb20.InSeccionTb20_IdSeccion like concat('%',dato,'%')
or secciontb20.InSeccionTb20_Cupo like concat('%',dato,'%')
or secciontb20.InSeccionTb20_Num_Grupo like concat('%',dato);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_BuscarSecCompleta` (IN `numGra` INT, IN `numSec` INT)  BEGIN
select concat(gradotb13.VcGradoTb13_NombreGrado, '-',secciontb20.InSeccionTb20_Num_Grupo) as 'Seccion' 
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
join secesttb28 on secesttb28.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion
join graesttb26 on graesttb26.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
where gradotb13.InGradoTb13_IdGrado like concat('%',numGra)
and secciontb20.InSeccionTb20_IdSeccion like concat(numSec,'%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_Guardar_Seccion` (IN `cupo` INT, IN `num_grupo` INT, IN `Grado` INT)  begin
DECLARE CONT INT;
DECLARE id INT;
select COUNT(*) INTO CONT from SeccionTb20;
if(CONT > 0)
then insert into secciontb20(InSeccionTb20_cupo,InSeccionTb20_Num_Grupo) VALUES(cupo,num_grupo);
select InSeccionTb20_IdSeccion from secciontb20 order by InSeccionTb20_IdSeccion desc limit 1 into id;
insert into secgradotb25(InGradoTb13_IdGrado,InSeccionTb20_IdSeccion)
select gradotb13.InGradoTb13_IdGrado,secciontb20.InSeccionTb20_IdSeccion 
from gradotb13,secciontb20 
where gradotb13.InGradoTb13_IdGrado = Grado and secciontb20.InSeccionTb20_IdSeccion = id;
else 
		insert into secciontb20(InSeccionTb20_cupo,InSeccionTb20_Num_Grupo) VALUES(cupo,num_grupo);
		insert into secgradotb25(InGradoTb13_IdGrado,InSeccionTb20_IdSeccion)
select gradotb13.InGradoTb13_IdGrado,secciontb20.InSeccionTb20_IdSeccion 
from gradotb13,secciontb20 
where gradotb13.InGradoTb13_IdGrado = Grado;
end if;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_ListaNumSec` ()  BEGIN
select secciontb20.InSeccionTb20_IdSeccion as 'ID_Seccion',
secciontb20.InSeccionTb20_Num_Grupo as 'Grupo' 
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado   
ORDER BY 'date added';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_Listar` (IN `inicio` INT, IN `final` INT)  begin
select secciontb20.InSeccionTb20_IdSeccion as 'ID_Seccion',secciontb20.InSeccionTb20_Cupo as 'cupo',
secciontb20.InSeccionTb20_Num_Grupo as 'Num_grupo',gradotb13.VcGradoTb13_NombreGrado as 'Grado'
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
order by 'date addeed' limit inicio,final;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_ListarEst` (IN `idsec` INT)  BEGIN
    select usutb01.VcUsuTb01_Cedula AS 'Cedula',
   concat(usutb01.VcUsuTb01_Nombre, ' ' ,usutb01.VcUsuTb01_Ape1, ' ', usutb01.VcUsuTb01_Ape2) as 'Estudiante',
concat(gradotb13.VcGradoTb13_NombreGrado,'-', secciontb20.InSeccionTb20_Num_Grupo) as 'Seccion'
from usutb01, esttb03, secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
where secciontb20.InSeccionTb20_IdSeccion = idsec
and  usutb01.VcUsuTb01_Cedula = esttb03.VcEstTb03_IdEstudiante
ORDER BY esttb03.VcEstTb03_IdEstudiante ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_Listar_Todos` ()  BEGIN
select 
secciontb20.InSeccionTb20_Cupo as 'Cupo',
gradotb13.VcGradoTb13_NombreGrado as 'Grado',
secciontb20.InSeccionTb20_Num_Grupo as 'Grupo' 
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado   
ORDER BY 'date added';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_Lista_Sec` ()  BEGIN
select secciontb20.InSeccionTb20_IdSeccion as 'ID_Seccion',
concat(gradotb13.VcGradoTb13_NombreGrado,'-', secciontb20.InSeccionTb20_Num_Grupo) as 'Seccion'
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
ORDER BY GradoTb13.VcGradoTb13_NombreGrado ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_Lista_SecProf` (IN `IdProf` VARCHAR(20), IN `IdSec` INT)  BEGIN
select secciontb20.InSeccionTb20_IdSeccion as 'ID_Seccion',gradotb13.VcGradoTb13_NombreGrado as 'Grado',
secciontb20.InSeccionTb20_Num_Grupo as 'Num_grupo'
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado 
order by 'date added';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSecEstTb28_Listar_Asist` (IN `idSec` INT)  begin
select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2' 
 from usutb01 inner join secesttb28 on usutb01.VcUsuTb01_Cedula = secesttb28.VcEstTb03_IdEstudiante 
 where secesttb28.InSeccionTb20_IdSeccion = idSec;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSecGradoTb25_Listar` (IN `numGra` INT, IN `numSec` INT)  BEGIN
select gradotb13.VcGradoTb13_NombreGrado as 'Grado'
from gradotb13 inner join secgradotb25 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
join graesttb26 on graesttb26.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
where secgradotb25.InGradoTb13_IdGrado =  numGra and
secgradotb25.InSeccionTb20_IdSeccion = numSec;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeguridadTb31_Validar_Usu` (IN `usu` VARCHAR(20), IN `pass` VARCHAR(20))  BEGIN
IF EXISTS(SELECT AdmTb02.VcAdmTb02_IdAdmin FROM AdmTb02  
	WHERE AdmTb02.VcAdmTb02_IdAdmin = usu AND AdmTb02.VcAdmTb02_Clave = pass)
THEN 
	SELECT SeguridadTb31.VcSeguridadTb31_Funcion AS 'Funcion',SeguridadTb31.VcSeguridadTb31_Glyphicons AS 'Iconos',
	SeguridadTb31.VcSeguridadTb31_SideNav AS 'SideNav' FROM SeguridadTb31 
	WHERE SeguridadTb31.InSeguridadTb31_Nivel = 1;
ELSEIF EXISTS(SELECT ProfTb04.VcProfTb04_IdProfesor FROM ProfTb04 
    WHERE ProfTb04.VcProfTb04_IdProfesor = usu AND ProfTb04.VcProfTb04_Clave = pass)
THEN 
	SELECT SeguridadTb31.VcSeguridadTb31_Funcion AS 'Funcion',SeguridadTb31.VcSeguridadTb31_Glyphicons AS 'Iconos',
    SeguridadTb31.VcSeguridadTb31_SideNav AS 'SideNav' FROM SeguridadTb31 
    WHERE SeguridadTb31.InSeguridadTb31_Nivel = 2;
ELSEIF EXISTS(SELECT enctb05.VcEncTb05_IdEncargado FROM EncTb05 
	WHERE EncTb05.VcEncTb05_IdEncargado = USER AND EncTb05.Vcenctb05_Clave = pass)
THEN 
	SELECT SeguridadTb31.VcSeguridadTb31_Funcion AS 'Funcion',SeguridadTb31.VcSeguridadTb31_Glyphicons AS 'Iconos',
	SeguridadTb31.VcSeguridadTb31_SideNav AS 'SideNav' FROM SeguridadTb31 
	WHERE SeguridadTb31.InSeguridadTb31_Nivel = 3;
ELSEIF EXISTS(SELECT  funtb06.VcFunTb06_IdFuncionario FROM funtb06 
	WHERE funtb06.VcFunTb06_IdFuncionario = USER AND funtb06.VcFunTb06_Clave = pass)
THEN 
	SELECT SeguridadTb31.VcSeguridadTb31_Funcion AS 'Funcion',SeguridadTb31.VcSeguridadTb31_Glyphicons AS 'Iconos',
	SeguridadTb31.VcSeguridadTb31_SideNav AS 'SideNav' FROM SeguridadTb31 
	WHERE SeguridadTb31.InSeguridadTb31_Nivel = 4;
	END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaUsuTb01_ListarUsuarios` ()  BEGIN
 SELECT UsuTb01.VcUsuTb01_Cedula AS 'Cedula', 
 concat(UsuTb01.VcUsuTb01_Nombre, ' ', UsuTb01.VcUsuTb01_Ape1, ' ',UsuTb01.VcUsuTb01_Ape2)  AS 'Nombre'
 FROM UsuTb01 
	ORDER BY 'date added';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PaUsuTb01_TipoUsu` (IN `nivel` INT)  BEGIN
	 if exists(select SeguridadTb31.InSeguridadTb31_Nivel from SeguridadTb31
     where nivel = 1) 
     then select VcSeguridadTb31_Funcion, VcSeguridadTb31_Glyphicons,VcSeguridadTb31_SideNav 
     from SeguridadTb31 where InSeguridadTb31_Nivel = 1;
	elseif exists (select SeguridadTb31.InSeguridadTb31_Nivel from SeguridadTb31
     where nivel = 2) 
     then select VcSeguridadTb31_Funcion, VcSeguridadTb31_Glyphicons,VcSeguridadTb31_SideNav 
     from SeguridadTb31 where InSeguridadTb31_Nivel = 2;
	elseif exists (select SeguridadTb31.InSeguridadTb31_Nivel from SeguridadTb31
     where nivel = 3) 
     then select VcSeguridadTb31_Funcion, VcSeguridadTb31_Glyphicons,VcSeguridadTb31_SideNav 
     from SeguridadTb31 where InSeguridadTb31_Nivel = 3;
	elseif exists (select SeguridadTb31.InSeguridadTb31_Nivel from SeguridadTb31
     where nivel = 4) 
     then select VcSeguridadTb31_Funcion, VcSeguridadTb31_Glyphicons,VcSeguridadTb31_SideNav 
     from SeguridadTb31 where InSeguridadTb31_Nivel = 4;
     end if;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admtb02`
--

CREATE TABLE `admtb02` (
  `VcAdmTb02_IdAdmin` varchar(20) NOT NULL,
  `VcAdmTb02_Clave` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admtb02`
--

INSERT INTO `admtb02` (`VcAdmTb02_IdAdmin`, `VcAdmTb02_Clave`) VALUES
('102220111', 'asdf');

-- --------------------------------------------------------

--
-- Table structure for table `asiggradotb12`
--

CREATE TABLE `asiggradotb12` (
  `InGradoTb13_IdGrado` int(11) NOT NULL,
  `VcProfTb04_IdProf` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `asiggradotb12`
--

INSERT INTO `asiggradotb12` (`InGradoTb13_IdGrado`, `VcProfTb04_IdProf`) VALUES
(1, '102410145');

-- --------------------------------------------------------

--
-- Table structure for table `asigmateriatb19`
--

CREATE TABLE `asigmateriatb19` (
  `VcProfTb04_IdProfesor` varchar(20) NOT NULL,
  `InMateriaTb17_IdMateria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `asigmateriatb19`
--

INSERT INTO `asigmateriatb19` (`VcProfTb04_IdProfesor`, `InMateriaTb17_IdMateria`) VALUES
('116000070', 27),
('116000070', 2),
('102410145', 2),
('102410145', 1);

-- --------------------------------------------------------

--
-- Table structure for table `asistclasetb18`
--

CREATE TABLE `asistclasetb18` (
  `InAsistClaseTb18_IdAsistClase` int(11) NOT NULL,
  `DtAsistClaseTb18_Fecha` date NOT NULL,
  `TmAsistClaseTb18_Hora` time NOT NULL,
  `VcAsistClaseTb18_Estado` varchar(20) NOT NULL,
  `InMateriaTb17_IdMateria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `asistclasetb18`
--

INSERT INTO `asistclasetb18` (`InAsistClaseTb18_IdAsistClase`, `DtAsistClaseTb18_Fecha`, `TmAsistClaseTb18_Hora`, `VcAsistClaseTb18_Estado`, `InMateriaTb17_IdMateria`) VALUES
(1, '2017-11-17', '05:42:44', 'Presente', 1),
(2, '2017-11-17', '05:42:44', 'Ausente', 2),
(3, '2017-11-17', '05:42:44', 'Presente', 27),
(4, '2017-11-17', '05:42:44', 'Presente', 3),
(5, '2017-11-17', '05:42:44', 'Presente', 28);

-- --------------------------------------------------------

--
-- Table structure for table `asistclasetb18-2`
--

CREATE TABLE `asistclasetb18-2` (
  `InAsistClaseTb18_IdAsistClase` int(11) NOT NULL,
  `DtAsistClaseTb18_Fecha` date NOT NULL,
  `TmAsistClaseTb18_Hora` time NOT NULL,
  `VcAsistClaseTb18_Estado` varchar(20) NOT NULL,
  `InMateriaTb17_IdMateria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `asistcoletb08`
--

CREATE TABLE `asistcoletb08` (
  `InAsistColeTb08_IdAsistCole` int(11) NOT NULL,
  `TmAsistColeTb08_HoraEntrada` time NOT NULL,
  `DtAsistColeTb08_FechaEntrada` date NOT NULL,
  `TmAsistColeTb08_HoraSalida` time NOT NULL,
  `DtAsistColeTb08_FechaSalida` date NOT NULL,
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `asistesttb23`
--

CREATE TABLE `asistesttb23` (
  `InAsistClaseTb18_IdAsistClase` int(11) NOT NULL,
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `asistesttb23`
--

INSERT INTO `asistesttb23` (`InAsistClaseTb18_IdAsistClase`, `VcEstTb03_IdEstudiante`) VALUES
(1, '102580300'),
(2, '102580760'),
(3, '102580844');

-- --------------------------------------------------------

--
-- Table structure for table `bachillertb14`
--

CREATE TABLE `bachillertb14` (
  `InBachillerTb14_IdBachiller` int(11) NOT NULL,
  `VcBachillerTb14_NombreBachiller` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bachillertb14`
--

INSERT INTO `bachillertb14` (`InBachillerTb14_IdBachiller`, `VcBachillerTb14_NombreBachiller`) VALUES
(1, 'Internacional'),
(2, 'Nacional');

-- --------------------------------------------------------

--
-- Table structure for table `encreptb09`
--

CREATE TABLE `encreptb09` (
  `VcEncTb05_IdEncargado` varchar(20) NOT NULL,
  `InRepTb10_IdReporte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `enctb05`
--

CREATE TABLE `enctb05` (
  `VcEncTb05_IdEncargado` varchar(20) NOT NULL,
  `VcEncTb05_Clave` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enctb05`
--

INSERT INTO `enctb05` (`VcEncTb05_IdEncargado`, `VcEncTb05_Clave`) VALUES
('101074994', '1234'),
('101141843', '1234'),
('101230816', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `especialidadtb16`
--

CREATE TABLE `especialidadtb16` (
  `InEspecialidadTb16_IdEspecialidad` int(11) NOT NULL,
  `VcEspecialidadTb16_Nombre` varchar(20) NOT NULL,
  `InEspecialidadTb16_Cupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `especialidadtb16`
--

INSERT INTO `especialidadtb16` (`InEspecialidadTb16_IdEspecialidad`, `VcEspecialidadTb16_Nombre`, `InEspecialidadTb16_Cupo`) VALUES
(1, 'Informatica', 30),
(2, 'Contabilidad', 15),
(3, 'AyB', 20),
(6, 'Ing Sistemas', 30);

-- --------------------------------------------------------

--
-- Table structure for table `estenctb07`
--

CREATE TABLE `estenctb07` (
  `VcEncTb05_IdEncargado` varchar(20) NOT NULL,
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estenctb07`
--

INSERT INTO `estenctb07` (`VcEncTb05_IdEncargado`, `VcEstTb03_IdEstudiante`) VALUES
('101230816', '102580844'),
('101074994', '102580844'),
('101230816', '102580844'),
('101074994', '102580300'),
('101074994', '102580760');

-- --------------------------------------------------------

--
-- Table structure for table `estreptb22`
--

CREATE TABLE `estreptb22` (
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  `InRepTb10_IdReporte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `esttb03`
--

CREATE TABLE `esttb03` (
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  `DtEstTb03_FechaNac` date NOT NULL,
  `VcEstTb03_Adecuacion` varchar(20) NOT NULL,
  `VcEstTb03_Estado` varchar(20) NOT NULL,
  `InEspecialidadTb16_IdEspecialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `esttb03`
--

INSERT INTO `esttb03` (`VcEstTb03_IdEstudiante`, `DtEstTb03_FechaNac`, `VcEstTb03_Adecuacion`, `VcEstTb03_Estado`, `InEspecialidadTb16_IdEspecialidad`) VALUES
('102580300', '1993-10-04', 'No', 'A', 1),
('102580760', '1993-10-04', 'No_significativa', 'A', 2),
('102580844', '1993-10-04', 'Acceso', 'A', 3);

-- --------------------------------------------------------

--
-- Table structure for table `funcreptb21`
--

CREATE TABLE `funcreptb21` (
  `VcFunTb06_IdFuncionario` varchar(20) NOT NULL,
  `InRepTb10_IdReporte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `funtb06`
--

CREATE TABLE `funtb06` (
  `VcFunTb06_IdFuncionario` varchar(20) NOT NULL,
  `VcFunTb06_Clave` varchar(20) NOT NULL,
  `DtFunTb06_FechaNac` date NOT NULL,
  `VcFunTb06_Estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `funtb06`
--

INSERT INTO `funtb06` (`VcFunTb06_IdFuncionario`, `VcFunTb06_Clave`, `DtFunTb06_FechaNac`, `VcFunTb06_Estado`) VALUES
('102620342', '4567', '1978-03-06', 'A'),
('102620585', '1234', '1978-03-06', 'A'),
('102630207', '1234', '1978-03-06', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `gradoesptb15`
--

CREATE TABLE `gradoesptb15` (
  `InGradoTb13_IdGrado` int(11) NOT NULL,
  `InEspecialidadTb16_IdEspecialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gradotb13`
--

CREATE TABLE `gradotb13` (
  `InGradoTb13_IdGrado` int(11) NOT NULL,
  `VcGradoTb13_NombreGrado` varchar(20) NOT NULL,
  `InBachillerTb14_IdBachiller` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gradotb13`
--

INSERT INTO `gradotb13` (`InGradoTb13_IdGrado`, `VcGradoTb13_NombreGrado`, `InBachillerTb14_IdBachiller`) VALUES
(1, '7', 2),
(2, '8', 2),
(3, '9', 2);

-- --------------------------------------------------------

--
-- Table structure for table `graesttb26`
--

CREATE TABLE `graesttb26` (
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  `InGradoTb13_IdGrado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `graesttb26`
--

INSERT INTO `graesttb26` (`VcEstTb03_IdEstudiante`, `InGradoTb13_IdGrado`) VALUES
('102580300', 1);

-- --------------------------------------------------------

--
-- Table structure for table `horariostb29`
--

CREATE TABLE `horariostb29` (
  `InHorariosTb29_IdHorario` int(11) NOT NULL,
  `VcHorariosTb29_Dia` varchar(20) NOT NULL,
  `TmHorariosTb29_Hora_Inicio` time NOT NULL,
  `TmHorariosTb29_Hora_Final` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `horariostb29`
--

INSERT INTO `horariostb29` (`InHorariosTb29_IdHorario`, `VcHorariosTb29_Dia`, `TmHorariosTb29_Hora_Inicio`, `TmHorariosTb29_Hora_Final`) VALUES
(1, 'Lunes', '08:00:00', '10:00:00'),
(2, 'Martes', '07:00:00', '07:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `inscmateriatb11`
--

CREATE TABLE `inscmateriatb11` (
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  `InMateriaTb17_IdMateria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inscmateriatb11`
--

INSERT INTO `inscmateriatb11` (`VcEstTb03_IdEstudiante`, `InMateriaTb17_IdMateria`) VALUES
('102580300', 1);

-- --------------------------------------------------------

--
-- Table structure for table `materiatb17`
--

CREATE TABLE `materiatb17` (
  `InMateriaTb17_IdMateria` int(11) NOT NULL,
  `VcMateriaTb17_Nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `materiatb17`
--

INSERT INTO `materiatb17` (`InMateriaTb17_IdMateria`, `VcMateriaTb17_Nombre`) VALUES
(1, 'Sociales'),
(2, 'Español'),
(3, 'Ciencias'),
(27, 'ingles'),
(28, 'Civica'),
(30, 'Matemáticas'),
(32, 'Fisica');

-- --------------------------------------------------------

--
-- Table structure for table `matriculatb30`
--

CREATE TABLE `matriculatb30` (
  `InSeccionTb20_IdSeccion` int(11) NOT NULL,
  `InHorariosTb29_IdHorario` int(11) NOT NULL,
  `InMateriaTb17_IdMateria` int(11) NOT NULL,
  `VcProfTb04_IdProfesor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matriculatb30`
--

INSERT INTO `matriculatb30` (`InSeccionTb20_IdSeccion`, `InHorariosTb29_IdHorario`, `InMateriaTb17_IdMateria`, `VcProfTb04_IdProfesor`) VALUES
(20, 1, 1, '102410145'),
(25, 2, 2, '116000070');

-- --------------------------------------------------------

--
-- Table structure for table `profreptb24`
--

CREATE TABLE `profreptb24` (
  `VcProfTb04_IdProfesor` varchar(20) NOT NULL,
  `InRepTb10_IdReporte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `proftb04`
--

CREATE TABLE `proftb04` (
  `VcProfTb04_IdProfesor` varchar(20) NOT NULL,
  `VcProfTb04_Clave` varchar(20) NOT NULL,
  `DtProfTb04_FechaNac` date NOT NULL,
  `VcProfTb04_Estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proftb04`
--

INSERT INTO `proftb04` (`VcProfTb04_IdProfesor`, `VcProfTb04_Clave`, `DtProfTb04_FechaNac`, `VcProfTb04_Estado`) VALUES
('102410145', '1234', '1993-10-04', 'A'),
('102410237', '1234', '1993-10-04', 'A'),
('102410877', '1234', '1993-10-04', 'A'),
('116000070', '3333', '1990-03-12', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `reptb10`
--

CREATE TABLE `reptb10` (
  `InRepTb10_IdReporte` int(11) NOT NULL,
  `DtRepTb10_FechaReporte` date NOT NULL,
  `TmRepTb10_HoraReporte` time NOT NULL,
  `InAsistClaseTb18_IdAsistClase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `seccionproftb27`
--

CREATE TABLE `seccionproftb27` (
  `VcProfTb04_IdProfesor` varchar(20) NOT NULL,
  `InSeccionTb20_IdSeccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seccionproftb27`
--

INSERT INTO `seccionproftb27` (`VcProfTb04_IdProfesor`, `InSeccionTb20_IdSeccion`) VALUES
('102410145', 20),
('116000070', 25),
('102410877', 18),
('102410237', 18);

-- --------------------------------------------------------

--
-- Table structure for table `secciontb20`
--

CREATE TABLE `secciontb20` (
  `InSeccionTb20_IdSeccion` int(11) NOT NULL,
  `InSeccionTb20_Num_Grupo` int(11) NOT NULL,
  `InSeccionTb20_Cupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `secciontb20`
--

INSERT INTO `secciontb20` (`InSeccionTb20_IdSeccion`, `InSeccionTb20_Num_Grupo`, `InSeccionTb20_Cupo`) VALUES
(18, 3, 15),
(20, 4, 21),
(22, 2, 12),
(25, 5, 12);

-- --------------------------------------------------------

--
-- Table structure for table `secesttb28`
--

CREATE TABLE `secesttb28` (
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  `InSeccionTb20_IdSeccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `secesttb28`
--

INSERT INTO `secesttb28` (`VcEstTb03_IdEstudiante`, `InSeccionTb20_IdSeccion`) VALUES
('102580300', 18);

-- --------------------------------------------------------

--
-- Table structure for table `secgradotb25`
--

CREATE TABLE `secgradotb25` (
  `InGradoTb13_IdGrado` int(11) NOT NULL,
  `InSeccionTb20_IdSeccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `secgradotb25`
--

INSERT INTO `secgradotb25` (`InGradoTb13_IdGrado`, `InSeccionTb20_IdSeccion`) VALUES
(1, 18),
(1, 20),
(2, 22),
(3, 25);

-- --------------------------------------------------------

--
-- Table structure for table `seguridadtb31`
--

CREATE TABLE `seguridadtb31` (
  `VcSeguridadTb31_Funcion` varchar(200) NOT NULL,
  `VcSeguridadTb31_Glyphicons` varchar(200) NOT NULL,
  `VcSeguridadTb31_SideNav` varchar(200) NOT NULL,
  `InSeguridadTb31_Id` int(11) NOT NULL,
  `InSeguridadTb31_Nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seguridadtb31`
--

INSERT INTO `seguridadtb31` (`VcSeguridadTb31_Funcion`, `VcSeguridadTb31_Glyphicons`, `VcSeguridadTb31_SideNav`, `InSeguridadTb31_Id`, `InSeguridadTb31_Nivel`) VALUES
('function principal(){$(\"#contenido\").load(\'Vista/Seg_Nivel/Nivel_1/principal.php\');}', '<li><a class=\"glyphicon glyphicon-home\" style=\"margin-top:25px; \" href=\"index.php\"></a></li>', '<a href=\"index.php\">Inicio</a>', 1, 1),
('function profesor(){$(\"#contenido\").load(\'Vista/Seg_Nivel/Nivel_1/Profesor.php\');}', ' <li><a class=\"glyphicon glyphicon-blackboard\" style=\"margin-top:15px; \" href=\"#\" onclick=\"profesor();\"></a></li>', '<a href=\"#\" onclick=\"profesor();\">Profesores</a>', 2, 1),
('function especialidad(){$(\"#contenido\").load(\'Vista/Seg_Nivel/Nivel_1/Especialidad.php\');}', ' <li><a class=\"glyphicon glyphicon-blackboard\" style=\"margin-top:15px; \" href=\"#\" onclick=\"especialidad();\"></a></li>', '<a href=\"#\" onclick=\"especialidad();\">Especialidad</a>', 3, 1),
('function seccion(){$(\"#contenido\").load(\'Vista/Seg_Nivel/Nivel_1/Seccion-Grupo.php\');}   ', '<li><a class=\"glyphicon glyphicon-sound-7-1\" style=\"margin-top:15px; \" href=\"#\" onclick=\"seccion();\"></a></li>', '<a href=\"#\" onclick=\"seccion();\">Secciones</a>', 4, 1),
('function encargado(){$(\"#contenido\").load(\'Vista/Seg_Nivel/Nivel_1/Encargado.php\');}', '<li><a class=\"glyphicon glyphicon-eye-open\" style=\"margin-top:15px; \" href=\"#\" onclick=\"encargado();\"></a></li>', '<a href=\"#\" onclick=\"encargado();\">Padres</a>', 5, 1),
('function funcionario(){$(\"#contenido\").load(\'Vista/Seg_Nivel/Nivel_1/Funcionario.php\');}', '<li><a class=\"glyphicon glyphicon-user\" style=\"margin-top:15px; \" href=\"#\" onclick=\"funcionario();\"></a></li>', '<a href=\"#\" onclick=\"funcionario();\">Funcionarios</a>', 6, 1),
('function estudiante(){$(\"#contenido\").load(\'Vista/Seg_Nivel/Nivel_1/Estudiante.php\');}', '<li><a class=\"glyphicon glyphicon-education\" style=\"margin-top:15px; \" href=\"#\" onclick=\"estudiante();\"></a></li>', '<a href=\"#\" onclick=\"estudiante();\">Estudiantes</a>', 7, 1),
('function materia(){$(\"#contenido\").load(\'Vista/Seg_Nivel/Nivel_1/Materia.php\');}', ' <li><a class=\"glyphicon glyphicon-book\" style=\"margin-top:15px; \" href=\"#\" onclick=\"materia();\"></a></li>', '<a href=\"#\" onclick=\"materia();\">Materias</a>', 8, 1),
('function principal(){\r\n$(\'#contenido\').load(\'Vista/Seg_Nivel/Nivel_2/Asistencia.php\');\r\n}', 'nada', 'nada', 9, 2),
('function principal(){\r\n$(\'#contenido\').load(\'Vista/Seg_Nivel/Nivel_3/Encargado.php\');\r\n}', ' ', ' ', 10, 3),
('function grado(){\r\n$(\'#contenido\').load(\'Vista/Seg_Nivel/Nivel_1/Grado.php\');}', '<li><a class=\"glyphicon glyphicon-file\" style=\"margin-top:15px; \" href=\"#\" onclick=\"grado();\"></a></li>', ' <a href=\"#\" onclick=\"grado();\">Grado</a>', 11, 1),
('function bachiller(){\r\n$(\'#contenido\').load(\'Vista/Seg_Nivel/Nivel_1/Bachiller.php\');}', '<li><a class=\"glyphicon glyphicon-list-alt\" style=\"margin-top:15px; \" href=\"#\" onclick=\"bachiller();\"></a></li>', '<a href=\"#\" onclick=\"bachiller();\">Bachiller</a>', 12, 1),
('function horario(){\r\n$(\'#contenido\').load(\'Vista/Seg_Nivel/Nivel_1/Horarios.php\');}', '<li><a class=\"glyphicon glyphicon-tasks\" style=\"margin-top:15px; \" href=\"#\" onclick=\"horario();\"></a></li>', '<a href=\"#\" onclick=\"horario();\">Horarios</a>', 13, 1),
('function Usuario(){\r\n$(\'#contenido\').load(\'Vista/Seg_Nivel/Nivel_1/Usuario.php\');}', '<li><a class=\"glyphicon glyphicon-wrench\" style=\"margin-top:15px; \"href=\"#\" onclick=\"Usuario();\"></a></li>', '<a href=\"#\" onclick=\"Usuario();\">Usuarios</a>', 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usutb01`
--

CREATE TABLE `usutb01` (
  `VcUsuTb01_Cedula` varchar(20) NOT NULL,
  `VcUsuTb01_Nombre` varchar(20) NOT NULL,
  `VcUsuTb01_Ape1` varchar(20) NOT NULL,
  `VcUsuTb01_Ape2` varchar(20) NOT NULL,
  `VcUsuTb01_Direccion` varchar(100) NOT NULL,
  `CrUsuTb01_Sexo` char(1) NOT NULL,
  `VcUsuTb01_Telefono` varchar(8) NOT NULL,
  `VcUsuTb01_Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usutb01`
--

INSERT INTO `usutb01` (`VcUsuTb01_Cedula`, `VcUsuTb01_Nombre`, `VcUsuTb01_Ape1`, `VcUsuTb01_Ape2`, `VcUsuTb01_Direccion`, `CrUsuTb01_Sexo`, `VcUsuTb01_Telefono`, `VcUsuTb01_Email`) VALUES
('101074994', 'Francisca', 'ROJAS', 'UREï¿½A', 'Nicoya', 'F', '26453312', 'fran@gmail.com'),
('101141843', 'SACRAMENTO', 'MORA', 'MORALES', 'Moracia', 'M', '77654423', 'sacra@outlook.com'),
('101230816', 'VIRGINIA', 'ROVIRA', 'PANIAGUA', 'Nosara', 'F', '65441233', 'virg@outlook.com'),
('102410145', 'HARRY', 'JENKINS', 'CHAVARRIA', 'Santa Clara', 'F', '60918664', 'fina@outlook.com'),
('102410237', 'CECILIA', 'PORTILLA', 'IBARRA', 'Santa Clara', 'F', '60918664', 'fina@outlook.com'),
('102410877', 'FRANCISCA ELENA', 'PAVON', 'PAVON', 'Santa Clara', 'F', '60918664', 'fina@outlook.com'),
('102580300', 'TERESA', 'ARCE', 'VILLEGAS', 'Santa Clara', 'F', '60918664', 'fina@outlook.com'),
('102580760', 'MARIA DE LOS ANGELES', 'CARVAJAL', 'SABORIO', 'Santa Clara', 'F', '60918664', 'fina@outlook.com'),
('102580844', 'CECILIO', 'BADILLA', 'GUEVARA', 'Santa Clara', 'F', '60918664', 'fina@outlook.com'),
('102620342', 'RIGOBERTO', 'l', 'perez', 'gr', 'M', '88', 'a@g'),
('102620585', 'JORGE', 'MORA', 'SIBAJA', 'Samara', 'M', '88674699', 'franc@gmail.com'),
('102630207', 'FILIBERTO', 'JIMENEZ', 'JIMENEZ', 'Samara', 'M', '88674699', 'franc@gmail.com'),
('116000070', 'Anyu', 'villa', 'Peralta', 'Nandayure', 'F', '88776655', 'anyuvillalobos@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asiggradotb12`
--
ALTER TABLE `asiggradotb12`
  ADD KEY `FK_Prof` (`VcProfTb04_IdProf`),
  ADD KEY `FK_Gra` (`InGradoTb13_IdGrado`);

--
-- Indexes for table `asigmateriatb19`
--
ALTER TABLE `asigmateriatb19`
  ADD KEY `FK_Profes_M` (`VcProfTb04_IdProfesor`),
  ADD KEY `FK_Matt_P` (`InMateriaTb17_IdMateria`);

--
-- Indexes for table `asistclasetb18`
--
ALTER TABLE `asistclasetb18`
  ADD PRIMARY KEY (`InAsistClaseTb18_IdAsistClase`),
  ADD KEY `FK_Materi` (`InMateriaTb17_IdMateria`);

--
-- Indexes for table `asistclasetb18-2`
--
ALTER TABLE `asistclasetb18-2`
  ADD PRIMARY KEY (`InAsistClaseTb18_IdAsistClase`);

--
-- Indexes for table `asistcoletb08`
--
ALTER TABLE `asistcoletb08`
  ADD PRIMARY KEY (`InAsistColeTb08_IdAsistCole`),
  ADD KEY `FK_Est_Asis` (`VcEstTb03_IdEstudiante`);

--
-- Indexes for table `asistesttb23`
--
ALTER TABLE `asistesttb23`
  ADD KEY `FK_A_Estu` (`VcEstTb03_IdEstudiante`),
  ADD KEY `FK_As_Cla` (`InAsistClaseTb18_IdAsistClase`);

--
-- Indexes for table `bachillertb14`
--
ALTER TABLE `bachillertb14`
  ADD PRIMARY KEY (`InBachillerTb14_IdBachiller`);

--
-- Indexes for table `encreptb09`
--
ALTER TABLE `encreptb09`
  ADD KEY `FK_Enc_Rep` (`VcEncTb05_IdEncargado`),
  ADD KEY `FK_Id_Rep` (`InRepTb10_IdReporte`);

--
-- Indexes for table `enctb05`
--
ALTER TABLE `enctb05`
  ADD PRIMARY KEY (`VcEncTb05_IdEncargado`);

--
-- Indexes for table `especialidadtb16`
--
ALTER TABLE `especialidadtb16`
  ADD PRIMARY KEY (`InEspecialidadTb16_IdEspecialidad`);

--
-- Indexes for table `estenctb07`
--
ALTER TABLE `estenctb07`
  ADD KEY `FK_Est` (`VcEstTb03_IdEstudiante`),
  ADD KEY `FK_Enc` (`VcEncTb05_IdEncargado`);

--
-- Indexes for table `estreptb22`
--
ALTER TABLE `estreptb22`
  ADD KEY `FK_Est_R` (`VcEstTb03_IdEstudiante`),
  ADD KEY `FK_Rep_E` (`InRepTb10_IdReporte`);

--
-- Indexes for table `esttb03`
--
ALTER TABLE `esttb03`
  ADD PRIMARY KEY (`VcEstTb03_IdEstudiante`),
  ADD KEY `FK_Especialidad` (`InEspecialidadTb16_IdEspecialidad`);

--
-- Indexes for table `funcreptb21`
--
ALTER TABLE `funcreptb21`
  ADD KEY `FK_Fun` (`VcFunTb06_IdFuncionario`),
  ADD KEY `FK_Rep_Func` (`InRepTb10_IdReporte`);

--
-- Indexes for table `funtb06`
--
ALTER TABLE `funtb06`
  ADD PRIMARY KEY (`VcFunTb06_IdFuncionario`);

--
-- Indexes for table `gradoesptb15`
--
ALTER TABLE `gradoesptb15`
  ADD KEY `FK_Esp_Gra` (`InEspecialidadTb16_IdEspecialidad`),
  ADD KEY `FK_Gra_Esp` (`InGradoTb13_IdGrado`);

--
-- Indexes for table `gradotb13`
--
ALTER TABLE `gradotb13`
  ADD PRIMARY KEY (`InGradoTb13_IdGrado`),
  ADD KEY `FK_Bac` (`InBachillerTb14_IdBachiller`);

--
-- Indexes for table `graesttb26`
--
ALTER TABLE `graesttb26`
  ADD KEY `FK_Gra_E` (`InGradoTb13_IdGrado`),
  ADD KEY `FK_G_Est` (`VcEstTb03_IdEstudiante`);

--
-- Indexes for table `horariostb29`
--
ALTER TABLE `horariostb29`
  ADD PRIMARY KEY (`InHorariosTb29_IdHorario`);

--
-- Indexes for table `inscmateriatb11`
--
ALTER TABLE `inscmateriatb11`
  ADD KEY `FK_Est_Mate` (`VcEstTb03_IdEstudiante`),
  ADD KEY `FK_Id_Mate` (`InMateriaTb17_IdMateria`);

--
-- Indexes for table `materiatb17`
--
ALTER TABLE `materiatb17`
  ADD PRIMARY KEY (`InMateriaTb17_IdMateria`);

--
-- Indexes for table `matriculatb30`
--
ALTER TABLE `matriculatb30`
  ADD UNIQUE KEY `FK_Prof_Matri` (`VcProfTb04_IdProfesor`),
  ADD KEY `FK_Sec_Matri` (`InSeccionTb20_IdSeccion`),
  ADD KEY `FK_Hor_Matri` (`InHorariosTb29_IdHorario`),
  ADD KEY `FK_Mat_Matri` (`InMateriaTb17_IdMateria`);

--
-- Indexes for table `profreptb24`
--
ALTER TABLE `profreptb24`
  ADD KEY `FK_Prof_R` (`VcProfTb04_IdProfesor`),
  ADD KEY `FK_Rep_P` (`InRepTb10_IdReporte`);

--
-- Indexes for table `proftb04`
--
ALTER TABLE `proftb04`
  ADD PRIMARY KEY (`VcProfTb04_IdProfesor`);

--
-- Indexes for table `reptb10`
--
ALTER TABLE `reptb10`
  ADD PRIMARY KEY (`InRepTb10_IdReporte`),
  ADD KEY `FK_AsCla` (`InAsistClaseTb18_IdAsistClase`);

--
-- Indexes for table `seccionproftb27`
--
ALTER TABLE `seccionproftb27`
  ADD KEY `FK_Prof_S` (`VcProfTb04_IdProfesor`),
  ADD KEY `FK_Sec_P` (`InSeccionTb20_IdSeccion`);

--
-- Indexes for table `secciontb20`
--
ALTER TABLE `secciontb20`
  ADD PRIMARY KEY (`InSeccionTb20_IdSeccion`);

--
-- Indexes for table `secesttb28`
--
ALTER TABLE `secesttb28`
  ADD KEY `FK_Sec_Est` (`VcEstTb03_IdEstudiante`),
  ADD KEY `FK_Est_Sec` (`InSeccionTb20_IdSeccion`) USING BTREE;

--
-- Indexes for table `secgradotb25`
--
ALTER TABLE `secgradotb25`
  ADD KEY `FK_S_Gra` (`InGradoTb13_IdGrado`),
  ADD KEY `FK_Sec_G` (`InSeccionTb20_IdSeccion`);

--
-- Indexes for table `seguridadtb31`
--
ALTER TABLE `seguridadtb31`
  ADD PRIMARY KEY (`InSeguridadTb31_Id`);

--
-- Indexes for table `usutb01`
--
ALTER TABLE `usutb01`
  ADD PRIMARY KEY (`VcUsuTb01_Cedula`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asistclasetb18`
--
ALTER TABLE `asistclasetb18`
  MODIFY `InAsistClaseTb18_IdAsistClase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `asistclasetb18-2`
--
ALTER TABLE `asistclasetb18-2`
  MODIFY `InAsistClaseTb18_IdAsistClase` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `asistcoletb08`
--
ALTER TABLE `asistcoletb08`
  MODIFY `InAsistColeTb08_IdAsistCole` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bachillertb14`
--
ALTER TABLE `bachillertb14`
  MODIFY `InBachillerTb14_IdBachiller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `especialidadtb16`
--
ALTER TABLE `especialidadtb16`
  MODIFY `InEspecialidadTb16_IdEspecialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `gradotb13`
--
ALTER TABLE `gradotb13`
  MODIFY `InGradoTb13_IdGrado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `horariostb29`
--
ALTER TABLE `horariostb29`
  MODIFY `InHorariosTb29_IdHorario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `materiatb17`
--
ALTER TABLE `materiatb17`
  MODIFY `InMateriaTb17_IdMateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `reptb10`
--
ALTER TABLE `reptb10`
  MODIFY `InRepTb10_IdReporte` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `secciontb20`
--
ALTER TABLE `secciontb20`
  MODIFY `InSeccionTb20_IdSeccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `seguridadtb31`
--
ALTER TABLE `seguridadtb31`
  MODIFY `InSeguridadTb31_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `asiggradotb12`
--
ALTER TABLE `asiggradotb12`
  ADD CONSTRAINT `FK_Gra` FOREIGN KEY (`InGradoTb13_IdGrado`) REFERENCES `gradotb13` (`InGradoTb13_IdGrado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Prof` FOREIGN KEY (`VcProfTb04_IdProf`) REFERENCES `proftb04` (`VcProfTb04_IdProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `asigmateriatb19`
--
ALTER TABLE `asigmateriatb19`
  ADD CONSTRAINT `FK_Matt_P` FOREIGN KEY (`InMateriaTb17_IdMateria`) REFERENCES `materiatb17` (`InMateriaTb17_IdMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Profes_M` FOREIGN KEY (`VcProfTb04_IdProfesor`) REFERENCES `proftb04` (`VcProfTb04_IdProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `asistclasetb18`
--
ALTER TABLE `asistclasetb18`
  ADD CONSTRAINT `FK_Materi` FOREIGN KEY (`InMateriaTb17_IdMateria`) REFERENCES `materiatb17` (`InMateriaTb17_IdMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `asistcoletb08`
--
ALTER TABLE `asistcoletb08`
  ADD CONSTRAINT `FK_Est_Asis` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `asistesttb23`
--
ALTER TABLE `asistesttb23`
  ADD CONSTRAINT `FK_A_Estu` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_As_Cla` FOREIGN KEY (`InAsistClaseTb18_IdAsistClase`) REFERENCES `asistclasetb18` (`InAsistClaseTb18_IdAsistClase`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `encreptb09`
--
ALTER TABLE `encreptb09`
  ADD CONSTRAINT `FK_Enc_Rep` FOREIGN KEY (`VcEncTb05_IdEncargado`) REFERENCES `enctb05` (`VcEncTb05_IdEncargado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Id_Rep` FOREIGN KEY (`InRepTb10_IdReporte`) REFERENCES `reptb10` (`InRepTb10_IdReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `estenctb07`
--
ALTER TABLE `estenctb07`
  ADD CONSTRAINT `FK_Enc` FOREIGN KEY (`VcEncTb05_IdEncargado`) REFERENCES `enctb05` (`VcEncTb05_IdEncargado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Est` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `estreptb22`
--
ALTER TABLE `estreptb22`
  ADD CONSTRAINT `FK_Est_R` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Rep_E` FOREIGN KEY (`InRepTb10_IdReporte`) REFERENCES `reptb10` (`InRepTb10_IdReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `esttb03`
--
ALTER TABLE `esttb03`
  ADD CONSTRAINT `FK_Especialidad` FOREIGN KEY (`InEspecialidadTb16_IdEspecialidad`) REFERENCES `especialidadtb16` (`InEspecialidadTb16_IdEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `funcreptb21`
--
ALTER TABLE `funcreptb21`
  ADD CONSTRAINT `FK_Fun` FOREIGN KEY (`VcFunTb06_IdFuncionario`) REFERENCES `funtb06` (`VcFunTb06_IdFuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Rep_Func` FOREIGN KEY (`InRepTb10_IdReporte`) REFERENCES `reptb10` (`InRepTb10_IdReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `gradoesptb15`
--
ALTER TABLE `gradoesptb15`
  ADD CONSTRAINT `FK_Esp_Gra` FOREIGN KEY (`InEspecialidadTb16_IdEspecialidad`) REFERENCES `especialidadtb16` (`InEspecialidadTb16_IdEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Gra_Esp` FOREIGN KEY (`InGradoTb13_IdGrado`) REFERENCES `gradotb13` (`InGradoTb13_IdGrado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `gradotb13`
--
ALTER TABLE `gradotb13`
  ADD CONSTRAINT `FK_Bac` FOREIGN KEY (`InBachillerTb14_IdBachiller`) REFERENCES `bachillertb14` (`InBachillerTb14_IdBachiller`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `graesttb26`
--
ALTER TABLE `graesttb26`
  ADD CONSTRAINT `FK_G_Est` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Gra_E` FOREIGN KEY (`InGradoTb13_IdGrado`) REFERENCES `gradotb13` (`InGradoTb13_IdGrado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inscmateriatb11`
--
ALTER TABLE `inscmateriatb11`
  ADD CONSTRAINT `FK_Est_Mate` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Id_Mate` FOREIGN KEY (`InMateriaTb17_IdMateria`) REFERENCES `materiatb17` (`InMateriaTb17_IdMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `profreptb24`
--
ALTER TABLE `profreptb24`
  ADD CONSTRAINT `FK_Prof_R` FOREIGN KEY (`VcProfTb04_IdProfesor`) REFERENCES `proftb04` (`VcProfTb04_IdProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Rep_P` FOREIGN KEY (`InRepTb10_IdReporte`) REFERENCES `reptb10` (`InRepTb10_IdReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reptb10`
--
ALTER TABLE `reptb10`
  ADD CONSTRAINT `FK_AsCla` FOREIGN KEY (`InAsistClaseTb18_IdAsistClase`) REFERENCES `asistclasetb18` (`InAsistClaseTb18_IdAsistClase`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `seccionproftb27`
--
ALTER TABLE `seccionproftb27`
  ADD CONSTRAINT `FK_Prof_S` FOREIGN KEY (`VcProfTb04_IdProfesor`) REFERENCES `proftb04` (`VcProfTb04_IdProfesor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Sec_P` FOREIGN KEY (`InSeccionTb20_IdSeccion`) REFERENCES `secciontb20` (`InSeccionTb20_IdSeccion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `secgradotb25`
--
ALTER TABLE `secgradotb25`
  ADD CONSTRAINT `FK_S_Gra` FOREIGN KEY (`InGradoTb13_IdGrado`) REFERENCES `gradotb13` (`InGradoTb13_IdGrado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Sec_G` FOREIGN KEY (`InSeccionTb20_IdSeccion`) REFERENCES `secciontb20` (`InSeccionTb20_IdSeccion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

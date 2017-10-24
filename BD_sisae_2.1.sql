-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-10-2017 a las 14:41:40
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sisae`
--
CREATE DATABASE IF NOT EXISTS `sisae` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sisae`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `PaEncTb05_ActualizarEnc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_ActualizarEnc` (IN `IdEnc` VARCHAR(20), IN `NomEnc` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(100), IN `Telefono` VARCHAR(8), IN `Email` VARCHAR(100))  begin
	update enctb05,usutb01
    set usutb01.VcUsuTb01_Nombre = NomEnc, usutb01.VcUsuTb01_Ape1 = Ape1, usutb01.VcusuTb01_Ape2 = Ape2,
    usutb01.VcUsutb01_Direccion = Direccion, usutb01.VcUsuTb01_Telefono = Telefono,
	usutb01.VcUsuTb01_Email = Email
    where enctb05.VcEncTb05_IdEncargado = IdEnc  and usutb01.VcUsuTb01_Cedula=IdEnc;
end$$

DROP PROCEDURE IF EXISTS `PaEncTb05_BuscarEnc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_BuscarEnc` (IN `cedula` VARCHAR(20))  begin
	select u.VcUsuTb01_Cedula as 'Cedula', u.VcUsuTb01_Nombre as 'Nombre', u.VcUsuTb01_Ape1 as 'Apellido1',
    u.VcUsuTb01_Ape2 as 'Apellido2', u.VcUsuTb01_Direccion as 'Direccion', u.CrUsuTb01_Sexo as 'Genero',
    u.VcUsuTb01_Telefono as 'Telefono', u.VcUsuTb01_Email as 'Email', e.VcEncTb05_Clave as 'Clave'
    from EncTb05 as e inner join usutb01 as u on e.VcEncTb05_IdEncargado = u.VcUsuTb01_Cedula
  where e.VcEncTb05_IdEncargado = cedula;
end$$

DROP PROCEDURE IF EXISTS `PaEncTb05_Eliminar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_Eliminar` (IN `id` VARCHAR(20))  begin
	delete from enctb05 where VcEncTb05_IdEncargado = id;
end$$

DROP PROCEDURE IF EXISTS `PaEncTb05_GuardarEnc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_GuardarEnc` (IN `IdEnc` VARCHAR(20), IN `NomEnc` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(100), IN `Sexo` CHAR(1), IN `Telefono` VARCHAR(8), IN `Email` VARCHAR(100), IN `Clave` VARCHAR(20))  begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdEnc, NomEnc, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
	insert into EncTb05(VcEncTb05_IdEncargado, VcEncTb05_Clave)
    values (IdEnc, Clave);
end$$

DROP PROCEDURE IF EXISTS `PaEncTb05_Listar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_Listar` ()  begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email', 
 enctb05.Vcenctb05_IdEncargado as 'Id Encargado', enctb05.Vcenctb05_Clave as 'Clave'
    from UsuTb01, enctb05
    where enctb05.VcEncTb05_IdEncargado = UsuTb01.VcUsuTb01_Cedula
	order by enctb05.VcEncTb05_IdEncargado;
end$$

DROP PROCEDURE IF EXISTS `PaEspecialidadTb16_ActualizarEspecialidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_ActualizarEspecialidad` (IN `IdEsp` VARCHAR(20), IN `NomEsp` VARCHAR(20), IN `Cupo` INT)  begin
	update EspecialidadTb16
    set   especialidadtb16.VcEspecialidadTb16_Nombre = NomEsp, especialidadtb16.InEspecialidadTb16_Cupo = Cupo
    where especialidadtb16.VcEspecialidadTb16_IdEspecialidad = IdEsp;
end$$

DROP PROCEDURE IF EXISTS `PaEspecialidadTb16_BuscarEspecialidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_BuscarEspecialidad` (IN `IdEsp` VARCHAR(20))  begin
	select * from EspecialidadTb16
     where VcEspecialidadTb16_IdEspecialidad = IdEsp;
end$$

DROP PROCEDURE IF EXISTS `PaEspecialidadTb16_GuardarEspecialidad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_GuardarEspecialidad` (IN `IdEsp` VARCHAR(20), IN `NomEsp` VARCHAR(20), IN `Cupo` INT)  begin
	insert into EspecialidadTb16 (VcEspecialidadTb16_IdEspecialidad, VcEspecialidadTb16_Nombre, InEspecialidadTb16_Cupo)
    values (IdEsp, NomEsp, Cupo);
end$$

DROP PROCEDURE IF EXISTS `PaEspecialidadTb16_Listar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_Listar` ()  begin
	select VcEspecialidadTb16_IdEspecialidad as 'Id', VcEspecialidadTb16_Nombre as 'Nombre',InEspecialidadTb16_Cupo  as 'Cupo' 
    from especialidadtb16
	order by especialidadtb16.VcEspecialidadTb16_IdEspecialidad;
end$$

DROP PROCEDURE IF EXISTS `PaEstEncTb07_ActualizarEstEnc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstEncTb07_ActualizarEstEnc` (IN `IdEnc` VARCHAR(20), IN `IdEst` VARCHAR(20))  begin
	update EstEncTb07
    set IdEnc = VcEstEncTb07_IdEncargado, IdEst = VcEstEncTb07_IdEstudiante
    where IdEnc = VcEstEncTb07_IdEncargado;
end$$

DROP PROCEDURE IF EXISTS `PaEsttb03_ActualizarEst`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEsttb03_ActualizarEst` (IN `cedula` VARCHAR(20), IN `FechaNac` DATE, IN `Nombre` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(100), IN `Telefono` VARCHAR(20), IN `email` VARCHAR(20))  BEGIN
update esttb03,usutb01 set esttb03.DtEstTb03_FechaNac = FechaNac,usutb01.VcUsuTb01_Nombre = Nombre,usutb01.VcUsuTb01_Ape1 = Ape1,usutb01.VcUsuTb01_Ape2 = Ape2,usutb01.VcUsuTb01_Direccion = Direccion,usutb01.VcUsuTb01_Telefono = Telefono,usutb01.VcUsuTb01_Email = email
where usutb01.VcUsuTb01_Cedula = cedula and esttb03.VcEstTb03_IdEstudiante = cedula;
end$$

DROP PROCEDURE IF EXISTS `PaEstTb03_BorrarEst`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_BorrarEst` (IN `IdEst` VARCHAR(20))  begin
update esttb03 set VcEstTb03_Estado = 'I' where VcEstTb03_IdEstudiante = IdEst;
end$$

DROP PROCEDURE IF EXISTS `PaEstTb03_BuscarEst`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_BuscarEst` (IN `cedula` VARCHAR(20))  begin
	select u.VcUsuTb01_Cedula as 'Cedula', u.VcUsuTb01_Nombre as 'Nombre', u.VcUsuTb01_Ape1 as 'Apellido1',
    u.VcUsuTb01_Ape2 as 'Apellido2', u.VcUsuTb01_Direccion as 'Direccion', u.CrUsuTb01_Sexo as 'Genero',
    u.VcUsuTb01_Telefono as 'Telefono', u.VcUsuTb01_Email as 'Email', e.DtEstTb03_FechaNac as 'Fecha_Nac',
	e.VcEstTb03_Adecuacion as 'Adecuacion',
    e.VcEstTb03_Estado as 'Estado', s.VcEspecialidadTb16_Nombre as 'Especialidad'
    from esttb03 as e inner join usutb01 as u on e.VcEstTb03_IdEstudiante = u.VcUsuTb01_Cedula join especialidadtb16 as s on e.VcEspecialidadTb16_IdEspecialidad = s.VcEspecialidadTb16_IdEspecialidad
  where e.VcEstTb03_IdEstudiante = cedula;
end$$

DROP PROCEDURE IF EXISTS `PaEstTb03_GuardarEst`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_GuardarEst` (IN `IdEst` VARCHAR(20), IN `FecNacEst` DATE, IN `Adecuacion` VARCHAR(20), IN `Estado` VARCHAR(20), IN `IdEspecialidad` VARCHAR(20), IN `NomEst` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(20), IN `Sexo` CHAR(1), IN `Telefono` VARCHAR(8), IN `Email` VARCHAR(100))  begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdEst, NomEst, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
     insert into EstTb03 (VcEstTb03_IdEstudiante, DtEstTb03_FechaNac, VcEstTb03_Adecuacion, VcEstTb03_Estado, VcEspecialidadTb16_IdEspecialidad)
    values (IdEst, FecNacEst, Adecuacion, Estado, IdEspecialidad);
end$$

DROP PROCEDURE IF EXISTS `PaEstTb03_Listar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_Listar` ()  begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email', EstTb03.DtEstTb03_FechaNac as 'FechaNac', 
 EstTb03.VcEstTb03_Adecuacion as 'Adecuacion', EstTb03.VcEstTb03_Estado as 'Estado', especialidadtb16.VcEspecialidadTb16_Nombre as 'Especialidad'
    from UsuTb01, EstTb03,especialidadtb16
    where EstTb03.VcEstTb03_IdEstudiante = UsuTb01.VcUsuTb01_Cedula and esttb03.VcEspecialidadTb16_IdEspecialidad = especialidadtb16.VcEspecialidadTb16_IdEspecialidad
	order by EstTb03.VcEstTb03_IdEstudiante;
end$$

DROP PROCEDURE IF EXISTS `PaEstTb03_ListarActivos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_ListarActivos` ()  begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email', EstTb03.DtEstTb03_FechaNac as 'FechaNac', 
 EstTb03.VcEstTb03_Adecuacion as 'Adecuacion', EstTb03.VcEstTb03_Estado as 'Estado', EspecialidadTb16.VcEspecialidadTb16_Nombre as 'Especialidad'
    from UsuTb01, EstTb03, EspecialidadTb16
    where EstTb03.VcEstTb03_IdEstudiante = UsuTb01.VcUsuTb01_Cedula and esttb03.VcEstTb03_Estado = 'A' and EspecialidadTb16.VcEspecialidadTb16_IdEspecialidad = EstTb03.VcEspecialidadTb16_IdEspecialidad
	order by EstTb03.VcEstTb03_IdEstudiante;
end$$

DROP PROCEDURE IF EXISTS `PaFunTb06_ActualizarFunc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_ActualizarFunc` (IN `IdFun` VARCHAR(20), IN `FechaNac` DATE, IN `Clave` VARCHAR(20), IN `NomFun` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(100), IN `Telefono` VARCHAR(20), IN `Email` VARCHAR(20))  begin
	update FunTb06,usutb01
    set funtb06.VcFunTb06_Clave = Clave, funtb06.DtFunTb06_FechaNac = FechaNac, usutb01.VcUsuTb01_Nombre = NomFun, usutb01.VcUsuTb01_Ape1 = Ape1, usutb01.VcusuTb01_Ape2 = Ape2,
	usutb01.VcUsutb01_Direccion = Direccion, usutb01.VcUsuTb01_Telefono = Telefono,
	usutb01.VcUsuTb01_Email = Email
	where funtb06.VcFunTb06_IdFuncionario = IdFun and usutb01.VcUsuTb01_Cedula = IdFun;
end$$

DROP PROCEDURE IF EXISTS `PaFunTb06_Borrar_Func`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_Borrar_Func` (IN `cedula` INT)  NO SQL
BEGIN
update funtb06 set VcFunTb06_Estado = 'I' where VcFunTb06_IdFuncionario = cedula;
end$$

DROP PROCEDURE IF EXISTS `PaFunTb06_Buscar_Func`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_Buscar_Func` (IN `cedula` INT)  begin
select usutb01.VcUsuTb01_Cedula as 'Cedula',usutb01.VcUsuTb01_Nombre as 'Nombre',usutb01.VcUsuTb01_Ape1 as 'Apellido1',usutb01.VcUsuTb01_Ape2 as 'Apellido2',usutb01.VcUsuTb01_Direccion as 'Direccion',usutb01.CrUsuTb01_Sexo as 'Sexo',usutb01.VcUsuTb01_Telefono as 'Telefono',usutb01.VcUsuTb01_Email as 'Email',funtb06.VcFunTb06_Clave as 'Clave',funtb06.DtFunTb06_FechaNac as 'Fecha_Nac',funtb06.VcFunTb06_Estado as 'Estado' from usutb01 inner join funtb06 on usutb01.VcUsuTb01_Cedula = funtb06.VcFunTb06_IdFuncionario where funtb06.VcFunTb06_IdFuncionario = cedula;
end$$

DROP PROCEDURE IF EXISTS `PaFunTb06_GuardarFunc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_GuardarFunc` (IN `IdFun` VARCHAR(20), IN `Clave` VARCHAR(20), IN `FechaNac` DATE, IN `Estado` VARCHAR(20), IN `NomFun` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(20), IN `Sexo` CHAR(1), IN `Telefono` VARCHAR(8), IN `Email` VARCHAR(20))  begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdFun, NomFun, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
    insert into FunTb06 ( VcFunTb06_IdFuncionario,VcFunTb06_Clave, DtFunTb06_FechaNac, VcFunTb06_Estado)
    values (IdFun, Clave, FechaNac, Estado);
end$$

DROP PROCEDURE IF EXISTS `PaFunTb06_Listar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_Listar` ()  begin
select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email', 
 funtb06.VcFunTb06_IdFuncionario as 'Id Funcionario', funtb06.VcFunTb06_Clave as 'Clave', 
 funtb06.DtFunTb06_FechaNac as 'Fecha_Nac', funtb06.VcFunTb06_Estado as 'Estado'
    from UsuTb01, funtb06
    where funtb06.VcFunTb06_IdFuncionario = UsuTb01.VcUsuTb01_Cedula
    and funtb06.VcFunTb06_Estado = 'A'
	order by funtb06.VcFunTb06_IdFuncionario;
end$$

DROP PROCEDURE IF EXISTS `PaGradoTb13_Listar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaGradoTb13_Listar` ()  NO SQL
BEGIN
select gradotb13.VcGradoTb13_IdGrado as 'id_grado' , gradotb13.VcGradoTb13_NombreGrado as 'Nombre' from gradotb13 order by gradotb13.VcGradoTb13_IdGrado;
end$$

DROP PROCEDURE IF EXISTS `PaMateriaTb17_ActualizarMateria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_ActualizarMateria` (IN `IdMat` VARCHAR(20), IN `NomMat` VARCHAR(20))  begin
	update MateriaTb17
    set   VcMateriaTb17_Nombre = NomMat
    where VcMateriaTb17_IdMateria = IdMat;
end$$

DROP PROCEDURE IF EXISTS `PaMateriaTb17_BuscarMateria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_BuscarMateria` (IN `IdMat` VARCHAR(20))  begin
	select VcMateriaTb17_IdMateria as 'Id', VcMateriaTb17_Nombre as 'Nombre' from MateriaTb17
     where VcMateriaTb17_IdMateria = IdMat;
end$$

DROP PROCEDURE IF EXISTS `PaMateriaTb17_EliminarMateria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_EliminarMateria` (IN `IdMat` VARCHAR(20))  begin
	delete from MateriaTb17 where materiatb17.VcMateriaTb17_IdMateria = IdMat;
end$$

DROP PROCEDURE IF EXISTS `PaMateriaTb17_GuardarMateria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_GuardarMateria` (IN `IdMat` VARCHAR(20), IN `NomMat` VARCHAR(20))  begin
	insert into MateriaTb17 (VcMateriaTb17_IdMateria, VcMateriaTb17_Nombre)
    values (IdMat, NomMat);
end$$

DROP PROCEDURE IF EXISTS `PaMateriaTb17_Listar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_Listar` ()  begin
	select VcMateriaTb17_IdMateria as 'Id', VcMateriaTb17_Nombre as 'Nombre' from MateriaTb17
	order by materiatb17.VcMateriaTb17_IdMateria;
end$$

DROP PROCEDURE IF EXISTS `PaProfTb04_ActualizarProf`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_ActualizarProf` (IN `IdProf` VARCHAR(20), IN `FecNac` DATE, IN `Clave` VARCHAR(20), IN `Nom` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(100), IN `Telefono` VARCHAR(8), IN `Email` VARCHAR(100))  begin
	update usutb01, ProfTb04
    set usutb01.VcUsuTb01_Nombre = Nom,
    usutb01.VcUsuTb01_Ape1 = Ape1,usutb01.VcUsuTb01_Ape2 = Ape2,usutb01.VcUsuTb01_Direccion = Direccion,usutb01.VcUsuTb01_Telefono = Telefono,usutb01.VcUsuTb01_Email = Email,
    ProfTb04.VcProfTb04_IdProfesor = IdProf, ProfTb04.VcProfTb04_Clave = Clave,
    ProfTb04.DtProfTb04_FechaNac = FecNac
    where ProfTb04.VcProfTb04_IdProfesor = IdProf and usutb01.VcUsuTb01_Cedula = IdProf;
end$$

DROP PROCEDURE IF EXISTS `PaProfTb04_BorrarProf`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_BorrarProf` (IN `IdProf` VARCHAR(20))  begin
update proftb04 set VcProfTb04_Estado = 'I' where VcProfTb04_IdProfesor = IdProf;
end$$

DROP PROCEDURE IF EXISTS `PaProfTb04_BuscarProf`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_BuscarProf` (IN `cedula` VARCHAR(20))  begin
	select u.VcUsuTb01_Cedula as 'Cedula', u.VcUsuTb01_Nombre as 'Nombre', u.VcUsuTb01_Ape1 as 'Apellido1',
    u.VcUsuTb01_Ape2 as 'Apellido2', u.VcUsuTb01_Direccion as 'Direccion', u.CrUsuTb01_Sexo as 'Sexo',
    u.VcUsuTb01_Telefono as 'Telefono', u.VcUsuTb01_Email as 'Correo_Electronico',
    p.VcProfTb04_IdProfesor as 'Id_Profesor', p.DtProfTb04_FechaNac as 'Fecha_Nac',
    p.VcProfTb04_Clave as 'Clave', p.VcProfTb04_Estado as 'Estado'
    from ProfTb04 as p inner join usutb01 as u on p.VcProfTb04_IdProfesor = u.VcUsuTb01_Cedula
  where p.VcProfTb04_IdProfesor = cedula;
end$$

DROP PROCEDURE IF EXISTS `PaProfTb04_GuardarProf`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_GuardarProf` (IN `IdProf` VARCHAR(20), IN `FecNac` DATE, IN `clave` VARCHAR(20), IN `Estado` VARCHAR(20), IN `NomProf` VARCHAR(20), IN `Ape1` VARCHAR(20), IN `Ape2` VARCHAR(20), IN `Direccion` VARCHAR(100), IN `Sexo` CHAR(1), IN `Telefono` VARCHAR(8), IN `Email` VARCHAR(100))  begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdProf, NomProf, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
     insert into ProfTb04 (VcProfTb04_IdProfesor, DtProfTb04_FechaNac, VcProfTb04_Clave, VcProfTb04_Estado)
    values (IdProf, FecNac, clave, Estado);
end$$

DROP PROCEDURE IF EXISTS `PaProfTb04_Listar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_Listar` ()  begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email', ProfTb04.VcProfTb04_Clave as 'Clave', 
 ProfTb04.DtProfTb04_FechaNac as 'Fecha_Nac', ProfTb04.VcProfTb04_Estado as 'Estado'
    from UsuTb01, ProfTb04
    where ProfTb04.VcProfTb04_IdProfesor = UsuTb01.VcUsuTb01_Cedula and proftb04.VcProfTb04_Estado = 'A'
	order by ProfTb04.VcProfTb04_IdProfesor;
end$$

DROP PROCEDURE IF EXISTS `PaSeccionTb20_ActualizarSeccion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_ActualizarSeccion` (IN `id_grupo` VARCHAR(20), IN `cupo` INT, IN `num_grupo` INT)  BEGIN
update secciontb20 set InSeccionTb20_Num_Grupo = num_grupo,InSeccionTb20_Cupo = cupo where InSeccionTb20_IdSeccion = id_grupo;
end$$

DROP PROCEDURE IF EXISTS `PaSeccionTb20_Borrar_Seccion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_Borrar_Seccion` (IN `id_seccion` INT)  NO SQL
BEGIN
delete from SeccionTb20 where InSeccionTb20_IdSeccion = id_seccion;
end$$

DROP PROCEDURE IF EXISTS `PaSeccionTb20_BuscarSec`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_BuscarSec` (IN `id_sec` INT)  NO SQL
begin
select secciontb20.InSeccionTb20_IdSeccion as 'ID_Seccion',secciontb20.InSeccionTb20_Cupo as 'cupo',secciontb20.InSeccionTb20_Num_Grupo as 'Num_grupo',gradotb13.VcGradoTb13_NombreGrado as 'Grado' from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion join gradotb13 on secgradotb25.VcGradoTb13_IdGrado = gradotb13.VcGradoTb13_IdGrado
where secciontb20.InSeccionTb20_IdSeccion = id_sec;
end$$

DROP PROCEDURE IF EXISTS `PaSeccionTb20_Guardar_Seccion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_Guardar_Seccion` (IN `cupo` INT, IN `num_grupo` INT, IN `Grado` VARCHAR(10))  begin
DECLARE CONT INT;
DECLARE id INT;
select COUNT(*) INTO CONT from SeccionTb20;
if(CONT > 0)
then insert into secciontb20(InSeccionTb20_cupo,InSeccionTb20_Num_Grupo) VALUES(cupo,num_grupo);
select InSeccionTb20_IdSeccion from secciontb20 order by InSeccionTb20_IdSeccion desc limit 1 into id;
insert into secgradotb25(VcGradoTb13_IdGrado,InSeccionTb20_IdSeccion)
select gradotb13.VcGradoTb13_IdGrado,secciontb20.InSeccionTb20_IdSeccion from gradotb13,secciontb20 where gradotb13.VcGradoTb13_IdGrado = Grado and secciontb20.InSeccionTb20_IdSeccion = id;
else insert into secciontb20(InSeccionTb20_cupo,InSeccionTb20_Num_Grupo) VALUES(cupo,num_grupo);
insert into secgradotb25(VcGradoTb13_IdGrado,InSeccionTb20_IdSeccion)
select gradotb13.VcGradoTb13_IdGrado,secciontb20.InSeccionTb20_IdSeccion from gradotb13,secciontb20 where gradotb13.VcGradoTb13_IdGrado = Grado;
end if;
end$$

DROP PROCEDURE IF EXISTS `PaSeccionTb20_Listar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_Listar` ()  begin
select secciontb20.InSeccionTb20_IdSeccion as 'ID_Seccion',secciontb20.InSeccionTb20_Cupo as 'cupo',secciontb20.InSeccionTb20_Num_Grupo as 'Num_grupo',gradotb13.VcGradoTb13_NombreGrado as 'Grado' from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion join gradotb13 on secgradotb25.VcGradoTb13_IdGrado = gradotb13.VcGradoTb13_IdGrado;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admtb02`
--

DROP TABLE IF EXISTS `admtb02`;
CREATE TABLE IF NOT EXISTS `admtb02` (
  `VcAdmTb02_IdAdmin` varchar(20) NOT NULL,
  `VcAdmTb02_Clave` varchar(20) NOT NULL,
  PRIMARY KEY (`VcAdmTb02_IdAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asiggradotb12`
--

DROP TABLE IF EXISTS `asiggradotb12`;
CREATE TABLE IF NOT EXISTS `asiggradotb12` (
  `VcGradoTb13_IdGrado` varchar(20) NOT NULL,
  `VcProfTb04_IdProf` varchar(20) NOT NULL,
  KEY `FK_Prof_idx` (`VcProfTb04_IdProf`),
  KEY `FK_Gra_idx` (`VcGradoTb13_IdGrado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asigmateriatb19`
--

DROP TABLE IF EXISTS `asigmateriatb19`;
CREATE TABLE IF NOT EXISTS `asigmateriatb19` (
  `VProfTb04_IdProf` varchar(20) NOT NULL,
  `VcMateriaTb17_IdMateria` varchar(20) NOT NULL,
  KEY `FK_Prof_idx` (`VProfTb04_IdProf`),
  KEY `FK_Mat_idx` (`VcMateriaTb17_IdMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistclasetb18`
--

DROP TABLE IF EXISTS `asistclasetb18`;
CREATE TABLE IF NOT EXISTS `asistclasetb18` (
  `VcAsistClaseTb18_IdAsistClase` varchar(20) NOT NULL,
  `DtAsistClaseTb18_Fecha` date NOT NULL,
  `TmAsistClaseTb18_Hora` time NOT NULL,
  `VcAsistClaseTb18_Estado` varchar(20) NOT NULL,
  `VcMateriaTb17_IdMateria` varchar(20) NOT NULL,
  PRIMARY KEY (`VcAsistClaseTb18_IdAsistClase`),
  KEY `FK_Mat_idx` (`VcMateriaTb17_IdMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistcoletb08`
--

DROP TABLE IF EXISTS `asistcoletb08`;
CREATE TABLE IF NOT EXISTS `asistcoletb08` (
  `VcAsistColeTb08_IdAsistCole` varchar(20) NOT NULL,
  `TmAsistColeTb08_HoraEntrada` time NOT NULL,
  `DtAsistColeTb08_FechaEntrada` date NOT NULL,
  `TmAsistColeTb08_HoraSalida` time NOT NULL,
  `DtAsistColeTb08_FechaSalida` date NOT NULL,
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  PRIMARY KEY (`VcAsistColeTb08_IdAsistCole`),
  KEY `FK_Est_idx` (`VcEstTb03_IdEstudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistesttb23`
--

DROP TABLE IF EXISTS `asistesttb23`;
CREATE TABLE IF NOT EXISTS `asistesttb23` (
  `VcAsistClaseTb18_IdAsistClase` varchar(20) NOT NULL,
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  KEY `FK_Est_idx` (`VcEstTb03_IdEstudiante`),
  KEY `FK_AsiC_idx` (`VcAsistClaseTb18_IdAsistClase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bachillertb14`
--

DROP TABLE IF EXISTS `bachillertb14`;
CREATE TABLE IF NOT EXISTS `bachillertb14` (
  `VcBachillerTb14_IdBachiller` varchar(20) NOT NULL,
  `VcBachillerTb14_NombreBachiller` varchar(50) NOT NULL,
  PRIMARY KEY (`VcBachillerTb14_IdBachiller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bachillertb14`
--

INSERT INTO `bachillertb14` (`VcBachillerTb14_IdBachiller`, `VcBachillerTb14_NombreBachiller`) VALUES
('12', 'Internacional'),
('5', 'Educacion media');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encreptb09`
--

DROP TABLE IF EXISTS `encreptb09`;
CREATE TABLE IF NOT EXISTS `encreptb09` (
  `VcEncTb05_IdEncargado` varchar(20) NOT NULL,
  `VcRepTb10_IdReporte` varchar(20) NOT NULL,
  KEY `FK_Enc_idx` (`VcEncTb05_IdEncargado`),
  KEY `FK_Rep_idx` (`VcRepTb10_IdReporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enctb05`
--

DROP TABLE IF EXISTS `enctb05`;
CREATE TABLE IF NOT EXISTS `enctb05` (
  `VcEncTb05_IdEncargado` varchar(20) NOT NULL,
  `VcEncTb05_Clave` varchar(20) NOT NULL,
  PRIMARY KEY (`VcEncTb05_IdEncargado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `enctb05`
--

INSERT INTO `enctb05` (`VcEncTb05_IdEncargado`, `VcEncTb05_Clave`) VALUES
('203740645', '1234'),
('402370069', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidadtb16`
--

DROP TABLE IF EXISTS `especialidadtb16`;
CREATE TABLE IF NOT EXISTS `especialidadtb16` (
  `VcEspecialidadTb16_IdEspecialidad` varchar(20) NOT NULL,
  `VcEspecialidadTb16_Nombre` varchar(20) NOT NULL,
  `InEspecialidadTb16_Cupo` int(11) NOT NULL,
  PRIMARY KEY (`VcEspecialidadTb16_IdEspecialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `especialidadtb16`
--

INSERT INTO `especialidadtb16` (`VcEspecialidadTb16_IdEspecialidad`, `VcEspecialidadTb16_Nombre`, `InEspecialidadTb16_Cupo`) VALUES
('1234', 'Informatica', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estenctb07`
--

DROP TABLE IF EXISTS `estenctb07`;
CREATE TABLE IF NOT EXISTS `estenctb07` (
  `VcEncTb05_IdEncargado` varchar(20) NOT NULL,
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  KEY `FK_Enc` (`VcEncTb05_IdEncargado`),
  KEY `FK_Est_idx` (`VcEstTb03_IdEstudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estenctb07`
--

INSERT INTO `estenctb07` (`VcEncTb05_IdEncargado`, `VcEstTb03_IdEstudiante`) VALUES
('402370069', '504070202');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estreptb22`
--

DROP TABLE IF EXISTS `estreptb22`;
CREATE TABLE IF NOT EXISTS `estreptb22` (
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  `VcRepTb10_IdReporte` varchar(20) NOT NULL,
  KEY `FK_Est_idx` (`VcEstTb03_IdEstudiante`),
  KEY `FK_Rep_idx` (`VcRepTb10_IdReporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `esttb03`
--

DROP TABLE IF EXISTS `esttb03`;
CREATE TABLE IF NOT EXISTS `esttb03` (
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  `DtEstTb03_FechaNac` date NOT NULL,
  `VcEstTb03_Adecuacion` varchar(20) NOT NULL,
  `VcEstTb03_Estado` varchar(20) NOT NULL,
  `VcEspecialidadTb16_IdEspecialidad` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`VcEstTb03_IdEstudiante`),
  KEY `FK_Esp_idx` (`VcEspecialidadTb16_IdEspecialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `esttb03`
--

INSERT INTO `esttb03` (`VcEstTb03_IdEstudiante`, `DtEstTb03_FechaNac`, `VcEstTb03_Adecuacion`, `VcEstTb03_Estado`, `VcEspecialidadTb16_IdEspecialidad`) VALUES
('11600007', '1995-03-03', 'No', 'A', '1234'),
('504070202', '1995-10-12', 'No', 'A', '1234'),
('603450678', '1995-03-20', 'No_Significativa', 'A', '1234'),
('808880888', '1980-12-12', 'No', 'A', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcreptb21`
--

DROP TABLE IF EXISTS `funcreptb21`;
CREATE TABLE IF NOT EXISTS `funcreptb21` (
  `VcFuncTb06_IdFuncionario` varchar(20) NOT NULL,
  `VcRepTb10_IdReporte` varchar(20) NOT NULL,
  KEY `FK_Fun_idx` (`VcFuncTb06_IdFuncionario`),
  KEY `FK_Rep_idx` (`VcRepTb10_IdReporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funtb06`
--

DROP TABLE IF EXISTS `funtb06`;
CREATE TABLE IF NOT EXISTS `funtb06` (
  `VcFunTb06_IdFuncionario` varchar(20) NOT NULL,
  `VcFunTb06_Clave` varchar(20) NOT NULL,
  `DtFunTb06_FechaNac` date NOT NULL,
  `VcFunTb06_Estado` varchar(20) NOT NULL,
  PRIMARY KEY (`VcFunTb06_IdFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `funtb06`
--

INSERT INTO `funtb06` (`VcFunTb06_IdFuncionario`, `VcFunTb06_Clave`, `DtFunTb06_FechaNac`, `VcFunTb06_Estado`) VALUES
('606660666', '3456', '2017-10-11', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gradoesptb15`
--

DROP TABLE IF EXISTS `gradoesptb15`;
CREATE TABLE IF NOT EXISTS `gradoesptb15` (
  `VcGradoEspTb15_IdGrado` varchar(20) NOT NULL,
  `VcEspecialidadTb15_IdEspecialidad` varchar(20) NOT NULL,
  KEY `FK_Esp_idx` (`VcEspecialidadTb15_IdEspecialidad`),
  KEY `FK_Gra_idx` (`VcGradoEspTb15_IdGrado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gradotb13`
--

DROP TABLE IF EXISTS `gradotb13`;
CREATE TABLE IF NOT EXISTS `gradotb13` (
  `VcGradoTb13_IdGrado` varchar(20) NOT NULL,
  `VcGradoTb13_NombreGrado` varchar(20) NOT NULL,
  `VcBachillerTb14_IdBachiller` varchar(20) NOT NULL,
  PRIMARY KEY (`VcGradoTb13_IdGrado`),
  KEY `FK_Bac_idx` (`VcBachillerTb14_IdBachiller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gradotb13`
--

INSERT INTO `gradotb13` (`VcGradoTb13_IdGrado`, `VcGradoTb13_NombreGrado`, `VcBachillerTb14_IdBachiller`) VALUES
('17', '7', '12'),
('34', '10', '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `graesttb26`
--

DROP TABLE IF EXISTS `graesttb26`;
CREATE TABLE IF NOT EXISTS `graesttb26` (
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  `VcGradoTb13_IdGrado` varchar(20) NOT NULL,
  KEY `FK_Gra_idx` (`VcGradoTb13_IdGrado`),
  KEY `FK_Est_idx` (`VcEstTb03_IdEstudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `graesttb26`
--

INSERT INTO `graesttb26` (`VcEstTb03_IdEstudiante`, `VcGradoTb13_IdGrado`) VALUES
('504070202', '34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscmateriatb11`
--

DROP TABLE IF EXISTS `inscmateriatb11`;
CREATE TABLE IF NOT EXISTS `inscmateriatb11` (
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  `VcInscMateriaTb17_IdMateria` varchar(20) NOT NULL,
  KEY `FK_Est_idx` (`VcEstTb03_IdEstudiante`),
  KEY `FK_Mat_idx` (`VcInscMateriaTb17_IdMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiatb17`
--

DROP TABLE IF EXISTS `materiatb17`;
CREATE TABLE IF NOT EXISTS `materiatb17` (
  `VcMateriaTb17_IdMateria` varchar(20) NOT NULL,
  `VcMateriaTb17_Nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`VcMateriaTb17_IdMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `materiatb17`
--

INSERT INTO `materiatb17` (`VcMateriaTb17_IdMateria`, `VcMateriaTb17_Nombre`) VALUES
('5', 'Español'),
('6', 'Sociales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profreptb24`
--

DROP TABLE IF EXISTS `profreptb24`;
CREATE TABLE IF NOT EXISTS `profreptb24` (
  `VcProfTb04_IdProfesor` varchar(20) NOT NULL,
  `VcRepTb10_IdReporte` varchar(20) NOT NULL,
  KEY `FK_Prof_idx` (`VcProfTb04_IdProfesor`),
  KEY `FK_Rep_idx` (`VcRepTb10_IdReporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proftb04`
--

DROP TABLE IF EXISTS `proftb04`;
CREATE TABLE IF NOT EXISTS `proftb04` (
  `VcProfTb04_IdProfesor` varchar(20) NOT NULL,
  `VcProfTb04_Clave` varchar(20) NOT NULL,
  `DtProfTb04_FechaNac` date NOT NULL,
  `VcProfTb04_Estado` varchar(20) NOT NULL,
  PRIMARY KEY (`VcProfTb04_IdProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proftb04`
--

INSERT INTO `proftb04` (`VcProfTb04_IdProfesor`, `VcProfTb04_Clave`, `DtProfTb04_FechaNac`, `VcProfTb04_Estado`) VALUES
('101110111', '1111', '2000-12-03', 'A'),
('1313123', '1234', '2000-12-09', 'A'),
('202220222', '1234', '1998-06-04', 'A'),
('303330333', '1234', '0000-00-00', 'A'),
('707770777', '1234', '0200-12-12', 'A'),
('7575', '1234', '1999-12-12', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reptb10`
--

DROP TABLE IF EXISTS `reptb10`;
CREATE TABLE IF NOT EXISTS `reptb10` (
  `VcRepTb10_IdReporte` varchar(20) NOT NULL,
  `DtRepTb10_FechaReporte` date NOT NULL,
  `TmRepTb10_HoraReporte` time NOT NULL,
  `VcAsistClaseTb18_IdAsistClase` varchar(20) NOT NULL,
  PRIMARY KEY (`VcRepTb10_IdReporte`),
  KEY `FK_AsCla_idx` (`VcAsistClaseTb18_IdAsistClase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccionproftb27`
--

DROP TABLE IF EXISTS `seccionproftb27`;
CREATE TABLE IF NOT EXISTS `seccionproftb27` (
  `VcProfTb04_IdProfesor` varchar(20) NOT NULL,
  `InSeccionTb20_IdSeccion` int(11) NOT NULL,
  KEY `FK_Prof_S_idx` (`VcProfTb04_IdProfesor`),
  KEY `FK_Sec_P_idx` (`InSeccionTb20_IdSeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciontb20`
--

DROP TABLE IF EXISTS `secciontb20`;
CREATE TABLE IF NOT EXISTS `secciontb20` (
  `InSeccionTb20_IdSeccion` int(11) NOT NULL AUTO_INCREMENT,
  `InSeccionTb20_Cupo` int(11) NOT NULL,
  `InSeccionTb20_Num_Grupo` int(11) NOT NULL,
  PRIMARY KEY (`InSeccionTb20_IdSeccion`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `secciontb20`
--

INSERT INTO `secciontb20` (`InSeccionTb20_IdSeccion`, `InSeccionTb20_Cupo`, `InSeccionTb20_Num_Grupo`) VALUES
(9, 30, 2),
(10, 25, 4),
(11, 25, 1),
(14, 20, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secgradotb25`
--

DROP TABLE IF EXISTS `secgradotb25`;
CREATE TABLE IF NOT EXISTS `secgradotb25` (
  `VcGradoTb13_IdGrado` varchar(20) NOT NULL,
  `InSeccionTb20_IdSeccion` int(11) NOT NULL,
  KEY `FK_S_Gra_idx` (`VcGradoTb13_IdGrado`),
  KEY `FK_Sec_G_idx` (`InSeccionTb20_IdSeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `secgradotb25`
--

INSERT INTO `secgradotb25` (`VcGradoTb13_IdGrado`, `InSeccionTb20_IdSeccion`) VALUES
('17', 9),
('34', 10),
('34', 11),
('17', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usutb01`
--

DROP TABLE IF EXISTS `usutb01`;
CREATE TABLE IF NOT EXISTS `usutb01` (
  `VcUsuTb01_Cedula` varchar(20) NOT NULL,
  `VcUsuTb01_Nombre` varchar(20) NOT NULL,
  `VcUsuTb01_Ape1` varchar(20) NOT NULL,
  `VcUsuTb01_Ape2` varchar(20) NOT NULL,
  `VcUsuTb01_Direccion` varchar(100) NOT NULL,
  `CrUsuTb01_Sexo` char(1) NOT NULL,
  `VcUsuTb01_Telefono` varchar(8) NOT NULL,
  `VcUsuTb01_Email` varchar(100) NOT NULL,
  PRIMARY KEY (`VcUsuTb01_Cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usutb01`
--

INSERT INTO `usutb01` (`VcUsuTb01_Cedula`, `VcUsuTb01_Nombre`, `VcUsuTb01_Ape1`, `VcUsuTb01_Ape2`, `VcUsuTb01_Direccion`, `CrUsuTb01_Sexo`, `VcUsuTb01_Telefono`, `VcUsuTb01_Email`) VALUES
('101110111', 'Sofia', 'Herrera', 'Villalobos', 'Hojancha', 'F', '23445563', 'aasd@asda.com'),
('1025603456', 'asda', 'asdasd', 'asdasd', 'dfgdffdg', 'F', '12345678', 'asd@asd.com'),
('11600007', 'Anyulieth', 'Villalobos', 'Peralta', 'Nandayure', 'F', '86471288', 'anyuvillalobos@gmail.com'),
('202220222', 'Dilan', 'Esquivel', 'Venegas', 'Hojancha', 'M', '60606060', 'dilanesquivelvenegas@gmail.com'),
('203740645', 'Albert', 'Esquivel', 'Alvarado', 'Nicoya', 'M', '38475635', 'asd@asd.com'),
('303330333', 'Sonia', 'Venegas', 'Araya', 'Hojancha', 'F', '26598260', 'nada@gmail.com'),
('402370069', 'Fernanda', 'Herrera', 'Villalobos', 'Hojancha', 'F', '62001746', 'nose@gmail.com'),
('504070202', 'Derian', 'Esquivel', 'Venegas', 'Hojancha', 'M', '60918664', 'deresquivel@outlook.com'),
('603450678', 'Mauricio', 'Chevez', 'Carrillo', 'Nicoya', 'M', '21345678', 'qwe@sdf.com'),
('606660666', 'Geiner', 'Esquivel', 'Rodriguez', 'Hojancha', 'M', '29384756', 'asd@gmail.com'),
('707770777', 'Alexa', 'Esquivel', 'Venegas', 'Hojancha', 'F', '3456789', 'asd@gmail.com'),
('808880888', 'Keiner', 'Esquivel', 'Venegas', 'Hojancha', 'M', '28374655', 'asd@gmail.com'),
('909990999', 'Jose', 'Molina', 'Cascante', 'Puntarenas', 'M', '38475647', 'asd@asd.com');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asiggradotb12`
--
ALTER TABLE `asiggradotb12`
  ADD CONSTRAINT `FK_Gra` FOREIGN KEY (`VcGradoTb13_IdGrado`) REFERENCES `gradotb13` (`VcGradoTb13_IdGrado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Prof` FOREIGN KEY (`VcProfTb04_IdProf`) REFERENCES `proftb04` (`VcProfTb04_IdProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asigmateriatb19`
--
ALTER TABLE `asigmateriatb19`
  ADD CONSTRAINT `FK_Mat_Asig` FOREIGN KEY (`VcMateriaTb17_IdMateria`) REFERENCES `materiatb17` (`VcMateriaTb17_IdMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Prof_Asig` FOREIGN KEY (`VProfTb04_IdProf`) REFERENCES `proftb04` (`VcProfTb04_IdProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asistclasetb18`
--
ALTER TABLE `asistclasetb18`
  ADD CONSTRAINT `FK_Mat` FOREIGN KEY (`VcMateriaTb17_IdMateria`) REFERENCES `materiatb17` (`VcMateriaTb17_IdMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asistcoletb08`
--
ALTER TABLE `asistcoletb08`
  ADD CONSTRAINT `FK_Est_Asis` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asistesttb23`
--
ALTER TABLE `asistesttb23`
  ADD CONSTRAINT `FK_AsCla_Est` FOREIGN KEY (`VcAsistClaseTb18_IdAsistClase`) REFERENCES `asistclasetb18` (`VcAsistClaseTb18_IdAsistClase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Est_AsistEst` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `encreptb09`
--
ALTER TABLE `encreptb09`
  ADD CONSTRAINT `FK_Enc_Rep` FOREIGN KEY (`VcEncTb05_IdEncargado`) REFERENCES `enctb05` (`VcEncTb05_IdEncargado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Rep_Enc` FOREIGN KEY (`VcRepTb10_IdReporte`) REFERENCES `reptb10` (`VcRepTb10_IdReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estenctb07`
--
ALTER TABLE `estenctb07`
  ADD CONSTRAINT `FK_Enc` FOREIGN KEY (`VcEncTb05_IdEncargado`) REFERENCES `enctb05` (`VcEncTb05_IdEncargado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Est` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estreptb22`
--
ALTER TABLE `estreptb22`
  ADD CONSTRAINT `FK_Est_Rep` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Rep_Est` FOREIGN KEY (`VcRepTb10_IdReporte`) REFERENCES `reptb10` (`VcRepTb10_IdReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `esttb03`
--
ALTER TABLE `esttb03`
  ADD CONSTRAINT `FK_Esp` FOREIGN KEY (`VcEspecialidadTb16_IdEspecialidad`) REFERENCES `especialidadtb16` (`VcEspecialidadTb16_IdEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `funcreptb21`
--
ALTER TABLE `funcreptb21`
  ADD CONSTRAINT `FK_Fun` FOREIGN KEY (`VcFuncTb06_IdFuncionario`) REFERENCES `funtb06` (`VcFunTb06_IdFuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Rep` FOREIGN KEY (`VcRepTb10_IdReporte`) REFERENCES `reptb10` (`VcRepTb10_IdReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gradoesptb15`
--
ALTER TABLE `gradoesptb15`
  ADD CONSTRAINT `FK_Esp_Grado` FOREIGN KEY (`VcEspecialidadTb15_IdEspecialidad`) REFERENCES `especialidadtb16` (`VcEspecialidadTb16_IdEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Gra_Grado` FOREIGN KEY (`VcGradoEspTb15_IdGrado`) REFERENCES `gradotb13` (`VcGradoTb13_IdGrado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gradotb13`
--
ALTER TABLE `gradotb13`
  ADD CONSTRAINT `FK_Bac` FOREIGN KEY (`VcBachillerTb14_IdBachiller`) REFERENCES `bachillertb14` (`VcBachillerTb14_IdBachiller`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `graesttb26`
--
ALTER TABLE `graesttb26`
  ADD CONSTRAINT `FK_Est_Gra` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Gra_Est` FOREIGN KEY (`VcGradoTb13_IdGrado`) REFERENCES `gradotb13` (`VcGradoTb13_IdGrado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inscmateriatb11`
--
ALTER TABLE `inscmateriatb11`
  ADD CONSTRAINT `FK_Est_Insc` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Mat_Insc` FOREIGN KEY (`VcInscMateriaTb17_IdMateria`) REFERENCES `materiatb17` (`VcMateriaTb17_IdMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `profreptb24`
--
ALTER TABLE `profreptb24`
  ADD CONSTRAINT `FK_Prof_Rep` FOREIGN KEY (`VcProfTb04_IdProfesor`) REFERENCES `proftb04` (`VcProfTb04_IdProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Rep_Prof` FOREIGN KEY (`VcRepTb10_IdReporte`) REFERENCES `reptb10` (`VcRepTb10_IdReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reptb10`
--
ALTER TABLE `reptb10`
  ADD CONSTRAINT `FK_AsCla` FOREIGN KEY (`VcAsistClaseTb18_IdAsistClase`) REFERENCES `asistclasetb18` (`VcAsistClaseTb18_IdAsistClase`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `seccionproftb27`
--
ALTER TABLE `seccionproftb27`
  ADD CONSTRAINT `FK_Prof_S` FOREIGN KEY (`VcProfTb04_IdProfesor`) REFERENCES `proftb04` (`VcProfTb04_IdProfesor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Sec_P` FOREIGN KEY (`InSeccionTb20_IdSeccion`) REFERENCES `secciontb20` (`InSeccionTb20_IdSeccion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `secgradotb25`
--
ALTER TABLE `secgradotb25`
  ADD CONSTRAINT `FK_S_Gra` FOREIGN KEY (`VcGradoTb13_IdGrado`) REFERENCES `gradotb13` (`VcGradoTb13_IdGrado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Sec_G` FOREIGN KEY (`InSeccionTb20_IdSeccion`) REFERENCES `secciontb20` (`InSeccionTb20_IdSeccion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

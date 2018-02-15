-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: sisae
-- ------------------------------------------------------
-- Server version	5.6.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admtb02`
--

DROP TABLE IF EXISTS `admtb02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admtb02` (
  `VcAdmTb02_IdAdmin` varchar(20) NOT NULL,
  `VcAdmTb02_Clave` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admtb02`
--

LOCK TABLES `admtb02` WRITE;
/*!40000 ALTER TABLE `admtb02` DISABLE KEYS */;
INSERT INTO `admtb02` VALUES ('102220111','asdf');
/*!40000 ALTER TABLE `admtb02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asiggradotb12`
--

DROP TABLE IF EXISTS `asiggradotb12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asiggradotb12` (
  `InGradoTb13_IdGrado` int(11) NOT NULL,
  `VcProfTb04_IdProf` varchar(20) NOT NULL,
  KEY `FK_Prof` (`VcProfTb04_IdProf`),
  KEY `FK_Gra` (`InGradoTb13_IdGrado`),
  CONSTRAINT `FK_Gra` FOREIGN KEY (`InGradoTb13_IdGrado`) REFERENCES `gradotb13` (`InGradoTb13_IdGrado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Prof` FOREIGN KEY (`VcProfTb04_IdProf`) REFERENCES `proftb04` (`VcProfTb04_IdProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiggradotb12`
--

LOCK TABLES `asiggradotb12` WRITE;
/*!40000 ALTER TABLE `asiggradotb12` DISABLE KEYS */;
INSERT INTO `asiggradotb12` VALUES (1,'102410145');
/*!40000 ALTER TABLE `asiggradotb12` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asigmateriatb19`
--

DROP TABLE IF EXISTS `asigmateriatb19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asigmateriatb19` (
  `VcProfTb04_IdProfesor` varchar(20) NOT NULL,
  `InMateriaTb17_IdMateria` int(11) NOT NULL,
  KEY `FK_Profes_M` (`VcProfTb04_IdProfesor`),
  KEY `FK_Matt_P` (`InMateriaTb17_IdMateria`),
  CONSTRAINT `FK_Matt_P` FOREIGN KEY (`InMateriaTb17_IdMateria`) REFERENCES `materiatb17` (`InMateriaTb17_IdMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Profes_M` FOREIGN KEY (`VcProfTb04_IdProfesor`) REFERENCES `proftb04` (`VcProfTb04_IdProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asigmateriatb19`
--

LOCK TABLES `asigmateriatb19` WRITE;
/*!40000 ALTER TABLE `asigmateriatb19` DISABLE KEYS */;
INSERT INTO `asigmateriatb19` VALUES ('116000070',27),('116000070',2),('102410145',2),('102410145',1);
/*!40000 ALTER TABLE `asigmateriatb19` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistclasetb18`
--

DROP TABLE IF EXISTS `asistclasetb18`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistclasetb18` (
  `InAsistClaseTb18_IdAsistClase` int(11) NOT NULL AUTO_INCREMENT,
  `DtAsistClaseTb18_Fecha` date NOT NULL,
  `TmAsistClaseTb18_Hora` time NOT NULL,
  `VcAsistClaseTb18_Estado` varchar(20) NOT NULL,
  `InMateriaTb17_IdMateria` int(11) NOT NULL,
  PRIMARY KEY (`InAsistClaseTb18_IdAsistClase`),
  KEY `FK_Materi` (`InMateriaTb17_IdMateria`),
  CONSTRAINT `FK_Materi` FOREIGN KEY (`InMateriaTb17_IdMateria`) REFERENCES `materiatb17` (`InMateriaTb17_IdMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistclasetb18`
--

LOCK TABLES `asistclasetb18` WRITE;
/*!40000 ALTER TABLE `asistclasetb18` DISABLE KEYS */;
INSERT INTO `asistclasetb18` VALUES (1,'2017-11-17','05:42:44','Presente',1),(2,'2017-11-17','05:42:44','Ausente',2),(3,'2017-11-17','05:42:44','Presente',27),(4,'2017-11-17','05:42:44','Presente',3),(5,'2017-11-17','05:42:44','Presente',28);
/*!40000 ALTER TABLE `asistclasetb18` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistcoletb08`
--

DROP TABLE IF EXISTS `asistcoletb08`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistcoletb08` (
  `InAsistColeTb08_IdAsistCole` int(11) NOT NULL AUTO_INCREMENT,
  `TmAsistColeTb08_HoraEntrada` time NOT NULL,
  `DtAsistColeTb08_FechaEntrada` date NOT NULL,
  `TmAsistColeTb08_HoraSalida` time NOT NULL,
  `DtAsistColeTb08_FechaSalida` date NOT NULL,
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  PRIMARY KEY (`InAsistColeTb08_IdAsistCole`),
  KEY `FK_Est_Asis` (`VcEstTb03_IdEstudiante`),
  CONSTRAINT `FK_Est_Asis` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistcoletb08`
--

LOCK TABLES `asistcoletb08` WRITE;
/*!40000 ALTER TABLE `asistcoletb08` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistcoletb08` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistesttb23`
--

DROP TABLE IF EXISTS `asistesttb23`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistesttb23` (
  `InAsistClaseTb18_IdAsistClase` int(11) NOT NULL,
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  KEY `FK_A_Estu` (`VcEstTb03_IdEstudiante`),
  KEY `FK_As_Cla` (`InAsistClaseTb18_IdAsistClase`),
  CONSTRAINT `FK_A_Estu` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_As_Cla` FOREIGN KEY (`InAsistClaseTb18_IdAsistClase`) REFERENCES `asistclasetb18` (`InAsistClaseTb18_IdAsistClase`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistesttb23`
--

LOCK TABLES `asistesttb23` WRITE;
/*!40000 ALTER TABLE `asistesttb23` DISABLE KEYS */;
INSERT INTO `asistesttb23` VALUES (1,'102580300'),(2,'102580760'),(3,'102580844');
/*!40000 ALTER TABLE `asistesttb23` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bachillertb14`
--

DROP TABLE IF EXISTS `bachillertb14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bachillertb14` (
  `InBachillerTb14_IdBachiller` int(11) NOT NULL AUTO_INCREMENT,
  `VcBachillerTb14_NombreBachiller` varchar(50) NOT NULL,
  PRIMARY KEY (`InBachillerTb14_IdBachiller`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bachillertb14`
--

LOCK TABLES `bachillertb14` WRITE;
/*!40000 ALTER TABLE `bachillertb14` DISABLE KEYS */;
INSERT INTO `bachillertb14` VALUES (1,'Internacional'),(2,'Nacional');
/*!40000 ALTER TABLE `bachillertb14` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encreptb09`
--

DROP TABLE IF EXISTS `encreptb09`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encreptb09` (
  `VcEncTb05_IdEncargado` varchar(20) NOT NULL,
  `InRepTb10_IdReporte` int(11) NOT NULL,
  KEY `FK_Enc_Rep` (`VcEncTb05_IdEncargado`),
  KEY `FK_Id_Rep` (`InRepTb10_IdReporte`),
  CONSTRAINT `FK_Enc_Rep` FOREIGN KEY (`VcEncTb05_IdEncargado`) REFERENCES `enctb05` (`VcEncTb05_IdEncargado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Id_Rep` FOREIGN KEY (`InRepTb10_IdReporte`) REFERENCES `reptb10` (`InRepTb10_IdReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encreptb09`
--

LOCK TABLES `encreptb09` WRITE;
/*!40000 ALTER TABLE `encreptb09` DISABLE KEYS */;
/*!40000 ALTER TABLE `encreptb09` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enctb05`
--

DROP TABLE IF EXISTS `enctb05`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enctb05` (
  `VcEncTb05_IdEncargado` varchar(20) NOT NULL,
  `VcEncTb05_Clave` varchar(20) NOT NULL,
  PRIMARY KEY (`VcEncTb05_IdEncargado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enctb05`
--

LOCK TABLES `enctb05` WRITE;
/*!40000 ALTER TABLE `enctb05` DISABLE KEYS */;
INSERT INTO `enctb05` VALUES ('101074994','1234'),('101141843','1234'),('101230816','1234');
/*!40000 ALTER TABLE `enctb05` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidadtb16`
--

DROP TABLE IF EXISTS `especialidadtb16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidadtb16` (
  `InEspecialidadTb16_IdEspecialidad` int(11) NOT NULL AUTO_INCREMENT,
  `VcEspecialidadTb16_Nombre` varchar(20) NOT NULL,
  `InEspecialidadTb16_Cupo` int(11) NOT NULL,
  PRIMARY KEY (`InEspecialidadTb16_IdEspecialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidadtb16`
--

LOCK TABLES `especialidadtb16` WRITE;
/*!40000 ALTER TABLE `especialidadtb16` DISABLE KEYS */;
INSERT INTO `especialidadtb16` VALUES (1,'Informatica',30),(2,'Contabilidad',15),(3,'AyB',20);
/*!40000 ALTER TABLE `especialidadtb16` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estenctb07`
--

DROP TABLE IF EXISTS `estenctb07`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estenctb07` (
  `VcEncTb05_IdEncargado` varchar(20) NOT NULL,
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  KEY `FK_Est` (`VcEstTb03_IdEstudiante`),
  KEY `FK_Enc` (`VcEncTb05_IdEncargado`),
  CONSTRAINT `FK_Enc` FOREIGN KEY (`VcEncTb05_IdEncargado`) REFERENCES `enctb05` (`VcEncTb05_IdEncargado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Est` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estenctb07`
--

LOCK TABLES `estenctb07` WRITE;
/*!40000 ALTER TABLE `estenctb07` DISABLE KEYS */;
INSERT INTO `estenctb07` VALUES ('101230816','102580844'),('101074994','102580844'),('101230816','102580844'),('101074994','102580300'),('101074994','102580760');
/*!40000 ALTER TABLE `estenctb07` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estreptb22`
--

DROP TABLE IF EXISTS `estreptb22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estreptb22` (
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  `InRepTb10_IdReporte` int(11) NOT NULL,
  KEY `FK_Est_R` (`VcEstTb03_IdEstudiante`),
  KEY `FK_Rep_E` (`InRepTb10_IdReporte`),
  CONSTRAINT `FK_Est_R` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Rep_E` FOREIGN KEY (`InRepTb10_IdReporte`) REFERENCES `reptb10` (`InRepTb10_IdReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estreptb22`
--

LOCK TABLES `estreptb22` WRITE;
/*!40000 ALTER TABLE `estreptb22` DISABLE KEYS */;
/*!40000 ALTER TABLE `estreptb22` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esttb03`
--

DROP TABLE IF EXISTS `esttb03`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esttb03` (
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  `DtEstTb03_FechaNac` date NOT NULL,
  `VcEstTb03_Adecuacion` varchar(20) NOT NULL,
  `VcEstTb03_Estado` varchar(20) NOT NULL,
  `InEspecialidadTb16_IdEspecialidad` int(11) NOT NULL,
  PRIMARY KEY (`VcEstTb03_IdEstudiante`),
  KEY `FK_Especialidad` (`InEspecialidadTb16_IdEspecialidad`),
  CONSTRAINT `FK_Especialidad` FOREIGN KEY (`InEspecialidadTb16_IdEspecialidad`) REFERENCES `especialidadtb16` (`InEspecialidadTb16_IdEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esttb03`
--

LOCK TABLES `esttb03` WRITE;
/*!40000 ALTER TABLE `esttb03` DISABLE KEYS */;
INSERT INTO `esttb03` VALUES ('102580300','1993-10-04','No','A',1),('102580760','1993-10-04','No_significativa','A',2),('102580844','1993-10-04','Acceso','A',3);
/*!40000 ALTER TABLE `esttb03` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcreptb21`
--

DROP TABLE IF EXISTS `funcreptb21`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcreptb21` (
  `VcFunTb06_IdFuncionario` varchar(20) NOT NULL,
  `InRepTb10_IdReporte` int(11) NOT NULL,
  KEY `FK_Fun` (`VcFunTb06_IdFuncionario`),
  KEY `FK_Rep_Func` (`InRepTb10_IdReporte`),
  CONSTRAINT `FK_Fun` FOREIGN KEY (`VcFunTb06_IdFuncionario`) REFERENCES `funtb06` (`VcFunTb06_IdFuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Rep_Func` FOREIGN KEY (`InRepTb10_IdReporte`) REFERENCES `reptb10` (`InRepTb10_IdReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcreptb21`
--

LOCK TABLES `funcreptb21` WRITE;
/*!40000 ALTER TABLE `funcreptb21` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcreptb21` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funtb06`
--

DROP TABLE IF EXISTS `funtb06`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funtb06` (
  `VcFunTb06_IdFuncionario` varchar(20) NOT NULL,
  `VcFunTb06_Clave` varchar(20) NOT NULL,
  `DtFunTb06_FechaNac` date NOT NULL,
  `VcFunTb06_Estado` varchar(20) NOT NULL,
  PRIMARY KEY (`VcFunTb06_IdFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funtb06`
--

LOCK TABLES `funtb06` WRITE;
/*!40000 ALTER TABLE `funtb06` DISABLE KEYS */;
INSERT INTO `funtb06` VALUES ('102620342','4567','1978-03-06','A'),('102620585','1234','1978-03-06','A'),('102630207','1234','1978-03-06','A');
/*!40000 ALTER TABLE `funtb06` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradoesptb15`
--

DROP TABLE IF EXISTS `gradoesptb15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradoesptb15` (
  `InGradoTb13_IdGrado` int(11) NOT NULL,
  `InEspecialidadTb16_IdEspecialidad` int(11) NOT NULL,
  KEY `FK_Esp_Gra` (`InEspecialidadTb16_IdEspecialidad`),
  KEY `FK_Gra_Esp` (`InGradoTb13_IdGrado`),
  CONSTRAINT `FK_Esp_Gra` FOREIGN KEY (`InEspecialidadTb16_IdEspecialidad`) REFERENCES `especialidadtb16` (`InEspecialidadTb16_IdEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Gra_Esp` FOREIGN KEY (`InGradoTb13_IdGrado`) REFERENCES `gradotb13` (`InGradoTb13_IdGrado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradoesptb15`
--

LOCK TABLES `gradoesptb15` WRITE;
/*!40000 ALTER TABLE `gradoesptb15` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradoesptb15` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradotb13`
--

DROP TABLE IF EXISTS `gradotb13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradotb13` (
  `InGradoTb13_IdGrado` int(11) NOT NULL AUTO_INCREMENT,
  `VcGradoTb13_NombreGrado` varchar(20) NOT NULL,
  `InBachillerTb14_IdBachiller` int(11) NOT NULL,
  PRIMARY KEY (`InGradoTb13_IdGrado`),
  KEY `FK_Bac` (`InBachillerTb14_IdBachiller`),
  CONSTRAINT `FK_Bac` FOREIGN KEY (`InBachillerTb14_IdBachiller`) REFERENCES `bachillertb14` (`InBachillerTb14_IdBachiller`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradotb13`
--

LOCK TABLES `gradotb13` WRITE;
/*!40000 ALTER TABLE `gradotb13` DISABLE KEYS */;
INSERT INTO `gradotb13` VALUES (1,'7',2),(2,'8',2),(3,'9',2);
/*!40000 ALTER TABLE `gradotb13` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graesttb26`
--

DROP TABLE IF EXISTS `graesttb26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graesttb26` (
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  `InGradoTb13_IdGrado` int(11) NOT NULL,
  KEY `FK_Gra_E` (`InGradoTb13_IdGrado`),
  KEY `FK_G_Est` (`VcEstTb03_IdEstudiante`),
  CONSTRAINT `FK_G_Est` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Gra_E` FOREIGN KEY (`InGradoTb13_IdGrado`) REFERENCES `gradotb13` (`InGradoTb13_IdGrado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graesttb26`
--

LOCK TABLES `graesttb26` WRITE;
/*!40000 ALTER TABLE `graesttb26` DISABLE KEYS */;
INSERT INTO `graesttb26` VALUES ('102580300',1);
/*!40000 ALTER TABLE `graesttb26` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horariostb29`
--

DROP TABLE IF EXISTS `horariostb29`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horariostb29` (
  `InHorariosTb29_IdHorario` int(11) NOT NULL AUTO_INCREMENT,
  `VcHorariosTb29_Dia` varchar(20) NOT NULL,
  `TmHorariosTb29_Hora_Inicio` time NOT NULL,
  `TmHorariosTb29_Hora_Final` time NOT NULL,
  PRIMARY KEY (`InHorariosTb29_IdHorario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horariostb29`
--

LOCK TABLES `horariostb29` WRITE;
/*!40000 ALTER TABLE `horariostb29` DISABLE KEYS */;
INSERT INTO `horariostb29` VALUES (1,'Lunes','08:00:00','10:00:00'),(2,'Martes','07:00:00','07:45:00');
/*!40000 ALTER TABLE `horariostb29` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscmateriatb11`
--

DROP TABLE IF EXISTS `inscmateriatb11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscmateriatb11` (
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  `InMateriaTb17_IdMateria` int(11) NOT NULL,
  KEY `FK_Est_Mate` (`VcEstTb03_IdEstudiante`),
  KEY `FK_Id_Mate` (`InMateriaTb17_IdMateria`),
  CONSTRAINT `FK_Est_Mate` FOREIGN KEY (`VcEstTb03_IdEstudiante`) REFERENCES `esttb03` (`VcEstTb03_IdEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Id_Mate` FOREIGN KEY (`InMateriaTb17_IdMateria`) REFERENCES `materiatb17` (`InMateriaTb17_IdMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscmateriatb11`
--

LOCK TABLES `inscmateriatb11` WRITE;
/*!40000 ALTER TABLE `inscmateriatb11` DISABLE KEYS */;
INSERT INTO `inscmateriatb11` VALUES ('102580300',1);
/*!40000 ALTER TABLE `inscmateriatb11` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiatb17`
--

DROP TABLE IF EXISTS `materiatb17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materiatb17` (
  `InMateriaTb17_IdMateria` int(11) NOT NULL AUTO_INCREMENT,
  `VcMateriaTb17_Nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`InMateriaTb17_IdMateria`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiatb17`
--

LOCK TABLES `materiatb17` WRITE;
/*!40000 ALTER TABLE `materiatb17` DISABLE KEYS */;
INSERT INTO `materiatb17` VALUES (1,'Sociales'),(2,'Español'),(3,'Ciencias'),(27,'ingles'),(28,'Civica'),(30,'Matemáticas'),(32,'Fisica');
/*!40000 ALTER TABLE `materiatb17` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matriculatb30`
--

DROP TABLE IF EXISTS `matriculatb30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matriculatb30` (
  `InSeccionTb20_IdSeccion` int(11) NOT NULL,
  `InHorariosTb29_IdHorario` int(11) NOT NULL,
  `InMateriaTb17_IdMateria` int(11) NOT NULL,
  `VcProfTb04_IdProfesor` varchar(20) NOT NULL,
  UNIQUE KEY `FK_Prof_Matri` (`VcProfTb04_IdProfesor`),
  KEY `FK_Sec_Matri` (`InSeccionTb20_IdSeccion`),
  KEY `FK_Hor_Matri` (`InHorariosTb29_IdHorario`),
  KEY `FK_Mat_Matri` (`InMateriaTb17_IdMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriculatb30`
--

LOCK TABLES `matriculatb30` WRITE;
/*!40000 ALTER TABLE `matriculatb30` DISABLE KEYS */;
INSERT INTO `matriculatb30` VALUES (20,1,1,'102410145'),(25,2,2,'116000070');
/*!40000 ALTER TABLE `matriculatb30` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profreptb24`
--

DROP TABLE IF EXISTS `profreptb24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profreptb24` (
  `VcProfTb04_IdProfesor` varchar(20) NOT NULL,
  `InRepTb10_IdReporte` int(11) NOT NULL,
  KEY `FK_Prof_R` (`VcProfTb04_IdProfesor`),
  KEY `FK_Rep_P` (`InRepTb10_IdReporte`),
  CONSTRAINT `FK_Prof_R` FOREIGN KEY (`VcProfTb04_IdProfesor`) REFERENCES `proftb04` (`VcProfTb04_IdProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Rep_P` FOREIGN KEY (`InRepTb10_IdReporte`) REFERENCES `reptb10` (`InRepTb10_IdReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profreptb24`
--

LOCK TABLES `profreptb24` WRITE;
/*!40000 ALTER TABLE `profreptb24` DISABLE KEYS */;
/*!40000 ALTER TABLE `profreptb24` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proftb04`
--

DROP TABLE IF EXISTS `proftb04`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proftb04` (
  `VcProfTb04_IdProfesor` varchar(20) NOT NULL,
  `VcProfTb04_Clave` varchar(20) NOT NULL,
  `DtProfTb04_FechaNac` date NOT NULL,
  `VcProfTb04_Estado` varchar(20) NOT NULL,
  PRIMARY KEY (`VcProfTb04_IdProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proftb04`
--

LOCK TABLES `proftb04` WRITE;
/*!40000 ALTER TABLE `proftb04` DISABLE KEYS */;
INSERT INTO `proftb04` VALUES ('102410145','1234','1993-10-04','A'),('102410237','1234','1993-10-04','A'),('102410877','1234','1993-10-04','A'),('116000070','3333','1990-03-12','A');
/*!40000 ALTER TABLE `proftb04` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reptb10`
--

DROP TABLE IF EXISTS `reptb10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reptb10` (
  `InRepTb10_IdReporte` int(11) NOT NULL AUTO_INCREMENT,
  `DtRepTb10_FechaReporte` date NOT NULL,
  `TmRepTb10_HoraReporte` time NOT NULL,
  `InAsistClaseTb18_IdAsistClase` int(11) NOT NULL,
  PRIMARY KEY (`InRepTb10_IdReporte`),
  KEY `FK_AsCla` (`InAsistClaseTb18_IdAsistClase`),
  CONSTRAINT `FK_AsCla` FOREIGN KEY (`InAsistClaseTb18_IdAsistClase`) REFERENCES `asistclasetb18` (`InAsistClaseTb18_IdAsistClase`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reptb10`
--

LOCK TABLES `reptb10` WRITE;
/*!40000 ALTER TABLE `reptb10` DISABLE KEYS */;
/*!40000 ALTER TABLE `reptb10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seccionproftb27`
--

DROP TABLE IF EXISTS `seccionproftb27`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seccionproftb27` (
  `VcProfTb04_IdProfesor` varchar(20) NOT NULL,
  `InSeccionTb20_IdSeccion` int(11) NOT NULL,
  KEY `FK_Prof_S` (`VcProfTb04_IdProfesor`),
  KEY `FK_Sec_P` (`InSeccionTb20_IdSeccion`),
  CONSTRAINT `FK_Prof_S` FOREIGN KEY (`VcProfTb04_IdProfesor`) REFERENCES `proftb04` (`VcProfTb04_IdProfesor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Sec_P` FOREIGN KEY (`InSeccionTb20_IdSeccion`) REFERENCES `secciontb20` (`InSeccionTb20_IdSeccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccionproftb27`
--

LOCK TABLES `seccionproftb27` WRITE;
/*!40000 ALTER TABLE `seccionproftb27` DISABLE KEYS */;
INSERT INTO `seccionproftb27` VALUES ('102410145',20),('116000070',25),('102410877',18),('102410237',18);
/*!40000 ALTER TABLE `seccionproftb27` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secciontb20`
--

DROP TABLE IF EXISTS `secciontb20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secciontb20` (
  `InSeccionTb20_IdSeccion` int(11) NOT NULL AUTO_INCREMENT,
  `InSeccionTb20_Num_Grupo` int(11) NOT NULL,
  `InSeccionTb20_Cupo` int(11) NOT NULL,
  PRIMARY KEY (`InSeccionTb20_IdSeccion`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secciontb20`
--

LOCK TABLES `secciontb20` WRITE;
/*!40000 ALTER TABLE `secciontb20` DISABLE KEYS */;
INSERT INTO `secciontb20` VALUES (18,3,15),(20,4,21),(22,2,12),(25,5,12);
/*!40000 ALTER TABLE `secciontb20` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secesttb28`
--

DROP TABLE IF EXISTS `secesttb28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secesttb28` (
  `VcEstTb03_IdEstudiante` varchar(20) NOT NULL,
  `InSeccionTb20_IdSeccion` int(11) NOT NULL,
  KEY `FK_Sec_Est` (`VcEstTb03_IdEstudiante`),
  KEY `FK_Est_Sec` (`InSeccionTb20_IdSeccion`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secesttb28`
--

LOCK TABLES `secesttb28` WRITE;
/*!40000 ALTER TABLE `secesttb28` DISABLE KEYS */;
INSERT INTO `secesttb28` VALUES ('102580300',18);
/*!40000 ALTER TABLE `secesttb28` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secgradotb25`
--

DROP TABLE IF EXISTS `secgradotb25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secgradotb25` (
  `InGradoTb13_IdGrado` int(11) NOT NULL,
  `InSeccionTb20_IdSeccion` int(11) NOT NULL,
  KEY `FK_S_Gra` (`InGradoTb13_IdGrado`),
  KEY `FK_Sec_G` (`InSeccionTb20_IdSeccion`),
  CONSTRAINT `FK_S_Gra` FOREIGN KEY (`InGradoTb13_IdGrado`) REFERENCES `gradotb13` (`InGradoTb13_IdGrado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Sec_G` FOREIGN KEY (`InSeccionTb20_IdSeccion`) REFERENCES `secciontb20` (`InSeccionTb20_IdSeccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secgradotb25`
--

LOCK TABLES `secgradotb25` WRITE;
/*!40000 ALTER TABLE `secgradotb25` DISABLE KEYS */;
INSERT INTO `secgradotb25` VALUES (1,18),(1,20),(2,22),(3,25);
/*!40000 ALTER TABLE `secgradotb25` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguridadtb31`
--

DROP TABLE IF EXISTS `seguridadtb31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguridadtb31` (
  `VcSeguridadTb31_Funcion` varchar(200) NOT NULL,
  `VcSeguridadTb31_Glyphicons` varchar(200) NOT NULL,
  `VcSeguridadTb31_SideNav` varchar(200) NOT NULL,
  `InSeguridadTb31_Id` int(11) NOT NULL AUTO_INCREMENT,
  `InSeguridadTb31_Nivel` int(11) NOT NULL,
  PRIMARY KEY (`InSeguridadTb31_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguridadtb31`
--

LOCK TABLES `seguridadtb31` WRITE;
/*!40000 ALTER TABLE `seguridadtb31` DISABLE KEYS */;
INSERT INTO `seguridadtb31` VALUES ('function principal(){$(\"#contenido\").load(\'Vista/Seg_Nivel/Nivel_1/principal.php\');}','<li><a class=\"glyphicon glyphicon-home\" style=\"margin-top:25px; \" href=\"index.php\"></a></li>','<a href=\"index.php\">Inicio</a>',1,1),('function profesor(){$(\"#contenido\").load(\'Vista/Seg_Nivel/Nivel_1/Profesor.php\');}',' <li><a class=\"glyphicon glyphicon-blackboard\" style=\"margin-top:15px; \" href=\"#\" onclick=\"profesor();\"></a></li>','<a href=\"#\" onclick=\"profesor();\">Profesores</a>',2,1),('function seccion(){$(\"#contenido\").load(\'Vista/Seg_Nivel/Nivel_1/Seccion-Grupo.php\');}   ','<li><a class=\"glyphicon glyphicon-sound-7-1\" style=\"margin-top:15px; \" href=\"#\" onclick=\"seccion();\"></a></li>','<a href=\"#\" onclick=\"seccion();\">Secciones</a>',4,1),('function encargado(){$(\"#contenido\").load(\'Vista/Seg_Nivel/Nivel_1/Encargado.php\');}','<li><a class=\"glyphicon glyphicon-eye-open\" style=\"margin-top:15px; \" href=\"#\" onclick=\"encargado();\"></a></li>','<a href=\"#\" onclick=\"encargado();\">Padres</a>',5,1),('function funcionario(){$(\"#contenido\").load(\'Vista/Seg_Nivel/Nivel_1/Funcionario.php\');}','<li><a class=\"glyphicon glyphicon-user\" style=\"margin-top:15px; \" href=\"#\" onclick=\"funcionario();\"></a></li>','<a href=\"#\" onclick=\"funcionario();\">Funcionarios</a>',6,1),('function estudiante(){$(\"#contenido\").load(\'Vista/Seg_Nivel/Nivel_1/Estudiante.php\');}','<li><a class=\"glyphicon glyphicon-education\" style=\"margin-top:15px; \" href=\"#\" onclick=\"estudiante();\"></a></li>','<a href=\"#\" onclick=\"estudiante();\">Estudiantes</a>',7,1),('function materia(){$(\"#contenido\").load(\'Vista/Seg_Nivel/Nivel_1/Materia.php\');}',' <li><a class=\"glyphicon glyphicon-book\" style=\"margin-top:15px; \" href=\"#\" onclick=\"materia();\"></a></li>','<a href=\"#\" onclick=\"materia();\">Materias</a>',8,1),('function principal(){\r\n$(\'#contenido\').load(\'Vista/Seg_Nivel/Nivel_2/Asistencia.php\');\r\n}','nada','nada',9,2),('function principal(){\r\n$(\'#contenido\').load(\'Vista/Seg_Nivel/Nivel_3/Encargado.php\');\r\n}',' ',' ',10,3),('function grado(){\r\n$(\'#contenido\').load(\'Vista/Seg_Nivel/Nivel_1/Grado.php\');}','<li><a class=\"glyphicon glyphicon-file\" style=\"margin-top:15px; \" href=\"#\" onclick=\"grado();\"></a></li>',' <a href=\"#\" onclick=\"grado();\">Grado</a>',11,1),('function bachiller(){\r\n$(\'#contenido\').load(\'Vista/Seg_Nivel/Nivel_1/Bachiller.php\');}','<li><a class=\"glyphicon glyphicon-list-alt\" style=\"margin-top:15px; \" href=\"#\" onclick=\"bachiller();\"></a></li>','<a href=\"#\" onclick=\"bachiller();\">Bachiller</a>',12,1),('function horario(){\r\n$(\'#contenido\').load(\'Vista/Seg_Nivel/Nivel_1/Horarios.php\');}','<li><a class=\"glyphicon glyphicon-tasks\" style=\"margin-top:15px; \" href=\"#\" onclick=\"horario();\"></a></li>','<a href=\"#\" onclick=\"horario();\">Horarios</a>',13,1),('function Usuario(){\r\n$(\'#contenido\').load(\'Vista/Seg_Nivel/Nivel_1/Usuario.php\');}','<li><a class=\"glyphicon glyphicon-wrench\" style=\"margin-top:15px; \"href=\"#\" onclick=\"Usuario();\"></a></li>','<a href=\"#\" onclick=\"Usuario();\">Usuarios</a>',14,1);
/*!40000 ALTER TABLE `seguridadtb31` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usutb01`
--

DROP TABLE IF EXISTS `usutb01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usutb01` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usutb01`
--

LOCK TABLES `usutb01` WRITE;
/*!40000 ALTER TABLE `usutb01` DISABLE KEYS */;
INSERT INTO `usutb01` VALUES ('101074994','FRANCISCA','ROJAS','UREÑA','Nicoya','F','26453312','fran@gmail.com'),('101141843','SACRAMENTO','MORA','MORALES','Moracia','M','77654423','sacra@outlook.com'),('101230816','VIRGINIA','ROVIRA','PANIAGUA','Nosara','F','65441233','virg@outlook.com'),('102410145','HARRY','JENKINS','CHAVARRIA','Santa Clara','F','60918664','fina@outlook.com'),('102410237','CECILIA','PORTILLA','IBARRA','Santa Clara','F','60918664','fina@outlook.com'),('102410877','FRANCISCA ELENA','PAVON','PAVON','Santa Clara','F','60918664','fina@outlook.com'),('102580300','TERESA','ARCE','VILLEGAS','Santa Clara','F','60918664','fina@outlook.com'),('102580760','MARIA DE LOS ANGELES','CARVAJAL','SABORIO','Santa Clara','F','60918664','fina@outlook.com'),('102580844','CECILIO','BADILLA','GUEVARA','Santa Clara','F','60918664','fina@outlook.com'),('102620342','RIGOBERTO','l','perez','gr','M','88','a@g'),('102620585','JORGE','MORA','SIBAJA','Samara','M','88674699','franc@gmail.com'),('102630207','FILIBERTO','JIMENEZ','JIMENEZ','Samara','M','88674699','franc@gmail.com'),('116000070','Anyu','villa','Peralta','Nandayure','F','88776655','anyuvillalobos@gmail.com');
/*!40000 ALTER TABLE `usutb01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sisae'
--

--
-- Dumping routines for database 'sisae'
--
/*!50003 DROP PROCEDURE IF EXISTS `PaAsigmateriaTb19_Asignar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsigmateriaTb19_Asignar`(in IdMat int, in IdProf varchar(20))
begin
	insert into asigmateriatb19(InMateriaTb17_IdMateria,VcProfTb04_IdProfesor) 
    values(IdMat,IdProf);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaAsigmateriaTb19_Profe_Materia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsigmateriaTb19_Profe_Materia`(in IdProf varchar(20))
begin
	select materiatb17.InMateriaTb17_IdMateria as 'Id_Materia', materiatb17.VcMateriaTb17_Nombre as 'nombre' 
    from materiatb17 inner join asigmateriatb19 on materiatb17.InMateriaTb17_IdMateria = asigmateriatb19.InMateriaTb17_IdMateria 
    where asigmateriatb19.VcProfTb04_IdProfesor = IdProf;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaAsistClaseTb18_ActualizarAsistClase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistClaseTb18_ActualizarAsistClase`(in IdAsist int, in Fec date, 
in Hora time, in Estado varchar(20), in IdMa int)
begin
	update AsistClaseTb18
    set   asistclasetb18.DtAsistClaseTb18_Fecha = Fec, asistclasetb18.TmAsistClaseTb18_Hora = Hora, 
    asistclasetb18.VcAsistClaseTb18_Estado = Estado, asistclasetb18.InMateriaTb17_IdMateria = IdMa
    where asistclasetb18.InAsistClaseTb18_IdAsistClase = IdAsist;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaAsistClaseTb18_BuscarAsistClase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistClaseTb18_BuscarAsistClase`(in IdAsis int)
begin
	select InAsistClaseTb18_IdAsistClase AS 'Id', DtAsistClaseTb18_Fecha as 'Fecha', 
    TmAsistClaseTb18_Hora as 'Hora', VcAsistClaseTb18_Estado as 'Estado', InMateriaTb17_IdMateria as 'Id_Materia' 
    from AsistClaseTb18
     where asistclasetb18.InAsistClaseTb18_IdAsistClase = IdAsis;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaAsistClaseTb18_EliminarAsistClase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistClaseTb18_EliminarAsistClase`(in IdAsi int)
begin
	delete from AsistClaseTb18 where asistclasetb18.InAsistClaseTb18_IdAsistClase = IdAsi;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaAsistClaseTb18_GuardarAsistClase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistClaseTb18_GuardarAsistClase`(in Fec date, in Hora time, in Estado varchar(20), in IdMa int)
begin
	insert into AsistClaseTb18 (DtAsistClaseTb18_Fecha, TmAsistClaseTb18_Hora, VcAsistClaseTb18_Estado, InMateriaTb17_IdMateria)
    values (Fec, Hora, Estado, IdMa);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaAsistClaseTb18_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistClaseTb18_Listar`(IN `inicio` INT, IN `final` INT)
begin
	select iNAsistClaseTb18_IdAsistClase as 'Id',DtAsistClaseTb18_Fecha as 'Fecha', TmAsistClaseTb18_Hora as 'Hora',
    VcAsistClaseTb18_Estado as 'Estado', InMateriaTb17_IdMateria as 'Id_Materia' 
    from AsistClaseTb18
	order by 'date added' limit inicio,final;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaAsistColeTb08_ActualizarAsistCole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistColeTb08_ActualizarAsistCole`(in IdAsistCole int, in HoraEntrada time, in FechaEntrada date,
in HoraSalida time, in FechaSalida date, in IdEstudiante varchar(20))
begin
	update AsistColeTb08
    set InAsistColeTb08_IdAsistCole = IdAsistCole, TmAsistColeTb08_HoraEntrada = HoraEntrada  , DtAsistColeTb08_FechaEntrada = FechaEntrada,
	TmAsistColeTb08_HoraSalida = HoraSalida, DtAsistColeTb08_FechaSalida = FechaSalida, VcEstTb03_IdEstudiante = IdEstudiante
	where InAsistColeTb08_IdAsistCole = IdAsistCole;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaAsistColeTb08_BuscarAsistCole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistColeTb08_BuscarAsistCole`(in IdAsistCole int)
begin
	select InAsistColeTb08_IdAsistCole, TmAsistColeTb08_HoraEntrada, DtAsistColeTb08_FechaEntrada,
    TmAsistColeTb08_HoraSalida, DtAsistColeTb08_FechaSalida, VcEstTb03_IdEstudiante
    from AsistColeTb08
     where InAsistColeTb08_IdAsistCole = IdAsistCole;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaAsistColeTb08_BuscarAsistColeD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistColeTb08_BuscarAsistColeD`(in dato int)
begin
	select InAsistColeTb08_IdAsistCole, TmAsistColeTb08_HoraEntrada, DtAsistColeTb08_FechaEntrada,
    TmAsistColeTb08_HoraSalida, DtAsistColeTb08_FechaSalida, VcEstTb03_IdEstudiante
    from AsistColeTb08
     where InAsistColeTb08_IdAsistCole like concat('%',dato,'%')
     or TmAsistColeTb08_HoraEntrada like concat('%',dato,'%')
     or DtAsistColeTb08_FechaEntrada like concat('%',dato,'%')
     or TmAsistColeTb08_HoraSalida like concat('%',dato,'%')
     or DtAsistColeTb08_FechaSalida like concat('%',dato,'%')
     or VcEstTb03_IdEstudiante like concat('%',dato,'%');
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaAsistColeTb08_EliminarAsistCole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistColeTb08_EliminarAsistCole`(in IdAsisCole int)
begin
	delete from AsistColeTb08 where InAsistColeTb08_IdAsistCole = IdAsisCole;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaAsistColeTb08_GuardarAsistCole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistColeTb08_GuardarAsistCole`(in HoraEntrada time, in FechaEntrada date,
in HoraSalida time, in FechaSalida date, in IdEstudiante varchar(20))
begin
	insert into AsistColeTb08 (TmAsistColeTb08_HoraEntrada, DtAsistColeTb08_FechaEntrada,
    TmAsistColeTb08_HoraSalida, DtAsistColeTb08_FechaSalida, VcEstTb03_IdEstudiante)
    values (HoraEntrada, FechaEntrada, HoraSalida, FechaSalida, IdEstudiante);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaAsistColeTb08_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistColeTb08_Listar`(IN `inicio` INT, IN `final` INT)
begin
	select InAsistColeTb08_IdAsistCole as 'Id Asistencia', TmAsistColeTb08_HoraEntrada as 'Hora Entrada', 
    DtAsistColeTb08_FechaEntrada as 'Fecha Entrada', TmAsistColeTb08_HoraSalida as 'Hora Salida', 
    DtAsistColeTb08_FechaSalida as 'Fecha Salida', VcEstTb03_IdEstudiante as 'Estudiante'
    from AsistColeTb08
	order by 'date added' limit inicio,final;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaAsistEstTb23_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistEstTb23_Listar`(IN `idSec` INT, IN `IdMater` VARCHAR(20))
BEGIN
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaAsistEstTb23_Listar_Est` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaAsistEstTb23_Listar_Est`(IN `IdEst` VARCHAR(20))
BEGIN
select asistclasetb18.VcAsistClaseTb18_Estado as 'Estado',asistclasetb18.TmAsistClaseTb18_Hora as 'Hora',
asistclasetb18.DtAsistClaseTb18_Fecha as 'Fecha',materiatb17.VcMateriaTb17_Nombre as 'Materia' 
from asistclasetb18 inner join asistesttb23 on asistclasetb18.InAsistClaseTb18_IdAsistClase = asistesttb23.InAsistClaseTb18_IdAsistClase 
join materiatb17 on asistclasetb18.InMateriaTb17_IdMateria = materiatb17.InMateriaTb17_IdMateria 
where asistesttb23.VcEstTb03_IdEstudiante = IdEst;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaBachillerTb14_ActualizarBachiller` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaBachillerTb14_ActualizarBachiller`(in IdBac int, in NomBac varchar(20))
begin
	update BachillerTb14
    set   bachillertb14.VcBachillerTb14_NombreBachiller = NomBac
    where   bachillertb14.InBachillerTb14_IdBachiller = IdBac;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaBachillerTb14_BuscarBachiller` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaBachillerTb14_BuscarBachiller`(in IdBac int)
begin
	select InBachillerTb14_IdBachiller as 'Id', VcBachillerTb14_NombreBachiller as 'Bachiller' 
    from BachillerTb14 
     where InBachillerTb14_IdBachiller = IdBac;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaBachillerTb14_BuscarBachillerD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaBachillerTb14_BuscarBachillerD`(in dato varchar(20))
begin
	select InBachillerTb14_IdBachiller as 'Id', VcBachillerTb14_NombreBachiller as 'Bachiller' 
    from BachillerTb14 
     where InBachillerTb14_IdBachiller like concat('%',dato,'%')
     or VcBachillerTb14_NombreBachiller like concat(dato,'%');
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaBachillerTb14_EliminarBachiller` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaBachillerTb14_EliminarBachiller`(in IdBac int)
begin
	delete from BachillerTb14 where bachillertb14.InBachillerTb14_IdBachiller = IdBac;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaBachillerTb14_GuardarBachiller` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaBachillerTb14_GuardarBachiller`(in NomBac varchar(20))
begin
	insert into BachillerTb14 (VcBachillerTb14_NombreBachiller)
    values (NomBac);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaBachillerTb14_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaBachillerTb14_Listar`(IN `inicio` INT, IN `final` INT)
begin
	select InBachillerTb14_IdBachiller as 'Id', VcBachillerTb14_NombreBachiller as 'Bachiller' 
    from BachillerTb14
	order by 'date added' limit inicio,final;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaBachillerTb14_Listar_Todos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaBachillerTb14_Listar_Todos`()
begin
	select InBachillerTb14_IdBachiller as 'Id', VcBachillerTb14_NombreBachiller as 'Bachiller' 
    from BachillerTb14;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEncTb05_ActualizarEnc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_ActualizarEnc`( in IdEnc varchar(20),in NomEnc varchar(20), in Ape1 varchar(20), 
in Ape2 varchar(20), in Direccion varchar(100), in Telefono varchar(8), in Email varchar(100))
begin
	update enctb05,usutb01
    set usutb01.VcUsuTb01_Nombre = NomEnc, usutb01.VcUsuTb01_Ape1 = Ape1, usutb01.VcusuTb01_Ape2 = Ape2,
    usutb01.VcUsutb01_Direccion = Direccion, usutb01.VcUsuTb01_Telefono = Telefono,
	usutb01.VcUsuTb01_Email = Email
    where enctb05.VcEncTb05_IdEncargado = IdEnc  and usutb01.VcUsuTb01_Cedula=IdEnc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEncTb05_BuscarEnc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_BuscarEnc`(in cedula varchar(20))
begin
	select u.VcUsuTb01_Cedula as 'Cedula', u.VcUsuTb01_Nombre as 'Nombre', u.VcUsuTb01_Ape1 as 'Apellido1',
    u.VcUsuTb01_Ape2 as 'Apellido2', u.VcUsuTb01_Direccion as 'Direccion', u.CrUsuTb01_Sexo as 'Genero',
    u.VcUsuTb01_Telefono as 'Telefono', u.VcUsuTb01_Email as 'Email', e.VcEncTb05_Clave as 'Clave'
    from EncTb05 as e inner join usutb01 as u on e.VcEncTb05_IdEncargado = u.VcUsuTb01_Cedula
  where e.VcEncTb05_IdEncargado = cedula;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEncTb05_BuscarEncD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_BuscarEncD`(in dato varchar(20))
begin
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEncTb05_EliminarEnc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_EliminarEnc`(in id varchar(20))
begin
	delete from enctb05 where VcEncTb05_IdEncargado = id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEncTb05_GuardarEnc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_GuardarEnc`(in IdEnc varchar(20),in NomEnc varchar(20), in Ape1 varchar(20), in Ape2 varchar(20), 
in Direccion varchar(100), in Sexo char(1), in Telefono varchar(8), in Email varchar(100), in Clave varchar(20))
begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdEnc, NomEnc, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
	insert into EncTb05(VcEncTb05_IdEncargado, VcEncTb05_Clave)
    values (IdEnc, Clave);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEncTb05_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_Listar`(IN `inicio` INT, IN `fin` INT)
begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email', 
 enctb05.Vcenctb05_IdEncargado as 'Id Encargado', enctb05.Vcenctb05_Clave as 'Clave'
    from UsuTb01, enctb05
    where enctb05.VcEncTb05_IdEncargado = UsuTb01.VcUsuTb01_Cedula
	order by 'date added' limit inicio,fin;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEncTb05_ListarA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_ListarA`()
begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email', 
 enctb05.Vcenctb05_IdEncargado as 'Id Encargado', enctb05.Vcenctb05_Clave as 'Clave'
    from UsuTb01, enctb05
    where enctb05.VcEncTb05_IdEncargado = UsuTb01.VcUsuTb01_Cedula
	order by VcEncTb05_IdEncargado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEncTb05_ListarAsigna` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEncTb05_ListarAsigna`()
begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', 
 UsuTb01.VcUsuTb01_Ape1  as 'Apellido1', UsuTb01.VcUsuTb01_Ape2  as 'Apellido2' 
    from UsuTb01 inner join esttb03 on usutb01.VcUsuTb01_Cedula = esttb03.VcEstTb03_IdEstudiante
	order by 'date added';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEspecialidadTb16_ActualizarEspecialidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_ActualizarEspecialidad`(in IdEsp int, in NomEsp varchar(20), in Cupo int)
begin
	update EspecialidadTb16
    set   especialidadtb16.VcEspecialidadTb16_Nombre = NomEsp, especialidadtb16.InEspecialidadTb16_Cupo = Cupo
    where especialidadtb16.InEspecialidadTb16_IdEspecialidad = IdEsp;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEspecialidadTb16_BuscarEspecialidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_BuscarEspecialidad`(in IdEsp int)
begin
	select InEspecialidadTb16_IdEspecialidad as 'Id_Especialidad', VcEspecialidadTb16_Nombre as 'Nom_Especialidad',
    InEspecialidadTb16_Cupo as 'Cupo_Especialidad'
    from EspecialidadTb16
     where InEspecialidadTb16_IdEspecialidad = IdEsp;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEspecialidadTb16_BuscarEspecialidadD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_BuscarEspecialidadD`(in dato varchar(20))
begin
	select InEspecialidadTb16_IdEspecialidad as 'Id_Especialidad', VcEspecialidadTb16_Nombre as 'Nom_Especialidad',
    InEspecialidadTb16_Cupo as 'Cupo_Especialidad'
    from EspecialidadTb16
     where InEspecialidadTb16_IdEspecialidad like concat('%',dato,'%')
     or VcEspecialidadTb16_Nombre like concat('%',dato,'%')
     or InEspecialidadTb16_Cupo like concat('%',dato,'%');
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEspecialidadTb16_EliminarEspecialidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_EliminarEspecialidad`(in IdEs int)
begin
	delete from EspecialidadTb16 
    where especialidadtb16.InEspecialidadTb16_IdEspecialidad = IdEs;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEspecialidadTb16_GuardarEspecialidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_GuardarEspecialidad`(in NomEsp varchar(20), in Cupo int)
begin
	insert into EspecialidadTb16 ( VcEspecialidadTb16_Nombre, InEspecialidadTb16_Cupo)
    values (NomEsp, Cupo);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEspecialidadTb16_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_Listar`(IN `inicio` INT, IN `final` INT)
begin
	select InEspecialidadTb16_IdEspecialidad as 'Id', VcEspecialidadTb16_Nombre as 'Nombre',InEspecialidadTb16_Cupo  as 'Cupo' 
    from especialidadtb16
	order by 'date added' limit inicio,final;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEspecialidadTb16_Listar_Todos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEspecialidadTb16_Listar_Todos`()
begin
	select InEspecialidadTb16_IdEspecialidad as 'Id', VcEspecialidadTb16_Nombre as 'Nombre',InEspecialidadTb16_Cupo  as 'Cupo' 
    from especialidadtb16
	order by InEspecialidadTb16_IdEspecialidad;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstEncTb07_ActualizarEstEnc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstEncTb07_ActualizarEstEnc`(in IdEnc varchar(20), in IdEst varchar(20))
begin
	update EstEncTb07
    set VcEstEncTb07_IdEncargado = IdEnc, VcEstEncTb07_IdEstudiante = IdEst
    where VcEstEncTb07_IdEncargado = IdEnc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstEncTb07_AsignarEstEn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstEncTb07_AsignarEstEn`(in IdEnc varchar(20),in IdEst varchar(20))
begin
	insert into estenctb07(VcEncTb05_IdEncargado,VcEstTb03_IdEstudiante)
    values(IdEnc,IdEst);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstEncTb07_BuscarEstEnc_Enc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstEncTb07_BuscarEstEnc_Enc`(in IdEnc varchar(20))
begin
	select u.VcUsuTb01_Cedula as 'Cedula',u.VcUsuTb01_Nombre as 'Nombre',u.VcUsuTb01_Ape1 as '1° Apellido',
    u.VcUsuTb01_Ape2 as '2° Apellido',u.VcUsuTb01_Direccion as 'Direccion',u.CrUsuTb01_Sexo as 'Sexo',
    u.VcUsuTb01_Telefono as 'Telefono',u.VcUsuTb01_Email as 'Correo electronico', e.DtEstTb03_FechaNac as 'Fecha de nacimiento',
    e.VcEstTb03_Adecuacion as 'Adecuacion',e.VcEstTb03_Estado as 'Estado'
    from usutb01 as u inner join esttb03 as e on u.VcUsuTb01_Cedula = e.VcEstTb03_IdEstudiante
    join estenctb07 as p on e.VcEstTb03_IdEstudiante = p.VcEstTb03_IdEstudiante
    where p.VcEncTb05_IdEncargado = IdEnc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstEncTb07_BuscarEstEnc_Est` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstEncTb07_BuscarEstEnc_Est`(in IdEst varchar(20))
begin
	select u.VcUsuTb01_Cedula as 'Cedula',u.VcUsuTb01_Nombre as 'Nombre',u.VcUsuTb01_Ape1 as '1° Apellido',
    u.VcUsuTb01_Ape2 as '2° Apellido',u.VcUsuTb01_Direccion as 'Direccion',u.CrUsuTb01_Sexo as 'Sexo',
    u.VcUsuTb01_Telefono as 'Telefono',u.VcUsuTb01_Email as 'Correo electronico'
    from usutb01 as u inner join enctb05 as e on u.VcUsuTb01_Cedula = e.VcEncTb05_IdEncargado
    inner join estenctb07 as l on e.VcEncTb05_IdEncargado = l.VcEncTb05_IdEncargado
     where l.VcEstTb03_IdEstudiante = IdEst;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstEncTb07_CargarEst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstEncTb07_CargarEst`(in IdEnc varchar(20))
begin
	select e.VcEstTb03_IdEstudiante as 'Cedula'
    from esttb03 as e inner join estenctb07 as p on e.VcEstTb03_IdEstudiante = p.VcEstTb03_IdEstudiante
    where p.VcEncTb05_IdEncargado = IdEnc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstEncTb07_GuardarEstEnc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstEncTb07_GuardarEstEnc`(in IdEncargado varchar(20), in IdEstudiante varchar(20))
begin
	insert into estenctb07(VcEstTb03_IdEstudiante,VcEncTb05_IdEncargado)
    select e.VcEstTb03_IdEstudiante, o.VcEncTb05_IdEncargado
    from esttb03 as e,enctb05 as o
    where e.VcEstTb03_IdEstudiante = IdEstudiante and o.VcEncTb05_IdEncargado = IdEncargado; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstEncTb07_ListarEstEn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstEncTb07_ListarEstEn`(IN IdEst VARCHAR(20))
BEGIN
  SELECT UsuTb01.VcUsuTb01_Cedula AS 'Cedula',
  concat(usutb01.VcUsuTb01_Nombre , ' ' , 
    usutb01.VcUsuTb01_Ape1, ' ' , usutb01.VcUsuTb01_Ape2) as 'Nombre Completo',
 UsuTb01.VcUsuTb01_Direccion AS 'Direccion', UsuTb01.CrUsuTb01_Sexo AS 'Genero', UsuTb01.VcUsuTb01_Telefono AS 'Telefono', 
 UsuTb01.VcUsuTb01_Email AS 'Email', EstTb03.DtEstTb03_FechaNac AS 'FechaNac',EstTb03.VcEstTb03_Adecuacion AS 'Adecuacion', EstTb03.VcEstTb03_Estado AS 'Estado'
   
 FROM usutb01 INNER JOIN estenctb07 ON  usutb01.VcUsuTb01_Cedula = estenctb07.VcEstTb03_IdEstudiante
 JOIN esttb03 ON EstTb03.VcEstTb03_IdEstudiante = usutb01.VcUsuTb01_Cedula
    WHERE estenctb07.VcEstTb03_IdEstudiante = IdEst;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstTb03_ActualizarEst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_ActualizarEst`(IN cedula VARCHAR(20), IN FechaNac DATE, IN idesp int(11),
IN Nombre VARCHAR(20),IN Ape1 VARCHAR(20),IN Ape2 VARCHAR(20), IN Direccion VARCHAR(100), 
IN Telefono VARCHAR(20), IN email VARCHAR(20))
BEGIN
update esttb03,usutb01 set esttb03.DtEstTb03_FechaNac = FechaNac,usutb01.VcUsuTb01_Nombre = Nombre,usutb01.VcUsuTb01_Ape1 = Ape1,
usutb01.VcUsuTb01_Ape2 = Ape2,esttb03.InEspecialidadTb16_IdEspecialidad = idesp ,usutb01.VcUsuTb01_Direccion = Direccion,
usutb01.VcUsuTb01_Telefono = Telefono,usutb01.VcUsuTb01_Email = email
where usutb01.VcUsuTb01_Cedula = cedula and esttb03.VcEstTb03_IdEstudiante = cedula;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstTb03_BorrarEst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_BorrarEst`(in IdEst varchar(20))
begin
update esttb03 set VcEstTb03_Estado = 'I' where VcEstTb03_IdEstudiante = IdEst;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstTb03_BuscarEst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_BuscarEst`(in cedula varchar(20))
begin
	select u.VcUsuTb01_Cedula as 'Cedula', u.VcUsuTb01_Nombre as 'Nombre', u.VcUsuTb01_Ape1 as 'Apellido1',
    u.VcUsuTb01_Ape2 as 'Apellido2', s.VcEspecialidadTb16_Nombre as 'Especialidad', u.VcUsuTb01_Direccion as 'Direccion',
    u.CrUsuTb01_Sexo as 'Genero', u.VcUsuTb01_Telefono as 'Telefono', u.VcUsuTb01_Email as 'Email', 
    e.DtEstTb03_FechaNac as 'Fecha_Nac', e.VcEstTb03_Adecuacion as 'Adecuacion', e.VcEstTb03_Estado as 'Estado'
  from esttb03 as e inner join usutb01 as u on e.VcEstTb03_IdEstudiante = u.VcUsuTb01_Cedula 
  join especialidadtb16 as s on e.InEspecialidadTb16_IdEspecialidad = s.InEspecialidadTb16_IdEspecialidad
  where e.VcEstTb03_IdEstudiante = cedula;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstTb03_BuscarEstD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_BuscarEstD`(in dato varchar(20))
begin
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstTb03_GuardarEst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_GuardarEst`(in IdEst varchar(20),  in FecNacEst date, in Adecuacion varchar(20), 
in Estado varchar(20), in IdEspecialidad int, in NomEst varchar(20), in Ape1 varchar(20), in Ape2 varchar(20), 
in Direccion varchar(20), in Sexo char(1), in Telefono varchar(8), in Email varchar(100))
begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdEst, NomEst, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
     insert into EstTb03 (VcEstTb03_IdEstudiante, DtEstTb03_FechaNac, VcEstTb03_Adecuacion, VcEstTb03_Estado, InEspecialidadTb16_IdEspecialidad)
    values (IdEst, FecNacEst, Adecuacion, Estado, IdEspecialidad);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstTb03_Info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_Info`(IN IdEst VARCHAR(20))
BEGIN
	select esttb03.VcEstTb03_IdEstudiante as 'Cedula', 
    concat(usutb01.VcUsuTb01_Nombre , ' ' , usutb01.VcUsuTb01_Ape1, ' ' , usutb01.VcUsuTb01_Ape2) as 'Nombre_Est',
    usutb01.VcUsuTb01_Direccion as 'Direccion',usutb01.CrUsuTb01_Sexo as 'Genero',
    usutb01.VcUsuTb01_Telefono AS 'Telefono',
    usutb01.VcUsuTb01_Email AS 'Email', 
    esttb03.DtEstTb03_FechaNac AS 'Nacimiento',
    esttb03.VcEstTb03_Adecuacion AS 'Adecuacion',
    esttb03.VcEstTb03_Estado AS 'Estado',
    enctb05.VcEncTb05_IdEncargado as 'Encargado'/*,
    concat(usutb01.VcUsuTb01_Nombre , ' ' , usutb01.VcUsuTb01_Ape1, ' ' , usutb01.VcUsuTb01_Ape2) as 'Nombre_Enc',
    usutb01.VcUsuTb01_Telefono AS 'Telefono_Enc',
    usutb01.VcUsuTb01_Email AS 'Email_Enc'*/
    FROM 
    usutb01 INNER JOIN EstTb03 ON usutb01.VcUsuTb01_Cedula = esttb03.VcEstTb03_IdEstudiante
    join estenctb07 ON esttb03.VcEstTb03_IdEstudiante = estenctb07.VcEstTb03_IdEstudiante
    join enctb05 on estenctb07.VcEncTb05_IdEncargado = enctb05.VcEncTb05_IdEncargado
    WHERE estenctb07.VcEstTb03_IdEstudiante = IdEst;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstTb03_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_Listar`(IN inicio INT, IN final INT)
begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', especialidadtb16.VcEspecialidadTb16_Nombre as 'Especialidad', 
 UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', UsuTb01.VcUsuTb01_Telefono as 'Telefono', 
 UsuTb01.VcUsuTb01_Email as 'Email', EstTb03.DtEstTb03_FechaNac as 'FechaNac',EstTb03.VcEstTb03_Adecuacion as 'Adecuacion', EstTb03.VcEstTb03_Estado as 'Estado'
    from UsuTb01, EstTb03,especialidadtb16
    where EstTb03.VcEstTb03_IdEstudiante = UsuTb01.VcUsuTb01_Cedula and esttb03.InEspecialidadTb16_IdEspecialidad = especialidadtb16.InEspecialidadTb16_IdEspecialidad
	order by 'date added' limit inicio,final;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstTb03_ListarActivos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_ListarActivos`()
begin
 select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', EspecialidadTb16.VcEspecialidadTb16_Nombre as 'Especialidad', 
 UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', UsuTb01.VcUsuTb01_Telefono as 'Telefono', 
 UsuTb01.VcUsuTb01_Email as 'Email', EstTb03.DtEstTb03_FechaNac as 'FechaNac', EstTb03.VcEstTb03_Adecuacion as 'Adecuacion', EstTb03.VcEstTb03_Estado as 'Estado'
    from UsuTb01, EstTb03, EspecialidadTb16
    where EstTb03.VcEstTb03_IdEstudiante = UsuTb01.VcUsuTb01_Cedula and esttb03.VcEstTb03_Estado = 'A' and EspecialidadTb16.InEspecialidadTb16_IdEspecialidad = EstTb03.InEspecialidadTb16_IdEspecialidad
	order by EstTb03.VcEstTb03_IdEstudiante;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstTb03_Matricula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_Matricula`(in idEst varchar(20), IN mat int,in gra int, in sec int)
BEGIN
insert into graesttb26 (VcEstTb03_IdEstudiante, InGradoTb13_IdGrado)
values (idEst, gra);
insert into secesttb28 (VcEstTb03_IdEstudiante,InSeccionTb20_IdSeccion)
values (idEst, sec);
insert into inscmateriatb11 (VcEstTb03_IdEstudiante,InMateriaTb17_IdMateria)
values (idEst, mat); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaEstTb03_VerPorSeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaEstTb03_VerPorSeccion`(in idGra int,in idSec int)
BEGIN
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaFunTb06_ActualizarFunc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_ActualizarFunc`(in IdFun varchar(20), in FechaNac date, in Clave varchar(20),in NomFun varchar(20),
in Ape1 varchar(20), in Ape2 varchar(20), in Direccion varchar(100), in Telefono varchar(8), in Email varchar(100))
begin
	update FunTb06,usutb01
    set funtb06.VcFunTb06_Clave = Clave, funtb06.DtFunTb06_FechaNac = FechaNac, 
	usutb01.VcUsuTb01_Nombre = NomFun, usutb01.VcUsuTb01_Ape1 = Ape1, usutb01.VcusuTb01_Ape2 = Ape2,
	usutb01.VcUsutb01_Direccion = Direccion, usutb01.VcUsuTb01_Telefono = Telefono, usutb01.VcUsuTb01_Email = Email
	where funtb06.VcFunTb06_IdFuncionario = IdFun and usutb01.VcUsuTb01_Cedula = IdFun;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaFunTb06_BorrarFunc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_BorrarFunc`(in cedula varchar(20))
begin
update funtb06
set VcFunTb06_Estado = 'I' where VcFunTb06_IdFuncionario = cedula;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaFunTb06_BuscarFunc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_BuscarFunc`(in cedula varchar(20))
begin
select usutb01.VcUsuTb01_Cedula as 'Cedula',usutb01.VcUsuTb01_Nombre as 'Nombre',usutb01.VcUsuTb01_Ape1 as 'Apellido1',
usutb01.VcUsuTb01_Ape2 as 'Apellido2',usutb01.VcUsuTb01_Direccion as 'Direccion',usutb01.CrUsuTb01_Sexo as 'Sexo',
usutb01.VcUsuTb01_Telefono as 'Telefono',usutb01.VcUsuTb01_Email as 'Email',funtb06.VcFunTb06_Clave as 'Clave',
funtb06.DtFunTb06_FechaNac as 'Fecha_Nac',funtb06.VcFunTb06_Estado as 'Estado' 
from usutb01 inner join funtb06 on usutb01.VcUsuTb01_Cedula = funtb06.VcFunTb06_IdFuncionario 
where funtb06.VcFunTb06_IdFuncionario = cedula;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaFunTb06_BuscarFuncD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_BuscarFuncD`(in dato varchar(20))
begin
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaFunTb06_GuardarFunc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_GuardarFunc`(IN IdFun VARCHAR(20), IN Clave VARCHAR(20), IN FechaNac DATE, 
IN Estado VARCHAR(20), IN NomFun VARCHAR(20), IN Ape1 VARCHAR(20), IN Ape2 VARCHAR(20), IN Direccion VARCHAR(20),
IN Sexo CHAR(1), IN Telefono VARCHAR(8), IN Email VARCHAR(20))
begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, 
    CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdFun, NomFun, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
    insert into FunTb06 (VcFunTb06_IdFuncionario,VcFunTb06_Clave, DtFunTb06_FechaNac, VcFunTb06_Estado)
    values (IdFun, Clave, FechaNac, Estado);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaFunTb06_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaFunTb06_Listar`(IN `inicio` INT, IN `final` INT)
begin
select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email', funtb06.VcFunTb06_Clave as 'Clave', 
 funtb06.DtFunTb06_FechaNac as 'Fecha_Nac', funtb06.VcFunTb06_Estado as 'Estado'
    from UsuTb01, funtb06
    where funtb06.VcFunTb06_IdFuncionario = usutb01.VcUsuTb01_Cedula
	order by 'date added' limit inicio,final;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaGradoTb13_ActualizarGrado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaGradoTb13_ActualizarGrado`(in IdGrado int, in NombreGrado varchar(20), in IdBachiller int)
begin
	update GradoTb13
    set   VcGradoTb13_NombreGrado = NombreGrado, InBachillerTb14_IdBachiller = IdBachiller 
    where InGradoTb13_IdGrado = IdGrado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaGradoTb13_BorrarGrado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaGradoTb13_BorrarGrado`(in id int)
begin
	delete from gradotb13 where InGradoTb13_IdGrado = id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaGradoTb13_BuscarGrado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaGradoTb13_BuscarGrado`(in IdGrado int)
begin
	select gradotb13.InGradoTb13_IdGrado as 'id_grado' , gradotb13.VcGradoTb13_NombreGrado as 'Nombre', 
    bachillertb14.InBachillerTb14_IdBachiller as 'IdBachiller'
    from gradotb13 inner join bachillertb14 
    on bachillertb14.InBachillerTb14_IdBachiller = gradotb13.InBachillerTb14_IdBachiller
     where InGradoTb13_IdGrado = IdGrado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaGradoTb13_BuscarGradoD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaGradoTb13_BuscarGradoD`(in dato varchar(20))
begin
	select gradotb13.InGradoTb13_IdGrado as 'id_grado' , gradotb13.VcGradoTb13_NombreGrado as 'Nombre', 
    bachillertb14.VcBachillerTb14_NombreBachiller as 'Bachiller'
    from gradotb13 inner join bachillertb14 
    on bachillertb14.InBachillerTb14_IdBachiller = gradotb13.InBachillerTb14_IdBachiller
     where InGradoTb13_IdGrado like concat('%',dato,'%')
     or VcGradoTb13_NombreGrado like concat('%',dato,'%')
     or  bachillertb14.VcBachillerTb14_NombreBachiller like concat('%',dato,'%');
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaGradoTb13_GuardarGrado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaGradoTb13_GuardarGrado`(in NombreGrado varchar(20), in IdBachiller int)
begin
	insert into GradoTb13(VcGradoTb13_NombreGrado, InBachillerTb14_IdBachiller)
    values (NombreGrado, IdBachiller);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaGradoTb13_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaGradoTb13_Listar`(IN `inicio` INT, IN `final` INT)
begin
	select gradotb13.InGradoTb13_IdGrado as 'id_grado' , gradotb13.VcGradoTb13_NombreGrado as 'Nombre', 
    bachillertb14.VcBachillerTb14_NombreBachiller as 'Bachiller'
    from gradotb13 inner join bachillertb14 on bachillertb14.InBachillerTb14_IdBachiller = gradotb13.InBachillerTb14_IdBachiller
    order by 'date addeed' limit inicio,final;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaGradoTb13_Listar_Todo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaGradoTb13_Listar_Todo`()
begin
	select gradotb13.InGradoTb13_IdGrado as 'id_grado' , gradotb13.VcGradoTb13_NombreGrado as 'Nombre', 
    bachillertb14.VcBachillerTb14_NombreBachiller as 'Bachiller'
    from gradotb13 inner join bachillertb14 on bachillertb14.InBachillerTb14_IdBachiller = gradotb13.InBachillerTb14_IdBachiller
    order by InGradoTb13_IdGrado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaHorariosTb29_ActualizarHorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaHorariosTb29_ActualizarHorario`(in Dia varchar(20), in HoraIni time, in HoraFin time)
begin
	update HorariosTb29 h
    set  h.VcHorariosTb29_Dia = Dia, h.TmHorariosTb29_Hora_Inicio = HoraIni, h.TmHorariosTb29_Hora_Final = HoraFin
    where h.InHorariosTb29_IdHorario = IdHorario;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaHorariosTb29_AgregarHorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaHorariosTb29_AgregarHorario`(IN dia varchar(20), in ini time, in fin time)
BEGIN
	insert into horariostb29 (VcHorariosTb29_Dia, TmHorariosTb29_Hora_Inicio, TmHorariosTb29_Hora_Final)
    values (dia, ini, fin);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaHorariosTb29_AsignarHorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaHorariosTb29_AsignarHorario`(in idsec int,in idHo int, in idmat int, in idprof varchar(20))
BEGIN
	insert into matriculatb30 (InSeccionTb20_IdSeccion,InHorariosTb29_IdHorario,
    InMateriaTb17_IdMateria,VcProfTb04_IdProfesor)
    values(idsec, idHo, idmat, idprof);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaHorariosTb29_BuscarHorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaHorariosTb29_BuscarHorario`(in IdHo int)
begin
	select h.InHorariosTb29_IdHorario as 'Id', h.InMateriaTb17_IdMateria as 'Id_Materia', 
    h.VcHorariosTb29_Dia as 'Dia', h.TmHorariosTb29_Hora_Inicio as 'Hora_Inicio', 
    h.TmHorariosTb29_Hora_Final as 'Hora_Fin' 
    from HorariosTb29 h
	where h.InHorariosTb29_IdHorario = IdHo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaHorarioTb28_EliminarHorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaHorarioTb28_EliminarHorario`(in IdHo int)
begin
	delete from HorariosTb29  
    where HorariosTb29.InHorarioTb28_IdHorario = IdHo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaMateriaTb17_ActualizarMateria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_ActualizarMateria`(in IdMat int, in NomMat varchar(20))
begin
	update MateriaTb17
    set   materiatb17.VcMateriaTb17_Nombre = NomMat
    where materiatb17.InMateriaTb17_IdMateria = IdMat;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaMateriaTb17_BuscarMateria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_BuscarMateria`(in IdMat int)
begin
	select InMateriaTb17_IdMateria as 'Id', VcMateriaTb17_Nombre as 'Nombre' 
    from MateriaTb17
     where InMateriaTb17_IdMateria = IdMat;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaMateriaTb17_BuscarMateriaD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_BuscarMateriaD`(in dato varchar(20))
begin
	select InMateriaTb17_IdMateria as 'Id', VcMateriaTb17_Nombre as 'Nombre' 
    from MateriaTb17
     where InMateriaTb17_IdMateria like concat('%',dato,'%')
     or VcMateriaTb17_Nombre like concat('%',dato,'%');
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaMateriaTb17_EliminarMateria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_EliminarMateria`(in IdMat int)
begin
	delete from MateriaTb17 where materiatb17.InMateriaTb17_IdMateria = IdMat;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaMateriaTb17_GuardarMateria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_GuardarMateria`(in NomMat varchar(20))
begin
	insert into MateriaTb17 (VcMateriaTb17_Nombre)
    values (NomMat);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaMateriaTb17_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_Listar`(IN inicio INT, IN final INT)
BEGIN
	SELECT InMateriaTb17_IdMateria AS 'Id', VcMateriaTb17_Nombre AS 'Nombre'
    FROM  MateriaTb17
    ORDER BY 'date added' LIMIT inicio,final;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaMateriaTb17_ListarA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_ListarA`()
BEGIN
	SELECT m.InMateriaTb17_IdMateria AS 'Id', m.VcMateriaTb17_Nombre AS 'Materia',  usutb01.VcUsuTb01_Cedula AS 'Cedula',
   concat(usutb01.VcUsuTb01_Nombre, ' ' ,usutb01.VcUsuTb01_Ape1, ' ', usutb01.VcUsuTb01_Ape2) as 'Asignado'
    FROM asigmateriatb19 as a inner join  usutb01 on  usutb01.VcUsuTb01_Cedula = a.VcProfTb04_IdProfesor
    join MateriaTb17 as m on a.InMateriaTb17_IdMateria = m.InMateriaTb17_IdMateria
    ORDER BY 'date added';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaMateriaTb17_Listar_Asigna` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_Listar_Asigna`()
BEGIN
	SELECT usutb01.VcUsuTb01_Cedula AS 'Cedula',usutb01.VcUsuTb01_Nombre AS 'Nombre',
    usutb01.VcUsuTb01_Ape1 AS 'Apellido1',usutb01.VcUsuTb01_Ape2 AS 'Apellido2' 
    FROM usutb01 INNER JOIN proftb04 ON usutb01.VcUsuTb01_Cedula = proftb04.VcProfTb04_IdProfesor 
    ORDER BY 'date added';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaMateriaTb17_Listar_Todos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMateriaTb17_Listar_Todos`()
begin
	select InMateriaTb17_IdMateria as 'Id', VcMateriaTb17_Nombre as 'Nombre' 
    from MateriaTb17;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaMatriculaTb30_CargarSeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMatriculaTb30_CargarSeccion`(IN idMater INT, IN idProf VARCHAR(20))
BEGIN
select secciontb20.InSeccionTb20_IdSeccion as 'Id_Seccion',gradotb13.VcGradoTb13_NombreGrado as 'Grado' ,secciontb20.InSeccionTb20_Num_Grupo as 'num_grupo'
from secciontb20 inner join secgradotb25 on secciontb20.InSeccionTb20_IdSeccion = secgradotb25.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado 
join matriculatb30 on secciontb20.InSeccionTb20_IdSeccion = matriculatb30.InSeccionTb20_IdSeccion 
where matriculatb30.InMateriaTb17_IdMateria = idMater and matriculatb30.VcProfTb04_IdProfesor = idProf;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaMatriculaTb30_MatriculaProf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaMatriculaTb30_MatriculaProf`(in sec int, in horario int, in mat int, in prof varchar(20))
BEGIN
	insert into matriculatb30 (InSeccionTb20_IdSeccion,InHorariosTb29_IdHorario,InMateriaTb17_IdMateria,VcProfTb04_IdProfesor)
    values(sec, horario, mat, prof);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaProfTb04_ActualizarProf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_ActualizarProf`(in IdProf varchar(20),  in FecNac Date, in Clave varchar(20),in Nom varchar(20), 
in Ape1 varchar(20), in Ape2 varchar(20), in Direccion varchar(100), in Telefono varchar(8), in Email varchar(100))
begin
	update usutb01, ProfTb04
    set usutb01.VcUsuTb01_Nombre = Nom,
    usutb01.VcUsuTb01_Ape1 = Ape1,usutb01.VcUsuTb01_Ape2 = Ape2,usutb01.VcUsuTb01_Direccion = Direccion,
    usutb01.VcUsuTb01_Telefono = Telefono,usutb01.VcUsuTb01_Email = Email,
    ProfTb04.VcProfTb04_IdProfesor = IdProf, ProfTb04.VcProfTb04_Clave = Clave,
    ProfTb04.DtProfTb04_FechaNac = FecNac
    where ProfTb04.VcProfTb04_IdProfesor = IdProf and usutb01.VcUsuTb01_Cedula = IdProf;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaProfTb04_Asigna_SecProf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_Asigna_SecProf`(IN IdProf VARCHAR(20), in IdSec int)
BEGIN
insert into seccionproftb27(VcProfTb04_IdProfesor,InSeccionTb20_IdSeccion) 
    values(IdProf, IdSec);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaProfTb04_BorrarProf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_BorrarProf`(in IdProf varchar(20))
begin
update proftb04 set VcProfTb04_Estado = 'I' where VcProfTb04_IdProfesor = IdProf;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaProfTb04_BuscarProf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_BuscarProf`(in cedula varchar(20))
begin
	select u.VcUsuTb01_Cedula as 'Cedula', u.VcUsuTb01_Nombre as 'Nombre', u.VcUsuTb01_Ape1 as 'Apellido1',
    u.VcUsuTb01_Ape2 as 'Apellido2', u.VcUsuTb01_Direccion as 'Direccion', u.CrUsuTb01_Sexo as 'Sexo',
    u.VcUsuTb01_Telefono as 'Telefono', u.VcUsuTb01_Email as 'Correo_Electronico',
    p.VcProfTb04_IdProfesor as 'Id_Profesor', p.DtProfTb04_FechaNac as 'Fecha_Nac',
    p.VcProfTb04_Clave as 'Clave', p.VcProfTb04_Estado as 'Estado'
    from ProfTb04 as p inner join usutb01 as u on p.VcProfTb04_IdProfesor = u.VcUsuTb01_Cedula
  where p.VcProfTb04_IdProfesor = cedula;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaProfTb04_BuscarProfD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_BuscarProfD`(in dato varchar(20))
begin
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaProfTb04_GuardarProf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_GuardarProf`(in IdProf varchar(20),  in FecNacProf date, in Clave varchar(20), in Estado varchar(20),
in NomProf varchar(20), in Ape1 varchar(20), in Ape2 varchar(20), in Direccion varchar(100), 
in Sexo char(1), in Telefono varchar(8), in Email varchar(100))
begin
	insert into UsuTb01(VcUsuTb01_Cedula, VcUsuTb01_Nombre, VcUsuTb01_Ape1, VcUsuTb01_Ape2, VcUsuTb01_Direccion, 
    CrUsuTb01_Sexo, VcUsuTb01_Telefono, VcUsuTb01_Email)
    values(IdProf, NomProf, Ape1, Ape2, Direccion, Sexo, Telefono, Email);
     insert into ProfTb04 (VcProfTb04_IdProfesor, DtProfTb04_FechaNac, VcProfTb04_Clave, VcProfTb04_Estado)
    values (IdProf, FecNacProf, Clave, Estado);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaProfTb04_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_Listar`(IN `inicio` INT, IN `final` INT)
begin
select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email',ProfTb04.VcProfTb04_Clave as 'Clave', 
 ProfTb04.DtProfTb04_FechaNac as 'Fecha_Nac', ProfTb04.VcProfTb04_Estado as 'Estado'
    from UsuTb01, ProfTb04
    where ProfTb04.VcProfTb04_IdProfesor = UsuTb01.VcUsuTb01_Cedula and proftb04.VcProfTb04_Estado = 'A'
	order by 'date added' limit inicio,final;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaProfTb04_ListarA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_ListarA`()
begin
select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2', UsuTb01.VcUsuTb01_Direccion as 'Direccion', UsuTb01.CrUsuTb01_Sexo as 'Genero', 
 UsuTb01.VcUsuTb01_Telefono as 'Telefono', UsuTb01.VcUsuTb01_Email as 'Email',ProfTb04.VcProfTb04_Clave as 'Clave', 
 ProfTb04.DtProfTb04_FechaNac as 'Fecha_Nac', ProfTb04.VcProfTb04_Estado as 'Estado'
    from UsuTb01, ProfTb04
    where ProfTb04.VcProfTb04_IdProfesor = UsuTb01.VcUsuTb01_Cedula and proftb04.VcProfTb04_Estado = 'A'
	order by VcProfTb04_IdProfesor;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaProfTb04_Listar_Asigna` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaProfTb04_Listar_Asigna`()
BEGIN
	SELECT usutb01.VcUsuTb01_Cedula AS 'Cedula',
    concat(usutb01.VcUsuTb01_Nombre, ' ' ,usutb01.VcUsuTb01_Ape1, ' ', usutb01.VcUsuTb01_Ape2) as 'Profesor'
    FROM usutb01 INNER JOIN proftb04 ON usutb01.VcUsuTb01_Cedula = proftb04.VcProfTb04_IdProfesor 
    ORDER BY usutb01.VcUsuTb01_Cedula ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSeccionprofTb27_Asignar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionprofTb27_Asignar`(in ids int, in idp varchar(20))
BEGIN
insert into seccionproftb27(InSeccionTb20_IdSeccion,VcProfTb04_IdProfesor) 
    values(ids,idp);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSeccionTb20_ActualizarSeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_ActualizarSeccion`(IN `id_grupo` int, IN `cupo` INT, IN `num_grupo` INT)
begin
	update secciontb20 set InSeccionTb20_Num_Grupo = num_grupo,InSeccionTb20_Cupo = cupo 
    where InSeccionTb20_IdSeccion = id_grupo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSeccionTb20_Borrar_Seccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_Borrar_Seccion`(in id_seccion int)
begin
	delete from SeccionTb20 where InSeccionTb20_IdSeccion = id_seccion;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSeccionTb20_BuscarSeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_BuscarSeccion`(in id_sec int)
begin
select secciontb20.InSeccionTb20_IdSeccion as 'ID_Seccion',secciontb20.InSeccionTb20_Cupo as 'cupo',
secciontb20.InSeccionTb20_Num_Grupo as 'Num_grupo',gradotb13.VcGradoTb13_NombreGrado as 'Grado' 
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
where secciontb20.InSeccionTb20_IdSeccion = id_sec;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSeccionTb20_BuscarSeccionD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_BuscarSeccionD`( in dato varchar(20))
begin
select secciontb20.InSeccionTb20_IdSeccion as 'ID_Seccion',secciontb20.InSeccionTb20_Cupo as 'cupo',
secciontb20.InSeccionTb20_Num_Grupo as 'Num_grupo',gradotb13.VcGradoTb13_NombreGrado as 'Grado' 
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
where secciontb20.InSeccionTb20_IdSeccion like concat('%',dato,'%')
or secciontb20.InSeccionTb20_Cupo like concat('%',dato,'%')
or secciontb20.InSeccionTb20_Num_Grupo like concat('%',dato);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSeccionTb20_BuscarSecCompleta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_BuscarSecCompleta`(in numGra int,in numSec int)
BEGIN
select concat(gradotb13.VcGradoTb13_NombreGrado, '-',secciontb20.InSeccionTb20_Num_Grupo) as 'Seccion' 
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
join secesttb28 on secesttb28.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion
join graesttb26 on graesttb26.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
where gradotb13.InGradoTb13_IdGrado like concat('%',numGra)
and secciontb20.InSeccionTb20_IdSeccion like concat(numSec,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSeccionTb20_Guardar_Seccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_Guardar_Seccion`(IN cupo INT, IN num_grupo INT, IN Grado INT)
begin
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSeccionTb20_ListaNumSec` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_ListaNumSec`()
BEGIN
select secciontb20.InSeccionTb20_IdSeccion as 'ID_Seccion',
secciontb20.InSeccionTb20_Num_Grupo as 'Grupo' 
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado   
ORDER BY 'date added';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSeccionTb20_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_Listar`(IN inicio INT, IN final INT)
begin
select secciontb20.InSeccionTb20_IdSeccion as 'ID_Seccion',secciontb20.InSeccionTb20_Cupo as 'cupo',
secciontb20.InSeccionTb20_Num_Grupo as 'Num_grupo',gradotb13.VcGradoTb13_NombreGrado as 'Grado'
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
order by 'date addeed' limit inicio,final;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSeccionTb20_ListarEst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_ListarEst`(in idsec int)
BEGIN
    select usutb01.VcUsuTb01_Cedula AS 'Cedula',
   concat(usutb01.VcUsuTb01_Nombre, ' ' ,usutb01.VcUsuTb01_Ape1, ' ', usutb01.VcUsuTb01_Ape2) as 'Estudiante',
concat(gradotb13.VcGradoTb13_NombreGrado,'-', secciontb20.InSeccionTb20_Num_Grupo) as 'Seccion'
from usutb01, esttb03, secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
where secciontb20.InSeccionTb20_IdSeccion = idsec
and  usutb01.VcUsuTb01_Cedula = esttb03.VcEstTb03_IdEstudiante
ORDER BY esttb03.VcEstTb03_IdEstudiante ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSeccionTb20_Listar_Todos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_Listar_Todos`()
BEGIN
select 
secciontb20.InSeccionTb20_Cupo as 'Cupo',
gradotb13.VcGradoTb13_NombreGrado as 'Grado',
secciontb20.InSeccionTb20_Num_Grupo as 'Grupo' 
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado   
ORDER BY 'date added';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSeccionTb20_Lista_Sec` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_Lista_Sec`()
BEGIN
select secciontb20.InSeccionTb20_IdSeccion as 'ID_Seccion',
concat(gradotb13.VcGradoTb13_NombreGrado,'-', secciontb20.InSeccionTb20_Num_Grupo) as 'Seccion'
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
ORDER BY GradoTb13.VcGradoTb13_NombreGrado ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSeccionTb20_Lista_SecProf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeccionTb20_Lista_SecProf`(IN IdProf VARCHAR(20), in IdSec int)
BEGIN
select secciontb20.InSeccionTb20_IdSeccion as 'ID_Seccion',gradotb13.VcGradoTb13_NombreGrado as 'Grado',
secciontb20.InSeccionTb20_Num_Grupo as 'Num_grupo'
from secciontb20 inner join secgradotb25 on secgradotb25.InSeccionTb20_IdSeccion = secciontb20.InSeccionTb20_IdSeccion 
join gradotb13 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado 
order by 'date added';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSecEstTb28_Listar_Asist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSecEstTb28_Listar_Asist`(in idSec int)
begin
select UsuTb01.VcUsuTb01_Cedula as 'Cedula', UsuTb01.VcUsuTb01_Nombre  as 'Nombre', UsuTb01.VcUsuTb01_Ape1  as 'Apellido1',
 UsuTb01.VcUsuTb01_Ape2  as 'Apellido2' 
 from usutb01 inner join secesttb28 on usutb01.VcUsuTb01_Cedula = secesttb28.VcEstTb03_IdEstudiante 
 where secesttb28.InSeccionTb20_IdSeccion = idSec;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSecGradoTb25_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSecGradoTb25_Listar`(in numGra int,in numSec int)
BEGIN
select gradotb13.VcGradoTb13_NombreGrado as 'Grado'
from gradotb13 inner 
join secgradotb25 on secgradotb25.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
join graesttb26 on graesttb26.InGradoTb13_IdGrado = gradotb13.InGradoTb13_IdGrado
where secgradotb25.InGradoTb13_IdGrado =  numGra and
secgradotb25.InSeccionTb20_IdSeccion = numSec;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaSeguridadTb31_Validar_Usu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaSeguridadTb31_Validar_Usu`(IN usu VARCHAR(20), IN pass VARCHAR(20))
BEGIN
IF EXISTS(SELECT AdmTb02.VcAdmTb02_IdAdmin FROM AdmTb02  /*Administrador*/
	WHERE AdmTb02.VcAdmTb02_IdAdmin = usu AND AdmTb02.VcAdmTb02_Clave = pass)
THEN 
	SELECT SeguridadTb31.VcSeguridadTb31_Funcion AS 'Funcion',SeguridadTb31.VcSeguridadTb31_Glyphicons AS 'Iconos',
	SeguridadTb31.VcSeguridadTb31_SideNav AS 'SideNav' FROM SeguridadTb31 
	WHERE SeguridadTb31.InSeguridadTb31_Nivel = 1;
ELSEIF EXISTS(SELECT ProfTb04.VcProfTb04_IdProfesor FROM ProfTb04 /*Profesor*/
    WHERE ProfTb04.VcProfTb04_IdProfesor = usu AND ProfTb04.VcProfTb04_Clave = pass)
THEN 
	SELECT SeguridadTb31.VcSeguridadTb31_Funcion AS 'Funcion',SeguridadTb31.VcSeguridadTb31_Glyphicons AS 'Iconos',
    SeguridadTb31.VcSeguridadTb31_SideNav AS 'SideNav' FROM SeguridadTb31 
    WHERE SeguridadTb31.InSeguridadTb31_Nivel = 2;
ELSEIF EXISTS(SELECT enctb05.VcEncTb05_IdEncargado FROM EncTb05 /*Encargado*/
	WHERE EncTb05.VcEncTb05_IdEncargado = USER AND EncTb05.Vcenctb05_Clave = pass)
THEN 
	SELECT SeguridadTb31.VcSeguridadTb31_Funcion AS 'Funcion',SeguridadTb31.VcSeguridadTb31_Glyphicons AS 'Iconos',
	SeguridadTb31.VcSeguridadTb31_SideNav AS 'SideNav' FROM SeguridadTb31 
	WHERE SeguridadTb31.InSeguridadTb31_Nivel = 3;
ELSEIF EXISTS(SELECT  funtb06.VcFunTb06_IdFuncionario FROM funtb06 /*Funcionario*/
	WHERE funtb06.VcFunTb06_IdFuncionario = USER AND funtb06.VcFunTb06_Clave = pass)
THEN 
	SELECT SeguridadTb31.VcSeguridadTb31_Funcion AS 'Funcion',SeguridadTb31.VcSeguridadTb31_Glyphicons AS 'Iconos',
	SeguridadTb31.VcSeguridadTb31_SideNav AS 'SideNav' FROM SeguridadTb31 
	WHERE SeguridadTb31.InSeguridadTb31_Nivel = 4;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaUsuTb01_ListarUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaUsuTb01_ListarUsuarios`()
BEGIN
 SELECT UsuTb01.VcUsuTb01_Cedula AS 'Cedula', 
 concat(UsuTb01.VcUsuTb01_Nombre, ' ', UsuTb01.VcUsuTb01_Ape1, ' ',UsuTb01.VcUsuTb01_Ape2)  AS 'Nombre'
 FROM UsuTb01 
	ORDER BY 'date added';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PaUsuTb01_TipoUsu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PaUsuTb01_TipoUsu`(in nivel int)
BEGIN
	 if exists(select SeguridadTb31.InSeguridadTb31_Nivel from SeguridadTb31
     where nivel = 1) /* Administrador */
     then select VcSeguridadTb31_Funcion, VcSeguridadTb31_Glyphicons,VcSeguridadTb31_SideNav 
     from SeguridadTb31 where InSeguridadTb31_Nivel = 1;
	elseif exists (select SeguridadTb31.InSeguridadTb31_Nivel from SeguridadTb31
     where nivel = 2) /* Profesor */
     then select VcSeguridadTb31_Funcion, VcSeguridadTb31_Glyphicons,VcSeguridadTb31_SideNav 
     from SeguridadTb31 where InSeguridadTb31_Nivel = 2;
	elseif exists (select SeguridadTb31.InSeguridadTb31_Nivel from SeguridadTb31
     where nivel = 3) /* Encargado */
     then select VcSeguridadTb31_Funcion, VcSeguridadTb31_Glyphicons,VcSeguridadTb31_SideNav 
     from SeguridadTb31 where InSeguridadTb31_Nivel = 3;
	elseif exists (select SeguridadTb31.InSeguridadTb31_Nivel from SeguridadTb31
     where nivel = 4) /* Funcionario */
     then select VcSeguridadTb31_Funcion, VcSeguridadTb31_Glyphicons,VcSeguridadTb31_SideNav 
     from SeguridadTb31 where InSeguridadTb31_Nivel = 4;
     end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-15 14:21:43

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-13 14:42:44

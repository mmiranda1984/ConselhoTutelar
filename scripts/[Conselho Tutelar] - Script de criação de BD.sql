CREATE DATABASE  IF NOT EXISTS `conselhotutelar` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `conselhotutelar`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: conselhotutelar
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `conselho`
--

DROP TABLE IF EXISTS `conselho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conselho` (
  `cod_conselho` int(11) NOT NULL AUTO_INCREMENT,
  `nom_conselho` varchar(100) NOT NULL,
  `dat_inicio_funcionamento` datetime DEFAULT NULL,
  `txt_endereco` varchar(50) DEFAULT NULL,
  `txt_complemento` varchar(50) DEFAULT NULL,
  `txt_bairro` varchar(40) DEFAULT NULL,
  `txt_cidade` varchar(40) DEFAULT NULL,
  `txt_uf` varchar(2) DEFAULT NULL,
  `txt_cep` varchar(9) DEFAULT NULL,
  `num_telefone_residencial` varchar(11) DEFAULT NULL,
  `num_telefone_celular` varchar(11) DEFAULT NULL,
  `ind_ativo` binary(1) DEFAULT NULL,
  PRIMARY KEY (`cod_conselho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conselho`
--

LOCK TABLES `conselho` WRITE;
/*!40000 ALTER TABLE `conselho` DISABLE KEYS */;
/*!40000 ALTER TABLE `conselho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `cod_evento` int(11) NOT NULL AUTO_INCREMENT,
  `nom_evento` varchar(100) NOT NULL,
  `dat_evento` datetime DEFAULT NULL,
  `txt_observacao` varchar(200) DEFAULT NULL,
  `qtd_associados` int(11) DEFAULT NULL,
  `qtd_nao_associados` int(11) DEFAULT NULL,
  `val_total_taxa_inscricao` double DEFAULT NULL,
  PRIMARY KEY (`cod_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento` (
  `cod_pessoa` int(11) NOT NULL,
  `num_mesanoreferencia` int(11) NOT NULL,
  `dat_pagamento` datetime NOT NULL,
  `val_pagamento` double NOT NULL,
  PRIMARY KEY (`cod_pessoa`,`num_mesanoreferencia`),
  KEY `fk_pagamento_pessoa1_idx` (`cod_pessoa`),
  CONSTRAINT `fk_pagamento_pessoa1` FOREIGN KEY (`cod_pessoa`) REFERENCES `pessoa` (`cod_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patrimonio`
--

DROP TABLE IF EXISTS `patrimonio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patrimonio` (
  `cod_patrimonio` int(11) NOT NULL AUTO_INCREMENT,
  `nom_patrimonio` varchar(100) NOT NULL,
  `dat_aquisicao` datetime DEFAULT NULL,
  `txt_tipo` varchar(40) DEFAULT NULL,
  `txt_observacao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cod_patrimonio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patrimonio`
--

LOCK TABLES `patrimonio` WRITE;
/*!40000 ALTER TABLE `patrimonio` DISABLE KEYS */;
/*!40000 ALTER TABLE `patrimonio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `cod_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nom_pessoa` varchar(100) NOT NULL,
  `dat_nascimento` datetime NOT NULL,
  `dat_associacao` datetime DEFAULT NULL,
  `txt_url_foto` varchar(45) DEFAULT NULL,
  `txt_endereco` varchar(50) DEFAULT NULL,
  `txt_complemento` varchar(50) DEFAULT NULL,
  `txt_bairro` varchar(40) DEFAULT NULL,
  `txt_cidade` varchar(40) DEFAULT NULL,
  `txt_uf` varchar(2) DEFAULT NULL,
  `txt_cep` varchar(9) DEFAULT NULL,
  `txt_email` varchar(45) DEFAULT NULL,
  `num_telefone_residencial` varchar(11) DEFAULT NULL,
  `num_telefone_celular` varchar(11) DEFAULT NULL,
  `ind_ativo` binary(1) DEFAULT NULL,
  `cod_conselho` int(11) NOT NULL,
  `cod_tipopessoa` int(11) NOT NULL,
  PRIMARY KEY (`cod_pessoa`),
  KEY `fk_pessoa_conselho_idx` (`cod_conselho`),
  KEY `fk_pessoa_tipopessoa1_idx` (`cod_tipopessoa`),
  CONSTRAINT `fk_pessoa_conselho` FOREIGN KEY (`cod_conselho`) REFERENCES `conselho` (`cod_conselho`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pessoa_tipopessoa1` FOREIGN KEY (`cod_tipopessoa`) REFERENCES `tipopessoa` (`cod_tipopessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopessoa`
--

DROP TABLE IF EXISTS `tipopessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipopessoa` (
  `cod_tipopessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nom_tipopessoa` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_tipopessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopessoa`
--

LOCK TABLES `tipopessoa` WRITE;
/*!40000 ALTER TABLE `tipopessoa` DISABLE KEYS */;
INSERT INTO `tipopessoa` VALUES (1,'Associado'),(2,'Conselheiro'),(3,'Conselheiro Associado'),(4,'Ex-Conselheiro'),(5,'Ex-Conselheiro Associado');
/*!40000 ALTER TABLE `tipopessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `cod_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nom_usuario` varchar(100) NOT NULL,
  `txt_login_usuario` varchar(20) NOT NULL,
  `txt_senha_usuario` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-04 16:57:30

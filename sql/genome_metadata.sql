-- MySQL dump 10.14  Distrib 5.5.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: genome_metadata
-- ------------------------------------------------------
-- Server version	5.5.44-MariaDB-1ubuntu0.14.04.1

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
-- Table structure for table `assembly`
--

DROP TABLE IF EXISTS `assembly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assembly` (
  `assembly_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `assembly_accession` varchar(16) DEFAULT NULL,
  `assembly_name` varchar(200) NOT NULL,
  `assembly_level` varchar(50) NOT NULL,
  `base_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`assembly_id`),
  UNIQUE KEY `assembly_accession_idx` (`assembly_accession`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assembly_sequence`
--

DROP TABLE IF EXISTS `assembly_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assembly_sequence` (
  `assembly_sequence_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `assembly_id` int(10) unsigned NOT NULL,
  `name` varchar(40) NOT NULL,
  `acc` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`assembly_sequence_id`),
  UNIQUE KEY `id_alias` (`assembly_id`,`name`,`acc`),
  KEY `acc` (`acc`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `compara_analysis`
--

DROP TABLE IF EXISTS `compara_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compara_analysis` (
  `compara_analysis_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `division` varchar(64) NOT NULL,
  `method` varchar(50) NOT NULL,
  `set_name` varchar(128) DEFAULT NULL,
  `dbname` varchar(64) NOT NULL,
  PRIMARY KEY (`compara_analysis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genome`
--

DROP TABLE IF EXISTS `genome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genome` (
  `genome_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `organism_id` int(10) unsigned NOT NULL,
  `assembly_id` int(10) unsigned NOT NULL,
  `genebuild` varchar(64) NOT NULL,
  `has_pan_compara` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `has_variations` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `has_peptide_compara` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `has_genome_alignments` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `has_synteny` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `has_other_alignments` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`genome_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genome_alias`
--

DROP TABLE IF EXISTS `genome_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genome_alias` (
  `genome_alias_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `genome_id` int(10) unsigned NOT NULL,
  `alias` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`genome_alias_id`),
  UNIQUE KEY `id_alias` (`genome_id`,`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genome_alignment`
--

DROP TABLE IF EXISTS `genome_alignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genome_alignment` (
  `genome_alignment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `genome_id` int(10) unsigned NOT NULL,
  `type` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`genome_alignment_id`),
  UNIQUE KEY `id_type_key` (`genome_id`,`type`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genome_annotation`
--

DROP TABLE IF EXISTS `genome_annotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genome_annotation` (
  `genome_annotation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `genome_id` int(10) unsigned NOT NULL,
  `type` varchar(32) NOT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`genome_annotation_id`),
  UNIQUE KEY `id_type` (`genome_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genome_compara_analysis`
--

DROP TABLE IF EXISTS `genome_compara_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genome_compara_analysis` (
  `genome_compara_analysis_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `genome_id` int(10) unsigned NOT NULL,
  `compara_analysis_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`genome_compara_analysis_id`),
  UNIQUE KEY `genome_compara_analysis_key` (`genome_id`,`compara_analysis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genome_feature`
--

DROP TABLE IF EXISTS `genome_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genome_feature` (
  `genome_feature_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `genome_id` int(10) unsigned NOT NULL,
  `type` varchar(32) NOT NULL,
  `analysis` varchar(128) NOT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`genome_feature_id`),
  UNIQUE KEY `id_type_analysis` (`genome_id`,`type`,`analysis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genome_publication`
--

DROP TABLE IF EXISTS `genome_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genome_publication` (
  `genome_publication_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `genome_id` int(10) unsigned NOT NULL,
  `publication` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`genome_publication_id`),
  UNIQUE KEY `id_publication` (`genome_id`,`publication`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genome_release`
--

DROP TABLE IF EXISTS `genome_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genome_release` (
  `genome_release_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `release_id` int(10) unsigned NOT NULL,
  `genome_id` int(10) unsigned NOT NULL,
  `division` varchar(32) NOT NULL,
  `dbname` varchar(64) NOT NULL,
  `species_id` int(10) unsigned NOT NULL,
  `ensembl_version` int(10) unsigned NOT NULL,
  `ensembl_genomes_version` int(10) unsigned DEFAULT NULL,
  `is_current` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`genome_release_id`),
  UNIQUE KEY `release_genome` (`release_id`,`genome_id`),
  UNIQUE KEY `dbname_species_id` (`dbname`,`species_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genome_variation`
--

DROP TABLE IF EXISTS `genome_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genome_variation` (
  `genome_variation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `genome_id` int(10) unsigned NOT NULL,
  `type` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`genome_variation_id`),
  UNIQUE KEY `id_type_key` (`genome_id`,`type`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organism`
--

DROP TABLE IF EXISTS `organism`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organism` (
  `organism_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxonomy_id` int(10) unsigned NOT NULL,
  `is_reference` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `species_taxonomy_id` int(10) unsigned NOT NULL,
  `species` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `strain` varchar(128) DEFAULT NULL,
  `serotype` varchar(128) DEFAULT NULL,
  `description` text,
  `image` blob,
  PRIMARY KEY (`organism_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `release`
--

DROP TABLE IF EXISTS `release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `release` (
  `release_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ensembl_version` int(10) unsigned NOT NULL,
  `ensembl_genomes_version` int(10) unsigned DEFAULT NULL,
  `is_current` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`release_id`),
  UNIQUE KEY `e_eg_idx` (`ensembl_version`,`ensembl_genomes_version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-09 10:58:06
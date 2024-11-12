-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: greendetails
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (1,3,19,1,23000.00),(2,1,14,2,14000.00),(3,4,22,5,15000.00),(4,2,12,1,25000.00);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `fecha_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `direccion_envio` varchar(255) NOT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,2,'2024-03-25 00:00:00','avenida 17 bis 13  - 62','Pse','entregado'),(2,4,'2024-03-27 00:00:00','calle 13  #3  -42','MasterCard','entregado'),(3,1,'2024-03-30 00:00:00','avenida 9 bis 16cs 62','MasterCard','entregado'),(4,3,'2024-04-06 00:00:00','calle 17 bis 13  - 62','Pse','entregado'),(5,4,'2024-04-07 00:00:00','calle 13  #3  -42','MasterCard','proceso'),(6,1,'2024-04-09 00:00:00','avenida 9 bis 16cs 62','MasterCard','proceso');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `cantidad_stock` int NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'repsos verde','matera colorida',20000.00,'porcelana',20,NULL),(2,'mini hongo toad','matero hongo toad',11300.00,'porcelana',14,NULL),(3,'perro doki','Matero jack russell terrier',12000.00,'porcelana',23,NULL),(4,'Los Perros',' Matero yorkshire, jack russell terrier, pitbull',11500.00,'porcelana',25,NULL),(5,'Buda','Matero cabeza buda',15000.00,'porcelana',31,NULL),(6,'Jirafa you','Matero Jirafas',13000.00,'porcelana',23,NULL),(7,'Madre planta',' Matero en madre tierra',20000.00,'porcelana',32,NULL),(8,'Conejin','Matero en conejo',22000.00,'porcelana',30,NULL),(9,'Mini y Michis',' Matero en gato',15000.00,'porcelana',21,NULL),(10,'La pareja','Matero en parejas',25000.00,'porcelana',20,NULL),(11,'Escandaloso','Matero en osos',16000.00,'porcelana',20,NULL),(12,'Abuelos','Matero en pareja de abuelos',25000.00,'porcelana',15,NULL),(13,'Jirafa maik','Matero en jirafa',10000.00,'porcelana',30,NULL),(14,'Stickman','Matero en stickman',14000.00,'porcelana',25,NULL),(15,'Maceta Earthling',' Matero en earthling',20000.00,'porcelana',15,NULL),(16,'Maceta Emoticon','Matero en emoticon',16000.00,'porcelana',24,NULL),(17,'Maceta osos','Matero en osos',25000.00,'porcelana',17,NULL),(18,'Stickman','Matero en stickman',12000.00,'porcelana',25,NULL),(19,'Los Michis','Matero en gatos',23000.00,'porcelana',29,NULL),(20,'Cerditos Colorados','Matero en cerditos',20000.00,'porcelana',40,NULL),(21,'Cabeza Esthetic',' Matero en aesthetic',12000.00,'porcelana',35,NULL),(22,'Conejos Coloridos',' Matero en cinejo',15000.00,'porcelana',25,NULL),(23,'Stickman','Matero en stickman',20000.00,'porcelana',18,NULL),(24,'Calavera Renaciente','Matero en calavera',12000.00,'porcelana',17,NULL),(25,'Pulpos Coloridos','Matero en pulpos',16000.00,'porcelana',39,NULL),(26,'Dia de Muertos','Matero en calavera',18000.00,'porcelana',45,NULL),(27,'Cerditos Colorados','Matero en cerditos',22000.00,'porcelana',20,NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `direccion_envio` varchar(255) DEFAULT NULL,
  `direccion_facturacion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'carlos','jaimes','carlos18@gmail.com','Carlos.18','avenida 9 bis 16cs 62','avenida 9 bis 16cs 62','3154437882'),(2,'andrea','caidedo','andreco@gmail.com','Andreacai12','avenida 17  #13  - 62','avenida 17 bis 13  - 62','3152236778'),(3,'samir','corredor','samicorredor@gmail.com','sami.123','calle 17 bis #13  - 62','calle 17 bis 13  - 62','3176639002'),(4,'jonathan','paez','jonathan12@gmail.com','paezjon12','calle 13  #3  -42','calle 13  #3  -42','3154489095');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'greendetails'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-15 21:11:52

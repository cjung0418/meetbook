-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: i6a206.p.ssafy.io    Database: ssafy_web_db
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

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
-- Table structure for table `conference`
--

DROP TABLE IF EXISTS `conference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conference` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `call_start_time` timestamp NOT NULL,
  `call_end_time` timestamp NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `max_members` int NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CONF_USER01_idx` (`user_id`),
  KEY `FK_CONF_BOOK01_idx` (`book_id`),
  CONSTRAINT `FK_CONF_BOOK01` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `FK_CONF_USER01` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference`
--

LOCK TABLES `conference` WRITE;
/*!40000 ALTER TABLE `conference` DISABLE KEYS */;
INSERT INTO `conference` VALUES (2,4,1,'2022-02-10 15:00:00','2022-02-10 15:00:00',NULL,NULL,NULL,'title','des',5,NULL),(3,9,11,'2022-02-10 15:00:00','2022-02-10 15:00:00','','','https://image.aladin.co.kr/product/21292/13/cover/8936438034_1.jpg','테스트','테스트입니다.',5,''),(4,9,26,'2022-02-10 15:00:00','2022-02-10 15:00:00','','','http://image.aladin.co.kr/product/4086/97/cover/8936434128_2.jpg','테스트 #1','테스트입니다.',4,''),(5,8,5,'2022-02-11 15:00:00','2022-02-11 15:00:00','','','http://image.aladin.co.kr/product/15848/6/cover/k622533431_1.jpg','테스트','테스트',7,'히가시노'),(6,12,1,'2022-02-25 15:00:00','2022-02-25 15:00:00','작가의 이름은?','손원평','http://image.aladin.co.kr/product/16839/4/cover/k492534773_1.jpg','테스트회의','아몬드 소설에 대한 이야기를 나누어봐요.',4,'# 장편소설 # 문학'),(7,12,1,'2022-02-13 15:00:00','2022-02-13 15:00:00','작가','손원평','http://image.aladin.co.kr/product/16839/4/cover/k492534773_1.jpg','test2','아몬드',3,''),(8,12,4,'2022-02-16 15:00:00','2022-02-16 15:00:00','작가','이미애','https://image.aladin.co.kr/product/24512/70/cover/k392630952_1.jpg','test3','설명',5,'#태그'),(9,10,71,'2022-02-13 15:00:00','2022-02-13 15:00:00','테스트','테스트','https://image.aladin.co.kr/product/24489/98/cover/8954673104_1.jpg','test','테스트',7,'테스트'),(10,9,3,'2022-02-13 15:00:00','2022-02-13 15:00:00','\'test\'를 입력하세요.','test','https://image.aladin.co.kr/product/19359/16/cover/s972635417_1.jpg','테스트 회의 2.14 #1','테스트 회의입니다.',6,'테스트 태그'),(11,9,3,'2022-02-13 15:00:00','2022-02-14 15:00:00','test를 입력하세요.','test','https://image.aladin.co.kr/product/19359/16/cover/s972635417_1.jpg','테스트','테스트',4,''),(12,12,1,'2022-02-14 15:00:00','2022-02-14 15:00:00','작가','손원평','http://image.aladin.co.kr/product/16839/4/cover/k492534773_1.jpg','테스트회의','설명',5,'# 힐링'),(13,10,17,'2022-02-14 15:00:00','2022-02-14 15:00:00','','','https://bookthumb-phinf.pstatic.net/cover/113/062/11306271.jpg?type=m1&udate=20180117','테스트','테스트',5,'태그'),(14,10,11,'2022-02-14 15:00:00','2022-02-14 15:00:00','','','https://image.aladin.co.kr/product/21292/13/cover/8936438034_1.jpg','테스트','테스트',5,'테스트'),(15,12,32,'2022-02-14 15:00:00','2022-02-14 15:00:00','','','http://image.aladin.co.kr/product/7164/35/cover/8937473097_1.jpg','보건교사 안은영','',3,''),(16,12,55,'2022-02-14 15:00:00','2022-02-14 15:00:00','','','http://image.aladin.co.kr/product/10590/57/cover/k162530537_1.jpg','안녕','',3,''),(17,12,22,'2022-02-14 15:00:00','2022-02-14 15:00:00','','','https://image.aladin.co.kr/product/25306/49/cover/k922633306_1.jpg','생각','',3,''),(18,9,3,'2022-02-14 15:00:00','2022-02-14 15:00:00','','','https://image.aladin.co.kr/product/19359/16/cover/s972635417_1.jpg','테스트 모임 0214_20시 13분부터','테스트입니다.',5,''),(19,12,9,'2022-02-14 15:00:00','2022-02-14 15:00:00','오늘','하루도 수고했어','https://image.aladin.co.kr/product/24131/85/cover/8934992492_1.jpg','라이브!','설명',4,'태그'),(20,6,1,'2022-02-14 15:00:00','2022-02-14 15:00:00','','','http://image.aladin.co.kr/product/16839/4/cover/k492534773_1.jpg','테스트','테스트',5,'테스트'),(21,8,28,'2022-02-14 15:00:00','2022-02-14 15:00:00','','','http://image.aladin.co.kr/product/7492/9/cover/8956609950_2.jpg','테스트','시간 테스트',5,'테스트'),(24,9,1,'2022-02-14 15:00:00','2022-02-15 15:00:00','1을 입력하세요.','1','http://image.aladin.co.kr/product/16839/4/cover/k492534773_1.jpg','테스트 0215 #1','테스트입니다',6,''),(25,9,3,'2022-02-15 15:00:00','2022-02-15 15:00:00','','','https://image.aladin.co.kr/product/19359/16/cover/s972635417_1.jpg','테스트 회의 #2','',10,''),(26,8,19,'2022-02-15 15:00:00','2022-02-15 15:00:00','','','https://image.aladin.co.kr/product/22246/11/cover/k842636722_1.jpg','테스트','테스트',2,''),(28,8,25,'2022-02-15 15:00:00','2022-02-15 15:00:00','','','https://image.aladin.co.kr/product/19804/82/cover/k072635131_1.jpg','시간 test','test',2,'시간 test'),(29,8,11,'2022-02-15 15:00:00','2022-02-15 15:00:00','','','https://image.aladin.co.kr/product/21292/13/cover/8936438034_1.jpg','시간 test','test',2,'시간 test'),(30,21,2,'2022-02-16 15:00:00','2022-02-16 15:00:00','','','https://image.aladin.co.kr/product/24131/37/cover/8954672213_1.jpg','ㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹ','',4,''),(31,12,4,'2022-03-01 15:00:00','2022-03-01 15:00:00','달러구트 꿈 ','비밀번호','https://image.aladin.co.kr/product/24512/70/cover/k392630952_1.jpg','테스트 회의','달러구트 꿈 백화점 즐겁게 읽으신 분?',6,'#독서 #힐링 #소설'),(32,12,4,'2022-02-16 15:00:00','2022-02-16 15:00:00','','','https://image.aladin.co.kr/product/24512/70/cover/k392630952_1.jpg','달러구트 꿈 백화점 ','백화점',6,''),(33,12,4,'2022-02-16 15:00:00','2022-02-16 15:00:00','','','https://image.aladin.co.kr/product/24512/70/cover/k392630952_1.jpg','달러구트 이야기 나누실분','',4,''),(34,9,6,'2022-02-18 15:00:00','2022-02-18 15:00:00','\'오은영\'을 입력하세요.','오은영','https://image.aladin.co.kr/product/25313/30/cover/8934986654_1.jpg','테스트 회의 1','테스트 회의입니다.',4,''),(35,9,26,'2022-02-18 15:00:00','2022-02-19 15:00:00','\"소년이 온다\"가 다룬 도시는 어디일까요?','광주','http://image.aladin.co.kr/product/4086/97/cover/8936434128_2.jpg','한강 소설 읽기 1: 소년이 온다','\"채식주의자\"를 읽고 오시면 더욱 좋습니다.',15,'#소설 #문학 #한국현대소설'),(36,25,9,'2022-02-16 15:00:00','2022-02-16 15:00:00','','','https://image.aladin.co.kr/product/24131/85/cover/8934992492_1.jpg','이세계에선 내가 프로즌 드래곤?','',2,''),(37,8,59,'2022-02-16 15:00:00','2022-02-16 15:00:00','','','https://image.aladin.co.kr/product/24622/84/cover/8950988488_2.jpg','테스트','테스트',2,'테스트'),(38,8,88,'2022-02-16 15:00:00','2022-02-16 15:00:00','이 책의 이름은?','언스크립티드','http://image.aladin.co.kr/product/12926/54/cover/k702532384_1.jpg','언스크립티드','언스크립티드',2,'경제'),(39,8,15,'2022-02-16 15:00:00','2022-02-16 15:00:00','이 책의 이름은(띄어쓰기 포함)','방구석 미술관','https://bookthumb-phinf.pstatic.net/cover/138/339/13833956.jpg?type=m1&udate=20180803','방구석 미술관','방구석 미술관',2,'예술'),(40,10,16,'2022-02-16 15:00:00','2022-02-17 15:00:00','이 책의 이름은?(띄어쓰기 포함)','보통의 언어들','https://image.aladin.co.kr/product/24088/61/cover/k182639239_1.jpg','보통의 언어들','보통의 언어들',2,'언어'),(42,8,69,'2022-02-17 15:00:00','2022-02-17 15:00:00','이 회의의 태그는?','힐링','https://image.aladin.co.kr/product/24639/8/cover/8967358024_1.jpg','매우 예민한 사람들을 위한 책','마음 가이드북',2,'힐링'),(43,30,2,'2022-02-17 15:00:00','2022-02-17 15:00:00','책 제목','시선으로부터','https://image.aladin.co.kr/product/24131/37/cover/8954672213_1.jpg','테트스 회의','시선으로부터 벗어나기',3,'꿈'),(44,9,2,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://image.aladin.co.kr/product/24131/37/cover/8954672213_1.jpg','테스트 회의 0217','',6,''),(48,5,2,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://image.aladin.co.kr/product/24131/37/cover/8954672213_1.jpg','19시 테스트','',6,''),(50,5,5,'2022-02-17 15:00:00','2022-02-17 15:00:00','나미야 잡화점의','기적','http://image.aladin.co.kr/product/15848/6/cover/k622533431_1.jpg','10시 테스트','나미',4,''),(51,9,9,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://image.aladin.co.kr/product/24131/85/cover/8934992492_1.jpg','테스트 회의 0217 2200','진지하게 갑시다',5,'#진지 '),(52,5,7,'2022-02-17 15:00:00','2022-02-17 15:00:00','차별','차별','https://image.aladin.co.kr/product/19874/76/cover/8936477196_1.jpg','시간테스트로컬','',3,''),(53,10,54,'2022-02-17 15:00:00','2022-02-17 15:00:00','책의 제목은?(띄어쓰기 포함)','역사의 쓸모','https://image.aladin.co.kr/product/19433/93/cover/k152635416_1.jpg','역사의 쓸모','역사의 쓸모는 어디에 있을까?',2,'역사'),(54,5,10,'2022-02-17 15:00:00','2022-02-17 15:00:00','사피엔스','사피엔스','https://bookthumb-phinf.pstatic.net/cover/097/807/09780781.jpg?type=m1&udate=20180721','테스트 목적 회의 2','사피엔스',3,''),(55,5,9,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://image.aladin.co.kr/product/24131/85/cover/8934992492_1.jpg','테스트 목적3','',3,''),(56,5,5,'2022-02-16 15:00:00','2022-02-16 15:00:00','','','http://image.aladin.co.kr/product/15848/6/cover/k622533431_1.jpg','나미야 잡화점 같이 읽으실 분 모집합니다.','',3,''),(57,9,27,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://image.aladin.co.kr/product/18961/78/cover/k502635582_1.jpg','돈도로돈돈돈','주식 전에 적금부터 차근차근 합시다',6,'#금융 #경제'),(58,30,6,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://image.aladin.co.kr/product/25313/30/cover/8934986654_1.jpg','저녁 토론회','',3,''),(59,5,10,'2022-02-16 15:00:00','2022-02-16 15:00:00','','','https://bookthumb-phinf.pstatic.net/cover/097/807/09780781.jpg?type=m1&udate=20180721','10시50에 등록된 회의','',6,''),(61,5,1,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','http://image.aladin.co.kr/product/16839/4/cover/k492534773_1.jpg','8시5분','',3,''),(63,5,1,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','http://image.aladin.co.kr/product/16839/4/cover/k492534773_1.jpg','12시 회의','',2,''),(64,30,1,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','http://image.aladin.co.kr/product/16839/4/cover/k492534773_1.jpg','1시','',2,''),(65,30,2,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://image.aladin.co.kr/product/24131/37/cover/8954672213_1.jpg','1시','',2,''),(66,10,2,'2022-02-17 15:00:00','2022-02-17 15:00:00','책의 제목은?','시선으로부터','https://image.aladin.co.kr/product/24131/37/cover/8954672213_1.jpg','시선으로부터.','시선으로부터, 어떻게 벗어나는가',6,'문학'),(67,5,9,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://image.aladin.co.kr/product/24131/85/cover/8934992492_1.jpg','1시에 메일 보내주세요 abcd','',2,''),(68,10,2,'2022-02-17 15:00:00','2022-02-17 15:00:00','책의 제목은?','시선으로부터','https://image.aladin.co.kr/product/24131/37/cover/8954672213_1.jpg','시선으로부터','어떻게 벗어날 것인가',6,'문학'),(69,10,27,'2022-02-17 15:00:00','2022-02-17 15:00:00','책의 이름은?(띄어쓰기 포함)','돈의 역사','https://image.aladin.co.kr/product/18961/78/cover/k502635582_1.jpg','돈의 역사','돈은 어디에서 시작되었는가',6,'역사'),(70,9,27,'2022-02-16 15:00:00','2022-02-17 15:00:00','백원짜리 앞면은','이순신','https://image.aladin.co.kr/product/18961/78/cover/k502635582_1.jpg','우리 다시 만나요','제발~',8,'#경제'),(71,9,55,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','http://image.aladin.co.kr/product/10590/57/cover/k162530537_1.jpg','시간은 18일 00시','18일 00시에 시작하도록 프론트에서 작성했습니다.',6,''),(72,9,55,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','http://image.aladin.co.kr/product/10590/57/cover/k162530537_1.jpg','명령어 넣고 개설','18일 00시 00분',3,''),(73,5,1,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','http://image.aladin.co.kr/product/16839/4/cover/k492534773_1.jpg','abc','',2,''),(74,9,3,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://image.aladin.co.kr/product/19359/16/cover/s972635417_1.jpg','이상한 시간','1시인가요?',5,''),(75,9,1,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','http://image.aladin.co.kr/product/16839/4/cover/k492534773_1.jpg','이상한 시간','이거 1시인가요?',6,''),(76,12,95,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://bookthumb-phinf.pstatic.net/cover/083/399/08339910.jpg?type=m1&udate=20180616','미움받을 용기','미움받을 용기',4,'#인생도서'),(77,12,53,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','http://image.aladin.co.kr/product/14131/58/cover/k722532337_1.jpg','공부머리 독서법 - 자기계발 합시다','독서를 위한 독서',6,'#자기계발 #독서'),(78,12,58,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://image.aladin.co.kr/product/22271/23/cover/8932919550_1.jpg','교육과 자유','삶을 논하다',6,'#교육 #인생'),(79,12,92,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','http://image.aladin.co.kr/product/10951/42/cover/8984076260_1.jpg','부자되고 싶다!','어떻게 해야 부자가 되죠?',4,'#부자되기 #필수'),(80,12,96,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://image.aladin.co.kr/product/25162/16/cover/k432633578_1.jpg','공간 전문가의 신박한 정리','정리의 미학..',8,'#공간정리'),(81,12,12,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','http://image.aladin.co.kr/product/16938/73/cover/8965746663_1.jpg','당신이 옳다!!','',12,'#심리'),(82,12,20,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://image.aladin.co.kr/product/24839/85/cover/8901244608_1.jpg','살고 싶다는 농담','',12,''),(83,5,10,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://bookthumb-phinf.pstatic.net/cover/097/807/09780781.jpg?type=m1&udate=20180721','1시','',2,''),(84,30,9,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://image.aladin.co.kr/product/24131/85/cover/8934992492_1.jpg','3시','',2,''),(85,12,21,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://image.aladin.co.kr/product/18456/45/cover/8934985062_1.jpg','팩트풀니스','',4,''),(87,12,3,'2022-02-17 15:00:00','2022-02-17 15:00:00','챕터 \'빛의 속도로 갈 수 없다면\'에서 안나는 어떤 행성으로 가는 우주선을 기다리고 있나요?','슬렌포니아','https://image.aladin.co.kr/product/19359/16/cover/s972635417_1.jpg','우리가 빛의 속도로 갈 수 없다면','우리가 빛의 속도로 갈 수 없다면',6,'#SF #젊은작가'),(88,5,6,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','https://image.aladin.co.kr/product/25313/30/cover/8934986654_1.jpg','4시','',2,''),(89,21,55,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','http://image.aladin.co.kr/product/10590/57/cover/k162530537_1.jpg','ㄹㄴㅇㄹㅁㄴㅇㄹㅁ','안녕하세요',5,'#'),(90,21,55,'2022-02-18 15:00:00','2022-02-18 15:00:00','','','http://image.aladin.co.kr/product/10590/57/cover/k162530537_1.jpg','타이탄의 도구','ㅇㅇㅇ',4,''),(91,21,69,'2022-02-18 15:00:00','2022-02-18 15:00:00','','','https://image.aladin.co.kr/product/24639/8/cover/8967358024_1.jpg','예민한 스터디','안녕하세요',4,''),(92,21,53,'2022-02-17 15:00:00','2022-02-18 15:00:00','','','http://image.aladin.co.kr/product/14131/58/cover/k722532337_1.jpg','우리 아이 명문대 보내기','우리 아이 명문대 보내기 스터디입니다',7,''),(93,12,63,'2022-02-17 15:00:00','2022-02-17 15:00:00','','','http://image.aladin.co.kr/product/15533/81/cover/k852533629_1.jpg','바깥은 여름','',5,''),(95,21,69,'2022-02-18 15:00:00','2022-02-18 16:00:00','','','https://image.aladin.co.kr/product/24639/8/cover/8967358024_1.jpg','예민하지만, 괜찮아','예민하지만 차분해지는 법을 배워요',3,''),(96,9,3,'2022-02-19 13:00:00','2022-02-19 14:00:00','','','https://image.aladin.co.kr/product/19359/16/cover/s972635417_1.jpg','SF를 읽는 시간','심야 SF 여행',8,'#심야 #과학 #소설 '),(97,6,1,'2022-02-17 16:58:35','2022-02-17 16:58:35','','','string','string','Test',6,'string'),(98,30,1,'2022-02-17 18:00:00','2022-02-17 19:00:00','','','http://image.aladin.co.kr/product/16839/4/cover/k492534773_1.jpg','3시회의 21분 알람','',2,''),(99,30,7,'2022-02-17 18:00:00','2022-02-17 19:00:00','','','https://image.aladin.co.kr/product/19874/76/cover/8936477196_1.jpg','3시10분 회의 21분 알람','',2,''),(100,9,8,'2022-02-18 09:00:00','2022-02-18 10:00:00','','','https://image.aladin.co.kr/product/22631/95/cover/k772636937_1.jpg','이 회의는 18일 18시에 끝납니다. ','만세!',7,''),(102,33,5,'2022-02-19 05:00:00','2022-02-19 06:00:00','이 책의 제목은?(띄어쓰기 포함)','나미야 잡화점의 기적','http://image.aladin.co.kr/product/15848/6/cover/k622533431_1.jpg','나미야 잡화점의 기적을 읽고나서...','히가시노 게이고의 가장 특별한 대표작을 만나다',6,'감동적인'),(103,5,5,'2022-02-17 19:00:00','2022-02-17 20:00:00','','','http://image.aladin.co.kr/product/15848/6/cover/k622533431_1.jpg','시작','',2,''),(104,6,9,'2022-02-17 18:03:00','2022-02-17 19:03:00','','','https://image.aladin.co.kr/product/24131/85/cover/8934992492_1.jpg','adfadf','dfdf',5,'dfdf'),(107,9,69,'2022-02-18 02:00:00','2022-02-18 03:00:00','','','https://image.aladin.co.kr/product/24639/8/cover/8967358024_1.jpg','오전 11시 북마크 테스트','북마크 시연을 위한 회의입니다.',8,''),(108,9,69,'2022-02-18 06:00:00','2022-02-18 07:00:00','','','https://image.aladin.co.kr/product/24639/8/cover/8967358024_1.jpg','오후 3시 북마크 시연','북마크 시연을 위한 회의입니다.',8,''),(109,9,7,'2022-02-18 00:45:00','2022-02-18 01:45:00','','','https://image.aladin.co.kr/product/19874/76/cover/8936477196_1.jpg','시간 확인','',5,''),(110,5,8,'2022-02-17 15:00:00','2022-02-17 16:00:00','','','https://image.aladin.co.kr/product/22631/95/cover/k772636937_1.jpg','12시','',2,''),(111,5,2,'2022-02-18 02:16:00','2022-02-18 03:16:00','','','https://image.aladin.co.kr/product/24131/37/cover/8954672213_1.jpg','12시10분','',2,''),(112,5,34,'2022-02-17 15:23:00','2022-02-17 16:23:00','','','https://image.aladin.co.kr/product/18228/51/cover/k832534441_1.jpg','12ㅅ ㅣ23분 모임','',3,''),(113,5,16,'2022-02-18 02:00:00','2022-02-18 03:00:00','','','https://image.aladin.co.kr/product/24088/61/cover/k182639239_1.jpg','12시 45분','',3,''),(114,5,82,'2022-02-18 02:00:00','2022-02-18 03:00:00','','','https://image.aladin.co.kr/product/15136/29/cover/k962533360_1.jpg','12시 15분 모임입니다.','',7,''),(115,6,95,'2022-02-18 02:00:00','2022-02-18 03:00:00','','','https://bookthumb-phinf.pstatic.net/cover/083/399/08339910.jpg?type=m1&udate=20180616','함께해요, 미움 받을 용기','미움 받을 용기에 대해서 알아봅시다.',6,''),(116,5,42,'2022-02-18 04:04:00','2022-02-18 05:04:00','','','http://image.aladin.co.kr/product/7747/73/cover/s552532081_1.jpg','미라클 모닝 독서모임','',3,''),(117,5,12,'2022-02-18 06:00:00','2022-02-18 07:00:00','','','http://image.aladin.co.kr/product/16938/73/cover/8965746663_1.jpg','당신이 옳다 독서모임 6시반','',2,''),(118,5,15,'2022-02-18 03:00:00','2022-02-18 04:00:00','','','https://bookthumb-phinf.pstatic.net/cover/138/339/13833956.jpg?type=m1&udate=20180803','3시 회의 개최예정','',3,''),(119,5,58,'2022-02-18 03:00:00','2022-02-18 04:00:00','','','https://image.aladin.co.kr/product/22271/23/cover/8932919550_1.jpg','6시 저녁 모임','',2,''),(120,5,58,'2022-02-18 03:00:00','2022-02-18 04:00:00','','','https://image.aladin.co.kr/product/22271/23/cover/8932919550_1.jpg','배움의 발견 공부하실분','',5,''),(121,6,27,'2022-02-18 03:00:00','2022-02-18 04:00:00','','','https://image.aladin.co.kr/product/18961/78/cover/k502635582_1.jpg','돈의 역사를 같이 읽어요','돈의 역사에 대해서 알아봅시다.',6,''),(122,6,6,'2022-02-18 03:00:00','2022-02-18 04:00:00','','','https://image.aladin.co.kr/product/25313/30/cover/8934986654_1.jpg','육아에 대해서 같이 이야기해요','육아회화',13,''),(124,6,5,'2022-02-18 03:00:00','2022-02-18 04:00:00','','','http://image.aladin.co.kr/product/15848/6/cover/k622533431_1.jpg','테스트','나미야 잡화점의 기적에 대해서 같이 이야기해요',6,''),(125,23,10,'2022-02-18 03:00:00','2022-02-18 04:00:00','','','https://bookthumb-phinf.pstatic.net/cover/097/807/09780781.jpg?type=m1&udate=20180721','테스트','테',30,'테스트,테스트2');
/*!40000 ALTER TABLE `conference` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-18 11:55:35

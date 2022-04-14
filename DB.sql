-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.5.3-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bd_universidad
CREATE DATABASE IF NOT EXISTS `bd_universidad` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bd_universidad`;

-- Volcando estructura para función bd_universidad.ASINATURAS_DE_PROFESOR
DELIMITER //
CREATE FUNCTION `ASINATURAS_DE_PROFESOR`(x_PROFESOR_CODIGO varchar(10)) RETURNS varchar(100) CHARSET latin1
begin
declare RETORNO varchar(100);
declare NUM_MATERIAS int(3);

set NUM_MATERIAS =
(select count(distinct m.descripcionMateria) from materias m join grupos_por_materia gpm
where gpm.codigoProfesor = x_PROFESOR_CODIGO and gpm.codigoMateria = m.codigoMateria);

if NUM_MATERIAS = 1 then
set RETORNO = (select concat(p.nombresProfesor,' ',p.apellidosProfesor,': ',
group_concat(distinct m.descripcionMateria separator ', ' ))
	from  materias m join profesores p , grupos_por_materia gpm
	where gpm.codigoProfesor = x_PROFESOR_CODIGO and gpm.codigoMateria = m.codigoMateria);
else
if NUM_MATERIAS > 1 then
	set RETORNO = (select concat(p.nombresProfesor,' ',p.apellidosProfesor,': ','TIENE ',
	count(distinct m.descripcionMateria),' MATERIAS')
	from  materias m join profesores p , grupos_por_materia gpm
	where gpm.codigoProfesor = x_PROFESOR_CODIGO and gpm.codigoMateria = m.codigoMateria);
else
	set RETORNO = (select concat(nombresProfesor,' ',apellidosProfesor,
	': NO TIENE MATERIAS ASIGNADAS')
	from  profesores where codigoProfesor = x_PROFESOR_CODIGO );
end if ;

end if ;
return (RETORNO);
end//
DELIMITER ;

-- Volcando estructura para tabla bd_universidad.estudiantes
CREATE TABLE IF NOT EXISTS `estudiantes` (
  `codigoEstudiante` varchar(15) NOT NULL,
  `apellidosEstudiante` varchar(20) NOT NULL,
  `nombresEstudiante` varchar(20) NOT NULL,
  `estado` varchar(20) DEFAULT 'Inactivo',
  PRIMARY KEY (`codigoEstudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_universidad.estudiantes: ~100 rows (aproximadamente)
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` (`codigoEstudiante`, `apellidosEstudiante`, `nombresEstudiante`, `estado`) VALUES
	('70432657', 'TAMAYO LLANOS', 'HAROLD ELIECER', 'Inactivo'),
	('70435949', 'DAVILA HIDALGO', 'JAVIER IGNACIO', 'Inactivo'),
	('70499990', 'ORTIZ ORTIZ', 'AIDA RITA', 'Inactivo'),
	('70504359', 'ENRIQUEZ DELGADO', 'GILMAR ALBERTO', 'Inactivo'),
	('70529298', 'CHAMORRO TONGUINO', 'JHON VICTOR', 'Inactivo'),
	('70550716', 'ERASO BARCO', 'JUAN CARLOS', 'Inactivo'),
	('70852509', 'MIRANDA LUNA', 'ARTURO IVAN', 'Inactivo'),
	('70873920', 'INSUASTY ZAMBRANO', 'MARIA DEL CARMEN', 'Inactivo'),
	('70976047', 'FEUILLET SAÑUDO', 'LUIS FERNANDO', 'Inactivo'),
	('71108664', 'VELASQUEZ ARCINIEGAS', 'JESUS EDUARDO', 'Inactivo'),
	('71154140', 'SOLARTE SOLARTE', 'HENRY ALFONSO', 'Inactivo'),
	('71241236', 'SALAS ARCOS', 'FANNY DEL ROSARIO', 'Inactivo'),
	('71259700', 'LOPEZ CASTRO', 'JORGE ENRIQUE', 'Inactivo'),
	('71262023', 'ROSERO MATERON', 'ROBERT', 'Inactivo'),
	('71281964', 'VELASQUEZ FIGUEROA', 'OLIVARDO ANTONIO', 'Inactivo'),
	('71688642', 'ARAUJO ORTEGA', 'DORA BERNARDA', 'Inactivo'),
	('71838045', 'NARVAEZ BENITEZ', 'ELSA VICTORIA', 'Inactivo'),
	('71859116', 'CADENA CHARFUELAN', 'OSMAR BENJAMIN', 'Inactivo'),
	('71905588', 'PABON ESTUPIÑAN', 'ROSAURA', 'Inactivo'),
	('72107642', 'ACHICANOY ACHICANOY', 'JUAN', 'Inactivo'),
	('72165818', 'BETANCOURTH REALPE', 'MARIO GERMAN', 'Inactivo'),
	('72323450', 'BENAVIDES GONZALEZ', 'EDWIN ALFONSO', 'Inactivo'),
	('72458142', 'ESCOBAR PEREZ', 'NUBIA DEL CARMEN', 'Inactivo'),
	('72627043', 'FIERRO VELASQUEZ', 'GERMAN HUGO', 'Inactivo'),
	('72635804', 'ARTEAGA RAMIREZ', 'JAVIER', 'Inactivo'),
	('72692614', 'ROSERO HERRERA', 'EYMA OLIVA', 'Inactivo'),
	('72693031', 'VALLEJO VILLOTA', 'PEPE ALBERTO', 'Inactivo'),
	('72772463', 'MESIAS CADAVID', 'HENRY EDGARDO', 'Inactivo'),
	('72793429', 'ESPINOSA VILLAREAL', 'LUIS ALBERTO', 'Inactivo'),
	('72794639', 'JOJOA INSUASTY', 'GLADIS LILIANA', 'Inactivo'),
	('72833447', 'ORTIZ CALVACHE', 'BERNARDO GERMAN', 'Inactivo'),
	('72926371', 'FIGUEROA GOMEZ', 'TEOFILO FRANCISCO', 'Inactivo'),
	('72955332', 'NARVAEZ VASQUEZ', 'HECTOR HERNANDO', 'Inactivo'),
	('73097397', 'GUERRERO ORTIZ', 'MARIA DE LOURDES', 'Inactivo'),
	('73136498', 'HERNANDEZ CAICEDO', 'HERMEL ALBERTO', 'Inactivo'),
	('73194159', 'CALVACHI SANCHEZ', 'MAURICIO', 'Inactivo'),
	('73227696', 'RODRIGUEZ VALENZUELA', 'ANA LUCIA', 'Inactivo'),
	('73343663', 'LAGOS CAMPOS', 'LUIS IGNACIO', 'Inactivo'),
	('73557098', 'VELASQUEZ ARCINIEGAS', 'ANA LILIANA', 'Inactivo'),
	('73721662', 'CONTRERAS BAEZ', 'CARLOS ALBERTO', 'Inactivo'),
	('73727265', 'DELGADO PAZ', 'MONICA ISABEL', 'Inactivo'),
	('73999732', 'ZAMBRANO MARIN', 'JAVIER ANTONIO', 'Inactivo'),
	('74075392', 'GUERRERO FARINANGO', 'LUIS EDUARDO', 'Inactivo'),
	('74279075', 'PANTOJA PAREDES', 'ALVARO EFRAIN', 'Inactivo'),
	('74301412', 'CORDOVA ARIAS', 'RUPERTO MARDONIO', 'Inactivo'),
	('74599113', 'DELGADO RECALDE', 'LUIS EDUARDO', 'Inactivo'),
	('74648492', 'ORTEGA APRAEZ', 'ROMULO OLIVERIO', 'Inactivo'),
	('74655295', 'ALMARIO MEZA', 'RUTH DEL CARMEN', 'Inactivo'),
	('74917398', 'MORA MUÑOZ', 'LUCY DEL SOCORRO', 'Inactivo'),
	('75013975', 'CERON SALAS', 'MARIO FERNANDO', 'Inactivo'),
	('75041782', 'MIRANDA VILLOTA', 'GEOVANNA DEL CARMEN', 'Inactivo'),
	('75043804', 'THOME PONCE', 'MARIA EUGENIA', 'Inactivo'),
	('75058438', 'FUERTES FUERTES', 'ALVARO EDUARDO', 'Inactivo'),
	('75092627', 'DAZA GUEVARA', 'SANDRA CECILIA', 'Inactivo'),
	('75570582', 'ERAZO INSUASTY', 'PATRICIA MARIA ISABE', 'Inactivo'),
	('75721248', 'CABRERA QUENGUAN', 'ALVARO ENRIQUE', 'Inactivo'),
	('75883851', 'MUÑOZ BURBANO', 'SONIA JANETT', 'Inactivo'),
	('75899648', 'WHITE PATIÑO', 'JAIRO ADALBERTO', 'Inactivo'),
	('75964117', 'DELGADO ALVAREZ', 'MONICA DE LOS ANGELE', 'Inactivo'),
	('76012804', 'ROSERO FAINI', 'YOLANDA CRISTINA', 'Inactivo'),
	('76040653', 'ROSERO REVELO', 'JAIME ERNESTO', 'Inactivo'),
	('76054464', 'GUDIÑO DAVILA', 'GLADIS LILIANA', 'Inactivo'),
	('76169237', 'DAZA VALLEJO', 'RICARDO ARTURO', 'Inactivo'),
	('76386967', 'ZAMUDIO ORDOÑEZ', 'GUILLERMO FERNANDO', 'Inactivo'),
	('76585610', 'VELA SANTACRUZ', 'ALVARO ENRIQUE', 'Inactivo'),
	('76590830', 'ERASO DIAZ DEL CASTI', 'RAMIRO', 'Inactivo'),
	('77073674', 'ERASO SALAZAR', 'ALVARO ANTONIO', 'Inactivo'),
	('77098681', 'MORALES GARCIA', 'OLGA SUSANA', 'Inactivo'),
	('77168721', 'BOTINA JOJOA', 'LOURDES ROCIO', 'Inactivo'),
	('77197018', 'NARVAEZ ESTRADA', 'CARLOS RAMIRO', 'Inactivo'),
	('77297698', 'PALACIOS CAICEDO', 'NESTOR GABRIEL', 'Inactivo'),
	('77320653', 'BASTIDAS MORENO', 'LUIS GERMAN', 'Inactivo'),
	('77458312', 'MUYUY CHASOY', 'EDGAR GERARDO', 'Inactivo'),
	('77591222', 'CEBALLOS', 'ALFREDO MAURICIO', 'Inactivo'),
	('77754815', 'ESPARZA MOSQUERA', 'LUIS ALBERTO', 'Inactivo'),
	('77828334', 'RIASCOS PEPINOSA', 'LUIS EDISON', 'Inactivo'),
	('77838520', 'SANCHEZ CERON', 'JESUS JAVIER', 'Inactivo'),
	('77968196', 'DELGADO MURIEL', 'CAMPO ELIAS', 'Inactivo'),
	('78216927', 'LOPEZ FUENMAYOR', 'JOSE IGNACIO', 'Inactivo'),
	('78229674', 'WHITE PATIÑO', 'MARIANA ELENA', 'Inactivo'),
	('78368901', 'MONCAYO MAFLA', 'HECTOR FERNANDO', 'Inactivo'),
	('78397604', 'BENAVIDES FUERTES', 'JORGE ALBERTO', 'Inactivo'),
	('78512434', 'MELODELGADO PABON', 'FRANCISCO TAYLOR', 'Inactivo'),
	('78757862', 'BENAVIDES SALAZAR', 'ELISABETH REYNA', 'Inactivo'),
	('78811661', 'MORILLO ESTRADA', 'LUIS CARLOS', 'Inactivo'),
	('78837293', 'ALPALA REINA', 'FABIAN', 'Activo'),
	('78958185', 'PASTAS ESTRADA', 'NORBERTO YESID', 'Inactivo'),
	('79125351', 'VITERY BENAVIDES', 'MAGDA LEONOR', 'Inactivo'),
	('79149790', 'BENAVIDES BARAHONA', 'ALVARO MARINO', 'Inactivo'),
	('79163909', 'MONTENEGRO CORAL', 'OSCAR ARTURO', 'Inactivo'),
	('79253290', 'ERASO RODRIGUEZ', 'ARTURO DANIEL', 'Inactivo'),
	('79295902', 'VALENCIA RAMIREZ', 'YOLANDA PATRICIA', 'Inactivo'),
	('79335044', 'REVELO CALVACHE', 'EDWAR JIMY', 'Inactivo'),
	('79382936', 'RIASCOS APRAEZ', 'OSCAR ORLANDO', 'Inactivo'),
	('79548645', 'ARTURO', 'ELIZABETH DEL CARMEN', 'Inactivo'),
	('79613036', 'ROMERO MEDINA', 'SONIA LEONOR', 'Inactivo'),
	('79713784', 'MEZA', 'ANA DORIS', 'Inactivo'),
	('79825264', 'RUANO VILLOTA', 'SAUL DANILO', 'Inactivo'),
	('79839122', 'ESCANDON PORTILLA', 'OSCAR ALIRIO', 'Inactivo'),
	('79842062', 'ROMO LUCERO', 'MARTA LUCIA', 'Inactivo');
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;

-- Volcando estructura para función bd_universidad.F_Asignatura
DELIMITER //
CREATE FUNCTION `F_Asignatura`(x_Codigo varchar(15)) RETURNS varchar(100) CHARSET latin1
begin
    declare v_Cantidad int ;
    declare asignaturas varchar(80);
    
    set v_Cantidad = (select count(distinct descripcionMateria) 
    from materias as m 
    cross join grupos_por_materia as g
    on m.codigoMateria = g.codigoMateria
    cross join profesores as p 
    on g.codigoProfesor = p.codigoProfesor
    where p.codigoProfesor = x_Codigo);
    
    if v_cantidad = 1 then 
    set asignaturas = CONCAT('Profesor posee solo una asignatura', 
    (select distinct descripcionMateria 
    from materias as m 
    cross join grupos_por_materia as g
    on m.codigoMateria = g.codigoMateria
    cross join profesores as p 
    on g.codigoProfesor = p.codigoProfesor
    where p.codigoProfesor = x_Codigo));
    
    else
    set asignaturas = (select group_concat(distinct descripcionMateria separator ', ' ) 
    from materias as m 
    cross join grupos_por_materia as g
    on m.codigoMateria = g.codigoMateria
    cross join profesores as p 
    on g.codigoProfesor = p.codigoProfesor
    where p.codigoProfesor = x_Codigo);
    
    end if ;
    return (asignaturas) ;
    
end//
DELIMITER ;

-- Volcando estructura para tabla bd_universidad.grupos_por_materia
CREATE TABLE IF NOT EXISTS `grupos_por_materia` (
  `codigoGrupoPorMateria` varchar(5) NOT NULL,
  `numeroGrupo` varchar(3) NOT NULL,
  `codigoMateria` varchar(5) NOT NULL,
  `codigoEstudiante` varchar(15) NOT NULL,
  `codigoProfesor` varchar(15) NOT NULL,
  `codigoPeriodo` varchar(6) NOT NULL,
  PRIMARY KEY (`codigoGrupoPorMateria`),
  KEY `FK_Estudiantes` (`codigoEstudiante`),
  KEY `FK_Profesores` (`codigoProfesor`),
  KEY `FK_Materias` (`codigoMateria`),
  KEY `FK_Periodos_idx` (`codigoPeriodo`),
  CONSTRAINT `FK_Estudiantes` FOREIGN KEY (`codigoEstudiante`) REFERENCES `estudiantes` (`codigoEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Materias` FOREIGN KEY (`codigoMateria`) REFERENCES `materias` (`codigoMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Periodos` FOREIGN KEY (`codigoPeriodo`) REFERENCES `periodos` (`codigoPeriodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Profesores` FOREIGN KEY (`codigoProfesor`) REFERENCES `profesores` (`codigoProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_universidad.grupos_por_materia: ~80 rows (aproximadamente)
/*!40000 ALTER TABLE `grupos_por_materia` DISABLE KEYS */;
INSERT INTO `grupos_por_materia` (`codigoGrupoPorMateria`, `numeroGrupo`, `codigoMateria`, `codigoEstudiante`, `codigoProfesor`, `codigoPeriodo`) VALUES
	('1', '156', '10023', '78837293', '12312312', '2020-3'),
	('10', '156', '10023', '73727265', '12312312', '2020-1'),
	('11', '156', '10023', '79825264', '12312312', '2020-1'),
	('12', '156', '10023', '70504359', '12312312', '2020-1'),
	('13', '156', '10023', '72772463', '12312312', '2020-1'),
	('14', '156', '10023', '71859116', '12312312', '2020-1'),
	('15', '156', '10023', '79839122', '12312312', '2020-1'),
	('16', '156', '10023', '73999732', '12312312', '2020-1'),
	('17', '156', '10023', '73136498', '12312312', '2020-1'),
	('18', '156', '10023', '78229674', '12312312', '2020-1'),
	('19', '156', '10023', '74599113', '12312312', '2020-1'),
	('2', '156', '10023', '72833447', '12312312', '2020-1'),
	('20', '156', '10023', '79382936', '12312312', '2020-1'),
	('200', '999', '10055', '70432657', '12312312', '2020-4'),
	('21', '156', '10023', '75721248', '12312312', '2020-1'),
	('22', '156', '10023', '73721662', '12312312', '2020-1'),
	('23', '156', '10023', '78368901', '12312312', '2020-1'),
	('24', '156', '10023', '71259700', '12312312', '2020-1'),
	('25', '156', '10023', '78216927', '12312312', '2020-1'),
	('26', '156', '10023', '77968196', '12312312', '2020-1'),
	('27', '156', '10023', '75883851', '12312312', '2020-1'),
	('28', '156', '10023', '70852509', '12312312', '2020-1'),
	('29', '156', '10023', '72323450', '12312312', '2020-1'),
	('3', '156', '10023', '75043804', '12312312', '2020-1'),
	('31', '198', '10054', '78837293', '32132132', '2020-3'),
	('32', '198', '10054', '72833447', '32132132', '2020-1'),
	('33', '198', '10054', '75043804', '32132132', '2020-1'),
	('34', '198', '10054', '77168721', '32132132', '2020-1'),
	('35', '198', '10054', '77838520', '32132132', '2020-1'),
	('36', '198', '10054', '74655295', '32132132', '2020-1'),
	('37', '198', '10054', '72107642', '32132132', '2020-1'),
	('38', '198', '10054', '73097397', '32132132', '2020-1'),
	('39', '198', '10054', '77073674', '32132132', '2020-1'),
	('4', '156', '10023', '77168721', '12312312', '2020-1'),
	('40', '198', '10054', '73727265', '32132132', '2020-1'),
	('41', '198', '10054', '79825264', '32132132', '2020-1'),
	('42', '198', '10054', '70504359', '32132132', '2020-1'),
	('43', '198', '10054', '72772463', '32132132', '2020-1'),
	('44', '198', '10054', '71859116', '32132132', '2020-1'),
	('45', '198', '10054', '79839122', '32132132', '2020-1'),
	('46', '198', '10054', '73999732', '32132132', '2020-1'),
	('47', '198', '10054', '73136498', '32132132', '2020-1'),
	('48', '198', '10054', '78229674', '32132132', '2020-1'),
	('49', '198', '10054', '74599113', '32132132', '2020-1'),
	('5', '156', '10023', '77838520', '12312312', '2020-1'),
	('50', '198', '10054', '79382936', '32132132', '2020-1'),
	('51', '198', '10054', '75721248', '32132132', '2020-1'),
	('52', '198', '10054', '73721662', '32132132', '2020-1'),
	('53', '198', '10054', '78368901', '32132132', '2020-1'),
	('55', '199', '10055', '76585610', '12312312', '2020-1'),
	('56', '199', '10055', '73557098', '12312312', '2020-1'),
	('57', '199', '10055', '72955332', '12312312', '2020-1'),
	('58', '199', '10055', '72693031', '12312312', '2020-1'),
	('59', '199', '10055', '77197018', '12312312', '2020-1'),
	('6', '156', '10023', '74655295', '12312312', '2020-1'),
	('60', '199', '10055', '75058438', '12312312', '2020-1'),
	('61', '199', '10055', '77458312', '12312312', '2020-1'),
	('62', '199', '10055', '70976047', '12312312', '2020-1'),
	('63', '199', '10055', '71688642', '12312312', '2020-1'),
	('64', '199', '10055', '75013975', '12312312', '2020-1'),
	('65', '199', '10055', '70873920', '12312312', '2020-1'),
	('66', '199', '10055', '74648492', '12312312', '2020-1'),
	('67', '199', '10055', '72458142', '12312312', '2020-1'),
	('68', '199', '10055', '76169237', '12312312', '2020-1'),
	('69', '199', '10055', '71281964', '12312312', '2020-1'),
	('7', '156', '10023', '72107642', '12312312', '2020-1'),
	('70', '199', '10055', '79125351', '12312312', '2020-1'),
	('71', '199', '10055', '70432657', '12312312', '2020-1'),
	('72', '199', '10055', '71108664', '12312312', '2020-1'),
	('73', '199', '10055', '78397604', '12312312', '2020-1'),
	('74', '199', '10055', '78757862', '12312312', '2020-1'),
	('75', '199', '10055', '75092627', '12312312', '2020-1'),
	('76', '199', '10055', '73227696', '12312312', '2020-1'),
	('77', '199', '10055', '71262023', '12312312', '2020-1'),
	('78', '199', '10055', '76040653', '12312312', '2020-1'),
	('79', '199', '10055', '73194159', '12312312', '2020-1'),
	('8', '156', '10023', '73097397', '12312312', '2020-1'),
	('80', '199', '10055', '76590830', '12312312', '2020-1'),
	('81', '199', '10055', '79713784', '12312312', '2020-1'),
	('9', '156', '10023', '77073674', '12312312', '2020-1');
/*!40000 ALTER TABLE `grupos_por_materia` ENABLE KEYS */;

-- Volcando estructura para tabla bd_universidad.materias
CREATE TABLE IF NOT EXISTS `materias` (
  `codigoMateria` varchar(5) NOT NULL,
  `descripcionMateria` varchar(30) NOT NULL,
  PRIMARY KEY (`codigoMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_universidad.materias: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` (`codigoMateria`, `descripcionMateria`) VALUES
	('10004', 'Sistemas Operativos'),
	('10022', 'Programación Orientada a Objet'),
	('10023', 'Estructuras de Datos'),
	('10054', 'Bases de Datos 1'),
	('10055', 'Bases de Datos 2'),
	('10151', 'Minería de Datos'),
	('15004', 'Cálculo Diferencial');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;

-- Volcando estructura para función bd_universidad.materias_dictadas_por_docente
DELIMITER //
CREATE FUNCTION `materias_dictadas_por_docente`(x_codigo_docente varchar(20)) RETURNS varchar(1000) CHARSET latin1
begin
declare var_numero_materias int;

set var_numero_materias =
(select count(distinct m.descripcionMateria) from materias m join grupos_por_materia gpm
where gpm.codigoProfesor = x_codigo_docente and gpm.codigoMateria = m.codigoMateria);

if var_numero_materias = 1 then
	return (select concat(p.nombresProfesor,' ',p.apellidosProfesor,': ',
	group_concat(distinct m.descripcionMateria separator ', ' ))
		from  materias m join profesores p , grupos_por_materia gpm
		where gpm.codigoProfesor = x_codigo_docente and gpm.codigoMateria = m.codigoMateria);
else
	if var_numero_materias > 1 then
		return (select concat(p.nombresProfesor,' ',p.apellidosProfesor,': ','tiene ',
		count(distinct m.descripcionMateria),' asignaturas')
		from  materias m join profesores p , grupos_por_materia gpm
		where gpm.codigoProfesor = x_codigo_docente and gpm.codigoMateria = m.codigoMateria);
	else
		return (select concat(nombresProfesor,' ',apellidosProfesor,
        ': no tiene asignaturas asignadas')
		from  profesores where codigoProfesor = x_codigo_docente );
    end if ;
end if ;
end//
DELIMITER ;

-- Volcando estructura para procedimiento bd_universidad.nombre_notas
DELIMITER //
CREATE PROCEDURE `nombre_notas`()
begin

select descripcionNota as "Nombre de nota", m.descripcionMateria from notas n join materias m
where n.codigoMateria = m.codigoMateria group by m.codigoMateria;

end//
DELIMITER ;

-- Volcando estructura para procedimiento bd_universidad.NOMBRE_NOTA_POR_MATERIA
DELIMITER //
CREATE PROCEDURE `NOMBRE_NOTA_POR_MATERIA`()
BEGIN
SELECT DESCRIPCIONNOTA "NOTA" FROM NOTAS JOIN MATERIAS
WHERE MATERIAS.CODIGOMATERIA = NOTAS.CODIGOMATERIA GROUP BY MATERIAS.CODIGOMATERIA;
END//
DELIMITER ;

-- Volcando estructura para tabla bd_universidad.notas
CREATE TABLE IF NOT EXISTS `notas` (
  `codigoNota` varchar(20) NOT NULL,
  `valorNota` float NOT NULL,
  `desempenio` varchar(20) DEFAULT NULL,
  `descripcionNota` varchar(255) NOT NULL,
  `codigoEstudiante` varchar(15) NOT NULL,
  `codigoMateria` varchar(5) NOT NULL,
  `codigoTipoNota` varchar(2) NOT NULL,
  `codigoPeriodo` varchar(6) NOT NULL,
  PRIMARY KEY (`codigoNota`),
  KEY `FK_EstudiantesNotas` (`codigoEstudiante`),
  KEY `FK_MateriasNotas` (`codigoMateria`),
  KEY `FK_TiposNotas_idx` (`codigoTipoNota`),
  KEY `FK_PeriodosNotas_idx` (`codigoPeriodo`),
  CONSTRAINT `FK_EstudiantesNotas` FOREIGN KEY (`codigoEstudiante`) REFERENCES `estudiantes` (`codigoEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MateriasNotas` FOREIGN KEY (`codigoMateria`) REFERENCES `materias` (`codigoMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PeriodosNotas` FOREIGN KEY (`codigoPeriodo`) REFERENCES `periodos` (`codigoPeriodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TiposNotas` FOREIGN KEY (`codigoTipoNota`) REFERENCES `tipos_de_nota` (`codigoTipoNota`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_universidad.notas: ~164 rows (aproximadamente)
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` (`codigoNota`, `valorNota`, `desempenio`, `descripcionNota`, `codigoEstudiante`, `codigoMateria`, `codigoTipoNota`, `codigoPeriodo`) VALUES
	('1', 0.2, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '78837293', '10023', '6', '2020-1'),
	('10', 1.2, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '73727265', '10023', '6', '2020-1'),
	('100', 1, 'Bajo', 'Valoración de conceptos previos', '72772463', '10054', '1', '2020-1'),
	('1000', 4, 'Alto', 'Valoracin de conceptos previos', '70432657', '10055', '1', '2020-1'),
	('101', 1.5, 'Bajo', 'Valoración de conceptos previos', '71859116', '10054', '1', '2020-1'),
	('102', 1.2, 'Bajo', 'Valoración de conceptos previos', '79839122', '10054', '1', '2020-1'),
	('103', 4.4, 'Alto', 'Valoración de conceptos previos', '73999732', '10054', '1', '2020-1'),
	('104', 4.8, 'Superior', 'Valoración de conceptos previos', '73136498', '10054', '1', '2020-1'),
	('105', 1.6, 'Bajo', 'Valoración de conceptos previos', '78229674', '10054', '1', '2020-1'),
	('106', 1.8, 'Bajo', 'Valoración de conceptos previos', '74599113', '10054', '1', '2020-1'),
	('107', 4.5, 'Superior', 'Valoración de conceptos previos', '79382936', '10054', '1', '2020-1'),
	('108', 3.5, 'Básico', 'Valoración de conceptos previos', '75721248', '10054', '1', '2020-1'),
	('109', 4.5, 'Superior', 'Valoración de conceptos previos', '73721662', '10054', '1', '2020-1'),
	('11', 4.4, 'Alto', 'Valoración de conceptos iniciales, pilas, colas', '79825264', '10023', '6', '2020-1'),
	('110', 4.2, 'Alto', 'Valoración de conceptos previos', '78368901', '10054', '1', '2020-1'),
	('111', 3.7, 'Básico', 'Temas para proyectos propuestos por los estudiantes por grupos', '76585610', '10055', '5', '2020-1'),
	('112', 1.7, 'Bajo', 'Temas para proyectos propuestos por los estudiantes por grupos', '73557098', '10055', '5', '2020-1'),
	('113', 1.5, 'Bajo', 'Temas para proyectos propuestos por los estudiantes por grupos', '72955332', '10055', '5', '2020-1'),
	('114', 3.3, 'Básico', 'Temas para proyectos propuestos por los estudiantes por grupos', '72693031', '10055', '5', '2020-1'),
	('115', 4.1, 'Alto', 'Temas para proyectos propuestos por los estudiantes por grupos', '77197018', '10055', '5', '2020-1'),
	('116', 1.9, 'Bajo', 'Temas para proyectos propuestos por los estudiantes por grupos', '75058438', '10055', '5', '2020-1'),
	('117', 3.2, 'Básico', 'Temas para proyectos propuestos por los estudiantes por grupos', '77458312', '10055', '5', '2020-1'),
	('118', 2.8, 'Bajo', 'Temas para proyectos propuestos por los estudiantes por grupos', '70976047', '10055', '5', '2020-1'),
	('119', 3.5, 'Básico', 'Temas para proyectos propuestos por los estudiantes por grupos', '71688642', '10055', '5', '2020-1'),
	('12', 2.4, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '70504359', '10023', '6', '2020-1'),
	('120', 3.6, 'Básico', 'Temas para proyectos propuestos por los estudiantes por grupos', '75013975', '10055', '5', '2020-1'),
	('121', 0.7, 'Bajo', 'Temas para proyectos propuestos por los estudiantes por grupos', '70873920', '10055', '5', '2020-1'),
	('122', 2.9, 'Bajo', 'Temas para proyectos propuestos por los estudiantes por grupos', '74648492', '10055', '5', '2020-1'),
	('123', 4.4, 'Alto', 'Temas para proyectos propuestos por los estudiantes por grupos', '72458142', '10055', '5', '2020-1'),
	('124', 3.8, 'Básico', 'Temas para proyectos propuestos por los estudiantes por grupos', '76169237', '10055', '5', '2020-1'),
	('125', 2.3, 'Bajo', 'Temas para proyectos propuestos por los estudiantes por grupos', '71281964', '10055', '5', '2020-1'),
	('126', 0.6, 'Bajo', 'Temas para proyectos propuestos por los estudiantes por grupos', '79125351', '10055', '5', '2020-1'),
	('127', 1.9, 'Bajo', 'Temas para proyectos propuestos por los estudiantes por grupos', '70432657', '10055', '5', '2020-1'),
	('128', 4.9, 'Superior', 'Temas para proyectos propuestos por los estudiantes por grupos', '71108664', '10055', '5', '2020-1'),
	('129', 0.2, 'Bajo', 'Temas para proyectos propuestos por los estudiantes por grupos', '78397604', '10055', '5', '2020-1'),
	('13', 2.5, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '72772463', '10023', '6', '2020-1'),
	('130', 0.9, 'Bajo', 'Temas para proyectos propuestos por los estudiantes por grupos', '78757862', '10055', '5', '2020-1'),
	('131', 1.3, 'Bajo', 'Temas para proyectos propuestos por los estudiantes por grupos', '75092627', '10055', '5', '2020-1'),
	('132', 1.5, 'Bajo', 'Temas para proyectos propuestos por los estudiantes por grupos', '73227696', '10055', '5', '2020-1'),
	('133', 0.1, 'Bajo', 'Temas para proyectos propuestos por los estudiantes por grupos', '71262023', '10055', '5', '2020-1'),
	('134', 3.4, 'Básico', 'Temas para proyectos propuestos por los estudiantes por grupos', '76040653', '10055', '5', '2020-1'),
	('135', 4, 'Alto', 'Temas para proyectos propuestos por los estudiantes por grupos', '73194159', '10055', '5', '2020-1'),
	('136', 4.5, 'Superior', 'Temas para proyectos propuestos por los estudiantes por grupos', '76590830', '10055', '5', '2020-1'),
	('137', 0.1, 'Bajo', 'Temas para proyectos propuestos por los estudiantes por grupos', '79713784', '10055', '5', '2020-1'),
	('138', 0.6, 'Bajo', 'Valoración de activadores y cursores', '76585610', '10055', '7', '2020-1'),
	('139', 1.9, 'Bajo', 'Valoración de activadores y cursores', '73557098', '10055', '7', '2020-1'),
	('14', 4.6, 'Superior', 'Valoración de conceptos iniciales, pilas, colas', '71859116', '10023', '6', '2020-1'),
	('140', 4.1, 'Alto', 'Valoración de activadores y cursores', '72955332', '10055', '7', '2020-1'),
	('141', 0.3, 'Bajo', 'Valoración de activadores y cursores', '72693031', '10055', '7', '2020-1'),
	('142', 2.5, 'Bajo', 'Valoración de activadores y cursores', '77197018', '10055', '7', '2020-1'),
	('143', 1.6, 'Bajo', 'Valoración de activadores y cursores', '75058438', '10055', '7', '2020-1'),
	('144', 1.7, 'Bajo', 'Valoración de activadores y cursores', '77458312', '10055', '7', '2020-1'),
	('145', 4.3, 'Alto', 'Valoración de activadores y cursores', '70976047', '10055', '7', '2020-1'),
	('146', 4.3, 'Alto', 'Valoración de activadores y cursores', '71688642', '10055', '7', '2020-1'),
	('147', 2.4, 'Bajo', 'Valoración de activadores y cursores', '75013975', '10055', '7', '2020-1'),
	('148', 1.2, 'Bajo', 'Valoración de activadores y cursores', '70873920', '10055', '7', '2020-1'),
	('15', 0.5, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '79839122', '10023', '6', '2020-1'),
	('150', 4, 'Alto', 'Valoración de activadores y cursores', '72458142', '10055', '7', '2020-1'),
	('151', 3.8, 'Básico', 'Valoración de activadores y cursores', '76169237', '10055', '7', '2020-1'),
	('152', 3.3, 'Básico', 'Valoración de activadores y cursores', '71281964', '10055', '7', '2020-1'),
	('153', 1.4, 'Bajo', 'Valoración de activadores y cursores', '79125351', '10055', '7', '2020-1'),
	('154', 1.8, 'Bajo', 'Valoración de activadores y cursores', '70432657', '10055', '7', '2020-1'),
	('155', 3.3, 'Básico', 'Valoración de activadores y cursores', '71108664', '10055', '7', '2020-1'),
	('156', 3.9, 'Básico', 'Valoración de activadores y cursores', '78397604', '10055', '7', '2020-1'),
	('157', 0.5, 'Bajo', 'Valoración de activadores y cursores', '78757862', '10055', '7', '2020-1'),
	('158', 3.2, 'Básico', 'Valoración de activadores y cursores', '75092627', '10055', '7', '2020-1'),
	('159', 4.2, 'Alto', 'Valoración de activadores y cursores', '73227696', '10055', '7', '2020-1'),
	('16', 1.9, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '73999732', '10023', '6', '2020-1'),
	('160', 4, 'Alto', 'Valoración de activadores y cursores', '71262023', '10055', '7', '2020-1'),
	('161', 2.6, 'Bajo', 'Valoración de activadores y cursores', '76040653', '10055', '7', '2020-1'),
	('162', 2.2, 'Bajo', 'Valoración de activadores y cursores', '73194159', '10055', '7', '2020-1'),
	('163', 4.3, 'Alto', 'Valoración de activadores y cursores', '76590830', '10055', '7', '2020-1'),
	('164', 3.5, 'Básico', 'Valoración de activadores y cursores', '79713784', '10055', '7', '2020-1'),
	('165', 3.2, 'Básico', 'Valoración de conceptos previos', '74648492', '10055', '1', '2020-1'),
	('17', 1.8, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '73136498', '10023', '6', '2020-1'),
	('18', 1.3, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '78229674', '10023', '6', '2020-1'),
	('19', 1.3, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '74599113', '10023', '6', '2020-1'),
	('20', 4.9, 'Superior', 'Valoración de conceptos iniciales, pilas, colas', '79382936', '10023', '6', '2020-1'),
	('21', 1.3, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '75721248', '10023', '6', '2020-1'),
	('22', 0.3, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '73721662', '10023', '6', '2020-1'),
	('23', 4.6, 'Superior', 'Valoración de conceptos iniciales, pilas, colas', '78368901', '10023', '6', '2020-1'),
	('24', 0.3, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '71259700', '10023', '6', '2020-1'),
	('25', 2, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '78216927', '10023', '6', '2020-1'),
	('26', 4, 'Alto', 'Valoración de conceptos iniciales, pilas, colas', '77968196', '10023', '6', '2020-1'),
	('27', 5, 'Superior', 'Valoración de conceptos iniciales, pilas, colas', '75883851', '10023', '6', '2020-1'),
	('28', 1.6, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '70852509', '10023', '6', '2020-1'),
	('29', 3.8, 'Básico', 'Valoración de conceptos iniciales, pilas, colas', '72323450', '10023', '6', '2020-1'),
	('3', 3.7, 'Básico', 'Valoración de conceptos iniciales, pilas, colas', '75043804', '10023', '6', '2020-1'),
	('30', 4.8, 'Superior', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '78837293', '10023', '11', '2020-1'),
	('31', 0.3, 'Bajo', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '72833447', '10023', '11', '2020-1'),
	('32', 3.8, 'Básico', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '75043804', '10023', '11', '2020-1'),
	('33', 4.2, 'Alto', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '77168721', '10023', '11', '2020-1'),
	('34', 3.6, 'Básico', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '77838520', '10023', '11', '2020-1'),
	('35', 2.1, 'Bajo', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '74655295', '10023', '11', '2020-1'),
	('36', 0.9, 'Bajo', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '72107642', '10023', '11', '2020-1'),
	('37', 2.7, 'Bajo', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '73097397', '10023', '11', '2020-1'),
	('38', 4, 'Alto', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '77073674', '10023', '11', '2020-1'),
	('39', 4.4, 'Alto', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '73727265', '10023', '11', '2020-1'),
	('4', 5, 'Superior', 'Valoración de conceptos iniciales, pilas, colas', '77168721', '10023', '6', '2020-1'),
	('40', 0.8, 'Bajo', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '79825264', '10023', '11', '2020-1'),
	('41', 0.7, 'Bajo', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '70504359', '10023', '11', '2020-1'),
	('42', 4.8, 'Superior', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '72772463', '10023', '11', '2020-1'),
	('43', 1.7, 'Bajo', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '71859116', '10023', '11', '2020-1'),
	('44', 3.7, 'Básico', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '79839122', '10023', '11', '2020-1'),
	('45', 3.1, 'Básico', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '73999732', '10023', '11', '2020-1'),
	('46', 1.2, 'Bajo', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '73136498', '10023', '11', '2020-1'),
	('47', 2.1, 'Bajo', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '78229674', '10023', '11', '2020-1'),
	('48', 1.7, 'Bajo', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '74599113', '10023', '11', '2020-1'),
	('49', 2.8, 'Bajo', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '79382936', '10023', '11', '2020-1'),
	('5', 4.7, 'Superior', 'Valoración de conceptos iniciales, pilas, colas', '77838520', '10023', '6', '2020-1'),
	('50', 3, 'Básico', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '75721248', '10023', '11', '2020-1'),
	('51', 2, 'Bajo', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '73721662', '10023', '11', '2020-1'),
	('52', 3.8, 'Básico', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '78368901', '10023', '11', '2020-1'),
	('53', 4.5, 'Superior', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '71259700', '10023', '11', '2020-1'),
	('54', 4.5, 'Superior', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '78216927', '10023', '11', '2020-1'),
	('55', 5, 'Superior', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '77968196', '10023', '11', '2020-1'),
	('56', 1.1, 'Bajo', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '75883851', '10023', '11', '2020-1'),
	('57', 4, 'Alto', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '70852509', '10023', '11', '2020-1'),
	('58', 4.3, 'Alto', 'Evaluación de métodos de búsqueda, métodos de ordenamiento, pilas, colas, nodos, listas enlazadas simples', '72323450', '10023', '11', '2020-1'),
	('59', 0.6, 'Bajo', 'Temáticas seleccionadas por los estudiantes', '78837293', '10023', '2', '2020-1'),
	('6', 1.4, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '74655295', '10023', '6', '2020-1'),
	('60', 4.8, 'Superior', 'Temáticas seleccionadas por los estudiantes', '72833447', '10023', '2', '2020-1'),
	('61', 1.1, 'Bajo', 'Temáticas seleccionadas por los estudiantes', '75043804', '10023', '2', '2020-1'),
	('62', 3.1, 'Básico', 'Temáticas seleccionadas por los estudiantes', '77168721', '10023', '2', '2020-1'),
	('63', 4.2, 'Alto', 'Temáticas seleccionadas por los estudiantes', '77838520', '10023', '2', '2020-1'),
	('64', 2, 'Bajo', 'Temáticas seleccionadas por los estudiantes', '74655295', '10023', '2', '2020-1'),
	('65', 3.1, 'Básico', 'Temáticas seleccionadas por los estudiantes', '72107642', '10023', '2', '2020-1'),
	('66', 3, 'Básico', 'Temáticas seleccionadas por los estudiantes', '73097397', '10023', '2', '2020-1'),
	('67', 3, 'Básico', 'Temáticas seleccionadas por los estudiantes', '77073674', '10023', '2', '2020-1'),
	('68', 3.1, 'Básico', 'Temáticas seleccionadas por los estudiantes', '73727265', '10023', '2', '2020-1'),
	('69', 2.7, 'Bajo', 'Temáticas seleccionadas por los estudiantes', '79825264', '10023', '2', '2020-1'),
	('7', 3.3, 'Básico', 'Valoración de conceptos iniciales, pilas, colas', '72107642', '10023', '6', '2020-1'),
	('70', 4.5, 'Superior', 'Temáticas seleccionadas por los estudiantes', '70504359', '10023', '2', '2020-1'),
	('71', 1.5, 'Bajo', 'Temáticas seleccionadas por los estudiantes', '72772463', '10023', '2', '2020-1'),
	('72', 4.9, 'Superior', 'Temáticas seleccionadas por los estudiantes', '71859116', '10023', '2', '2020-1'),
	('73', 2.1, 'Bajo', 'Temáticas seleccionadas por los estudiantes', '79839122', '10023', '2', '2020-1'),
	('74', 4.1, 'Alto', 'Temáticas seleccionadas por los estudiantes', '73999732', '10023', '2', '2020-1'),
	('75', 2.1, 'Bajo', 'Temáticas seleccionadas por los estudiantes', '73136498', '10023', '2', '2020-1'),
	('76', 4, 'Alto', 'Temáticas seleccionadas por los estudiantes', '78229674', '10023', '2', '2020-1'),
	('77', 3.9, 'Básico', 'Temáticas seleccionadas por los estudiantes', '74599113', '10023', '2', '2020-1'),
	('78', 3.5, 'Básico', 'Temáticas seleccionadas por los estudiantes', '79382936', '10023', '2', '2020-1'),
	('79', 4.8, 'Superior', 'Temáticas seleccionadas por los estudiantes', '75721248', '10023', '2', '2020-1'),
	('8', 0.1, 'Bajo', 'Valoración de conceptos iniciales, pilas, colas', '73097397', '10023', '6', '2020-1'),
	('80', 1.1, 'Bajo', 'Temáticas seleccionadas por los estudiantes', '73721662', '10023', '2', '2020-1'),
	('81', 5, 'Superior', 'Temáticas seleccionadas por los estudiantes', '78368901', '10023', '2', '2020-1'),
	('82', 2.9, 'Bajo', 'Temáticas seleccionadas por los estudiantes', '71259700', '10023', '2', '2020-1'),
	('83', 3, 'Básico', 'Temáticas seleccionadas por los estudiantes', '78216927', '10023', '2', '2020-1'),
	('84', 1.1, 'Bajo', 'Temáticas seleccionadas por los estudiantes', '77968196', '10023', '2', '2020-1'),
	('85', 0.9, 'Bajo', 'Temáticas seleccionadas por los estudiantes', '75883851', '10023', '2', '2020-1'),
	('86', 4.8, 'Superior', 'Temáticas seleccionadas por los estudiantes', '70852509', '10023', '2', '2020-1'),
	('87', 2.3, 'Bajo', 'Temáticas seleccionadas por los estudiantes', '72323450', '10023', '2', '2020-1'),
	('88', 1.3, 'Bajo', 'Valoración de conceptos previos', '78837293', '10054', '1', '2020-1'),
	('89', 0.2, 'Bajo', 'Valoración de conceptos previos', '72833447', '10054', '1', '2020-1'),
	('9', 4, 'Alto', 'Valoración de conceptos iniciales, pilas, colas', '77073674', '10023', '6', '2020-1'),
	('90', 1, 'Bajo', 'Valoración de conceptos previos', '75043804', '10054', '1', '2020-1'),
	('91', 4.7, 'Superior', 'Valoración de conceptos previos', '77168721', '10054', '1', '2020-1'),
	('92', 3.4, 'Básico', 'Valoración de conceptos previos', '77838520', '10054', '1', '2020-1'),
	('93', 4.3, 'Alto', 'Valoración de conceptos previos', '74655295', '10054', '1', '2020-1'),
	('94', 0.4, 'Bajo', 'Valoración de conceptos previos', '72107642', '10054', '1', '2020-1'),
	('95', 5, 'Superior', 'Valoración de conceptos previos', '73097397', '10054', '1', '2020-1'),
	('96', 5, 'Superior', 'Valoración de conceptos previos', '77073674', '10054', '1', '2020-1'),
	('97', 0.2, 'Bajo', 'Valoración de conceptos previos', '73727265', '10054', '1', '2020-1'),
	('98', 3.5, 'Básico', 'Valoración de conceptos previos', '79825264', '10054', '1', '2020-1'),
	('99', 0, 'Bajo', 'Valoración de conceptos previos', '70504359', '10054', '1', '2020-1');
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;

-- Volcando estructura para tabla bd_universidad.periodos
CREATE TABLE IF NOT EXISTS `periodos` (
  `codigoPeriodo` varchar(6) NOT NULL,
  `periodoYear` varchar(4) NOT NULL,
  `periodoNum` varchar(1) NOT NULL,
  PRIMARY KEY (`codigoPeriodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_universidad.periodos: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `periodos` DISABLE KEYS */;
INSERT INTO `periodos` (`codigoPeriodo`, `periodoYear`, `periodoNum`) VALUES
	('2018-1', '2018', '1'),
	('2018-2', '2018', '2'),
	('2018-3', '2018', '3'),
	('2018-4', '2018', '4'),
	('2018-5', '2018', '5'),
	('2019-1', '2019', '1'),
	('2019-2', '2019', '2'),
	('2019-3', '2019', '3'),
	('2019-4', '2019', '4'),
	('2019-5', '2019', '5'),
	('2020-1', '2020', '1'),
	('2020-2', '2020', '2'),
	('2020-3', '2020', '3'),
	('2020-4', '2020', '4'),
	('2020-5', '2020', '5');
/*!40000 ALTER TABLE `periodos` ENABLE KEYS */;

-- Volcando estructura para tabla bd_universidad.profesores
CREATE TABLE IF NOT EXISTS `profesores` (
  `codigoProfesor` varchar(15) NOT NULL,
  `apellidosProfesor` varchar(20) NOT NULL,
  `nombresProfesor` varchar(20) NOT NULL,
  PRIMARY KEY (`codigoProfesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_universidad.profesores: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` (`codigoProfesor`, `apellidosProfesor`, `nombresProfesor`) VALUES
	('10012300', 'CASTRO ORTIZ', 'CARLOS ALBERTO'),
	('11012363', 'MARIN MARIN', 'ESTEPHANY'),
	('12312312', 'CRUZ ORDIERES', 'DIEGO IVAN'),
	('32132132', 'PALOMARES VEGA', 'MARIA DEL MAR'),
	('5556553', 'SOLARTE', 'ALFONSO');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;

-- Volcando estructura para procedimiento bd_universidad.PROMEDIO_MATERIA
DELIMITER //
CREATE PROCEDURE `PROMEDIO_MATERIA`(in VAR_MATERIA varchar(100))
begin 
select SUM(VALORNOTA)/COUNT(VALORNOTA) PROMEDIO from NOTAS join MATERIAS where NOTAS.CODIGOMATERIA = MATERIAS.CODIGOMATERIA
    and DESCRIPCIONMATERIA = VAR_MATERIA;
end//
DELIMITER ;

-- Volcando estructura para procedimiento bd_universidad.promedio_notas_estudiante
DELIMITER //
CREATE PROCEDURE `promedio_notas_estudiante`(in x_codigo_estudiante varchar(100), in x_codigo_materia varchar(100))
begin

select avg(valorNota) Promedio from notas n where n.codigoEstudiante = x_codigo_estudiante and n.codigoMateria = x_codigo_materia;

end//
DELIMITER ;

-- Volcando estructura para tabla bd_universidad.tipos_de_nota
CREATE TABLE IF NOT EXISTS `tipos_de_nota` (
  `codigoTipoNota` varchar(2) NOT NULL,
  `descripcionTipoNota` varchar(45) NOT NULL,
  PRIMARY KEY (`codigoTipoNota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_universidad.tipos_de_nota: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `tipos_de_nota` DISABLE KEYS */;
INSERT INTO `tipos_de_nota` (`codigoTipoNota`, `descripcionTipoNota`) VALUES
	('1', 'Evaluación Diagnóstica'),
	('10', 'Quiz 5'),
	('11', 'Evaluación Parcial 1'),
	('12', 'Evaluación Parcial 2'),
	('13', 'Evaluación Final'),
	('2', 'Exposicion'),
	('3', 'Sustentación'),
	('4', 'Trabajo en clase'),
	('5', 'Proyecto de aula'),
	('6', 'Quiz 1'),
	('7', 'Quiz 2'),
	('8', 'Quiz 3'),
	('9', 'Quiz 4');
/*!40000 ALTER TABLE `tipos_de_nota` ENABLE KEYS */;

-- Volcando estructura para tabla bd_universidad.vacunas
CREATE TABLE IF NOT EXISTS `vacunas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `edad` int(2) NOT NULL,
  `codigoVacuna` varchar(10) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  UNIQUE KEY `id` (`id`,`ciudad`,`fecha`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1
 PARTITION BY RANGE (year(`fecha`))
(PARTITION `before2017` VALUES LESS THAN (2017) ENGINE = InnoDB,
 PARTITION `before2020` VALUES LESS THAN (2020) ENGINE = InnoDB,
 PARTITION `max` VALUES LESS THAN MAXVALUE ENGINE = InnoDB);

-- Volcando datos para la tabla bd_universidad.vacunas: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `vacunas` DISABLE KEYS */;
INSERT INTO `vacunas` (`id`, `nombre`, `apellido`, `celular`, `edad`, `codigoVacuna`, `ciudad`, `fecha`) VALUES
	(1, 'mateo', 'peñaranda diaz', '399272991', 42, 'ACC99', 'Medellin', '2016-01-05'),
	(2, 'camilo andres', 'barreto leal', '36778542', 39, 'BNN33', 'Medellin', '2015-08-22'),
	(3, 'andres felipe', 'castaño cadavid', '3886995', 56, 'LOUJ44', 'Medellin', '2016-11-11'),
	(5, 'juan jose', 'chaverra escalante', '311220099', 19, 'MNU99', 'Cali', '2015-07-13'),
	(6, 'laura sofia', 'urrego restrepo', '37660999', 22, 'XCS22', 'Bogota', '2017-06-23'),
	(4, 'monica', 'duque sierra', '3875654', 17, 'OIY777', 'Cali', '2020-11-02');
/*!40000 ALTER TABLE `vacunas` ENABLE KEYS */;

-- Volcando estructura para disparador bd_universidad.nivel_desempeño_notas
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger nivel_desempeño_notas
before update on notas 
for each row 
begin

	if new.codigoPeriodo = "2020-4" then
		if old.valorNota >= 0 and old.valorNota <= 3 then
			set new.desempenio  = "Bajo";
		end if;
			if old.valorNota >= 3 and old.valorNota <= 4 then
			set new.desempenio = "Básico";
		end if;
		if old.valorNota >= 4 and old.valorNota <= 4.5 then
			set new.desempenio = "Alto";
		end if;
		if old.valorNota >= 4.5 and old.valorNota <= 5.0 then
			set new.desempenio = "Superior";
        end if;
	end if;

end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador bd_universidad.T_ESTUDIANTEPERIODO
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE trigger T_ESTUDIANTEPERIODO
 before update on grupos_por_materia
 for each row
 begin
	declare v_idGrupo varchar(10);
   update estudiantes set estado = 'Activo' where codigoEstudiante = old.codigoEstudiante;
end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

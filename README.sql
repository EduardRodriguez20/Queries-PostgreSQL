CREATE DATABASE bd_universidad;

\c bd_universidad;

CREATE TYPE sexo AS ENUM('H', 'M');
CREATE TYPE tipo_persona AS ENUM('alumno', 'profesor');

CREATE TABLE persona(
	id INT PRIMARY KEY,
	nif VARCHAR(9),
	nombre VARCHAR(25),
	apellido1 VARCHAR(50),
	apellido2 VARCHAR(50),
	ciudad VARCHAR(25),
	direccion VARCHAR(50),
	telefono VARCHAR(9),
	fecha_nacimiento DATE,
	sexo sexo,
	tipo tipo_persona
);

CREATE TABLE departamento(
	id INT PRIMARY KEY,
	nombre VARCHAR(50)
);

CREATE TABLE profesor(
    id INT PRIMARY KEY,
	id_persona INT REFERENCES persona(id),
	id_departamento INT REFERENCES departamento(id)
);

CREATE TABLE grado(
	id INT PRIMARY KEY,
	nombre VARCHAR(100)
);

CREATE TYPE tipo_asignatura AS ENUM('obligatoria', 'optativa', 'básica');

CREATE TABLE asignatura(
	id INT PRIMARY KEY,
	nombre VARCHAR(100),
	creditos FLOAT,
	tipo tipo_asignatura,
	curso SMALLINT,
	cuatrimestre SMALLINT,
	id_profesor INT REFERENCES profesor(id),
	id_grado INT REFERENCES grado(id)
);

CREATE TABLE curso_escolar(
	id INT PRIMARY KEY,
	anyo_inicio INT,
	anyo_fin INT
);

CREATE TABLE matricula(
	id INT PRIMARY KEY,
	id_alumno INT REFERENCES persona (id),
	id_asignatura INT REFERENCES asignatura(id),
	id_curso_escolar INT REFERENCES curso_escolar(id)
);

 /* Departamento */
INSERT INTO departamento VALUES (1, 'Informática');
INSERT INTO departamento VALUES (2, 'Matemáticas');
INSERT INTO departamento VALUES (3, 'Economía y Empresa');
INSERT INTO departamento VALUES (4, 'Educación');
INSERT INTO departamento VALUES (5, 'Agronomía');
INSERT INTO departamento VALUES (6, 'Química y Física');
INSERT INTO departamento VALUES (7, 'Filología');
INSERT INTO departamento VALUES (8, 'Derecho');
INSERT INTO departamento VALUES (9, 'Biología y Geología');
 
 /* Persona */
INSERT INTO persona VALUES (1, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991/03/28', 'H', 'alumno');
INSERT INTO persona VALUES (2, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992/08/08', 'H', 'alumno');
INSERT INTO persona VALUES (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979/08/19', 'M', 'profesor');
INSERT INTO persona VALUES (4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H', 'alumno');
INSERT INTO persona VALUES (5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978/01/19', 'H', 'profesor');
INSERT INTO persona VALUES (6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998/01/28', 'H', 'alumno');
INSERT INTO persona VALUES (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999/05/24', 'H', 'alumno');
INSERT INTO persona VALUES (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977/08/21', 'M', 'profesor');
INSERT INTO persona VALUES (9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996/11/21', 'H', 'alumno');
INSERT INTO persona VALUES (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977/05/19', 'M', 'profesor');
INSERT INTO persona VALUES (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997/04/26', 'H', 'alumno');
INSERT INTO persona VALUES (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor');
INSERT INTO persona VALUES (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 'profesor');
INSERT INTO persona VALUES (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977/01/02', 'H', 'profesor');
INSERT INTO persona VALUES (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980/03/14', 'H', 'profesor');
INSERT INTO persona VALUES (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 'profesor');
INSERT INTO persona VALUES (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973/05/05', 'H', 'profesor');
INSERT INTO persona VALUES (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976/02/25', 'H', 'profesor');
INSERT INTO persona VALUES (19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998/09/01', 'M', 'alumno');
INSERT INTO persona VALUES (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980/10/31', 'H', 'profesor');
INSERT INTO persona VALUES (21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998/01/01', 'H', 'alumno');
INSERT INTO persona VALUES (22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999/02/11', 'H', 'alumno');
INSERT INTO persona VALUES (23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996/03/12', 'M', 'alumno');
INSERT INTO persona VALUES (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995/04/13', 'M', 'alumno');
 
/* Profesor */
INSERT INTO profesor VALUES (1, 3, 1);
INSERT INTO profesor VALUES (2, 5, 2);
INSERT INTO profesor VALUES (3, 8, 3);
INSERT INTO profesor VALUES (4, 10, 4);
INSERT INTO profesor VALUES (5, 12, 4);
INSERT INTO profesor VALUES (6, 13, 6);
INSERT INTO profesor VALUES (7, 14, 1);
INSERT INTO profesor VALUES (8, 15, 2);
INSERT INTO profesor VALUES (9, 16, 3);
INSERT INTO profesor VALUES (10, 17, 4);
INSERT INTO profesor VALUES (11, 18, 5);
INSERT INTO profesor VALUES (12, 20, 6);
 
 /* Grado */
INSERT INTO grado VALUES (1, 'Grado en Ingeniería Agrícola (Plan 2015)');
INSERT INTO grado VALUES (2, 'Grado en Ingeniería Eléctrica (Plan 2014)');
INSERT INTO grado VALUES (3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)');
INSERT INTO grado VALUES (4, 'Grado en Ingeniería Informática (Plan 2015)');
INSERT INTO grado VALUES (5, 'Grado en Ingeniería Mecánica (Plan 2010)');
INSERT INTO grado VALUES (6, 'Grado en Ingeniería Química Industrial (Plan 2010)');
INSERT INTO grado VALUES (7, 'Grado en Biotecnología (Plan 2015)');
INSERT INTO grado VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO grado VALUES (9, 'Grado en Matemáticas (Plan 2010)');
INSERT INTO grado VALUES (10, 'Grado en Química (Plan 2009)');
 
/* Asignatura */
INSERT INTO asignatura VALUES (1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, 1, 4);
INSERT INTO asignatura VALUES (2, 'Cálculo', 6, 'básica', 1, 1, 7, 4);
INSERT INTO asignatura VALUES (3, 'Física para informática', 6, 'básica', 1, 1, 1, 4);
INSERT INTO asignatura VALUES (4, 'Introducción a la programación', 6, 'básica', 1, 1, 7, 4);
INSERT INTO asignatura VALUES (5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, 1, 4);
INSERT INTO asignatura VALUES (6, 'Estadística', 6, 'básica', 1, 2, 7, 4);
INSERT INTO asignatura VALUES (7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, 1, 4);
INSERT INTO asignatura VALUES (8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, 7, 4);
INSERT INTO asignatura VALUES (9, 'Lógica y algorítmica', 6, 'básica', 1, 2, 1, 4);
INSERT INTO asignatura VALUES (10, 'Metodología de la programación', 6, 'básica', 1, 2, 7, 4);
INSERT INTO asignatura VALUES (11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 1, 4);
INSERT INTO asignatura VALUES (12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 1, 4);
INSERT INTO asignatura VALUES (13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 7, 4);
INSERT INTO asignatura VALUES (14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 1, 4);
INSERT INTO asignatura VALUES (15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 7, 4);
INSERT INTO asignatura VALUES (16, 'Bases de Datos', 6, 'básica', 2, 2, 7, 4);
INSERT INTO asignatura VALUES (17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 7, 4);
INSERT INTO asignatura VALUES (18, 'Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 1, 4);
INSERT INTO asignatura VALUES (19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 1, 4);
INSERT INTO asignatura VALUES (20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 7, 4);
INSERT INTO asignatura VALUES (21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 7, 4);
INSERT INTO asignatura VALUES (22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4); 
INSERT INTO asignatura VALUES (28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (53, 'Física', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (55, 'Química general', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (59, 'Genética', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

/* Curso escolar */
INSERT INTO curso_escolar VALUES (1, 2014, 2015);
INSERT INTO curso_escolar VALUES (2, 2015, 2016);
INSERT INTO curso_escolar VALUES (3, 2016, 2017);
INSERT INTO curso_escolar VALUES (4, 2017, 2018);
INSERT INTO curso_escolar VALUES (5, 2018, 2019);

/* Alumno se matricula en asignatura */
INSERT INTO matricula VALUES 
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 2, 1, 1),
(5, 2, 2, 1),
(6, 2, 3, 1),
(7, 4, 1, 1),
(8, 4, 2, 1),
(9, 4, 3, 1),
(10, 24, 1, 5),
(11, 24, 2, 5),
(12, 24, 3, 5),
(13, 24, 4, 5),
(14, 24, 5, 5),
(15, 24, 6, 5),
(16, 24, 7, 5),
(17, 24, 8, 5),
(18, 24, 9, 5),
(19, 24, 10, 5),
(20, 23, 1, 5),
(21, 23, 2, 5),
(22, 23, 3, 5),
(23, 23, 4, 5),
(24, 23, 5, 5),
(25, 23, 6, 5),
(26, 23, 7, 5),
(27, 23, 8, 5),
(28, 23, 9, 5),
(29, 23, 10, 5),
(30, 19, 1, 5),
(31, 19, 2, 5),
(32, 19, 3, 5),
(33, 19, 4, 5),
(34, 19, 5, 5),
(35, 19, 6, 5),
(36, 19, 7, 5),
(37, 19, 8, 5),
(38, 19, 9, 5),
(39, 19, 10, 5);

-- Consultas

-- 3.
-- 3.1.

SELECT p.apellido1, p.apellido2, p.nombre FROM persona p 
WHERE tipo = 'alumno' ORDER BY p.apellido1, p.apellido2, p.nombre;

-- 3.2.

SELECT p.apellido1, p.apellido2, p.nombre FROM persona p 
WHERE tipo = 'alumno' AND telefono IS NULL;

-- 3.3.

SELECT p.apellido1, p.apellido2, p.nombre, p.fecha_nacimiento FROM persona p 
WHERE EXTRACT(YEAR FROM p.fecha_nacimiento) = 1999 AND tipo = 'alumno';

-- 3.4.

SELECT p.apellido1, p.apellido2, p.nombre FROM persona p 
WHERE tipo = 'profesor' AND telefono IS NULL AND (nif LIKE '%K');

-- 3.5.

SELECT * FROM asignatura a 
JOIN grado g ON a.id_grado = g.id 
WHERE a.cuatrimestre = 1 AND a.curso = 3 AND g.id = 7 ;

-- 4.
-- 4.1.

SELECT DISTINCT p.apellido1, p.apellido2, p.nombre, g.nombre FROM persona p 
JOIN matricula m ON p.id = m.id_alumno
JOIN asignatura a ON m.id_asignatura = a.id
JOIN grado g ON a.id_grado = g.id
WHERE p.sexo = 'M' AND g.id = 4;

-- 4.2.

SELECT a.* FROM asignatura a 
JOIN grado g ON a.id_grado = g.id
WHERE g.id = 4;

-- 4.3.

SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS nombre_departamento 
FROM persona p 
JOIN profesor pr ON p.id = pr.id_persona
JOIN departamento d ON pr.id_departamento = d.id
ORDER BY p.apellido1, p.apellido2, p.nombre;

-- 4.4.

SELECT a.nombre, c.anyo_inicio, c.anyo_fin FROM matricula m
JOIN curso_escolar c ON m.id_curso_escolar = c.id 
JOIN persona p ON m.id_alumno = p.id
JOIN asignatura a ON m.id_asignatura = a.id
WHERE p.nif = '26902806M'

-- 4.5.

SELECT DISTINCT d.nombre, pr.id AS id_profesor FROM departamento d
JOIN profesor pr ON d.id = pr.id_departamento
JOIN asignatura a ON pr.id = a.id_profesor
JOIN grado g ON a.id_grado = g.id
WHERE g.id = 4;

-- 4.6.

SELECT DISTINCT p.id, p.apellido1, p.apellido2, p.nombre AS id_matricula, c.anyo_inicio, c.anyo_fin
FROM matricula m
JOIN curso_escolar c ON m.id_curso_escolar = c.id
JOIN persona p ON m.id_alumno = p.id
WHERE c.id = 5;


-- 5

-- 5.1

SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM persona p
JOIN profesor pr ON p.id = pr.id_persona
LEFT JOIN departamento d ON pr.id_departamento = d.id;

-- 5.2

SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM persona p
JOIN profesor pr ON p.id = pr.id_persona
LEFT JOIN departamento d ON pr.id_departamento = d.id
WHERE d.id IS NULL;

-- 5.3

SELECT d.* FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
WHERE p.id IS NULL;

-- 5.4

SELECT p.apellido1, p.apellido2, p.nombre FROM profesor pr
JOIN persona p ON p.id = pr.id_persona
LEFT JOIN asignatura a ON a.id_profesor = pr.id
WHERE a.id IS NULL;

-- 5.5

SELECT a.* FROM asignatura a
LEFT JOIN profesor p ON a.id_profesor = p.id
WHERE p.id IS NULL;

-- 5.6

SELECT d.nombre AS departamento, a.nombre AS asignatura
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
JOIN asignatura a ON p.id = a.id_profesor
LEFT JOIN matricula m ON a.id = m.id_asignatura
WHERE m.id IS NULL;

-- 6.
-- 6.1.

SELECT * FROM persona WHERE tipo = 'alumno' AND sexo = 'M';

-- 6.2.

SELECT * FROM persona p WHERE tipo = 'alumno' 
AND EXTRACT(YEAR FROM p.fecha_nacimiento) = 2005;

-- 6.3.

SELECT d.nombre AS departamento, COUNT(pr.id) AS profesores 
FROM departamento d
JOIN profesor pr ON d.id = pr.id_departamento
GROUP BY d.nombre ORDER BY profesores DESC;

-- 6.4.

SELECT d.nombre AS departamento, COUNT(pr.id) AS profesores 
FROM departamento d
LEFT JOIN profesor pr ON d.id = pr.id_departamento
GROUP BY d.nombre ORDER BY profesores DESC;

-- 6.5.

SELECT g.nombre AS grado, COUNT(a.id) AS asignaturas 
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre ORDER BY asignaturas DESC;

-- 6.6.

SELECT g.nombre AS grado, COUNT(a.id) AS asignaturas 
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre 
HAVING COUNT(a.id) > 40
ORDER BY asignaturas DESC;

-- 6.7.

SELECT g.nombre AS grado, a.tipo AS tipo_asignatura, 
SUM(a.creditos) AS total_creditos FROM grado g
JOIN asignatura a ON g.id = a.id_grado
GROUP BY a.tipo, g.nombre ORDER BY total_creditos DESC;

-- 6.8.

SELECT DISTINCT ce.anyo_inicio AS año_inicio, 
COUNT(m.id_alumno) AS cantidad_matriculados 
FROM curso_escolar ce
JOIN matricula m ON ce.id = m.id_curso_escolar
GROUP BY m.id_alumno, ce.anyo_inicio;

-- 6.9.

SELECT p.id, p.apellido1, p.apellido2, p.nombre, 
COUNT(a.id) AS cantidad_asignaturas
FROM profesor pr
JOIN persona p ON p.id = pr.id_persona
LEFT JOIN asignatura a ON pr.id = a.id_profesor
GROUP BY p.id ORDER BY cantidad_asignaturas DESC;

-- 1.5.8
-- 1.5.8.1

SELECT * FROM persona 
WHERE tipo = 'alumno' 
ORDER BY fecha_nacimiento DESC LIMIT 1;

-- 1.5.8.2

SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM persona p
JOIN profesor pr ON p.id = pr.id_persona
LEFT JOIN departamento d ON pr.id_departamento = d.id
WHERE d.id IS NULL;

-- 1.5.8.3

SELECT d.* FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
WHERE p.id IS NULL;

-- 1.5.8.4

SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS departamento
FROM profesor pr
JOIN persona p ON p.id = pr.id_persona
JOIN departamento d ON pr.id_departamento = d.id
LEFT JOIN asignatura a ON a.id_profesor = pr.id
WHERE a.id IS NULL;

-- 1.5.8.5

SELECT a.* FROM asignatura a
LEFT JOIN profesor p ON a.id_profesor = p.id
WHERE p.id IS NULL;

-- 1.5.8.6

SELECT d.nombre AS departamento, a.nombre AS asignatura
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
JOIN asignatura a ON p.id = a.id_profesor
LEFT JOIN matricula m ON a.id = m.id_asignatura
WHERE m.id IS NULL;

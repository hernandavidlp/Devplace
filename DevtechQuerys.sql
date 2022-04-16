if not exists(select * from sysdatabases where name='devtech') 
create database devtech;

use devtech;
create table profesor(
dni int primary key,
apellido varchar(25),
nombre varchar(25),
estado_civi varchar(1),
nro_despacho int
);

create table empleado(
dni int primary key,
apellido varchar(25),
nombre varchar(25),
estado_civi varchar(1),
nro_despacho int
);

create table estudiante(
dni int primary key,
apellido varchar(25),
nombre varchar(25),
estado_civi varchar(1)
);

create table materia(
codigo int primary key identity(1,1),
nombre varchar(40)
);

create table departamento(
codigo int primary key identity(1,1),
nombre varchar(40)
);

create table seccion(
codigo int primary key identity(1,1),
nombre varchar(30)
);

create table inscripcion(
dni_estudiante int,
codigo_materia int,
constraint fk_dni_estudiante foreign key(dni_estudiante) references estudiante(dni),
constraint fk_codigo_materia foreign key(codigo_materia) references materia(codigo)
);

create table departamento_profesor(
dni_profesor int,
codigo_departamento int,
constraint fk_dni_profesor foreign key(dni_profesor) references profesor(dni),
constraint fk_codigo_departamento foreign key(codigo_departamento) references departamento(codigo)
);

create table seccion_empleado(
dni_empleado int,
codigo_seccion int,
fecha_ingreso date
constraint fk_dni_empleado foreign key(dni_empleado) references empleado(dni),
constraint fk_codigo_seccion foreign key(codigo_seccion) references seccion(codigo)
);

insert into estudiante values (29769877, 'Diprinzio', 'Enzo', 'C'),
(40355678, 'Lopes', 'Andrea', 'S'),
(45369845, 'Rupel', 'David', 'S'),
(29771431, 'De Souza', 'Feliciano', 'C'),
(48898745, 'Antonelli', 'Roxana', 'C'),
(38200345, 'Flores', 'Analia Solange', 'C'),
(31887452, 'Konopka', 'Andres Dario', 'C'),
(32546987, 'Alonso', 'Naomi', 'S'),
(31021545, 'Perez', 'Dario Esteban', 'S'),
(29887697, 'Otto', 'Rojelio', 'C');

insert into profesor values 
(29887699, 'Lopez', 'Rojelio Elias', 'C', 1),
(30258972, 'Andreani', 'Estefania', 'S', 2),
(33993487, 'Flurence', 'Ruben Dario', 'S', 3),
(27534521, 'Krakovski', 'Ana', 'C', 4),
(28898745, 'Anderssen', 'Soledad', 'C', 1),
(23469777, 'Rumanov', 'Hernando', 'C', 2),
(25548687, 'Rodriguez', 'Delia', 'S', 3),
(29145875, 'Ivannova', 'Olga Noemi', 'S', 4),
(30431025, 'Clutterbuck', 'Paola Graciela', 'C', 1),
(29833012, 'Perez', 'Ernesto', 'C', 2);

insert into empleado values 
(30548752, 'Lopez', 'Adriana', 'C', 1),
(31225485, 'Solano', 'Felipe Elias', 'C', 2),
(30256854, 'Flossi', 'Rojelio', 'C', 3),
(28751656, 'Petersen', 'Daiana Rocio', 'C', 4),
(29324635, 'Ivangsdoter', 'Jesica', 'C', 1),
(29654115, 'Krupcz', 'Hector', 'C', 2),
(28784665, 'Rosetti', 'Daniel', 'C', 3),
(29774587, 'Lavengs', 'Rosa', 'C', 4),
(29456325, 'Clauss', 'Antonella', 'C', 1),
(31575755, 'Ullrich', 'Pedro', 'C', 2);

insert into departamento values
('Programacion'),
('Base de Datos'),
('Diseño Web'),
('Mobile Develop');

insert into materia values
('JavaScript'),
('C#'),
('POO'),
('SQL Server'),
('MySQL'),
('HTML5'),
('CSS3'),
('React-Native'),
('IONIC');

if DB_ID('Devtech') is null
	create database Devtech;
else
    use master;
	drop database Devtech;
go

if OBJECT_ID
create table estudiantes(
id int primary key identity(1,1),
nombre varchar(30),
apellido varchar(30),
estado_civil varchar(1));

create table profesores(
id int primary key identity(1,1),
nombre varchar(30),
apellido varchar(30),
estado_civil varchar(1));

--Decanato, biblioteca, etc--
create table secciones(
id int primary key identity(1,1),
nombre varchar(40));

create table empleados(
id int primary key identity(1,1),
nombre varchar(30),
apellido varchar(30),
estado_civil varchar(1),
year_facultad int,
id_seccion int, 
constraint fk_idseccion foreign key(id_seccion) references secciones(id));

create table cursos(
id int primary key identity(1,1),
nombre varchar(30));

create table cursos_estudiantes(
id_estudiante int,
id_curso int,
constraint fk_idestudiante foreign key(id_estudiante) references estudiantes(id),
constraint fk_idcurso_estudiante foreign key(id_curso) references cursos(id));

create table cursos_profesores(
id_profesor int,
id_curso int,
constraint fk_idprofesor foreign key(id_profesor) references profesores (id),
constraint fk_idcurso_profesor foreign key(id_curso) references cursos(id));
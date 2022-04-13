use [master];
go

IF NOT EXISTS (SELECT * FROM sysdatabases WHERE (name = 'Devtech')) 
Begin
	create database Devtech;
end
Else
	begin	
		if DB_ID('Devtech') is not null
		begin
		use Devtech;

		if OBJECT_ID('estudiantes', 'U') is null
		begin
			create table estudiantes(
			id int primary key identity(1,1),
			nombre varchar(30),
			apellido varchar(30),
			estado_civil varchar(1));
		end

		if OBJECT_ID('profesores', 'U') is null
		begin	
			create table profesores(
			id int primary key identity(1,1),
			nombre varchar(30),
			apellido varchar(30),
			estado_civil varchar(1));
		end
		
		if OBJECT_ID('departamentos', 'U') is null
		begin
		--Decanato, biblioteca, etc--
			create table departamentos(
			id int primary key identity(1,1),
			nombre varchar(40));
		end

		if OBJECT_ID('empleados', 'U') is null
		begin	
			create table empleados(
			id int primary key identity(1,1),
			nombre varchar(30),
			apellido varchar(30),
			estado_civil varchar(1),
			año_inicio_facultad int,
			id_departamento int, 
			constraint fk_iddepartamento foreign key(id_departamento) references departamentos(id));
		end

		if OBJECT_ID('cursos', 'U') is null
		begin	
			create table cursos(
			id int primary key identity(1,1),
			nombre varchar(30));
		end

		if OBJECT_ID('cursos_estudiantes', 'U') is null
		begin	
			create table cursos_estudiantes(
			id_estudiante int,
			id_curso int,
			constraint fk_idestudiante foreign key(id_estudiante) references estudiantes(id),
			constraint fk_idcurso_estudiante foreign key(id_curso) references cursos(id));
		end

		if OBJECT_ID('cursos_profesores', 'U') is null
		begin
			create table cursos_profesores(
			id_profesor int,
			id_curso int,
			constraint fk_idprofesor foreign key(id_profesor) references profesores (id),
			constraint fk_idcurso_profesor foreign key(id_curso) references cursos(id));
		end
	end
end	

/*crear base de datos*/
create database con_humberto_candia;
use con_humberto_candia;
#------------------------------------------------------------------------------------------------------------------------------
/*crear tabla usuarios */
create table USUARIO
(
idUsuario int primary key auto_increment,
nombreUsuario nvarchar(50)not null,
apellidoUsuario nvarchar(50)not null,
correoUsuario nvarchar(50)not null,
telefonoUsuario nvarchar(20)not null,
direccionUsuario nvarchar(50)not null,
passwordUsuario nvarchar(20)not null,
rolUsuario nvarchar(20)not null,
estadoUsuario nvarchar(30) not null
)engine=innoDB;
#------------------------------------------------------------------------------------------------------------------------------
/*crear tabla medico */
create table MEDICO
(
idMedico nvarchar(12) primary key not null,
nombreMedico nvarchar(50)not null,
apellidoMedico nvarchar(50)not null,
telefonoMedico nvarchar(20)not null,
correoMedico nvarchar(100)not null,
tarjetaProfesional nvarchar(50)not null,
especialidadMedico nvarchar(50)not null,
estadoMedico nvarchar(30) not null,
idUsuario int not null unique
)engine=innoDB;
#------------------------------------------------------------------------------------------------------------------------------
/*crear tabla agenda */
create table AGENDA
(
idAgenda int auto_increment primary key not null,
fechaAgenda date not null,
horaAgenda datetime not null,
consultorio nvarchar(2)not null,
estadoAgenda nvarchar(30) not null,
idMedicoFK nvarchar(12) not null,
idPacienteFK nvarchar(12) not null
)engine=innoDB;
#------------------------------------------------------------------------------------------------------------------------------

/*crear tabla paciente */
create table PACIENTE
(
idPaciente nvarchar(20) primary key not null,
nombrePaciente nvarchar(50)not null, 
apellidoPaciente nvarchar(50)not null,
direccionPaciente nvarchar(100)not null,
telefonoPaciente nvarchar(20)not null,
correoPaciente nvarchar(100)not null,
fechaNacimiento date not null,
estadoPaciente nvarchar(30) not null,
idUsuario int not null unique
)engine=innoDB;
#-----------------------------------------------------------------------------------------------------------------------
/*crear tabla historiaclinica */
create table HISTORIA_CLINICA
(
idHistoria int auto_increment primary key not null,
Estatura double not null,
Peso double not null,
antecedentesFamiliares text not null,
alergias text not null,
enfermedadesPadecidas text not null,
idPaciente nvarchar(12) not null unique
)engine=innoDB;
#------------------------------------------------------------------------------------------------------------------------------
/*crear tabla examen */
create table EXAMEN
(
idexamen int auto_increment primary key not null,
valor numeric not null,
fechaExamen date not null,
tipoExamen nvarchar(50) not null,
idHistoriaFK int not null
)engine=innoDB;
#---------------------------------------------------------------------------------------------------------------------------
/*crear tabla consulta_medica */
create table CONSULTA_MEDICA
(
idConsulta int auto_increment primary key not null,
horaAtencion datetime not null,
motivoConsulta text not null,
Enfermedad text not null,
idHistoriaFK int not null
)engine=innoDB;
#-----------------------------------------------------------------------------------------------------------------------------------
/*crear tabla DIAGNOSTICO */
create table DIAGNOSTICO
(
idDIAGNOSTICO int auto_increment primary key not null,
Descripcion text not null,
idConsultaFK int not null
)engine=innoDB;
#--------------------------------------------------------------------------------------------------------------------------------------------
/*relaciones*/
ALTER TABLE MEDICO ADD CONSTRAINT FK_Usuario foreign key (idUsuario) 
references USUARIO (idUsuario) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE AGENDA ADD CONSTRAINT FK_MedicoA foreign key (idMedicoFK) 
references MEDICO (idMedico) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE AGENDA ADD CONSTRAINT FK_PacienteA foreign key (idPacienteFK) 
references PACIENTE (idPaciente) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE PACIENTE ADD CONSTRAINT FK_UsuarioP foreign key (idUsuario) 
references USUARIO (idUsuario) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE HISTORIA_CLINICA ADD CONSTRAINT FK_PacienteH foreign key (idPaciente) 
references PACIENTE (idPaciente) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE EXAMEN ADD CONSTRAINT FK_Historia foreign key (idHistoriaFK) 
references HISTORIA_CLINICA (idHistoria) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE CONSULTA_MEDICA ADD CONSTRAINT FK_HistoriaC foreign key (idHistoriaFK) 
references HISTORIA_CLINICA (idHistoria) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE DIAGNOSTICO ADD CONSTRAINT FK_idConsulta foreign key (idConsultaFK) 
references CONSULTA_MEDICA (idConsulta) ON DELETE CASCADE ON UPDATE CASCADE;
#------------------------------------------------------------------------------------------------------------------------
/*insercciones*/
/*insertar datos en las columnas*/
INSERT into USUARIO values(1,'evelin','pelaez','evelin@gmail.com','3204148925','cll 23-34 sur','eve123','medico','activo');
INSERT into USUARIO values(2,'luna','jaramiyo','luna@gmail.com','3005082136','cll 23b n°27-34','lunalunera','medico','inactivo');
INSERT into USUARIO values(3,'andrea','morales','andrea@gmail.com','3108721231','kr 72c n° 27 este','neuroandre','medico','activo');
INSERT into USUARIO values(4,'sofia','mora','sofia@gmail.com','3124567432','diagonal 19 n° 27_2','chispita123','medico','inactivo');
INSERT into USUARIO values(5,'luis','mendez','luis@gmail.com','3102783640','cll 56f n° 34 oeste','luis1894367','medico','activo');
INSERT into USUARIO values(6,'valentina','aponte','valentina@outlook.es','3132134564','cll 89e n°52-35','vale1234765','paciente','activo');
INSERT into USUARIO values(7,'victor','vanegas','victory@gmail.com','3124832654','cll 56d n°52-36 este','47835843','paciente','inactivo');
INSERT into USUARIO values(8,'sebastian','mejia','sebastian@outlook.es','3113566789','carrera 52-35 sur','45twygdys','paciente','activo');
INSERT into USUARIO values(9,'julian','perez','julian@yahoo.es','3124571235','diagonal 56d n°52-35 oeste','qwert345','paciente','inactivo');
INSERT into USUARIO values(10,'daniel','rojas','daniel@gmail.es','3134526579','cll 56b n°57-35 sur','345ggr','paciente','activo');
INSERT into USUARIO values(11,'valentin','quevedo','valentin123@outlook.es','31378654567','cll 9e n°2-35','contraseña','paciente','activo');
INSERT into USUARIO values(12,'victoria','mendez','victoriahermosa@gmail.com','3145678943','KRA 56 n°52 este','gatitos','paciente','inactivo');
INSERT into USUARIO values(13,'pedro','guerrero','guerrero@outlook.es','3117778865','cll 52-35 sur','199989','paciente','activo');
INSERT into USUARIO values(14,'juliana','praez','julianapra@yahoo.es','3124766577','diagonal 56d n°52','20040123','paciente','inactivo');
INSERT into USUARIO values(15,'daniela','rojas','danielar@gmail.es','3144529879','cll 56b n°57-35 sur','latoureffiel','paciente','activo');
INSERT into USUARIO values(16,'lorena','vanegas','lorena@gmail.com','3124807976','cll 59d n°56-35 sur','6782004','secretaria','inactivo');
INSERT into USUARIO values(17,'lina','mejia','lina@gmail.com','3113567432','cll 59d n°56-35 norte','mejia1234','enfermera','activo');
INSERT into USUARIO values(19,'lina','Rojas','linarojas@gmail.com','3123577432','cll 59C n°56-45 sur','linroja234','paciente','activo');
select*from usuario;
/*insertar datos en las columnas*/

INSERT into MEDICO values('1023564496','luna','jaramiyo','3005082136','luna@gmail.com','6230','cardiologia','inactivo',2);
INSERT into MEDICO values('1073364393','andrea','morales','3108721231','andrea@gmail.com','4019','neurologia','activo',3);
INSERT into MEDICO values('1036123456','sofia','mora','3124567432','sofia@gmail.com','4756','cardiologia','inactivo',4);
INSERT into MEDICO values('1036345678','luis','mendez','3102783640','luis@gmail.com','7980','ginecologia','activo',5);

select*from MEDICO;
/*insertar datos en las columnas*/
INSERT into PACIENTE values('1023456754','valentina','aponte','cll 89e n°52-35 sur','3132134564','valentina@outlook.es','2004/07/13','activo',6);
INSERT into PACIENTE values('1035674356','victor','vanegas','cll 56d n°52-36 este','3124832654','victory@gmail.com','1998/04/23','inactivo',7);
INSERT into PACIENTE values('1045637823','sebastian','mejia','carrera 52-35 sur','3113566789','sebastian@outlook.es','1999/12/25','activo',8);
INSERT into PACIENTE values('23654945','julian','perez','diagonal 56d n°52-35 oeste','3124571235','julian@yahoo.es','2004/02/03','inactivo',9);
INSERT into PACIENTE values('1023454560','daniel','rojas','cll 56b n°57-35 sur','3134526579','daniel@gmail.es','2005/09/28','activo',10);
INSERT into PACIENTE values('102999765','valentin','quevedo','cll 9e n°2-35','31378654567','valentin123@outlook.es','1994/08/13','activo',11);
INSERT into PACIENTE values('1035888997','victoria','mendez','KRA 56 n°52 este','3145678943','victoriahermosa@gmail.com','1988/04/25','inactivo',12);
INSERT into PACIENTE values('1045644332','pedro','guerrero','cll 52-35 sur','3117778865','guerrero@outlook.es','1999/12/25','activo',13);
INSERT into PACIENTE values('1033445533','juliana','praez','diagonal 56d n°52','3124766577','julianapra@yahoo.es','2004/01/23','inactivo',14);
INSERT into PACIENTE values('1023346660','daniela','rojas','cll 56b n°57-35 sur','3144529879','danielar@gmail.es','2013/07/28','activo',15);
select*from paciente;
/*insertar datos en las columnas*/
INSERT into AGENDA values(1,'2020/07/13','2020-07-13 20:00:00','25','activo','1023364396','1023456754');
INSERT into AGENDA values(2,'2020/04/23','2020-04-23 10:00:00','28','inactivo','1023564496','1035674356');
INSERT into AGENDA values(3,'2019/12/25','2019-12-25 12:00:00','19','activo','1073364393','1045637823');
INSERT into AGENDA values(4,'2020/02/03','2020-02-03 14:00:00','12','inactivo','1036123456','23654945');
INSERT into AGENDA values(5,'2020/09/28','2020-09-28 16:00:00','31','inactivo','1036123456','1033445533');
INSERT into AGENDA values(6,'2020/04/13','2020-04-13 10:00:00','20','activo','1023364396','1023456754');
INSERT into AGENDA values(7,'2020/04/03','2020-04-03 10:00:00','29','inactivo','1023564496','1035674356');
INSERT into AGENDA values(8,'2021/12/25','2021-12-25 16:00:00','19','activo','1073364393','1045637823');
INSERT into AGENDA values(9,'2020/12/23','2020-12-23 15:00:00','12','inactivo','1023364396','23654945');
INSERT into AGENDA values(10,'2020/09/18','2020-09-18 13:00:00','31','inactivo','1073364393','1023346660');
select*from agenda;

/*insertar datos en las columnas*/
INSERT into HISTORIA_CLINICA values(1,1.60,120.7,'diabetes','fresas','artrosis','1023456754');
INSERT into HISTORIA_CLINICA values(2,1.30,74.89,'cancer','ibuprofeno','tiroides','1035674356');
INSERT into HISTORIA_CLINICA values(3,1.49,23.34,'anemia','leche','asma','1045637823');
INSERT into HISTORIA_CLINICA values(4,1.78,56.78,'tiroides','acido clorhidrico','asma','23654945');
INSERT into HISTORIA_CLINICA values(5,1.80,51.72,'artrosis','acetaminofen','neumonia','1023454560');
INSERT into HISTORIA_CLINICA values(6,1.65,80.7,'leucemia','maracuya','artrosis','102999765');
INSERT into HISTORIA_CLINICA values(7,1.56,64.89,'cancer','beclometasona','tiroides','1035888997');
INSERT into HISTORIA_CLINICA values(8,1.59,33.34,'anemia','sulfuro','diabetes','1045644332');
INSERT into HISTORIA_CLINICA values(9,1.88,57.78,'tiroides','acido clorhidrico','asma','1033445533');
INSERT into HISTORIA_CLINICA values(10,1.80,51.72,'artrosis','sulfuro','neumonia','1023346660');
select*from HISTORIA_CLINICA;
/*insertar datos en las columnas*/
INSERT into EXAMEN values(1,160000,'2020/07/13','muestra de sangre',1);
INSERT into EXAMEN values(2,130000,'2020/04/23','tiroides',2);
INSERT into EXAMEN values(3,50000,'2019/12/25','examen de heces',3);
INSERT into EXAMEN values(4,20000,'2020/02/03','rayos x',4);
INSERT into EXAMEN values(5,70000,'2020/09/28','examen de orina',5);
INSERT into EXAMEN values(6,220000,'2020/07/13','quimioterapia',6);
INSERT into EXAMEN values(7,30000,'2020/04/23','muestra de orina',7);
INSERT into EXAMEN values(8,110000,'2019/12/25','radiografia',8);
INSERT into EXAMEN values(9,30000,'2020/02/03','consulta general',9);
INSERT into EXAMEN values(10,70000,'2020/09/28','sesion psicologia',10);
select*from EXAMEN;
/*insertar datos en las columnas*/
INSERT into CONSULTA_MEDICA values(1,'2020-07-13 20:00:00','cansancio,desmayos','anemia',1);
INSERT into CONSULTA_MEDICA values(2,'2020-04-23 10:00:00','subida de peso y dolor en el cuello','tiroides',2);
INSERT into CONSULTA_MEDICA values(3,'2019-12-25 12:00:00','heces con sangre','hemorroides',3);
INSERT into CONSULTA_MEDICA values(4,'2020-02-03 14:00:00','tos con sangre','tumor',4);
INSERT into CONSULTA_MEDICA values(5,'2020-09-28 16:00:00','sangre en la orina','infeccion urinaria',5);
INSERT into CONSULTA_MEDICA values(6,'2020-04-13 10:00:00','cansancio,desmayos''anemia','leucemia',6);
INSERT into CONSULTA_MEDICA values(7,'2020-04-03 10:00:00','dolor en la espalda','problemas renales',7);
INSERT into CONSULTA_MEDICA values(8,'2021-12-25 16:00:00','ulceras estomacales graves','cancer estomacal',8);
INSERT into CONSULTA_MEDICA values(9,'2020-12-23 15:00:00','vision borrosa','migraña',9);
INSERT into CONSULTA_MEDICA values(10,'2020-09-18 13:00:00','inestabilidad emocional','ansiedad',10);
select*from CONSULTA_MEDICA;
/*insertar datos en las columnas*/
INSERT into DIAGNOSTICO values(1,'el paciente presenta signos de anemia',1);
INSERT into DIAGNOSTICO values(2,'el paciente presenta ensanchamiento de la glandula tiroidea',2);
INSERT into DIAGNOSTICO values(3,'el paciente presenta signos de hemorroides',3);
INSERT into DIAGNOSTICO values(4,'el paciente presenta signos de un masa en los pulmones',4);
INSERT into DIAGNOSTICO values(5,'el paciente presenta sangre en la orina y una infeccion urinaria',5);
INSERT into DIAGNOSTICO values(6,'el paciente presenta signos de leucemia',6);
INSERT into DIAGNOSTICO values(7,'el paciente presenta inflamacion renal',7);
INSERT into DIAGNOSTICO values(8,'el paciente presenta signos de cancer estomacal',8);
INSERT into DIAGNOSTICO values(9,'el paciente presenta migraña severa',9);
INSERT into DIAGNOSTICO values(10,'el paciente presenta un amplio marco de ansiedad',10);
select*from DIAGNOSTICO;
#--------------------------------------------------------------------------------------------------------------------
/*guia 7 */
/*ejercicios replace*/
replace into USUARIO values(1,'juana','roza','juana@gmail.com','3206677545','cll 23-34 ','juana123453','paciente','activo');
replace into USUARIO values(2,'juan','villanueva','aSFDGF@gmail.com','3209998545','KRA 24-34 ','3wedrafd','medico','activo');
replace into USUARIO values(5,'rosa','aponte','DHEFXa@gmail.com','3206798545','cll 93-78 norte ','dhvhxh123','enfermera','activo');
replace into USUARIO values(10,'miliana','suares','ASDFG34@gmail.com','3209877545','KRA 83-34 ','caramell','medico','activo');
replace into USUARIO values(11,'nicoll','rodriguez','ERTGYB@gmail.com','3298765545','cll 23d n°56-34 ','56734','secretaria','activo');
/*consultas generales y especificas*/
select*from USUARIO;
select*from DIAGNOSTICO;
select*from HISTORIA_CLINICA;
describe MEDICO;
select*from Paciente;
select*from AGENDA;
select nombreUsuario,apellidoUsuario from USUARIO where idusuario=15;
select nombreUsuario,apellidoUsuario,telefonoUsuario,direccionUsuario,correoUsuario from USUARIO where ApellidoUsuario='vanegas';
select descripcion from DIAGNOSTICO where idDIAGNOSTICO=1;
select descripcion,idDIAGNOSTICO from DIAGNOSTICO where idDIAGNOSTICO=3;
select idDIAGNOSTICO from DIAGNOSTICO where descripcion='el paciente presenta signos de anemia';
select idDIAGNOSTICO,descripcion from DIAGNOSTICO where descripcion='el paciente presenta un amplio marco de ansiedad';
select*from DIAGNOSTICO group by descripcion;
select idHistoria from HISTORIA_CLINICA where estatura=1.60;
select idHistoria from HISTORIA_CLINICA where peso=23.34;
select horaAtencion from CONSULTA_MEDICA where enfermedad='hemorroides';
select idHistoria,peso,estatura from HISTORIA_CLINICA where estatura=1.60;
select idHistoria,alergias,antecedentesFamiliares from HISTORIA_CLINICA where peso<50;
select motivoConsulta,horaAtencion from CONSULTA_MEDICA where enfermedad='hemorroides';
select idMedico,tarjetaProfesional from MEDICO where nombreMedico='sofia';
select nombrePaciente,idPaciente from PACIENTE where apellidoPaciente='rojas';
select horaAgenda from AGENDA where idAgenda=6;
select nombrePaciente,idPaciente,telefonoPaciente,direccionPaciente from PACIENTE where idPaciente='1035888997';
select telefonoMedico from MEDICO where idMedico=1023364396;
select especialidadMedico from MEDICO where nombreMedico='luna';
/*operadores relaciones y logicos.*/
select*from EXAMEN where valor=160000;
select*from EXAMEN where valor=70000 or valor<20000;
select*from CONSULTA_MEDICA where enfermedad='tiroides' or enfermedad='leucemia';
select*from CONSULTA_MEDICA where idConsulta not in(1,2,3,5);
select*from CONSULTA_MEDICA where idConsulta in(1,2,3,5);
select*from EXAMEN where valor<>20000;
select*from EXAMEN where valor<=100000;
select*from EXAMEN where valor>40000;
/*columnas calculadas*/
select tipoExamen,valor*2 from EXAMEN where idExamen=1;/*el valor de 2 muestras de sangre*/
select tipoExamen,valor/3 from EXAMEN where idExamen=2;/*el valor del examen de tiroides en 3 cuotas*/
select tipoExamen,valor*4 from EXAMEN where idExamen=10;/*el valor de 4 sesiones psicologicas*/
/*(like y not like)*/
select*from USUARIO where nombreUsuario like '_a%';
select*from PACIENTE where nombrePaciente like '_a%';
select*from MEDICO where especialidadMedico like '___________'; 
select*from USUARIO where apellidoUsuario like '__d%';
/*(having)*/
select idExamen,avg(valor) from EXAMEN group by valor having avg(valor>40000);
select idExamen,max(valor) from EXAMEN group by valor having max(valor<160000);
select idExamen,min(valor) from EXAMEN group by valor having min(valor>100000);
select idExamen,max(valor) from EXAMEN group by valor having max(valor);
select idExamen,min(valor) from EXAMEN group by idExamen having min(valor);
/*(GroupBy)*/
select*from USUARIO group by nombreUsuario;
select*from USUARIO group by idUsuario;
select*from USUARIO group by telefonoUsuario;
select*from MEDICO group by tarjetaProfesional;
select*from PACIENTE group by idPaciente;
/*actualizacion*/
/*usuario*/
update USUARIO set nombreUsuario='pepito' where idUsuario=12;
update USUARIO set telefonoUsuario='7786578987' where idUsuario=5;
update USUARIO set apellidoUsuario='diaz' where idUsuario=9;
update USUARIO set nombreUsuario='luna martina' where nombreUsuario='luna';
update USUARIO set nombreUsuario='nicolle' where idUsuario='8';
select*from usuario;
/*MEDICO*/
update MEDICO set nombreMedico='pepito' where idMedico='1023364396';
update MEDICO set tarjetaProfesional='7785' where idMedico='1073364393';
update MEDICO set apellidoMedico='perez' where idMedico='1036123456';
update MEDICO set nombreMedico='luna martina' where nombreMedico='luna';
update MEDICO set especialidadMedico='neurologia' where idMedico='1073364393';
select*from medico;
/*AGENDA*/
update AGENDA set consultorio='99' where idAgenda=1;
update AGENDA set consultorio='52' where idAgenda=10;
update AGENDA set consultorio='67' where idAgenda=7;
update AGENDA set consultorio='11' where idAgenda=3;
update AGENDA set consultorio='19' where idAgenda=5;
select*from agenda;
/*PACIENTE*/
update PACIENTE set apellidoPaciente='rodriguez' where idPaciente='1023456754';
update PACIENTE set nombrePaciente='juan' where idPaciente='1023346660';
update PACIENTE set nombrePaciente='victor' where idPaciente='1035888997';
update PACIENTE set telefonoPaciente='3125676656' where idPaciente='1045637823';
update PACIENTE set apellidoPaciente='perez' where idPaciente='1023454560';
select*from paciente;
/*HISTORIA_CLINICA*/
update HISTORIA_CLINICA set alergias='mostaza' where idHistoria=1;
update HISTORIA_CLINICA set alergias='acetaminofen' where idHistoria=10;
update HISTORIA_CLINICA set enfermedadesPadecidas='diabetes' where idHistoria=7;
update HISTORIA_CLINICA set peso=56 where idHistoria=3;
update HISTORIA_CLINICA set estatura=1.56 where idHistoria=5;
select*from HISTORIA_CLINICA;
/*EXAMEN*/
update EXAMEN set tipoExamen='colondoscopia' where idExamen=1;
update EXAMEN set tipoExamen='radiografia' where idExamen=10;
update EXAMEN set valor=56000 where idExamen=7;
update EXAMEN set valor=100000 where idExamen=3;
update EXAMEN set tipoExamen='coteo de plaquetas' where idExamen=5;
select*from examen;
/*CONSULTA_MEDICA*/
update CONSULTA_MEDICA set motivoConsulta='desmayos frecuentes' where idConsulta=1;
update CONSULTA_MEDICA set motivoConsulta='dolor de cabeza' where idConsulta=10;
update CONSULTA_MEDICA set Enfermedad='bulimia' where idConsulta=7;
update CONSULTA_MEDICA set Enfermedad='anorexia' where idConsulta=3;
update CONSULTA_MEDICA set motivoConsulta='diarrea' where idConsulta=5;
select*from CONSULTA_MEDICA;
/*DIAGNOSTICO*/
update DIAGNOSTICO set descripcion='el paciente presenta desmayos frecuentes' where idDIAGNOSTICO=1;
update DIAGNOSTICO set descripcion='el paciente presenta dolor de cabeza' where idDIAGNOSTICO=10;
update DIAGNOSTICO set descripcion='el paciente presenta bulimia' where idDIAGNOSTICO=7;
update DIAGNOSTICO set descripcion='el paciente presenta anorexia' where idDIAGNOSTICO=3;
update DIAGNOSTICO set descripcion='el paciente presenta diarrea' where idDIAGNOSTICO=5;
select*from diagnostico;
/*eliminacion de registros*/
delete from DIAGNOSTICO where idDIAGNOSTICO=7;
select*from diagnostico;
delete from EXAMEN where idExamen=7;
select*from examen;
delete from EXAMEN where idExamen=6;
select*from examen;
delete from DIAGNOSTICO where idDIAGNOSTICO=6;
select*from diagnostico;
delete from USUARIO where idUsuario=26;
select*from usuario;
/*OrderBy*/ 
select*from DIAGNOSTICO order by descripcion desc; 
select*from medico where idMedico='1073364393';
select*from medico;
select*from DIAGNOSTICO order by descripcion asc; 
select*from MEDICO order by idMedico desc;
select*from EXAMEN order by idExamen desc;
select*from EXAMEN order by tipoExamen asc;
select*from EXAMEN order by idExamen asc;
select*from PACIENTE order by nombrePaciente asc;
/*guia 8 consultas multitablas*/
select*from USUARIO,EXAMEN;
/*uso del Inner Join-consulta de base de datos relacionales  */

select a.horaAgenda,a.FechaAgenda,p.nombrePaciente,p.apellidoPaciente from Agenda as a inner join Paciente as p where a.idAgenda=4;
select d.descripcion,e.valor from DIAGNOSTICO as d inner join EXAMEN as e on d.idDIAGNOSTICO=e.idExamen;
select d.descripcion,e.valor,e.tipoExamen from DIAGNOSTICO as d inner join EXAMEN as e on d.idDIAGNOSTICO=e.idExamen where d.idDIAGNOSTICO=3;
/*uso del left Join-consulta de base de datos relacionales  */
select d.descripcion,e.valor,e.tipoExamen,e.fechaExamen from DIAGNOSTICO as d left join EXAMEN as e on d.idDIAGNOSTICO=e.idExamen;
select d.descripcion,e.valor,e.tipoExamen,e.fechaExamen from DIAGNOSTICO as d left join EXAMEN as e on d.idDIAGNOSTICO=e.idExamen where d.idDIAGNOSTICO=2;
/*uso del right Join-consulta de base de datos relacionales  */
select d.descripcion,e.valor,e.tipoExamen,e.fechaExamen from DIAGNOSTICO as d right join EXAMEN as e on d.idDIAGNOSTICO=e.idExamen;
select d.descripcion,e.valor,e.tipoExamen,e.fechaExamen from DIAGNOSTICO as d right join EXAMEN as e on d.idDIAGNOSTICO=e.idExamen where d.idDIAGNOSTICO=2;
/*uso del Inner Join-consulta de base de datos relacionales  */
select d.descripcion as DIAGNOSTICO,e.tipoExamen as EXAMEN from DIAGNOSTICO as D inner join EXAMEN as e on d.idDIAGNOSTICO=e.idExamen;
select d.descripcion,e.valor,e.tipoExamen,e.fechaExamen from DIAGNOSTICO as d inner join EXAMEN as e on d.idDIAGNOSTICO=e.idExamen 
inner join PACIENTE as p on e.idExamen<p.idPaciente where e.idExamen=5;
select*from PACIENTE union select*from MEDICO;
select tipoExamen,idExamen from EXAMEN where valor<(select avg(valor) from EXAMEN);
/*select usuario*/
select idUsuario,nombreUsuario,telefonoUsuario from USUARIO where idUsuario<=7;
select idUsuario,nombreUsuario,direccionUsuario from USUARIO where idUsuario=9;
select idUsuario,nombreUsuario,rolUsuario from USUARIO where idUsuario>14;
select idUsuario,nombreUsuario,correoUsuario from USUARIO where idUsuario=12;
select idUsuario,nombreUsuario,direccionUsuario,telefonoUsuario from USUARIO where idUsuario=8;
select idUsuario,nombreUsuario,apellidoUsuario from USUARIO where nombreUsuario='lorena';

select idMedico,idUsuarioFK,nombreMedico,correoMedico from MEDICO where idMedico='1036123456';
select idMedico,idUsuarioFK,nombreMedico,especialidadMedico from MEDICO where idMedico='1073364393';
select idMedico,nombreMedico,apellidoMedico from MEDICO where idMedico='1073364393';

select idPaciente,nombrePaciente,idUsuarioFK,apellidoPaciente from PACIENTE where idPaciente='1035888997';
select nombrePaciente,idUsuarioFK,apellidoPaciente,telefonoPaciente from PACIENTE where idPaciente='23654945';
select idPaciente,nombrePaciente,apellidoPaciente from PACIENTE where idPaciente='1035674356';
select idPaciente,nombrePaciente,apellidoPaciente,direccionPaciente from PACIENTE where idPaciente='1045644332';

select*from PACIENTE where nombrePaciente='julian';


select horaAgenda,idAgenda,consultorio from AGENDA where idAgenda=4;
select horaAgenda,fechaAgenda from AGENDA where idAgenda=5;
select horaAgenda,idMedicoFK from AGENDA where idAgenda=3;
select horaAgenda,idPacienteFK from AGENDA where idAgenda=8;
select horaAgenda from AGENDA where idAgenda=10;

select*from Agenda order by consultorio desc;
select*from agenda where idPacienteFK='1023346660';
select consultorio,idpacienteFK,horaAgenda from agenda where idMedicoFK='1036123456';
select*from AGENDA group by consultorio;
select estadoAgenda,consultorio,idPacienteFK from AGENDA where estadoAgenda='inactivo';

select*from historia_clinica where idHistoria=1;
select idHistoria,antecedentesFamiliares from historia_clinica where idHistoria=3;
select peso,estatura from historia_clinica where idHistoria=7;
select enfermedadesPadecidas from historia_clinica where idHistoria=4;
select Peso,Estatura,idPacienteFK from historia_clinica where idHistoria=2;

select peso,estatura,idPacienteFK from historia_clinica where peso<60;
select peso,estatura,idPacienteFK from historia_clinica where peso>30;
select peso,estatura,idPacienteFK from historia_clinica where estatura<1.50;

select valor from examen where idExamen=3;
select valor,tipoExamen from examen where idExamen=2;
select motivoConsulta from consulta_medica where enfermedad='tumor';

select motivoConsulta,enfermedad,horaAtencion from consulta_medica where idConsulta=3;
select enfermedad,horaAtencion from consulta_medica where idConsulta=1;
select idConsulta,motivoConsulta,enfermedad,horaAtencion from consulta_medica where idConsulta=4;
select motivoConsulta,enfermedad from consulta_medica where idConsulta=2;
select horaAtencion from consulta_medica where idConsulta=1;
select enfermedad,horaAtencion from consulta_medica where enfermedad like '%s'; 
select motivoConsulta,enfermedad from consulta_medica where enfermedad like '_______'; 

select*from DIAGNOSTICO where idConsultaFK>3;
select*from DIAGNOSTICO where idDiagnostico>=3;
select descripcion,idConsultaFK from DIAGNOSTICO where idDIAGNOSTICO>=2;
select idConsultaFK from DIAGNOSTICO where idDIAGNOSTICO<=7;
select descripcion from DIAGNOSTICO where idDIAGNOSTICO<=4;

select*from MEDICO where especialidadMedico like '%a'; 
select especialidadMedico from MEDICO where nombreMedico like '%a'; 
select idMedico,nombreMedico,apellidoMedico,telefonoMedico from MEDICO where apellidoMedico like '_______'; 
select*from medico where idUsuarioFK<4;

select*from PACIENTE where nombrePaciente like '%a'; 
select correoPaciente from PACIENTE where apellidoPaciente like '%a'; 
select idPaciente,nombrePaciente,apellidoPaciente,telefonoPaciente from Paciente where apellidoPaciente like '_______'; 
select*from PACIENTE where idUsuarioFK<8;

select*from AGENDA where estadoAgenda like '________'; 
select consultorio,idPacienteFK from AGENDA where idpacientefk like '%3'; 
select estadoAgenda,consultorio,idPacienteFK from AGENDA where idPacienteFK like '________'; 
select*from AGENDA where idAgenda>=8;
select consultorio,idPacienteFK from AGENDA where idpacientefk like '%5'; 
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select*from agenda, medico;
/*consultas multitabla*/
select m.idMedico,a.idAgenda,m.nombreMedico,m.especialidadMedico,a.fechaAgenda,a.horaAgenda from MEDICO as m inner join AGENDA as a where a.idAgenda=5;
#-------------------------------------------------------------------------------------------------------------------------
select d.descripcion,e.valor,e.tipoExamen,e.fechaExamen,u.idUsuario,u.estadoUsuario from DIAGNOSTICO as d
 inner join EXAMEN as e on d.idDIAGNOSTICO=e.idExamen inner join USUARIO as u on e.idExamen=u.idUsuario;
 #----------------------------------------------------------------------------------------------------------------------
select d.idDIAGNOSTICO,e.idExamen,e.valor,d.descripcion from DIAGNOSTICO as d left join
 EXAMEN as e on d.idDIAGNOSTICO=e.idExamen; 
  #----------------------------------------------------------------------------------------------------------------------
select d.descripcion,e.valor,e.tipoExamen,d.idDIAGNOSTICO from DIAGNOSTICO as d right join
 EXAMEN as e on d.idDIAGNOSTICO=e.idExamen where d.idDIAGNOSTICO=2;
  #----------------------------------------------------------------------------------------------------------------------
select d.descripcion,e.valor,e.tipoExamen,e.fechaExamen from DIAGNOSTICO as d inner join
 EXAMEN as e on d.idDIAGNOSTICO=e.idExamen;
  #----------------------------------------------------------------------------------------------------------------------
select m.idMedico,m.nombreMedico,m.apellidoMedico,m.correoMedico,e.fechaExamen,e.valor from MEDICO as m inner join
 EXAMEN as e where e.idExamen=3;
  #----------------------------------------------------------------------------------------------------------------------
select d.descripcion,e.valor,e.tipoExamen,m.idMedico,m.nombreMedico,m.apellidoMedico,
e.fechaExamen from DIAGNOSTICO as d inner join EXAMEN as e on d.idDIAGNOSTICO=e.idExamen
 inner join MEDICO as m where e.idExamen>5;
  #----------------------------------------------------------------------------------------------------------------------
select p.idPaciente,p.direccionPaciente,p.telefonoPaciente,p.nombrePaciente,d.idDIAGNOSTICO
from DIAGNOSTICO as d right join PACIENTE as p on d.idDIAGNOSTICO<4 where p.nombrepaciente='victor';
  #----------------------------------------------------------------------------------------------------------------------
select d.descripcion,e.valor,e.tipoExamen,e.fechaExamen from DIAGNOSTICO as d left join 
EXAMEN as e on d.idDIAGNOSTICO=e.idExamen right join USUARIO as u on e.idExamen=u.idUsuario where e.idExamen<3;
 #----------------------------------------------------------------------------------------------------------------------
/*subconsultas*/
select tipoExamen,idExamen from EXAMEN where valor<(select max(valor) from EXAMEN);
select tipoExamen,idExamen,valor,fechaExamen from EXAMEN where valor>(select avg(valor) from EXAMEN);
select apellidoMedico,nombreMedico,tarjetaProfesional from MEDICO where idMedico>(select min(idMedico) from MEDICO);
select apellidoPaciente,nombrePaciente,telefonoPaciente from PACIENTE where idPaciente<(select avg(idPaciente) from PACIENTE);
select tipoExamen,idExamen,valor,fechaExamen from EXAMEN where valor=(select min(valor) from EXAMEN);

/*vistas*/
create view vista1 as select tipoExamen,idExamen,valor from EXAMEN where valor>(select avg(valor) from EXAMEN);
create view vista2 as select idMedico,tarjetaProfesional from MEDICO where idMedico>3;
create view vista3 as select nombreUsuario from USUARIO  where nombreUsuario like '_a%';
create view vista4 as select idHistoria,alergias,antecedentesFamiliares from HISTORIA_CLINICA where peso<50;
create view vista5 as select tipoExamen,valor,fechaExamen from EXAMEN where valor=(select min(valor) from EXAMEN);
create view vista6 as select d.idDIAGNOSTICO,e.valor,e.tipoExamen,e.fechaExamen,p.nombrePaciente,p.apellidoPaciente from DIAGNOSTICO as d inner join EXAMEN as e on d.idDIAGNOSTICO=e.idExamen 
inner join PACIENTE as p;
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*PROCEDIMIENTOS ALMACENADOS TABLA USUARIO*/
/* PROCEDIMIENTOS ALMACENADO PARA INSERTAR  REGISTRO TABLA USUARIOS*/
delimiter $
create procedure insertaru (in nombreUsua nvarchar(50),in apellidoUsua nvarchar(50),
in correoUsua nvarchar(50),in telefonoUsua nvarchar(20),in direccionUsua nvarchar(50),in passwordUsua nvarchar(20),
in rolUsua nvarchar(20),in estadoUsua nvarchar(30))
begin
			insert into USUARIO (nombreUsuario,apellidoUsuario,correoUsuario,telefonoUsuario,direccionUsuario,
            passwordUsuario,rolUsuario,estadoUsuario) values (nombreUsua,apellidoUsua,correoUsua,telefonoUsua,direccionUsua,
            passwordUsua,rolUsua,estadoUsua);
end $
 /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO*/
call insertaru ('liliana','corredor','lilana@gmail.com','3112897393','cll 59d n°96-85 este','lilicorredor','enfermera','activo');
select*from usuario;

/*  PROCEDIMIENTOS ALMACENADO PARA ELIMINAR  REGISTRO TABLA USUARIOS*/
delimiter $
create procedure eliminaru (in idUsua int)
begin 
	delete from USUARIO where idUsuario=idUsua;
end $
 /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO*/
call eliminaru (18);
select*from usuario;

/* PROCEDIMIENTOS ALMACENADO PARA CONSULTAR REGISTRO TABLA USUARIOS*/
delimiter $
create procedure consultaru ()
begin 
        select* from USUARIO;
end $
      /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO*/   
call consultaru ();

/* PROCEDIMIENTOS ALMACENADO PARA CONSULTAR REGISTRO TABLA USUARIOS*/
delimiter $
create procedure consultarubyid (in idUsua int)
begin 
        SELECT nombreUsuario,apellidoUsuario,correoUsuario,telefonoUsuario,direccionUsuario
        ,passwordUsuario,rolUsuario,estadoUsuario FROM USUARIO WHERE idUsuario = idUsua;
end $

      /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO*/   
call consultarubyid (15);

/* PROCEDIMIENTOS ALMACENADO PARA ACTUALIZAR  REGISTRO TABLA USUARIOS*/
delimiter $
create procedure actualizaru (in idusua int,in nombreUsua nvarchar(50),in apellidoUsua nvarchar(50),in correoUsua nvarchar(50),
in telefonoUsua nvarchar(20),in direccionUsua nvarchar(50),in passwordUsua nvarchar(20),in rolUsua nvarchar(20),in estadoUsua nvarchar(30))
begin
			update  USUARIO  set nombreUsuario = nombreUsua,apellidoUsuario = apellidoUsua, correoUsuario = correoUsua,
            telefonoUsuario = telefonoUsua,direccionUsuario = direccionUsua,passwordUsuario = passwordUsua, rolUsuario = rolUsua,
            estadoUsuario= estadoUsua where  idUsuario =idusua;
end $
  /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO*/
call actualizaru(18, 'liliana', 'corredor', 'lilana@gmail.com', '3127897876', 'cll 59d n°96-85 este', 'lilicorredor','medico','inactivo');
select*from Usuario;



 select* from usuario;
 #---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 /*PROCEDIMIENTOS ALMACENADOS TABLA MEDICO*/
/* INSERTAR  REGISTRO*/
delimiter $
create procedure insertarm (in idMed nvarchar(12),in nombreMed nvarchar(50),in apellidoMed nvarchar(50),in telefonoMed nvarchar(20),
in correoMed nvarchar(100),in tarjetaPro nvarchar(50),in especialidadMed nvarchar(50),in estadoMed nvarchar(30),in idUsua int)
begin
			insert into MEDICO (idMedico,nombreMedico,apellidoMedico,telefonoMedico,correoMedico,tarjetaProfesional,especialidadMedico,
            estadoMedico,idUsuario) values (idMed,nombreMed,apellidoMed,telefonoMed,correoMed,tarjetaPro,especialidadMed,estadoMed,idUsua);
end $
call con_humberto_candia.insertarm('1023367777','evelin','pelaez','3204148925','evelin@gmail.com','8396','ginecologia','activo',1);

select*from medico;
/* ELIMINAR  REGISTRO*/
delimiter $
create procedure eliminarm (in idMed int)
begin 
	delete from MEDICO where idMedico=idMed;
end $

/*CONSULTAR REGISTRO*/
delimiter $
create procedure consultarm ()
begin 
        select* from MEDICO;
end $
        
/* ACTUALIZAR  REGISTRO*/
delimiter $
create procedure actualizarm (in idMed nvarchar(12),in nombreMed nvarchar(50),in apellidoMed nvarchar(50),in telefonoMed nvarchar(20),
in correoMed nvarchar(100),in tarjetaPro nvarchar(50),in especialidadMed nvarchar(50),in estadoMed nvarchar(30),in idUsua int)
begin
			update  MEDICO  set nombreMedico=nombreMed,apellidoMedico=apellidoMed,telefonoMedico=telefonoMed,correoMedico=correoMed,
            tarjetaProfesional=tarjetaPro,especialidadMedico=especialidadMed,estadoMedico=estadoMed,idUsuario=idUsua
            where  idMedico =idMed;
end $
 
 /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO*/
 
call insertarm ('1234565465','liliana','corredor','3127897876','lilana@gmail.com','8899','ginecologia','activo',18);
call actualizarm('1234565465','liliana','corredor','3127897876','lilana2345@gmail.com','1119','ginecologia','inactivo',18);
call consultarm ();
call eliminarm ('1234565465');

 select* from MEDICO;
 
/* PROCEDIMIENTOS ALMACENADO PARA CONSULTAR REGISTRO TABLA Medico*/
delimiter $
create procedure consultarmbyid (in idMed nvarchar(12))
begin 
        SELECT*FROM MEDICO WHERE idMedico = idMed;
end $

      /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO*/   
call consultarmbyid ('1023367777');
 #-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  /*PROCEDIMIENTOS ALMACENADOS TABLA AGENDA*/
/* INSERTAR  REGISTRO*/
delimiter $
create procedure insertara (in idAge int,in fechaAge date,in horaAge datetime,in consul nvarchar(2),in estadoAge nvarchar(30),in idMedFK nvarchar(12),in idPaciFK nvarchar(12))
begin
			insert into AGENDA (idAgenda,fechaAgenda,horaAgenda,consultorio,estadoAgenda,idMedicoFK,idPacienteFK) values (idAge,fechaAge,horaAge,consul,estadoAge,idMedFK,idPaciFK);
end $

/* ELIMINAR  REGISTRO*/
delimiter $
create procedure eliminara (in idAge int)
begin 
	delete from AGENDA where idAgenda=idAge;
end $

/*CONSULTAR REGISTRO*/
delimiter $
create procedure consultara (in idAge int)
begin 
        select* from AGENDA where idAgenda=idAge;
end $
        
/* ACTUALIZAR  REGISTRO*/
delimiter $
create procedure actualizara (in idAge int,in fechaAge date,in horaAge datetime,in consul nvarchar(2),in estadoAge nvarchar(30),in idMedFK nvarchar(12),in idPaciFK nvarchar(12))
begin
			update  AGENDA  set idAgenda=idAge,fechaAgenda=fechaAge,horaAgenda=horaAge,consultorio=consul,estadoAgenda=estadoAge,idMedicoFK=idMedFK,idPacienteFK=idPaciFK
            where  idAgenda =idAge;
end $
 
 /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO*/
 
call insertara (11,'2020/08/15','2020-08-15 10:00:00','28','activo','1023364396','1023456754');
call actualizara(11,'2020/08/16','2020-08-16 13:00:00','23','activo','1023364396','1023456754');
call consultara (11);
call eliminara (11);

 select* from AGENDA;
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  /*PROCEDIMIENTOS ALMACENADOS TABLA PACIENTE*/
/* INSERTAR  REGISTRO*/
delimiter $
create procedure insertarpa (in idPaci nvarchar(20),in nombrePaci nvarchar(50),in apellidoPaci nvarchar(50),
in direccionPaci nvarchar(100),in telefonoPaci nvarchar(20),in correoPaci nvarchar(100),in fechaNac date,
in estadoPac nvarchar(30),in idUsua int)
begin
			insert into PACIENTE (idPaciente,nombrePaciente,apellidoPaciente,direccionPaciente,telefonoPaciente,
            correoPaciente,fechaNacimiento,estadoPaciente,idUsuario) values (idPaci,nombrePaci,apellidoPaci,direccionPaci,
            telefonoPaci,correoPaci,fechaNac,estadoPac,idUsua);
end $

/* ELIMINAR  REGISTRO*/
delimiter $
create procedure eliminarpa (in idPaci int)
begin 
	delete from PACIENTE where idPaciente=idPaci;
end $

/*CONSULTAR REGISTRO*/
delimiter $
create procedure consultarpa ()
begin 
        select* from PACIENTE;
end $
        
/* ACTUALIZAR  REGISTRO*/
delimiter $
create procedure actualizarpa (in idPaci nvarchar(20),in nombrePaci nvarchar(50),in apellidoPaci nvarchar(50),
in direccionPaci nvarchar(100),in telefonoPaci nvarchar(20),in correoPaci nvarchar(100),in fechaNac date,
in estadoPac nvarchar(30),in idUsua int)
begin
			update  PACIENTE  set nombrePaciente=nombrePaci,apellidoPaciente=apellidoPaci,direccionPaciente=direccionPaci,
            telefonoPaciente=telefonoPaci,correoPaciente=correoPaci,fechaNacimiento=fechaNac,estadoPaciente=estadoPac,idUsuario=idUsua
            where  idPaciente =idPaci;
end $
 
 /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO*/
 
call insertarpa ('1023888997','juana','mendez','cll 56f n°57-36 este','3102343343','juanitauwu@gmail.es','2003/08/28','activo',18);
call actualizarpa('1023888997','juana daniela','mendez','cll 56f n°57-36 este','3124565676','juanitamendez@gmail.es','2003/08/28','activo',18);
call consultarpa ();
call eliminarpa ('1023888997');



 select* from PACIENTE;
 
 delimiter $
create procedure consultarpbyid (in idPa nvarchar(12))
begin 
        SELECT*FROM PACIENTE WHERE idPaciente = idPa;
end $

      /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO*/   
call consultarpbyid ('1023888997');
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  /*PROCEDIMIENTOS ALMACENADOS TABLA HISTORIA_CLINICA*/
/* INSERTAR  REGISTRO*/
delimiter $
create procedure insertarh (in idHist int,in Estat double,in Pes double,in antecedentesFam text,in alerg text,in enfermedadesPad text,in idPaciFK nvarchar(12))
begin
			insert into HISTORIA_CLINICA (idHistoria,Estatura,Peso,antecedentesFamiliares,alergias,enfermedadesPadecidas,idPacienteFK) values (idHist,Estat,Pes,antecedentesFam,alerg,enfermedadesPad,idPaciFK);
end $

/* ELIMINAR  REGISTRO*/
delimiter $
create procedure eliminarh (in idHist int)
begin 
	delete from HISTORIA_CLINICA where idHistoria=idHist;
end $

/*CONSULTAR REGISTRO*/
delimiter $
create procedure consultarh (in idHist int)
begin 
        select* from HISTORIA_CLINICA where idHistoria=idHist;
end $
        
/* ACTUALIZAR  REGISTRO*/
delimiter $
create procedure actualizarh (in idHist int,in Estat double,in Pes double,in antecedentesFam text,in alerg text,in enfermedadesPad text,in idPaciFK nvarchar(12))
begin
			update  HISTORIA_CLINICA  set Estatura=Estat,Peso=Pes,antecedentesFamiliares=antecedentesFam,alergias=alerg,enfermedadesPadecidas=enfermedadesPad,idPacienteFK=idPaciFK
            where  idHistoria =idHist;
end $
 
 /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO */
 
call insertarh (11,1.85,55.72,'artrosis','sulfuro','neumonia',1035674356);
call actualizarh(11,1.90,45.72,'artrosis','sulfuro','neumonia',1035674356);
call consultarh (11);
call eliminarh (11);

 select* from HISTORIA_CLINICA;
 
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  /*PROCEDIMIENTOS ALMACENADOS TABLA EXAMEN*/
/* INSERTAR  REGISTRO EN LA TABLA EXAMEN*/
delimiter $
create procedure insertare (in idexam int,in val numeric,in fechaExam date,in tipoExam nvarchar(50),in idHistFK int)
begin
			insert into EXAMEN (idexamen,valor,fechaExamen,tipoExamen,idHistoriaFK) values (idexam,val,fechaExam,tipoExam,idHistFK);
end $

 /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO*/
 
call insertare (11,165000,'2019/07/13','muestra de sangre',1);
select*from examen;
/* ELIMINAR  REGISTRO*/
delimiter $
create procedure eliminare (in idexam int)
begin 
	delete from EXAMEN where idexamen=idexam;
end $

/*CONSULTAR REGISTRO*/
delimiter $
create procedure consultare (in idexam int)
begin 
        select* from EXAMEN where idexamen=idexam;
end $
        
/* ACTUALIZAR  REGISTRO TABLA EXAMEN*/
delimiter $
create procedure actualizarhe (in idexam int,in val numeric,in fechaExam date,in tipoExam nvarchar(50),in idHistFK int)
begin
			update  EXAMEN  set idexamen=idexam,valor=val,fechaExamen=fechaExam,tipoExamen=tipoExam,idHistoriaFK=idHistFK
            where  idexamen =idexam;
end $
 /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO*/
call actualizarhe(11,165000,'2019/07/13','muestra de orina',1);
SELECT*FROM EXAMEN;
 
 /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO*/
 
call insertare (11,165000,'2019/07/13','muestra de sangre',1);
call actualizarhe(11,165000,'2019/07/13','muestra de orina',1);
call consultare (11);
call eliminare (11);

 select* from EXAMEN;
 #-------------------------------------------------------------------------------------------------------------------------------------------
 /*PROCEDIMIENTOS ALMACENADOS TABLA CONSULTA_MEDICA*/
/* INSERTAR  REGISTRO*/
delimiter $
create procedure insertarc (in idCons int,in horaAten datetime,in motivoCons text,in Enferm text,in idHistFK int )
begin
			insert into CONSULTA_MEDICA (idConsulta,horaAtencion,motivoConsulta,Enfermedad,idHistoriaFK) values (idCons,horaAten,motivoCons,Enferm,idHistFK);
end $

/* ELIMINAR  REGISTRO*/
delimiter $
create procedure eliminarc (in idCons int)
begin 
	delete from CONSULTA_MEDICA where idConsulta=idCons;
end $

/*CONSULTAR REGISTRO*/
delimiter $
create procedure consultarc (in idCons int)
begin 
        select* from CONSULTA_MEDICA where idConsulta=idCons;
end $
        
/* ACTUALIZAR  REGISTRO*/
delimiter $
create procedure actualizarc (in idCons int,in horaAten datetime,in motivoCons text,in Enferm text,in idHistFK int )
begin
			update  CONSULTA_MEDICA  set idConsulta=idCons,horaAtencion=horaAten,motivoConsulta=motivoCons,Enfermedad=Enferm,idHistoriaFK=idHistFK
            where  idConsulta =idCons;
end $
 
 /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO */
 
call insertarc (11,'2020-09-18 13:00:00','depresion','ansiedad',11);
call actualizarc(11,'2020-09-18 17:00:00','inestabilidad emocional','depresion',11);
call consultarc (11);
call eliminarc (11);

 select* from CONSULTA_MEDICA;
 #--------------------------------------------------------------------------------------------------------------------------------------------------------

/*PROCEDIMIENTOS ALMACENADOS TABLA DIAGNOSTICO*/
/* INSERTAR  REGISTRO*/
delimiter $
create procedure insertard (in idDIAG int,in Descrip text,in idConsFK int )
begin
			insert into DIAGNOSTICO (idDIAGNOSTICO,Descripcion,idConsultaFK) values (idDIAG,Descrip,idConsFK); 
end $

/* ELIMINAR  REGISTRO*/
delimiter $
create procedure eliminard (in idDIAG int)
begin 
	delete from DIAGNOSTICO where idDIAGNOSTICO=idDIAG;
end $

/*CONSULTAR REGISTRO*/
delimiter $
create procedure consultard (in idDIAG int)
begin 
        select* from DIAGNOSTICO where idDIAGNOSTICO=idDIAG;
end $
        
/* ACTUALIZAR  REGISTRO*/
delimiter $
create procedure actualizard (in idDIAG int,in Descrip text,in idConsFK int)
begin
			update  DIAGNOSTICO  set idDIAGNOSTICO=idDIAG,Descripcion=Descrip,idConsultaFK=idConsFK
            where  idDIAGNOSTICO =idDIAG;
end $
 
 /*HACER EL LLAMADO DEL PROCEDIMIENTO ALMACENADO*/
 
call insertard (11,'el paciente presenta un amplio marco de ansiedad y depresion',11);
call actualizard(11,'el paciente presenta un amplio marco de ansiedad',11);
call consultard (11);
call eliminard (11);

 select* from DIAGNOSTICO;
 
 #-------------------------------------------------------------------------------------------------------------------------------------
 /*TRIGGERS*/
 /*TABLA USUARIO*/
 CREATE TABLE REG_USUARIO
(
idUsuario int,
nombreUsuario nvarchar(50),
apellidoUsuario nvarchar(50),
correoUsuario nvarchar(50),
telefonoUsuario nvarchar(20),
direccionUsuario nvarchar(50),
passwordUsuario nvarchar(20),
rolUsuario nvarchar(20),
estadoUsuario nvarchar(30)
);
/*AI AFTER DE LA INSERCION*/
CREATE TRIGGER USUARIO_AI after insert on  USUARIO for each row insert into REG_USUARIO (idUsuario,nombreUsuario,apellidoUsuario,correoUsuario,telefonoUsuario,direccionUsuario,passwordUsuario,rolUsuario,estadoUsuario)
values (new.idUsuario,new.nombreUsuario,new.apellidoUsuario,new.correoUsuario,new.telefonoUsuario,new.direccionUsuario,new.passwordUsuario,new.rolUsuario,new.estadoUsuario);

insert into USUARIO values(19,'luna','mejia','luna@gmail.com','3217867876','kr 59d n°56-35 este','luna12eed','enfermera','activo');
insert into USUARIO values(20,'juana','diaz','diazj@gmail.com','3103535354','cll 58o n°56-39 sur','juanitauwu','paciente','activo');

select*from USUARIO;
select*from REG_USUARIO;
#------------------------------------------------------------------------------------------------------------------
CREATE TABLE USUARIO_ACTUALIZADO
(
anterior_idUsuario int,
anterior_nombreUsuario nvarchar(50),
anterior_apellidoUsuario nvarchar(50),
anterior_correoUsuario nvarchar(50),
anterior_telefonoUsuario nvarchar(20),
anterior_direccionUsuario nvarchar(50),
anterior_passwordUsuario nvarchar(20),
anterior_rolUsuario nvarchar(20),
anterior_estadoUsuario nvarchar(30),
nuevo_idUsuario int,
nuevo_nombreUsuario nvarchar(50),
nuevo_apellidoUsuario nvarchar(50),
nuevo_correoUsuario nvarchar(50),
nuevo_telefonoUsuario nvarchar(20),
nuevo_direccionUsuario nvarchar(50),
nuevo_passwordUsuario nvarchar(20),
nuevo_rolUsuario nvarchar(20),
nuevo_estadoUsuario nvarchar(30)
);

/*BEFORE UPDATE*/
CREATE TRIGGER ACTUALIZA_BU before update on USUARIO for each row
insert into USUARIO_ACTUALIZADO (anterior_idUsuario,anterior_nombreUsuario,anterior_apellidoUsuario,anterior_correoUsuario,anterior_telefonoUsuario,anterior_direccionUsuario,anterior_passwordUsuario,
anterior_rolUsuario,anterior_estadoUsuario,nuevo_idUsuario,nuevo_nombreUsuario,nuevo_apellidoUsuario,nuevo_correoUsuario,nuevo_telefonoUsuario,nuevo_direccionUsuario,nuevo_passwordUsuario,nuevo_rolUsuario,nuevo_estadoUsuario)
values 
(old.idUsuario,old.nombreUsuario,old.apellidoUsuario,old.correoUsuario,old.telefonoUsuario,old.direccionUsuario,old.passwordUsuario,
old.rolUsuario,old.estadoUsuario,new.idUsuario,new.nombreUsuario,new.apellidoUsuario,new.correoUsuario,new.telefonoUsuario,new.direccionUsuario,new.passwordUsuario,new.rolUsuario,new.estadoUsuario);

update  usuario set nombreUsuario='diana' where idUsuario=6; /*condicion de actualizacion*/

select*from USUARIO_ACTUALIZADO ;
#------------------------------------------------------------------------------------------------------------------
CREATE TABLE USUARIO_ELIMINADO
(
idUsuario int not null,
nombreUsuario nvarchar(50),
apellidoUsuario nvarchar(50),
correoUsuario nvarchar(50),
telefonoUsuario nvarchar(20),
direccionUsuario nvarchar(50),
passwordUsuario nvarchar(20),
rolUsuario nvarchar(20),
estadoUsuario nvarchar(30)
);

create trigger ELIMUSUARIO_AD after delete on USUARIO for each row
insert into USUARIO_ELIMINADO (idUsuario,nombreUsuario,apellidoUsuario,correoUsuario,telefonoUsuario,direccionUsuario,passwordUsuario,rolUsuario,estadoUsuario,usuario,fecha_modif)
values (old.idUsuario,old.nombreUsuario,old.apellidoUsuario,old.correoUsuario,old.telefonoUsuario,old.direccionUsuario,old.passwordUsuario,old.rolUsuario,old.estadoUsuario,current_user,now());
alter table USUARIO_ELIMINADO add column (usuario varchar(15),fecha_modif date);
delete from USUARIO where idUsuario = 24;

select* from USUARIO_ELIMINADO;
select*from USUARIO;
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*TABLA MEDICO*/
 CREATE TABLE REG_MEDICO
(
idMedico nvarchar(12),
nombreMedico nvarchar(50),
apellidoMedico nvarchar(50),
telefonoMedico nvarchar(20),
correoMedico nvarchar(100),
tarjetaProfesional nvarchar(50),
especialidadMedico nvarchar(50),
estadoMedico nvarchar(30),
idUsuarioFK int
);
/*AI AFTER DE LA INSERCION*/
CREATE TRIGGER MEDICO_AI after insert on  MEDICO for each row insert into REG_MEDICO (idMedico,nombreMedico,apellidoMedico,telefonoMedico,correoMedico,tarjetaProfesional,especialidadMedico,estadoMedico,idUsuarioFK)
values (new.idMedico,new.nombreMedico,new.apellidoMedico,new.telefonoMedico,new.correoMedico,new.tarjetaProfesional,new.especialidadMedico,new.estadoMedico,new.idUsuarioFK);
INSERT into MEDICO values('1077773456','sofia','nuñes','3190897432','sofianuñez@gmail.com','4759','cardiologia','inactivo',12);
INSERT into MEDICO values('1039898678','juan','mendez','3167883640','juaitopp@gmail.com','7990','ginecologia','activo',13);

select*from MEDICO;
select*from REG_MEDICO;
#------------------------------------------------------------------------------------------------------------------
CREATE TABLE MEDICO_ACTUALIZADO
(
anterior_idMedico nvarchar(12),
anterior_nombreMedico nvarchar(50),
anterior_apellidoMedico nvarchar(50),
anterior_telefonoMedico nvarchar(20),
anterior_correoMedico nvarchar(100),
anterior_tarjetaProfesional nvarchar(50),
anterior_especialidadMedico nvarchar(50),
anterior_estadoMedico nvarchar(30),
anterior_idUsuarioFK int,
nuevo_idMedico nvarchar(12),
nuevo_nombreMedico nvarchar(50),
nuevo_apellidoMedico nvarchar(50),
nuevo_telefonoMedico nvarchar(20),
nuevo_correoMedico nvarchar(100),
nuevo_tarjetaProfesional nvarchar(50),
nuevo_especialidadMedico nvarchar(50),
nuevo_estadoMedico nvarchar(30),
nuevo_idUsuarioFK int
);
/*BEFORE UPDATE*/
CREATE TRIGGER ACTUALIZA_BM before update on MEDICO for each row
insert into MEDICO_ACTUALIZADO (anterior_idMedico,anterior_nombreMedico,anterior_apellidoMedico,anterior_telefonoMedico,anterior_correoMedico,anterior_tarjetaProfesional,anterior_especialidadMedico,anterior_estadoMedico,anterior_idUsuarioFK,nuevo_idMedico,nuevo_nombreMedico,nuevo_apellidoMedico,nuevo_telefonoMedico,nuevo_correoMedico,nuevo_tarjetaProfesional,nuevo_especialidadMedico,nuevo_estadoMedico,nuevo_idUsuarioFK)
values 
(old.idMedico,old.nombreMedico,old.apellidoMedico,old.telefonoMedico,old.correoMedico,old.tarjetaProfesional,old.especialidadMedico,old.estadoMedico,old.idUsuarioFK,new.idMedico,new.nombreMedico,new.apellidoMedico,new.telefonoMedico,new.correoMedico,new.tarjetaProfesional,new.especialidadMedico,new.estadoMedico,new.idUsuarioFK);

update  MEDICO set nombreMedico='juana' where idMedico='1036123456'; /*condicion de actualizacion*/

select*from MEDICO_ACTUALIZADO ;
#------------------------------------------------------------------------------------------------------------------
CREATE TABLE MEDICO_ELIMINADO
(
idMedico nvarchar(12),
nombreMedico nvarchar(50),
apellidoMedico nvarchar(50),
telefonoMedico nvarchar(20),
correoMedico nvarchar(100),
tarjetaProfesional nvarchar(50),
especialidadMedico nvarchar(50),
estadoMedico nvarchar(30),
idUsuarioFK int
);

create trigger ELIMMEDICO_AD after delete on MEDICO for each row
insert into MEDICO_ELIMINADO (idMedico,nombreMedico,apellidoMedico,telefonoMedico,correoMedico,tarjetaProfesional,especialidadMedico,estadoMedico,idUsuarioFK)
values (old.idMedico,old.nombreMedico,old.apellidoMedico,old.telefonoMedico,old.correoMedico,old.tarjetaProfesional,old.especialidadMedico,old.estadoMedico,old.idUsuarioFK,current_user,now());
alter table MEDICO_ELIMINADO add column (usuario varchar(15),fecha_modif date);
delete from MEDICO where idMedico = '1023564496';
select* from MEDICO_ELIMINADO;
select*from MEDICO;
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*TABLA AGENDA*/

 CREATE TABLE REG_AGENDA
(idAgenda int,
fechaAgenda date,
horaAgenda datetime ,
consultorio nvarchar(2),
estadoAgenda nvarchar(30),
idMedicoFK nvarchar(12),
idPacienteFK nvarchar(12)
);
/*AI AFTER DE LA INSERCION*/
CREATE TRIGGER AGENDA_AI after insert on  AGENDA for each row insert into REG_AGENDA (idAgenda,fechaAgenda,horaAgenda,consultorio,
estadoAgenda,idMedicoFK,idPacienteFK)
values (new.idAgenda,new.fechaAgenda,new.horaAgenda,new.consultorio,new.estadoAgenda,new.idMedicoFK,new.idPacienteFK);
INSERT into AGENDA values(11,'2020/08/15','2020-08-15 10:00:00','28','activo','1023364396','1023456754');


select*from AGENDA;
select*from REG_AGENDA;
#------------------------------------------------------------------------------------------------------------------
CREATE TABLE AGENDA_ACTUALIZADA
(
anterior_idAgenda int,
anterior_fechaAgenda date,
anterior_horaAgenda datetime ,
anterior_consultorio nvarchar(2),
anterior_estadoAgenda nvarchar(30),
anterior_idMedicoFK nvarchar(12),
anterior_idPacienteFK nvarchar(12),
nuevo_idAgenda int,
nuevo_fechaAgenda date,
nuevo_horaAgenda datetime ,
nuevo_consultorio nvarchar(2),
nuevo_estadoAgenda nvarchar(30),
nuevo_idMedicoFK nvarchar(12),
nuevo_idPacienteFK nvarchar(12)
);
/*BEFORE UPDATE*/
CREATE TRIGGER ACTUALIZA_BAG before update on AGENDA for each row
insert into AGENDA_ACTUALIZADA (anterior_idAgenda,anterior_fechaAgenda,anterior_horaAgenda,anterior_consultorio,
anterior_estadoAgenda,anterior_idMedicoFK,anterior_idPacienteFK,nuevo_idAgenda,nuevo_fechaAgenda,nuevo_horaAgenda,nuevo_consultorio,
nuevo_estadoAgenda,nuevo_idMedicoFK,nuevo_idPacienteFK)
values 
(old.idAgenda,old.fechaAgenda,old.horaAgenda,old.consultorio,old.estadoAgenda,old.idMedicoFK,old.idPacienteFK,new.idAgenda,
new.fechaAgenda,new.horaAgenda,new.consultorio,new.estadoAgenda,new.idMedicoFK,new.idPacienteFK);

update  AGENDA set consultorio='56' where idAgenda=4; /*condicion de actualizacion*/

select*from AGENDA_ACTUALIZADA ;
 delete from usuario where idUsuario=23
CREATE TABLE AGENDA_ELIMINADA
(
idAgenda int,
fechaAgenda date,
horaAgenda datetime ,
consultorio nvarchar(2),
estadoAgenda nvarchar(30),
idMedicoFK nvarchar(12),
idPacienteFK nvarchar(12)
);

create trigger ELIMAGENDA_AD after delete on AGENDA for each row
insert into AGENDA_ELIMINADA (idAgenda,fechaAgenda,horaAgenda,consultorio,estadoAgenda,idMedicoFK,idPacienteFK,usuario,fecha_modif)
values (old.idAgenda,old.fechaAgenda,old.horaAgenda,old.consultorio,old.estadoAgenda,old.idMedicoFK,old.idPacienteFK,current_user,now());
alter table AGENDA_ELIMINADA add column (usuario varchar(15),fecha_modif date);
delete from AGENDA where idAgenda=4;

select* from AGENDA_ELIMINADA;
select*from AGENDA;
#-----------------------------------------------------------------------------------------------------------------------------------------------------
/*TABLA PACIENTE*/
 CREATE TABLE REG_PACIENTE
(idPaciente nvarchar(20) ,
nombrePaciente nvarchar(50),
apellidoPaciente nvarchar(50),
direccionPaciente nvarchar(100),
telefonoPaciente nvarchar(20),
correoPaciente nvarchar(100),
fechaNacimiento date,
estadoPaciente nvarchar(30),
idUsuarioFK int
);
/*AI AFTER DE LA INSERCION*/
CREATE TRIGGER PACIENTE_AI after insert on  PACIENTE for each row insert into REG_PACIENTE (idPaciente,nombrePaciente,apellidoPaciente,direccionPaciente,telefonoPaciente,correoPaciente,fechaNacimiento,estadoPaciente,idUsuarioFK)
values (new.idPaciente,new.nombrePaciente,new.apellidoPaciente,new.direccionPaciente,new.telefonoPaciente,new.correoPaciente,new.fechaNacimiento,new.estadoPaciente,new.idUsuarioFK);
INSERT into PACIENTE values('1023888997','juana','mendez','cll 56f n°57-36 este','3102343343','juanitauwu@gmail.es','2003/08/28','activo',17);


select*from PACIENTE;
select*from REG_PACIENTE;
#------------------------------------------------------------------------------------------------------------------
CREATE TABLE PACIENTE_ACTUALIZADO
(
anterior_idPaciente nvarchar(20) ,
anterior_nombrePaciente nvarchar(50),
anterior_apellidoPaciente nvarchar(50),
anterior_direccionPaciente nvarchar(100),
anterior_telefonoPaciente nvarchar(20),
anterior_correoPaciente nvarchar(100),
anterior_fechaNacimiento date,
anterior_estadoPaciente nvarchar(30),
anterior_idUsuarioFK int,
nuevo_idPaciente nvarchar(20) ,
nuevo_nombrePaciente nvarchar(50),
nuevo_apellidoPaciente nvarchar(50),
nuevo_direccionPaciente nvarchar(100),
nuevo_telefonoPaciente nvarchar(20),
nuevo_correoPaciente nvarchar(100),
nuevo_fechaNacimiento date,
nuevo_estadoPaciente nvarchar(30),
nuevo_idUsuarioFK int
);
/*BEFORE UPDATE*/
CREATE TRIGGER ACTUALIZA_BPA before update on PACIENTE for each row
insert into PACIENTE_ACTUALIZADO (anterior_idPaciente,anterior_nombrePaciente,anterior_apellidoPaciente,anterior_direccionPaciente,anterior_telefonoPaciente,anterior_correoPaciente,anterior_fechaNacimiento,anterior_estadoPaciente,anterior_idUsuarioFK,nuevo_idPaciente,nuevo_nombrePaciente,nuevo_apellidoPaciente,nuevo_direccionPaciente,nuevo_telefonoPaciente,nuevo_correoPaciente,nuevo_fechaNacimiento,nuevo_estadoPaciente,nuevo_idUsuarioFK)
values 
(old.idPaciente,old.nombrePaciente,old.apellidoPaciente,old.direccionPaciente,old.telefonoPaciente,old.correoPaciente,old.fechaNacimiento,old.estadoPaciente,old.idUsuarioFK,new.idPaciente,new.nombrePaciente,new.apellidoPaciente,new.direccionPaciente,new.telefonoPaciente,new.correoPaciente,new.fechaNacimiento,new.estadoPaciente,new.idUsuarioFK);

update  PACIENTE set apellidoPaciente='mendez' where idPaciente='1023454560'; /*condicion de actualizacion*/
select*from PACIENTE;
select*from PACIENTE_ACTUALIZADO ;

CREATE TABLE PACIENTE_ELIMINADO
(
idPaciente nvarchar(20) ,
nombrePaciente nvarchar(50),
apellidoPaciente nvarchar(50),
direccionPaciente nvarchar(100),
telefonoPaciente nvarchar(20),
correoPaciente nvarchar(100),
fechaNacimiento date,
estadoPaciente nvarchar(30),
idUsuarioFK int
);

create trigger ELIMPaciente_AD after delete on PACIENTE for each row
insert into PACIENTE_ELIMINADO (idPaciente,nombrePaciente,apellidoPaciente,direccionPaciente,telefonoPaciente,correoPaciente,fechaNacimiento,estadoPaciente,idUsuarioFK,usuario,fecha_modif)
values (old.idPaciente,old.nombrePaciente,old.apellidoPaciente,old.direccionPaciente,old.telefonoPaciente,old.correoPaciente,old.fechaNacimiento,old.estadoPaciente,old.idUsuarioFK,current_user,now());
alter table PACIENTE_ELIMINADO add column (usuario varchar(15),fecha_modif date);
delete from PACIENTE where idPaciente='1023454560';

select* from PACIENTE_ELIMINADO;
select*from PACIENTE;
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*TABLA HISTORIA_CLINICA*/

 CREATE TABLE REG_HISTORIA_CLINICA
(idHistoria int,
Estatura double,
Peso double,
antecedentesFamiliares text,
alergias text,
enfermedadesPadecidas text,
idPacienteFK nvarchar(12)
);
/*AI AFTER DE LA INSERCION*/
CREATE TRIGGER HISTORIA_CLINICA_AI after insert on  HISTORIA_CLINICA for each row insert into REG_HISTORIA_CLINICA (idHistoria,Estatura,Peso,antecedentesFamiliares,alergias,enfermedadesPadecidas,idPacienteFK)
values (new.idHistoria,new.Estatura,new.Peso,new.antecedentesFamiliares,new.alergias,new.enfermedadesPadecidas,new.idPacienteFK);
INSERT into HISTORIA_CLINICA values(11,1.85,55.72,'artrosis','sulfuro','neumonia',1035674356);


select*from HISTORIA_CLINICA;
select*from REG_HISTORIA_CLINICA;
#------------------------------------------------------------------------------------------------------------------
CREATE TABLE HISTORIA_CLINICA_ACTUALIZADA
(
anterior_idHistoria int,
anterior_Estatura double,
anterior_Peso double,
anterior_antecedentesFamiliares text,
anterior_alergias text,
anterior_enfermedadesPadecidas text,
anterior_idPacienteFK nvarchar(12),
nuevo_idHistoria int,
nuevo_Estatura double,
nuevo_Peso double,
nuevo_antecedentesFamiliares text,
nuevo_alergias text,
nuevo_enfermedadesPadecidas text,
nuevo_idPacienteFK nvarchar(12)
);
/*BEFORE UPDATE*/
CREATE TRIGGER ACTUALIZA_BHC before update on HISTORIA_CLINICA for each row
insert into HISTORIA_CLINICA_ACTUALIZADA (anterior_idHistoria,anterior_Estatura,anterior_Peso,anterior_antecedentesFamiliares,anterior_alergias,anterior_enfermedadesPadecidas,anterior_idPacienteFK,nuevo_idHistoria,nuevo_Estatura,nuevo_Peso,nuevo_antecedentesFamiliares,nuevo_alergias,nuevo_enfermedadesPadecidas,nuevo_idPacienteFK)
values 
(old.idHistoria,old.Estatura,old.Peso,old.antecedentesFamiliares,old.alergias,old.enfermedadesPadecidas,old.idPacienteFK,new.idHistoria,new.Estatura,new.Peso,new.antecedentesFamiliares,new.alergias,new.enfermedadesPadecidas,new.idPacienteFK);

update  HISTORIA_CLINICA set alergias='ibuprofeno' where idHistoria=3; /*condicion de actualizacion*/
select*from HISTORIA_CLINICA;
select*from HISTORIA_CLINICA_ACTUALIZADA ;

CREATE TABLE HISTORIA_CLINICA_ELIMINADA
(
idHistoria int,
Estatura double,
Peso double,
antecedentesFamiliares text,
alergias text,
enfermedadesPadecidas text,
idPacienteFK nvarchar(12)
);

create trigger ELIMHISTORIA_AD after delete on HISTORIA_CLINICA for each row
insert into HISTORIA_CLINICA_ELIMINADA (idHistoria,Estatura,Peso,antecedentesFamiliares,alergias,enfermedadesPadecidas,idPaciente)
values (old.idHistoria,old.Estatura,old.Peso,old.antecedentesFamiliares,old.alergias,old.enfermedadesPadecidas,old.idPaciente,current_user,now());
alter table HISTORIA_CLINICA_ELIMINADA add column (usuario varchar(15),fecha_modif date);
delete from HISTORIA_CLINICA where idHistoria=4;

select* from HISTORIA_CLINICA_ELIMINADA;
select*from HISTORIA_CLINICA;
#---------------------------------------------------------------------------------------------------------------------------------------------------------------
/*TABLA EXAMEN*/
 CREATE TABLE REG_EXAMEN
(idexamen int ,
valor numeric ,
fechaExamen date ,
tipoExamen nvarchar(50),
idHistoriaFK int 
);
/*AI AFTER DE LA INSERCION*/
CREATE TRIGGER EXAMEN_AI after insert on  EXAMEN for each row insert into REG_EXAMEN (idexamen,valor,fechaExamen,tipoExamen,idHistoriaFK)
values (new.idexamen,new.valor,new.fechaExamen,new.tipoExamen,new.idHistoriaFK);
INSERT into EXAMEN values(12,165000,'2019/07/13','muestra de sangre',1);


select*from EXAMEN;
select*from REG_EXAMEN;
#------------------------------------------------------------------------------------------------------------------
CREATE TABLE EXAMEN_ACTUALIZADO
(
anterior_idexamen int ,
anterior_valor numeric ,
anterior_fechaExamen date ,
anterior_tipoExamen nvarchar(50),
anterior_idHistoriaFK int ,
nuevo_idexamen int ,
nuevo_valor numeric ,
nuevo_fechaExamen date ,
nuevo_tipoExamen nvarchar(50),
nuevo_idHistoriaFK int 
);
/*BEFORE UPDATE*/
CREATE TRIGGER ACTUALIZA_BEX before update on EXAMEN for each row
insert into EXAMEN_ACTUALIZADO (idexamen,valor,fechaExamen,tipoExamen,idHistoriaFK)
values 
(old.idexamen,old.valor,old.fechaExamen,old.tipoExamen,old.idHistoriaFK,new.idexamen,new.valor,
new.fechaExamen,new.tipoExamen,new.idHistoriaFK);

update  EXAMEN set tipoExamen='muestra de heces' where idexamen=4; /*condicion de actualizacion*/
select*from EXAMEN;
select*from EXAMEN_ACTUALIZADO ;

CREATE TABLE EXAMEN_ELIMINADO
(
idexamen int ,
valor numeric ,
fechaExamen date ,
tipoExamen nvarchar(50),
idHistoriaFK int 
);

create trigger ELIMEXAMEN_AD after delete on EXAMEN for each row
insert into EXAMEN_ELIMINADO (idexamen,valor,fechaExamen,tipoExamen,idHistoriaFK)
values (old.idexamen,old.valor,old.fechaExamen,old.tipoExamen,old.idHistoriaFK,current_user,now());
alter table EXAMEN_ELIMINADO add column (usuario varchar(15),fecha_modif date);
delete from EXAMEN where idexamen=7;

select* from EXAMEN_ELIMINADO;
select*from EXAMEN;
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
/*TABLA CONSULTA_MEDICA*/

 CREATE TABLE REG_CONSULTA_MEDICA
(idConsulta int,
horaAtencion datetime,
motivoConsulta text,
Enfermedad text ,
idHistoriaFK int 
);
/*AI AFTER DE LA INSERCION*/
CREATE TRIGGER CONSULTA_MEDICA_AI after insert on  CONSULTA_MEDICA for each row insert into REG_CONSULTA_MEDICA (idConsulta,horaAtencion,motivoConsulta,Enfermedad,idHistoriaFK )
values (NEW.idConsulta,NEW.horaAtencion,NEW.motivoConsulta,NEW.Enfermedad,NEW.idHistoriaFK );
INSERT into CONSULTA_MEDICA values(13,'2020-09-18 17:00:00','inestabilidad emocional','depresion',13);


select*from CONSULTA_MEDICA;
select*from REG_CONSULTA_MEDICA;
#------------------------------------------------------------------------------------------------------------------
/*TRIGGER PARA ACTUALIZACION TABLA CONSULTA MEDICA*/
CREATE TABLE CONSULTA_MEDICA_ACTUALIZADA
(
antiguo_idConsulta int,
antiguo_horaAtencion datetime,
antiguo_motivoConsulta text,
antiguo_Enfermedad text ,
antiguo_idHistoriaFK int ,
nuevo_idConsulta int,
nuevo_horaAtencion datetime,
nuevo_motivoConsulta text,
nuevo_Enfermedad text ,
nuevo_idHistoriaFK int 

);
/*BEFORE UPDATE*/
CREATE TRIGGER ACTUALIZA_BCM before update on CONSULTA_MEDICA for each row
insert into CONSULTA_MEDICA_ACTUALIZADA (idConsulta,horaAtencion,motivoConsulta,Enfermedad,idHistoriaFK )
values 
(old.idConsulta,old.horaAtencion,old.motivoConsulta,old.Enfermedad,old.idHistoriaFK,new.idConsulta,
new.horaAtencion,new.motivoConsulta,new.Enfermedad,new.idHistoriaFK );

update  CONSULTA_MEDICA set motivoConsulta='alergia' where idConsulta=3; /*condicion de actualizacion*/
select*from CONSULTA_MEDICA;
select*from CONSULTA_MEDICA_ACTUALIZADA ;

CREATE TABLE CONSULTA_MEDICA_ELIMINADA
(
idConsulta int,
horaAtencion datetime,
motivoConsulta text,
Enfermedad text ,
idHistoriaFK int 
);

create trigger ELIMConsulta_AD after delete on CONSULTA_MEDICA for each row
insert into CONSULTA_MEDICA_ELIMINADA (idConsulta,horaAtencion,motivoConsulta,Enfermedad,idHistoriaFK)
values (old.idConsulta,old.horaAtencion,old.motivoConsulta,old.Enfermedad,old.idHistoriaFK,current_user,now());
alter table CONSULTA_MEDICA_ELIMINADA add column (usuario varchar(15),fecha_modif date);
delete from CONSULTA_MEDICA where idConsulta=4;

select* from CONSULTA_MEDICA_ELIMINADA;
select*from CONSULTA_MEDICA;
#---------------------------------------------------------------------------------------------------------------------------------------------------
/*TABLA DIAGNOSTICO*/

 CREATE TABLE REG_DIAGNOSTICO
(idDIAGNOSTICO int,
Descripcion text,
idConsultaFK int
);
/*AI AFTER DE LA INSERCION*/
CREATE TRIGGER DIAGNOSTICO_AI after insert on  DIAGNOSTICO for each row insert into REG_DIAGNOSTICO (idDIAGNOSTICO,Descripcion,idConsultaFK)
values (new.idDIAGNOSTICO,new.Descripcion,new.idConsultaFK);
INSERT into DIAGNOSTICO values(11,'el paciente presenta un amplio marco de ansiedad y depresion',11);


select*from DIAGNOSTICO;
select*from REG_DIAGNOSTICO;
#------------------------------------------------------------------------------------------------------------------
CREATE TABLE DIAGNOSTICO_ACTUALIZADO
(
anterior_idDIAGNOSTICO int,
anterior_Descripcion text,
anterior_idConsultaFK int,
nuevo_idDIAGNOSTICO int,
nuevo_Descripcion text,
nuevo_idConsultaFK int
);
/*BEFORE UPDATE*/
CREATE TRIGGER ACTUALIZA_BDIC before update on DIAGNOSTICO for each row
insert into DIAGNOSTICO_ACTUALIZADO (anterior_idDIAGNOSTICO,anterior_Descripcion,anterior_idConsultaFK,nuevo_idDIAGNOSTICO,nuevo_Descripcion,nuevo_idConsultaFK )
values 
(old.idDIAGNOSTICO,old.Descripcion,old.idConsultaFK,new.idDIAGNOSTICO,new.Descripcion,new.idConsultaFK);

update  DIAGNOSTICO set descripcion='el paciente presenta signos de maltrato' where idDIAGNOSTICO=3; /*condicion de actualizacion*/
select*from DIAGNOSTICO;
select*from DIAGNOSTICO_ACTUALIZADO ;

CREATE TABLE DIAGNOSTICO_ELIMINADO
(
idDIAGNOSTICO int,
Descripcion text,
idConsultaFK int  
);

create trigger ELIMdignos_AD after delete on DIAGNOSTICO for each row
insert into DIAGNOSTICO_ELIMINADO (idDIAGNOSTICO,Descripcion,idConsultaFK)
values (old.idDIAGNOSTICO,old.Descripcion,old.idConsultaFK,current_user,now());
alter table DIAGNOSTICO_ELIMINADO add column (usuario varchar(15),fecha_modif date);
delete from DIAGNOSTICO where idDIAGNOSTICO=7;

select* from DIAGNOSTICO_ELIMINADO;
select*from DIAGNOSTICO;


#-----------------------------------------------------------------------------------------------------------
drop procedure if exists pa_multiplicar;
delimiter //
create procedure pa_multiplicar(
in numero1 int,
in numero2 int,
out producto int)
begin
set producto= numero1 * numero2;
end //
delimiter ;
call pa_multiplicar(20,3,@resu);
select @resu;
#------------------------------------------------------------------------------------------------------------
/*sacar el factorial de un numero*/
drop procedure if exists pa_factorial;
delimiter //
create procedure pa_factorial(
in numero int,
out resultado int)
begin
declare num int;
set resultado=1;
set num=numero;
while num>1 do 
call pa_multiplicar(resultado, num, resultado);
set num=num-1;
end while;
end //
delimiter ;

call pa_factorial (2,@resu);
select @resu;

#----------------------------------------------------------------------------------------------------------------------------------
/*Llamado de procedimientos internos aplicado proyecto*/
#----------------------------------------------------------------------------------------------------------------------------------
/*ejemplo #1*/
drop procedure if exists pa_estaturaalcuadrado;
/*en este procedimiento la estatura debe manejarse en metros*/
delimiter //
create procedure pa_estaturaalcuadrado(
in estatura double,
out result double)
begin
set result= estatura*estatura;
end //
delimiter ;
call pa_estaturaalcuadrado(1.65,@resu);
select @resu;

/*Calcular el indice de masa corporal del paciente */
drop procedure if exists pa_IMC;
delimiter //
create procedure pa_IMC(
in peso double,
in estatura double,
out resultado double)
begin
call pa_estaturaalcuadrado(estatura, resultado);
set resultado= peso/ resultado;

end //
delimiter ;

call pa_IMC (56,1.75,@resu);
select @resu;
#-------------------------------------------------------------------------------------------------------------------------------------
/*ejemplo #2*/
drop procedure if exists pa_precio3examenes;
delimiter //
create procedure pa_precio3examenes(
in examen1 numeric,
in examen2 numeric,
in examen3 numeric,
out precio numeric)
begin
set precio= examen1 + examen2 + examen3;
end //
delimiter ;
call pa_precio3examenes(50000,220000,130000,@resu);
select @resu;
#------------------------------------------------------------------------------------------------------------
/*saca el 30% de descuento de la suma de los volores de 3 examenes*/
drop procedure if exists pa_descuento30porciento;
delimiter //
create procedure pa_descuento30porciento(
in examen1 numeric,
in examen2 numeric,
in examen3 numeric,
out resultado numeric)
begin
call pa_precio3examenes(examen1, examen2, examen3, resultado);
set resultado = resultado-(resultado*0.3);

end //
delimiter ;

call pa_descuento30porciento (50000,220000,130000,@resu);
select @resu;


#------------------------------------------------------------------------------------------------------------------------------------
/*encriptacion de datos campo passwordUsuario*/
INSERT into USUARIO values(1,'evelin','pelaez','evelin@gmail.com','3204148925','cll 23-34 sur',
aes_encrypt('eve123456773','aes'),'medico','activo');
INSERT into USUARIO values(2,'luna','jaramiyo','luna@gmail.com','3005082136','cll 23b n°27-34',
aes_encrypt('lunaJARA4','aes'),'medico','inactivo');
select*from usuario;
/*desencriptacion de datos campo passwordUsuario*/
select cast(aes_decrypt(passwordUsuario,'aes') as char) from USUARIO;
#--------------------------------------------------------------------------------------------------------------------------------------------
/*encriptacion de datos campo tarjetaProfesional*/
INSERT into MEDICO values('1023364396','evelin','pelaez','3204148925','evelin@gmail.com','8396','ginecologia','activo',1);
INSERT into MEDICO values('1023564496','luna','jaramiyo','3005082136','luna@gmail.com','6230','cardiologia','inactivo',2);

/*desencriptacion de datos campo tarjetaProfesional*/
#----------------------------------------------------------------------------------------------------------------------------------------------------
/*encriptacion de datos campo direccionUsuario*/
INSERT into USUARIO values(3,'andrea','morales','andrea@gmail.com','3108721231','kr 72c n° 27 este','neuroandre','medico','activo');
INSERT into USUARIO values(4,'sofia','mora','sofia@gmail.com','3124567432','diagonal 19 n° 27_2','chispita123','medico','inactivo');
/*desencriptacion de datos campo direccionUsuario*/
#---------------------------------------------------------------------------------------------------------------------------------------------------
/*encriptacion de datos campo idMedico*/
INSERT into MEDICO values('1073364393','andrea','morales','3108721231','andrea@gmail.com','4019','neurologia','activo',3);
INSERT into MEDICO values('1036123456','sofia','mora','3124567432','sofia@gmail.com','4756','cardiologia','inactivo',4);

/*desencriptacion de datos campo idMedico*/


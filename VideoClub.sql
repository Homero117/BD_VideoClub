/* 

Carrera: Ingeniería en tecnologías de la información y la comunicación.
Asignatura: Taller de Base de Datos.
Profesora: DISE. Thalia Heidi Hernández Omaña. 
Práctica: Evaluación diagnóstica.
Grado y grupo: ¨4-A¨
Alumno: Homero de Jesús Portillo Calva
*/ 

Create database VideoClub

use VideoClub

create table MEMBERSHIP(
	MEM_NUM varchar(20) primary key,
	MEM_FNAME varchar(20),
	MEM_LNAME varchar(20),
	MEM_STREET varchar(20),
	MEM_CITY varchar(20),
	MEM_STATE varchar(20),
	MEM_ZIP varchar(20),
	MEM_BALANCE varchar(20)
)
go

create table PRICE(
	PRICE_CODE varchar(20) primary key,
	PRICE_DESCRIPTION varchar(20),
	PRICE_RENTFEE varchar(20),
	PRICE_DAILYLATEFEE varchar(20)
)
go

create table RENTAL(
	RENT_NUM varchar(20) primary key,
	RENT_DATE varchar(20),

	MEM_NUM_FK varchar(20),
	Foreign key (MEM_NUM_FK) references MEMBERSHIP(MEM_NUM)
)
go

create table MOVIE(
	MOVIE_NUM varchar(20) primary key,
	MOVIE_TITLE varchar(20),
	MOVIE_YEAR varchar(20),
	MOVIE_COST varchar(20),
	MOVIE_GENRE varchar(20),

	PRICE_CODE_FK varchar(20),
	Foreign key (PRICE_CODE_FK) references PRICE(PRICE_CODE)
)
go

create table VIDEO(
	VID_NUM varchar(20) primary key,
	VID_INDATE varchar(20),

	MOVIE_NUM_FK varchar(20),
	Foreign key (MOVIE_NUM_FK) references MOVIE(MOVIE_NUM)
)
go

create table DETALRENTAL(
	primary key (RENT_NUM_FK, VID_NUM_FK),
	RENT_NUM_FK varchar(20),
	VID_NUM_FK varchar(20),
	Foreign key (RENT_NUM_FK) references RENTAL(RENT_NUM),
	Foreign key (VID_NUM_FK) references VIDEO(VID_NUM),

	DETAIL_FEE varchar(20),
	DETAIL_DUEDATE  varchar(20),
	DETAIL_RETURNDATE varchar(20),
	DETAIL_DAILYLATEFEE varchar(20)
)
go
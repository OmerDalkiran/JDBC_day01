CREATE TABLE countries
(
    country_id CHAR(3),
    country_name VARCHAR(50),
    region_id SMALLINT
);
Insert into countries values ('AR','Argentina',2);
Insert into countries values ('AU','Australia',3);
Insert into countries values ('BE','Belgium',1);
Insert into countries values ('BR','Brazil',2);
Insert into countries values ('CA','Canada',2);
Insert into countries values ('CH','Switzerland',1);
Insert into countries values ('CN','China',3);
Insert into countries values ('DE','Germany',1);
Insert into countries values ('DK','Denmark',1);
Insert into countries values ('EG','Egypt',4);
Insert into countries values ('FR','France',1);
Insert into countries values ('IL','Israel',4);
Insert into countries values ('IN','India',3);
Insert into countries values ('IT','Italy',1);
Insert into countries values ('JP','Japan',3);
Insert into countries values ('KW','Kuwait',4);
Insert into countries values ('ML','Malaysia',3);
Insert into countries values ('MX','Mexico',2);
Insert into countries values ('NG','Nigeria',4);
Insert into countries values ('NL','Netherlands',1);
Insert into countries values ('SG','Singapore',3);
Insert into countries values ('UK','United Kingdom',1);
Insert into countries values ('US','United States of America',2);
Insert into countries values ('ZM','Zambia',4);
Insert into countries values ('ZW','Zimbabwe',4);

select * from countries

------------------------------------------------


CREATE TABLE companies 
(  
  company_id SMALLINT, 
  company VARCHAR(20),
  number_of_employees SMALLINT
);

INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);

SELECT * FROM companies;

select country_id,  country_name, region_id from countries where region_id =3;
select * from companies order by number_of_employees;

--1.yol
select * from companies order by number_of_employees desc offset 1 row fetch next 1 row only;
select company, number_of_employees from companies order by number_of_employees desc offset 1 limit 1;
--2.yol
select company, number_of_employees
from companies
where number_of_employees=18000;

/*  bu asagida yazilani yukaridaki 18000 in yerine yapistiracagiz. 
select max(number_of_employees) from companies
where number_of_employees < (select max(number_of_employees) from companies) ; --18000
*/

select company, number_of_employees from companies
where number_of_employees = (select max(number_of_employees) from companies
where number_of_employees < (select max(number_of_employees) from companies)) ;

select max(number_of_employees) from companies offset 1 row;


--//1. Örnek: number_of_employees değeri ortalama çalışan sayısından az olan 
--number_of_employees değerlerini 16000 olarak UPDATE edin.


SELECT * FROM companies;
update companies 
set number_of_employees where number_of_employees < 17000; -- Bu hardcode. bunun yerine asagidaki code yazilir, dinamik olmasi icin

--asagidaki kodu 17000 in yerine koyacagiz. 
Select avg(number_of_employees) from companies;

-- //1. Örnek: number_of_employees değeri ortalama çalışan sayısından az olan number_of_employees değerlerini 16000 olarak UPDATE edin.
UPDATE companies
SET number_of_employees = 16000
WHERE number_of_employees < (SELECT AVG(number_of_employees)
                             FROM companies);

drop table companies
-------------------------------
CREATE TABLE workers
(
    id SMALLINT,
    name VARCHAR(50),
    salary SMALLINT,
    CONSTRAINT id4_pk PRIMARY KEY(id)
);  
    
INSERT INTO workers VALUES(10001, 'Ali Can', 12000);
INSERT INTO workers VALUES(10002, 'Veli Han', 2000);
INSERT INTO workers VALUES(10003, 'Mary Star', 7000);
INSERT INTO workers VALUES(10004, 'Angie Ocean', 8500); 

Create table cities_in_Germany
(
city_name varChar(30),
	city_id char(3),
	city_population int,
	city_mayer varChar (30)
);
insert into cities_in_Germany values ('Berlin', 'BE',5000000, 'Mark Twins');
insert into cities_in_Germany values ('Dortmund', 'DO',660000, 'Hans Oracle');
insert into cities_in_Germany values ('Koln', 'K', 1100000, 'Benjamin Franklin');
insert into cities_in_Germany values ('WiesBaden', 'Wsb', 45000, 'Frau Toll'); -- eger "wies" degeri girerseniz city_id ye 
                                                           --soyle bir hata verir : " value too long for type character(3)"
select * from cities_in_Germany
/*
"Berlin"	"BE "	5000000	"Mark Twins"
"Dortmund"	"DO "	660000	"Hans Oracle"
"Koln"		"K  "	1100000	"Benjamin Franklin"
"WiesBaden"	"Wsb"	45000	"Frau Toll"
*/
select * from cities_in_Germany where city_population>500000;

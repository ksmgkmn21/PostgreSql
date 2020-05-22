
create table university(
 	"id" SERIAL NOT NULL,
	"type" BOOLEAN NOT NULL, -- if false devlet university else  vakıf university
	"name" TEXT NOT NULL,
	"address" TEXT NOT NULL,
	"e-mail" TEXT NOT NULL,
	"city" TEXT NOT NULL,
	"yearOfFoundation" INTEGER NOT NULL,
	CONSTRAINT "university_id" PRIMARY KEY("id")
);
INSERT INTO university("type","name","address","e-mail","city","yearOfFoundation")
VALUES
(false,'DOKUZ EYLÜL UNIVERSITY','İzmir','DEU@gmail.com','İzmir',1981),
(false,'EGE UNIVERSITY','İzmir','ege@gmail.com','İzmir',1955),
(false,'iZMİR YÜKSEK TEKNOLOJİ UNIVERSITY','İzmir','İYTE@gmail.com','İzmir',1992),
(true,'BAKIRÇAY UNIVERSITY','İzmir','bakırçay@gmail.com','İzmir',2010),
(false,'iZMİR DEMOKRASİ UNIVERSITY','İzmir','demokrasi@gmail.com','İzmir',2016),
(false,'İZMİR KATİP ÇELEBİ UNIVERSITY','İzmir','katip.çelebi@gmail.com','İzmir',2010),
(false,'İSTANBUL UNİVERSİTY','İstanbul','istanbulUni@gmail.com','İstanbul',1453),
(false,'DİCLE UNİVERSİTY','Diyarbakır','dicle@gmail.com','Diyarbakır',1974),
(false, 'Izmir Technical University','İzmir','izmirTeknik@gmail.com','İzmir',2020),
(true,'İZMİR UNİVERSİTY','İzmir','İzmirUni@gmail.com','İzmir',2000);
select * from university;


CREATE TABLE faculties(
	"faculties_id" SERIAL NOT NULL,
	"university_id" INTEGER NOT NULL,
	"name" TEXT NOT NULL,
	"e-mail" TEXT NOT NULL,
	CONSTRAINT "for_key_faculties_id"  PRIMARY KEY("faculties_id"),
	CONSTRAINT "for_key_universityid" FOREIGN KEY("university_id")
	REFERENCES university("id") match simple
	ON UPDATE CASCADE ON DELETE CASCADE
	
);
INSERT INTO faculties("university_id","name","e-mail")
VALUES
(1, 'Engineering','deuEngineering@gmail.com'),
(1, 'Law','deuLawg@gmail.com'),
(1, 'Medicine','deuMEDİCİNg@gmail.com'),
(2, 'Engineering','egeEngineering@gmail.com'),
(2, 'Law','egeLawg@gmail.com'),
(2, 'Medicine','egeMEDİCİNg@gmail.com'),
(3, 'Engineering','IYTEEngineering@gmail.com'),
(4, 'Engineering','BAKIRÇAYEngineering@gmail.com'),
(4, 'Law','BAKIRÇAYLawg@gmail.com'),
(4, 'Medicine','BAKIRÇAYMEDİCİNg@gmail.com'),
(5, 'Engineering','DemokrasiEngineering@gmail.com'),
(5, 'Law','DemokrasiLawg@gmail.com'),
(5, 'Medicine','DemokrasiMEDİCİNg@gmail.com'),
(6, 'Engineering','KTPÇEngineering@gmail.com'),
(6, 'Law','KTPÇLawg@gmail.com'),
(6, 'Medicine','KTPÇMEDİCİNg@gmail.com'),
(7, 'Engineering','İUEngineering@gmail.com'),
(7, 'Law','İULawg@gmail.com'),
(7, 'Medicine','İUMEDİCİNg@gmail.com'),
(8, 'Engineering','DİCLEngineering@gmail.com'),
(8, 'Law','DİCLELawg@gmail.com'),
(8, 'Medicine','DİCLEMEDİCİNg@gmail.com'),
(10, 'Engineering','İzmiruniEngineering@gmail.com'),
(10, 'Law','İzmiruniLawg@gmail.com'),
(10, 'Medicine','İzmiruniMEDİCİNEg@gmail.com');
select * from faculties;
select * from university as uni INNER JOIN faculties as fclt ON uni."id" = fclt."university_id";


CREATE TABLE departments(
	"departments_id" SERIAL NOT NULL,
	"faculties_id" INT NOT NULL,
	"name" TEXT NOT NULL,
	"e-mail" TEXT NOT NULL,
	"language" BOOLEAN NOT NULL, -- language is turkish or engilish if the value is true language will be engilish 
	"education_type" BOOLEAN NOT NULL, -- if the education type is true the type will be evening education(iö)
	"quato" INT NOT NULL,
	"spec_quato" INT,
	"period" INT NOT NULL,
	"min score 2019" DECIMAL,
	"min order 2019" DECIMAL,
	CONSTRAINT "for_key_departmentsid"  PRIMARY KEY ("departments_id"),
	CONSTRAINT "for_key_facultiesid" FOREIGN KEY("faculties_id")
	REFERENCES faculties("faculties_id") match simple
	ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO departments("faculties_id","name","e-mail","language","education_type","quato","spec_quato","period","min score 2019","min order 2019")
VALUES
(1, 'Computer Engineering','CENG@gmail.com',true, false, 80,3,4,425.12447,37000 ),
(1, 'Electrical Electronics Engineering','deuEEE@gmail.com',true, false, 80,2,4,420.94283,232000 ),
(2, 'Law Department','deuLaw@gmail.com',false, false, 100,3,4,400.94283,232000 ),
(3, 'Medicine Department','deuMedicine@gmail.com',false, false, 80,2,6,500.94283,5000 ),
(4, 'Computer Engineering','egeCENG@gmail.com',true, false, 80,3,4,425.12447,37000 ),
(4, 'Electrical Electronics Engineering','egeCENG@gmail.com',true, true, 80,2,4,266.94283,232000 ),
(5, 'Law Department','egeLaw@gmail.com',false, false, 100,3,4,400.94283,232000 ),
(6, 'Medicine Department','egeMedicine@gmail.com',false, false, 80,2,6,480.94283,5000 ),
(7, 'Computer Engineering','IYTECENG@gmail.com',true, false, 80,3,4,425.12447,37000 ),
(7, 'Electrical Electronics Engineering','IYTEEE@gmail.com',true, false, 80,2,4,266.94283,232000 ),
(8, 'Computer Engineering','bakırçayCENG@gmail.com',true, true, 80,3,4,425.12447,37000 ),
(8, 'Electrical Electronics Engineering','bakırçayEEE@gmail.com',true, false, 80,2,4,266.94283,232000 ),
(9, 'Law Department','bakırçayLaw@gmail.com',false, false, 100,3,4,400.94283,232000 ),
(10, 'Medicine Department','bakırçayMedicine@gmail.com',false, false, 80,2,6,480.94283,5000 ),
(11, 'Computer Engineering','demokrasiCENG@gmail.com',true, false, 80,3,4,425.12447,37000 ),
(11, 'Electrical Electronics Engineering','demokrasiEEE@gmail.com',true, false, 80,2,4,266.94283,232000 ),
(12, 'Law Department','demokrasiLaw@gmail.com',false, false, 100,3,4,400.94283,232000 ),
(13, 'Medicine Department','demokrasiMedicine@gmail.com',false, false, 80,2,6,480.94283,5000 ),
(14, 'Computer Engineering','katip.çelebiCENG@gmail.com',true, false, 80,3,4,425.12447,37000 ),
(14, 'Electrical Electronics Engineering','katip.çelebiEEE@gmail.com',true, false, 80,2,4,266.94283,232000 ),
(15, 'Law Department','katip.çelebiLaw@gmail.com',false, false, 100,3,4,400.94283,232000 ),
(16, 'Medicine Department','katip.çelebiMedicine@gmail.com',false, false, 80,2,6,480.94283,5000 ),
(17, 'Computer Engineering','istanbulUniCENG@gmail.com',true, false, 80,3,4,425.12447,37000 ),
(17, 'Electrical Electronics Engineering','istanbulUniEEE@gmail.com',true, false, 80,2,4,266.94283,232000 ),
(18, 'Law Department','istanbulUniLaw@gmail.com',false, false, 100,3,4,400.94283,232000 ),
(19, 'Medicine Department','istanbulUniMedicine@gmail.com',false, false, 80,2,6,480.94283,5000 ),
(20, 'Computer Engineering','dicleCENG@gmail.com',true, false, 80,3,4,450.12447,37000 ),
(20, 'Electrical Electronics Engineering','dicleEE@gmail.com',true, false, 80,2,4,450.94283,232000 ),
(21, 'Law Department','dicleLaw@gmail.com',false, false, 100,3,4,440.94283,232000 ),
(22, 'Medicine Department','dicleMedicine@gmail.com',false, false, 80,2,6,540.94283,5000 ),
(23, 'Computer Engineering','İzmiruniCENG@gmail.com',true, false, 80,3,4,425.12447,37000 ),
(23, 'Electrical Electronics Engineering','İzmiruniEEE@gmail.com',true, false, 80,2,4,420.94283,232000 ),
(24, 'Law Department','İzmiruniLaw@gmail.com',false, false, 100,3,4,400.94283,232000 ),
(25, 'Medicine Department','İzmiruniMedicine@gmail.com',false, false, 80,2,6,480.94283,5000 );
SELECT * FROM departments
SELECT * FROM university as uni INNER JOIN faculties as fclt ON uni."id" = fclt."university_id"  
INNER JOIN  departments as dprt ON dprt."faculties_id"=fclt."faculties_id";


CREATE TABLE students(
	"id" SERIAL NOT NULL,
	"name" TEXT NOT NULL,
	"surname" TEXT NOT NULL,
	"score" DECIMAL NOT NULL,
	"ranking" DECIMAL NOT NULL,
	"top ranked" BOOLEAN NOT NULL, -- if true it is ranked
	CONSTRAINT "for_key_id"  PRIMARY KEY ("id")
);
INSERT INTO students("name","surname","score","ranking","top ranked")
VALUES
('Kasım', 'Gökmen', 434.4545, 30000, false),
('Nazmican', 'Dikmen', 440.45, 29000, false),
('Berat', 'Gökmen', 484.4545, 4000, false),
('Berzan', 'Gökmen', 480.4545, 5000, true),
('Göksu', 'Tüysüzoğlu', 434.9545, 30001, false),
('Okan', 'Öztürkmenoğlu', 460.4545, 10000, false),
('Vedat', 'Özcan', 398.4545, 70000, false);
SELECT * FROM students


CREATE TABLE preferences(
	"student_id" INT NOT NULL,
	"first_pref" INT ,
	"second_pref" INT ,
	"third_pref" INT,
	CONSTRAINT "pks" PRIMARY KEY("student_id"),
	CONSTRAINT "for_key_first_pref" FOREIGN KEY("first_pref")
	REFERENCES departments("departments_id") match simple
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "for_key_second_pref" FOREIGN KEY("second_pref")
	REFERENCES departments("departments_id") match simple
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "for_key_third_pref" FOREIGN KEY("third_pref")
	REFERENCES departments("departments_id") match simple
	ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "for_key_studentid" FOREIGN KEY("student_id")
	REFERENCES students("id") match simple
	ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO preferences("student_id", "first_pref","second_pref","third_pref")
VALUES
(1,1,5,9),
(2,6,16,20),
(3,3,1,NULL),
(4,1,3,NULL),
(5,3,NULL,NULL),
(6,24,3,9),
(7,3,NULL,NULL);
SELECT * FROM preferences;

-----

SELECT * FROM university AS uni WHERE uni."city"  LIKE 'İ%'  and uni."yearOfFoundation" > 1990; -- for first queri

-----

SELECT uni."id", uni."name" --just to show your university id and name
FROM university AS uni INNER JOIN faculties AS f ON uni."id"=f."university_id"
WHERE f."name" IN ('Engineering','Medicine') 
GROUP BY uni."id", uni."name"
HAVING COUNT (DISTINCT f."name") = 2; --second queri

-----

SELECT university.type ,COUNT(faculties.name) as cnt
	FROM faculties, university where faculties.university_id = university.id
	group by university.type; --third queri
	
-----

SELECT * FROM  faculties AS fclt INNER JOIN departments AS dprt ON fclt."faculties_id" = dprt."faculties_id" 
WHERE fclt."name" = 'Engineering' and dprt."education_type" = true;-- fourth queri, true is iö

-----

SELECT * FROM departments AS dprt ORDER BY dprt."period" DESC, dprt."min score 2019" DESC LIMIT 5; --5.querii

----
WITH test as (select departments."name" as dprt_name from departments inner join preferences on departments."departments_id" = preferences."first_pref" 
			  where departments."period" = 4 union all
			 select departments."name" from departments inner join preferences on departments."departments_id" = preferences."second_pref" 
			  where departments."period" = 4 union all
			 select departments."name" from departments inner join preferences on departments."departments_id" = preferences."third_pref"
			 where departments."period" = 4 ) select dprt_name, count(dprt_name) as cnt from test group by dprt_name
			 order by cnt desc -- 6. queri
-----

SELECT st."id", st."name", st."surname", st."score", prf."first_pref" FROM  students AS st -- 7. queri
INNER JOIN preferences AS prf ON st."id" = prf."student_id" 
INNER JOIN departments AS dprt ON prf."first_pref" = dprt."departments_id" 
WHERE dprt."name" = 'Computer Engineering' ORDER BY st."score" DESC;


-----


UPDATE faculties AS f --8. queri
SET university_id = (select uni."id" from university as uni where uni."name" = 'Izmir Technical University')
WHERE f."university_id" = (select uni."id" from university as uni where uni."name" = 'DOKUZ EYLÜL UNIVERSITY') and f."name" = 'Engineering'
select * from university as uni INNER JOIN faculties as fclt ON uni."id" = fclt."university_id";

-----

UPDATE departments AS d --9. queri
SET period = period + 1
FROM faculties 
WHERE faculties."faculties_id" = d."faculties_id" and faculties."name" = 'Law';
SELECT * FROM departments

-----

DELETE FROM university where university."name" = 'İZMİR UNİVERSİTY'; -- 10. queri --you said the entire university can be deleted
select * from university

----

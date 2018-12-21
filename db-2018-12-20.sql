----------------------------------------
--------- Produktų_kategorijos ---------

CREATE TABLE IF NOT EXISTS Produktų_kategorijos (
	ID INT(11) AUTO_INCREMENT,
	Kodas CHAR(4),
	Pavadinimas VARCHAR(60),
	Aprašymas TEXT,
	PRIMARY KEY (ID)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO `test_schema`.`Produktų_kategorijos`
	(`Kodas`,`Pavadinimas`,`Aprašymas`)
VALUES
	(0400, 'Suknelė', 'Blah1'),
	(0805, 'Kelnės', 'Blah2'),
	(0842, 'Marškiniai', 'Blah3'),
	(0805, 'Kelnės', 'Blah4');

----------------------------------------
-------------- Dizaineriai -------------

CREATE TABLE IF NOT EXISTS Dizaineriai (
	ID INT(11) AUTO_INCREMENT,
	Pavadinimas VARCHAR(60),
	Aprašymas TEXT,
	PRIMARY KEY (ID)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO `test_schema`.`Dizaineriai`
	(`Pavadinimas`, `Aprašymas`)
VALUES	
	("J. Statkevičius","Geras 1"),
	("Goti","Geras 2"),
	("Al Capone","Geras 3"),
	("Rammstein","Geras 4");

----------------------------------------
--------------- Produktai --------------

CREATE TABLE IF NOT EXISTS Produktų_kainos (
	ID INT(11) AUTO_INCREMENT,
	Galiojimo_pradžia DATETIME,
	Galiojimo_pabaiga DATETIME,
	Nuolaidos_tipas ENUM("proc", "eur"),
	Nuolaidos_dydis FLOAT(8,2),
	Pvm_dydis FLOAT(5,2),
	PRIMARY KEY (ID)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

ALTER TABLE `test_schema`.`Produktų_kainos`
	ADD COLUMN Bazinė_kaina CHAR(4) AFTER ID,
	ADD COLUMN Kainos_galiojimo_pradžia DATETIME AFTER Bazinė_kaina,
	ADD COLUMN Kainos_galiojimo_pabaiga DATETIME AFTER Kainos_galiojimo_pradžia,
	CHANGE COLUMN Galiojimo_pradžia Nuolaidos_galiojimo_pradžia DATETIME,
	CHANGE COLUMN Galiojimo_pabaiga Nuolaidos_galiojimo_pabaiga DATETIME;
	
ALTER TABLE `test_schema`.`Produktų_kainos`
	ALTER `Bazinė_kaina` DROP DEFAULT,
	ALTER `Kainos_galiojimo_pradžia` DROP DEFAULT,
	ALTER `Kainos_galiojimo_pabaiga` DROP DEFAULT,
	ALTER `Pvm_dydis` DROP DEFAULT;
	
----------------------------------------

CREATE TABLE IF NOT EXISTS Produktai (
	ID INT(11) AUTO_INCREMENT,
	Pavadinimas VARCHAR(60),
	Produktų_kategorijos_ID INT(11),
	Dizaineriai_ID INT(11),
	Produktų_kainos_ID INT(11),
	Aprašymas TEXT,
	PRIMARY KEY (ID),
	FOREIGN KEY (Produktų_kategorijos_ID) REFERENCES Produktų_kategorijos(ID),
	FOREIGN KEY (Dizaineriai_ID) REFERENCES Dizaineriai(ID),
	FOREIGN KEY (Produktų_kainos_ID) REFERENCES Produktų_kainos(ID)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

ALTER TABLE Produktai
	ADD COLUMN Kodas CHAR(4) AFTER ID;

CREATE TABLE IF NOT EXISTS Klientai (
	ID INT(11) AUTO_INCREMENT,
	Vardas VARCHAR(20),
	Pavardė VARCHAR(20),
	Adresas VARCHAR(60),
	Telefonas VARCHAR(20),
	PRIMARY KEY (ID)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Pirkimai (
	ID INT(11) AUTO_INCREMENT,
	Produktai_ID INT(11),
	Kiekis INT(11),
	Kaina FLOAT(8,2),
	Pvm_dydis FLOAT(5,2),
	Klientai_ID INT(11),
	Pirkimo_data DATETIME,
	PRIMARY KEY (ID),
	FOREIGN KEY (Produktai_ID) REFERENCES Produktai(ID),
	FOREIGN KEY (Klientai_ID) REFERENCES Klientai(ID)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

-- SELECT * FROM Dizaineriai;

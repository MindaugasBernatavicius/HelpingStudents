--------- Dublis 2 ---------------------
--------- Klientas ---------------------

CREATE TABLE IF NOT EXISTS Klientas (
	ID int(11) NOT NULL AUTO_INCREMENT,
	Vardas varchar(20) NOT NULL,
	Pavardė varchar(20) NOT NULL,
	PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE Klientas
	ADD COLUMN Adresas VARCHAR(60) AFTER Pavardė,
	ADD COLUMN Telefonas VARCHAR(20) AFTER Adresas;

INSERT INTO Klientas
	(Vardas, Pavardė, Adresas, Telefonas)
VALUES
	('Eliza','Jonaitienė', '123 - 1 Žalgirio g. Kaunas 47825', '86000000'),
	('Tomas','Kruzas', 'Hollywood, Los Angeles', '870282996325');
	
----------------------------------------
--------- Produktas --------------------

CREATE TABLE IF NOT EXISTS Produktas (
	ID int(11) NOT NULL AUTO_INCREMENT,
	Kodas char(4) NOT NULL,
	ProduktoTipoID int(11) NOT NULL,
	DizainerioID int(11) NOT NULL,
	Pavadinimas varchar(60) NOT NULL,
	Kaina float(8,2) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (ProduktoTipoID) REFERENCES ProduktoTipas (ID),
	FOREIGN KEY (DizainerioID) REFERENCES Dizaineris (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Produktas
	(Kodas, ProduktoTipoID, DizainerioID, Pavadinimas, Kaina)
VALUES
	('0001', 1, 1, 'Škurlys', 6000.00),
	('0200', 2, 2, 'Kelnės X', 5000.00),
	('0230', 3, 3, 'Hawaii', 1500.00),
	('0150', 2, 4, 'Oda123', 3000.00);
	
----------------------------------------
--------- Sąskaita ---------------------

CREATE TABLE IF NOT EXISTS Sąskaita (
	ID int(11) NOT NULL AUTO_INCREMENT,
	KlientoID int(11) NOT NULL,
	Data datetime NOT NULL,
	VisoKaina float(8,2) NOT NULL,
	Pvm float(5,2) NOT NULL,
	VisoBePvm float(8,2) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (KlientoID) REFERENCES Klientas (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Sąskaita 
	(KlientoID, Data, VisoKaina, Pvm, VisoBePvm);
VALUES
	(1, '2018-12-11 19:10:17', 7000.00, 9.99, 6200.00);
	
----------------------------------------
--------- ProduktoTipas ----------------

CREATE TABLE IF NOT EXISTS ProduktoTipas (
	ID int(11) NOT NULL AUTO_INCREMENT,
	Kodas char(4) NOT NULL,
	Pavadinimas varchar(60) NOT NULL,
	PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
INSERT INTO ProduktoTipas
	(Kodas, Pavadinimas)
VALUES 
	('0400','Suknelė'),
	('0805','Kelnės'),
	('0842','Marškiniai'),
	('0805','Kelnės');

----------------------------------------
----------- SąskaitosDetalės -----------

CREATE TABLE IF NOT EXISTS SąskaitosDetalės (
	ID int(11) NOT NULL AUTO_INCREMENT,
	SąskaitosID int(11) NOT NULL,
	ProduktasID int(11) NOT NULL,
	KainaBeNuolaidos float(8,2) NOT NULL,
	Nuolaida float(8,2) DEFAULT NULL,
	PardavimoKaina float(8,2) NOT NULL,
	Kiekis int(8) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (SąskaitosID) REFERENCES Sąskaita (ID),
	FOREIGN KEY (ProduktasID) REFERENCES Produktas (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO SąskaitosDetalės
	(SąskaitosID, ProduktasID, KainaBeNuolaidos, Nuolaida, PardavimoKaina, Kiekis)
VALUES
	(1, 1, 7100, 100, 7000, 1),
	(1, 2, 5600, 100, 5500, 2),
	(1, 3, 1850, 50, 1800, 3),
	(1, 3, 3560, 60, 3500, 4);


--------- Dublis 1 ---------------------
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
	ALTER `Pvm_dydis` DROP DEFAULT;
	
INSERT INTO `test_schema`.`Produktų_kainos`
	(`Bazinė_kaina`,`Kainos_galiojimo_pradžia`, `Kainos_galiojimo_pabaiga`, `Pvm_dydis`)
VALUES
	(150, '2018-12-18 13:17:17', NULL, 21.0),
	(200, '2018-12-11 09:10:17', NULL, 18.0),
	(208, '2018-12-10 19:10:17', NULL, 21.0),
	(15, '2018-11-10 19:10:17', NULL, 21.0);
	
----------------------------------------
--------------- Produktai --------------

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
	
----------------------------------------
--------------- Klientai ---------------

CREATE TABLE IF NOT EXISTS Klientai (
	ID INT(11) AUTO_INCREMENT,
	Vardas VARCHAR(20),
	Pavardė VARCHAR(20),
	Adresas VARCHAR(60),
	Telefonas VARCHAR(20),
	PRIMARY KEY (ID)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

----------------------------------------
--------------- Pirkimai ---------------

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

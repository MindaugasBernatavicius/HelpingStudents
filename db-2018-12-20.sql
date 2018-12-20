CREATE TABLE IF NOT EXISTS Produktų_kategorijos (
  ID INT(11) AUTO_INCREMENT,
  Kodas CHAR(4),
  Pavadinimas VARCHAR(60),
  Aprašymas TEXT,
  PRIMARY KEY (ID)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Dizaineriai (
  ID INT(11) AUTO_INCREMENT,
  Pavadinimas VARCHAR(60),
  Aprašymas TEXT,
  PRIMARY KEY (ID)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Produktų_kainos (
  ID INT(11) AUTO_INCREMENT,
  Galiojimo_pradžia DATETIME,
	Galiojimo_pabaiga DATETIME,
	Nuolaidos_tipas ENUM("proc", "eur"),
	Nuolaidos_dydis FLOAT(8,2),
	Pvm_dydis FLOAT(5,2),
  PRIMARY KEY (ID)
) ENGINE=INNODB;

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
) ENGINE=INNODB;

-- SELECT * FROM Dizaineriai;

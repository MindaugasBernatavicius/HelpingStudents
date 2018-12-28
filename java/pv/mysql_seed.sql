CREATE SCHEMA `pacientu_vizitacija` DEFAULT CHARACTER SET utf8 ;
USE pacientu_vizitacija;

CREATE TABLE Specialistai (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    spaudo_numeris VARCHAR(10) NULL UNIQUE,
    vardas VARCHAR(30) NOT NULL,
    pavardė VARCHAR(30) NOT NULL,
    darbo_pradžia TIMESTAMP NULL,
    darbo_pabaiga TIMESTAMP NULL,
    slaptažodis VARCHAR(15) NOT NULL,
    rolės_id INT(3) NOT NULL,
    yra_administratorius BIT(1) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO pacientu_vizitacija.Specialistai
	(`spaudo_numeris`, `vardas`, `pavardė`, `darbo_pradžia`, `darbo_pabaiga`, `slaptažodis`, `rolės_id`, `yra_administratorius`)
VALUES
	('VN000621', 'ADELĖ', 'ANGLICKYTĖ', '2018-12-02 00:00:00', NULL, 'qwerty1', '1', b'0'),
	('GD000622', 'ADOMAS', 'SUKACKAS', '2017-12-02 00:00:00', NULL, 'qwerty2', '1', b'0'),
	('GD000623', 'MINDAUGAS', 'BERNATAVIČIUS', '2016-11-05 00:00:00', NULL, 'qwerty3', '1', b'1');
    
SELECT * FROM pacientu_vizitacija.specialistai;

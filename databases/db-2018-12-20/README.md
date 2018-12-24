1. Sukurkite 3 normaline forma viršuje pateiktai sąskaitai faktūrai. Pateikite lenteles jų laukus(laukų pavadinimus ir tipus) ir sąryšius(PK(pagrindiniai raktai) ir FK(forein key, raktas-nuoroda į pagrindinę lentele)). Papildoma informacija: prekių kaina gali kisti, prekėms taikomos nuolaidos.


2. Parašykite select tam kad gauti visus suknelių pardavimų duomenis (Produktas ir pirkimo informacija: Kaina, pirkimo data, kliento informacija.
```
SELECT Produktas.Pavadinimas AS Produktas,
	(SąskaitosDetalės.KainaBeNuolaidos / 
		SąskaitosDetalės.Kiekis) AS Kaina,
	Sąskaita.Data AS PirkimoData,
	Klientas.Vardas AS Vardas,
	Klientas.Pavardė AS Pavardė,
  	Klientas.Adresas AS Adresas,
  	Klientas.Telefonas AS Telefonas
FROM SąskaitosDetalės 
  	JOIN Produktas ON SąskaitosDetalės.ProduktasID = Produktas.ID
  	JOIN Sąskaita ON SąskaitosDetalės.SąskaitosID = Sąskaita.ID
  	JOIN Klientas ON Sąskaita.KlientoID = Klientas.ID
  	JOIN ProduktoTipas ON Produktas.ProduktoTipoID = ProduktoTipas.ID
WHERE ProduktoTipas.Pavadinimas = "Suknelė";
```

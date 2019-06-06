Užduotis:
- LoginForm
  - Html- sukurti du inputs (username&amp;password) ir submit button.
Submit Login
 On submit POST username &amp; password to http://kitmjavascript.azurewebsites.net/api/login
(username:“admin“, password:“Password“)
 On 403 response display user friendly error.

On 200 response :
 paslėpti „loginForm”
 sukurti lentelę (&lt;table&gt;)
 istraukti duomenis is http://kitmjavascript.azurewebsites.net/api/studentai
 ideti i lentele tik aktyvius studentus.
 Lenteles lauku antrastes (&lt;TH&gt;):
name, age, picture, balance, tags, registered, favoriteFruit.
 Prideti po 1000 $ kiekvienam studentui prie jo balanso.
 Sunumeruoti eilutes
 „Picture“ stulpelis turetu parodyti studento paveiksliuką. &lt;img&gt;

Reikalavimai
 Peteikti gražų kodą, iskaidytą į funkcijas. Naudot komentarus kur reikia.
 Use AJAX – (plain js or Jquery)
 Javasriptas turi buti atskirame faile (.js)
 Viska suarchivuoti i zip failą.
 Galima pagražint su CSS, bet nebūtina.

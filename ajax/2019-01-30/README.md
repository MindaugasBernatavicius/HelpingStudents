Task:
- LoginForm html w/ two input fields: username, password and a submit button.
- Submit Login
  - On submit POST username &amp; password to /api/login (username: "admin", password: "Password")
  - On 403 response display user friendly error.
  - On 200 response :
    - paslėpti loginForm
    - sukurti lentelę (<table>)
- istraukti duomenis is /api/studentai
- ideti i lentele tik aktyvius studentus.
- Lenteles lauku antrastes (<th>): name, age, picture, balance, tags, registered, favoriteFruit.
- Prideti po 1000 $ kiekvienam studentui prie jo balanso.
- Sunumeruoti eilutes
- "Picture" stulpelis turetu parodyti studento paveiksliuką <img>;

Reikalavimai:
- Peteikti gražų kodą, iskaidytą į funkcijas. Naudot komentarus kur reikia.
- Use AJAX – (plain js or Jquery)
- Javasriptas turi buti atskirame faile (.js)
- Add CSS styling for table

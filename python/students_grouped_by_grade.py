########### PAGALBINĖS FUNKCIJOS ##########

def vidurkis(pazymiai):
    # jei naudojame python3 galime
    # naudoti tokią išraišką vidurkiui
    # print(pazymiai)
    return round(sum(pazymiai) / len(pazymiai), 2)
    

def skaiciuoti_studentu_vidurkius(studentai_pazymiai):
    studentai_vidurkiai = {}
    for i in range(len(studentai_pazymiai)):
        studento_vardas = studentai_pazymiai[i][0]
        studento_pazymiai = []
        studento_pazymiai.append(int(studentai_pazymiai[i][1]))
        studentai_vidurkiai[studento_vardas] = vidurkis(studento_pazymiai)
    return studentai_vidurkiai
    

def visi_pazymiai(studentai_pazymiai):
    visu_pazymiai = []
    for i in range(len(studentai_pazymiai)):
        visu_pazymiai.append(int(studentai_pazymiai[i][1]))
    return visu_pazymiai
    
# funkcija surašanti geriausius ir blogiausius studentus į failą
def formuoti_geriausius_blogiausius(studentai_vidurkiai):
    auksciausias_vidurkis = max(studentai_vidurkiai.values())
    zemiausias_vidurkis = min(studentai_vidurkiai.values())
    geriausiai_besimokantys = []
    blogiausiai_besimokantys = []
    
    # atsirenkame, kas mokosi geriausiai ir blogiausiai
    for k, v in studentai_vidurkiai.items():
        if studentai_vidurkiai[k] == auksciausias_vidurkis:
            geriausiai_besimokantys.append(k)
        elif studentai_vidurkiai[k] == zemiausias_vidurkis:
            blogiausiai_besimokantys.append(k)
    
    with open("rezultatai-geriausi-blogiausi.txt", "w") as file:
        # Apsibrėžiame antrašes, kurias naudosime rezultatų faile
        geriausiu_antraste = "Geriausiai besimokantys studentai"
        blogiausiu_antraste = "Blogiausiai besimokantys studentai"
        file.write(geriausiu_antraste + ":" + "\n")
        for i in range(len(geriausiai_besimokantys)):
            file.write("\tVardas: " + geriausiai_besimokantys[i] + ", Vidurkis: " + str(auksciausias_vidurkis) + "\n")
        file.write("\n")
        file.write(blogiausiu_antraste + ":" + "\n")
        for i in range(len(blogiausiai_besimokantys)):
            file.write("\tVardas: " + blogiausiai_besimokantys[i] + ", Vidurkis: " + str(zemiausias_vidurkis) + "\n")
     

def formuoti_vidutinius(studentai_vidurkiai):
    auksciausias_vidurkis = max(studentai_vidurkiai.values())
    zemiausias_vidurkis = min(studentai_vidurkiai.values())
    geriau_nei_vid_besimokantys = {}
    vid_besimokantys = {}
    blogiau_nei_vid_besimokantys = {}
    
    # atsirenkame, kas mokosi geriau ar blogiau nei vidutiniškai, bei vidutiniškai
    for k, v in studentai_vidurkiai.items():
        if studentai_vidurkiai[k] == visu_vidurkis:
            vid_besimokantys[k] = v
        else:
            if studentai_vidurkiai[k] < auksciausias_vidurkis and studentai_vidurkiai[k] > visu_vidurkis:
                geriau_nei_vid_besimokantys[k] = v
            elif studentai_vidurkiai[k] > zemiausias_vidurkis and studentai_vidurkiai[k] < visu_vidurkis:
                blogiau_nei_vid_besimokantys[k] = v
    
    with open("rezultatai-geriau-blogiau-vidutiniškai.txt", "w") as file:
        # Apsibrėžiame antrašes, kurias naudosime rezultatų faile
        geriau_nei_vid_antraste = "Geriau nei vidutiškai besimokantys studentai"
        vid_antraste = "Vidutiniškai besimokantys studentai"
        blogiau_nei_vid_antraste = "Blogiau nei vidutiškai besimokantys studentai"
        
        file.write(geriau_nei_vid_antraste + ":" + "\n")
        for k, v in geriau_nei_vid_besimokantys.items():
            file.write("\tVardas: " + k + ", Vidurkis: " + str(geriau_nei_vid_besimokantys[k]) + "\n")
        file.write("\n")
        
        file.write(vid_antraste + ":" + "\n")
        for k, v in vid_besimokantys.items():
            file.write("\tVardas: " + k + ", Vidurkis: " + str(vid_besimokantys[k]) + "\n")
        file.write("\n")
        
        file.write(blogiau_nei_vid_antraste + ":" + "\n")
        for k, v in blogiau_nei_vid_besimokantys.items():
            file.write("\tVardas: " + k + ", Vidurkis: " + str(blogiau_nei_vid_besimokantys[k]) + "\n")
    
##########################################


# 1) turimą informaciją nuskaito iš failo ir surašo į dvimatį sąrašą; (2 balai)
#   Atidarome failą nurodydami jo pavadinimą skaitymui (raktas: "r");
#   Naudojame sutrumpintą sąrašo sintaksę (angl.: list comprehension) 
with open("duomenys.txt", "r") as file:
    studentai_pazymiai = [line.rstrip("\n").split(",") for line in file]
        
        
# 2) apskaičiuoja kiekvieno studento ir visų studentų bendrą pažymių vidurkius; (2 balai)

studentai_vidurkiai = skaiciuoti_studentu_vidurkius(studentai_pazymiai)
visu_vidurkis = vidurkis(visi_pazymiai(studentai_pazymiai))
print(studentai_vidurkiai)
print(visu_vidurkis)


# 3) suranda geriausiai ir blogiausiai besimokantį(čius) studentą(us):
#   informaciją apie juos įrašo į atskirą failą. (2 balai)

formuoti_geriausius_blogiausius(studentai_vidurkiai)
    
    
# 4) likusius studentus (neima geriausių ir blogiausių) suskirsto į šias kategorijas: 
#   "besimokantys geriau už vidurkį" (studento pažymių vidurkis didesnis už visos grupės pažymių vidurkį),
#   "vidutiniškai" (studento pažymių vidurkis lygus visos grupės pažymių vidurkiui) ir 
#   "blogiau už vidurkį" (studento pažymių vidurkis mažesnis už visos grupės pažymių vidurkį).
#   Šias kategorijas su joms priklausančių studentų vardais bei vidurkiais įrašo į kitą rezultatų failą. (2 balai)

formuoti_vidutinius(studentai_vidurkiai)

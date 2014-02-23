
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Sàraðø sudarymas ir pagrindiniai veiksmai su jais.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2012-09-03 | 2013-05-06
#


# TURINYS -------------------------------

# 
#   1. Sàraðø sudarymas ir jø sàvybës:
#      * komanda list
#      * komanda class
#      * komanda length 
#      * komanda names
#      * komanda attributes
#      * komanda str
#      * operatorius [
#      * operatorius [[
#      * operatorius $
#
#   2. Sàraðø apjungimas:
#      * komanda c
#      * komanda unlist 
#


# PASTABOS ------------------------------

#
# Kol kas pastabø nëra.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# SÀRAÐØ SUDARYMAS                        #
# --------------------------------------- #

# Sàraðas -- tokia duomenø struktûra, kuri nuo vektoriaus skiriasi tuo, kad sàraðo 
# elementai gali bûti skirtingo tipo.

s <- list(0, NA, "a", TRUE, NULL)
s

# Be to, sàraðo elementai gali bûti net ir skirtingos duomenø struktûros. Pvz., 
# vienas elementas gali bûti skaièius, kitas -- loginiø reikðmiø vektorius, treèias 
# elementas ið skaièiø sudaryta matrica, ketvirtas -- kaþkoks kitas sàraðas, kurio 
# elementai yra kiti sàraðai. Tokiu bûdu galima sukurti sudëtingas, hierarchines 
# duomenø struktûras.

s <- list(1:9, c(FALSE, FALSE, TRUE), matrix(1:4, 2, 2))
s


# Tokia duomenø struktûra yra specialaus list tipo.
class(s)

# Kaip ir vektoriaus, sàraðo elementø skaièius randamas su funkcija length.
length(s)

# Kaip ir vektoriaus, sàraðo elementams galima suteikti vardus. Tam naudojama
# komanda names.

names(s) <- c("skaitmenys", "logika", "matrica")
s

# Vardus elementams galima suteikti sàraðo sudarymo metu.
s <- list(skaitmenys = 1:9, logika = c(F, F, T), matrica = matrix(1:4, 2, 2))
s

# Kaip ir kitø R objektø, sàraðo atributus galima paþiûrëti su komanda attributes.
attributes(s)

# Sudëtingo objekto struktûrà galima pamatyti naudojant funkcijà str. Pvz., matome,
# kad sàraðas s yra sudarytas ið trijø elementø, kurio pirmasis vadinasi „skaitmenys“ 
# ir yra sveikøjø skaièiø vektorius, antras yra pavadintas „logika“ ir yra vektorius
# ið trijø loginiø reikðmiø, o treèias elementas vadinasi „matrica“, kurio elementai 
# yra skaièiai 1, 2, 3, 4 ir sudaro 2*2 matricà.

str(s)


# UÞDUOTIS ------------------------------ 

# 1. Sukurkite sàraðà, kuris turi du elementus: pirmas elementas yra vektorius ið
#    maþøjø lotyniðkø raidþiø, o antras -- ið to vektoriaus padaryta matrica su 
#    dviem stulpeliais. Sàraðo elementams suteikite vardus „vektorius“ ir „matrica“.


# Sàraðo elementus pagal jø eilës numerá galima iðskirti dviem bûdais: naudojant 
# operatoriø [ ir naudojant operatoriø [[. Pvz., iðskirsime pirmà elementà.
a <- s[1]
a

b <- s[[1]]
b

# Kadangi operatoriø [ naudojant iðskirtas vektoriaus elementas taip pat yra 
# vektorius, tai analogiðkai iðskirtas sàraðo elementas taip pat bus sàraðas. 
# Operatoriø [[ naudojant iðskirtas sàraðo elementas turës savo pradiná tipà 
# ir struktûrà.

# Palyginus dviem bûdais iðskirtø sàraðo elementø klasæ -- objekto tipà matome,
# kad pirmasis yra sàraðas ið vieno elemento -- vektoriaus, o antrasis ir yra
# tas sveikøjø skaièiø vektorius.

class(a)
class(b)

names(a)
names(b)

length(a)
length(b)

str(a)
str(b)

# Jei sàraðo elementai turi vardus, juos galima panaudoti elementø iðskyrimui.
# Ðiuo atveju operatoriø [ ir [[ naudojimas nesiskiria nuo jø naudojimo nurodant 
# elementø numerius.

x <- s["skaitmenys"]
x

y <- s[["skaitmenys"]]
y

# Operatorius $ naudojamas vieno sàraðo elemento iðskyrimui nurodant jo vardà.
# Elemento vardas daþniausiai raðomas be kabuèiø.

s$skaitmenys


# Kaip ir vektoriams, naudojant operatoriø [ galima iðskirti keletà elementø ið 
# karto. Naudojant operatoriø [[ galima iðskirti tik vienà sàraðo elementà.

i <- c(1, 3)
s[i]

i <- c("skaitmenys", "matrica")
s[i]


# NAUDINGA ------------------------------

# Vienoje iðraiðkoje galima naudoti skirtingus operatorius [, [[ ar $. Kartais tas
# yra bûtina, ypaè tais atvejais, kai sàraðas yra sudëtingos struktûros ir reikia
# pasiekti giliai esantá elementà. Statistiniø procedûrø rezultatai daþniausiai
# yra sàraðai, kurie gali bûti sudaryti ið kitø sàraðø, kuriø elementai daþnai yra 
# vektoriai, matricos ir t.t. Pvz., ið sàraðo s iðskirsime pirmojo elemento, kuris 
# yra vektorius, ketvirtà nará.

# Èia sàraðo elementas iðskiriamas su [[ ir jo numeriu, o vektoriaus su [ ir numeriu.
s[[1]][4]            

# Èia sàraðo elementas iðskiriamas su [[ ir jo vardu, o vektoriaus su [ ir numeriu.
s[["skaitmenys"]][4] 

# Èia sàraðo elementas iðskiriamas su $ nurodant vardà, o vektoriaus su [ ir numeriu.
s$skaitmenys[4]      


# UÞDUOTIS ------------------------------ 

# 1. Paraðykite komandà, kuri, nepriklausomai nuo sàraðo elementø skaièiaus, 
#    iðskirtø  pirmà ir paskutiná jo elementus.
# 2. Trimis aukðèiau apraðytais bûdais iðskirkite ið sàraðo s paskutinio elemento 
#    (matricos) paskutiná elementà. Paraðykite tokià komandà, kuri nepriklausytø 
#    nuo sàraðo ilgio.


# --------------------------------------- #
# SÀRAÐØ APJUNGIMAS                       #
# --------------------------------------- #

# Praktikoje daþnai tenka analizuoti to paties tipo, bet skirtingo ilgio vektorius, 
# kuriø negalima apjungti á matricà, nes eilutës ar stulpeliai negali bûti skirtingo
# ilgio. Tokiais atvejais vektorius patogu apjungti á sàraðà.

# Sukurkime tuðèià sàraðà, prie kurio prijungsime naujus elementus -- vektorius.
u <- list()
v <- list()

u[[1]] <- c(22, 83, 64, 23, 34, 93, 95, 36, 25, 49, 55, 13)
u[[2]] <- c(60, 95, 19, 9, 82, 26, 53, 84, 50, 74, 88, 62, 83, 42, 18, 77, 3)
u[[3]] <- c(67, 24, 63, 85, 65, 49, 37, 42, 72)
u[[4]] <- c(21, 35, 97, 88, 77, 62, 91, 58, 23, 56, 5, 2, 34, 82, 16)

v[[1]] <- c(3, 66, 43, 55, 97, 81, 96, 5, 98, 52, 15, 68, 11, 50, 87, 17)


# Viename sàraðe yra keturi vektoriai, kitame -- vienas. Visi jie to paties tipo, 
# taèiau skirtingø ilgiø.
u 
v

# Naudojant funkcijà c, sàraðus, kaip ir vektorius, galima prijungti vienà prie 
# kito. Tokiu atveju gaunamas sàraðas, kurio ilgis lygus apjungiamø sàraðø elementø 
# skaièiui.
l <- c(u, v)
l

length(l)
class(l)
str(l)


# Naudojant funkcijà list, sàraðus u ir v galima apjungti á vienà bendrà sàraðà. 
# Tokiu atveju gaunamas sàraðas ið dviejø elementø, kuriø kiekvienas atskirai yra 
# sàraðas.
z <- list(Pirmas = u, Antras = v)
z

length(z)
class(z)
str(z)

# Tokio sàraðo pirmo elemento pirmo vektoriaus pirmas narys iðskiriamas taip:
z$Pirmas[[1]][1]


# Sàraðo struktûrà galima supaprastinti apjungiant já sudaranèius elementus á 
# vektoriø. Tam naudojama funkcija unlist. Jos parametrai:
#
#         x -- sàraðas, kurio struktûrà ketiname supaprastinti,
# recursive -- pagal nutylëjimà TRUE, nurodo sàraðo elementus apjungti rekursiðkai,
# use.names -- pagal nutylëjimà TRUE, nurodo sàraðo elementams iðlaikyti vardus.

# Pritaikius ðià funkcijà sàraðui l, kuris turëjo 5 elementus-vektorius, gaunamas 
# vienas ilgas vektorius.
unlist(l)

# Pritaikius ðià funkcijà dviejø lygiø sàraðui z taip pat gauname vienà ilgà vektoriø.
# Kadangi sàraðo elementai turëjo vardus, tai gauto vektoriaus elementai su vardais.
unlist(z)

# Galima nurodyti, kad naujai gautas vektorius neturëtø senojo sàraðo vardø.
unlist(z, use.names = FALSE)

# Pagal nutylëjimà sàraðo, kurá sudaro kiti sàraðai, elementai apjungiami rekursiðkai.
# Pakeitus parametro recursive reikðmæ á FALSE, gauname sàraðà, kurá sudaro giliau 
# esanèiø sàraðø elementai, ðiuo atveju -- vektoriai.

unlist(z, recursive = FALSE)

unlist(z, recursive = FALSE, use.names = FALSE)

# Panaikinus tokio sàraðo elementø vardus, gauname toká pat sàraðà, koks buvo 
# gautas su funkcija c apjungus sàraðus u ir v. Tokiu bûdu galima supaprastinti 
# hierarchinæ struktûrà turinèius sàraðus.


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite kaip galima trumpesnæ komandà, kuri sukurtø sàraðà, sudarytà ið 10
#    2*2 dydþio matricø, kurios pirmo stulpelio elementai lygûs 1, o antro -- 2. 
# 2. Duotas sàraðas w <- list(list(list(1:2), list(3:4)), list(list(5:6), list(7:8))).
#    Iðnagrinëkite jo struktûrà. Kiek elementø sudaro taip uþraðytà sàraðà? 
#    Funkcija unlist(w) ið ðio sàraðo padaro vektoriø (1, 2, 3, 4, 5, 6, 7, 8).
#    Gaukite toká pat vektoriø su funkcija unlist, taèiau su parametru recursive = F.


#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Matricø sudarymas ir pagrindinës jø savybës.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2012-09-03 | 2013-05-06
#


# TURINYS -------------------------------

# 
#   1. Matricø sudarymas ir jø sàvybës:
#      * komanda matrix
#      * komanda mode 
#      * komanda class
#      * komanda dim
#      * komanda length
#      * komanda nrow ir ncol 
#      * komanda rownames ir colnames
#      * komanda dimnames
#      * operatorius [
#
#   2. Vektoriø ir matricø apjungimas:
#      * komanda cbind
#      * komanda rbind 
#


# PASTABOS ------------------------------

#
# Ateityje pridëti skyrelá apie array duomenø struktûrà.
# Pastaba apie vienà dimensijà turinèio masyvo dimensijos panaikinimà su drop.
# Pridëti skyrelá apie funkcijà str kintamojo struktûrai nustatyti.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# MATRICØ SUDARYMAS                       #
# --------------------------------------- #

# R kalboje matrica yra dvimatis masyvas, kurio visos reikðmës yra vienodo tipo. 
# Matricos sudarymui naudojama funkcija matrix. Jos parametrai:
# 
#     data -- vektorius, kurio reikðmëmis uþpildoma matrica,
#     nrow -- matricos eiluèiø skaièius,
#     ncol -- matricos stulpeliø skaièius,
#    byrow -- pagal nutylëjimà FALSE, matrica uþpildoma stulpeliais,
# dimnames -- eiluèiø ir stulpeliø vardø sàraðas.


# Pirmiausia nurodome matricos reikðmiø vektoriø. Antras parametras yra eiluèiø 
# ir tada stulpeliø skaièius. Pagal nutylëjimà reikðmës iðdëstomos stulpeliais.

x <- 1:10
m <- matrix(data = x, nrow = 5, ncol = 2)
m

# Pakeitus parametro byrow reikðmæ á TRUE, tà patá reikðmiø vektoriø matricoje 
# galima iðdëlioti eilutëse.

m <- matrix(data = x, nrow = 5, ncol = 2, byrow = TRUE)
m

# Jei argumentai uþraðomi ta paèia tvarka, parametrø pavadinimø galima neraðyti.
m <- matrix(x, 5, 2)
m

# Kadangi vektoriaus ilgis fiksuotas, tai ið jo sudarytà matricà pilnai galima
# nusakyti vien tik eiluèiø arba vien tik stulpeliø skaièiumi. Bet nevisada!

matrix(x, nrow = 5)
matrix(x, ncol = 2)

# Jei matricos reikðmiø vektorius per trumpas ir jo elementø neuþtenka uþpildyti 
# visai matricai, jis cikliðkai pakartojamas. Ðià savybæ galima panaudoti sudarant 
# matricà, sudaryta ið vienodø reikðmiø. Pvz., sudarysime 10 eiluèiø ir 3 stulpeliø 
# matricà, kurios visi elementai lygûs nuliui.

y <- 0
n <- matrix(y, nrow = 10, ncol = 3)
n

# Matrica gali bûti sudaryta ið bet kokio tipo vienodø reikðmiø: skaièiø, simboliø,
# loginiø reikðmiø ir t.t. Pvz., sudarysime matricà ið mënesiø pavadinimø.

y <- month.name
n <- matrix(y, ncol = 2)
n


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite kiek ámanoma trumpesnæ komandà, kuri sudarytø matricà ið 10 eiluèiø 
#    ir 2 stulpeliø, kur visi pirmo stulpelio nariai lygûs 1, o antrojo lygus 2.
# 2. Sukurkite antros eilës kvadratinæ matricà sudarytà ið praleistø reikðmiø.


# Kaip ir vektoriaus, visi matricos elementai yra to paties tipo. Já parodo funkcija 
# mode.

mode(x)     # vektoriaus elementø tipas 
mode(m)     # matricos elementø tipas

# Kintamojo klasë parodo, kokio tipo duomenø struktûrà sudaro kintamojo elementai.
# Kintamojo, kurio reikðmë yra vektorius, klasë sutampa su to vektoriaus reikðmiø
# tipu (numeric, integer, character ir t.t.). Kintamojo, kurio reikðmë yra matrica, 
# klasë yra matrix.

class(x)    # kintamasis x yra (skaitinio tipo) vektorius
class(m)    # kintamasis m yra matrica

# Matrica nuo vektoriaus (ið kurio ji gali bûti sudaryta) ið esmës skiriasi tuo, 
# kad matrica turi dimensijos atributà, ðiuo atveju tai yra eiluèiø ir stulpeliø 
# skaièius. 
attributes(m)

# Matricos dimensijos nustatymui naudojama funkcija dim. Pirmas gauto vektoriaus 
# skaièius yra matricos eiluèiø skaièius, antrasis -- stulpeliø skaièius. 
dim(m)

# Matricos dimensijà, kaip ir bet kurá kità atributà, galima pakeisti. Pvz., matricà
# galima paversti á matricà-eilutæ. Taèiau tokia matrica-eilutë nëra vektorius!
dim(m) <- c(1, 10)
m

# Matricos dimensijà galima panaikinti, tada matrica pavirsta á vektoriø, kurio 
# elementai iðrikiuoti pagal stulpelius.
dim(m) <- NULL
m

# Kad vektorius nuo matricos skiriasi tik dimensija, galima nesunkiai parodyti.
# Naudodami funkcijà dim, vektoriui m priskirkime dimensijà. Taip pakeistas 
# vektorius vël bus matrica.
dim(m) <- c(5, 2)
m

# Matricos elementø skaièiui apskaièiuoti naudojama ta pati funkcija length.
length(m)

# Matricos eiluèiø ir stulpeliø skaièiui surasti naudojamos funkcijos nrow ir ncol.
nrow(m)
ncol(m)

# Matricos eiluèiø ir stulpeliø pavadinimams nustatyti ar pakeisti naudojamos 
# funkcijos rownames ir colnames. Pavyzdþiui., matricos stulpelius pavadinsime X 
# ir Y, o eilutes -- maþosiomis abëcëlës raidëmis.

rownames(m) <- letters[1:5]
colnames(m) <- c("X", "Y")
m

rownames(m)
colnames(m)

# Eiluèiø arba stulpeliø vardus galima pakeisti arba ir visai panaikinti. 
rownames(m) <- NULL
m

# Funkcija dimnames naudojama ið karto abiejø dimensijø vardams parodyti ar jiems 
# pakeisti. Ðios funkcijos rezultatas yra sàraðas, kurio pirmas elementas yra 
# eiluèiø vardø vektorius, o antras -- stulpeliø vardø vektorius.
dimnames(m)
m


# UÞDUOTIS ------------------------------ 

# 1. Naudojant funkcijà dim paraðykite tokià komandà, kuri transponuotø matricà.


# Bet kuris matricos elementas pasiekiamas nurodant eilutës ir stulpelio numerá.
m[1, 1]

# Kaip ir vektoriams, galima nurodyti matricos eiluèiø ir stulpeliø indeksø aibæ.
# Pvz., ið matricos m iðskirsime pirmas dvi eilutes ir pirmus du stulpelius.
i <- c(1, 2)
j <- c(1, 2)
m[i, j]

# Tokià pat indeksø aibæ galima nurodyti ir labai kompaktiðku pavidalu.
m[1:2, 1:2]


# Ið matricos galima iðskirti bet kurià pasirinktà eilutæ ar stulpelá.
i <- 2
m[i, ]  # taip gaunama i-oji matricos eilutë, trumpiau taip: m[2, ]

j <- 1
m[, j]  # taip iðskiriamas j-asis stulpelis,  trumpiau taip: m[, 1]

# Galima iðskirti kelias matricos eilutes ar stulpelius, pvz., pirmas 3 eilutes.
i <- c(1, 2, 3)
m[i, ]

# Jei matricos eilutës arba stulpeliai turi vardus, juos galima panaudoti nurodant
# konkreèias eilutes arba stulpelius.
m[, "Y"]


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite komandà, kuri matricos m stulpelius sukeistø vietomis.
# 2. Uþraðykite komandà, kuri iðskirtø pirmus tris Y stulpelio elementus.
# 3. Uþraðykite komandà, kuri ið matricos m iðskirtø nelyginius pirmo stulpelio
#    narius iðdëstytus maþëjanèia tvarka.


# --------------------------------------- #
# VEKTORIØ IR MATRICØ APJUNGIMAS          #
# --------------------------------------- #

# Jei vektoriø apjungimui á vektoriø naudojama funkcija c, tai vektoriø ir matricø 
# apjungimui á matricà naudojamos komandos cbind ir rbind. Funkcija cbind vektorius
# sujungia kaip matricos stulpelius, funkcija rbind -- kaip eilutes.

x <- c(2.6, 4.8, 6.3,  8.1, 11.0, 13.0, 14.2, 16.8, 18.4, 20.2, 22.4, 24.2)
y <- c(3.5, 2.9, 6.2, 18.9, 31.5, 14.1, 26.9, 32.6, 35.3, 28.3, 40.5, 46.0)


# Vektorius x ir y apjungiame á matricà su dviem stulpeliais. Gauname matricà, 
# kurios stulpeliø pavadinimai sutampa su vektoriø vardais.
m <- cbind(x, y)
m

dim(m)
colnames(m)

# Panaðiai, kaip vektoriaus elementams, vardus matricos stulpeliams galima suteikti
# matricos sudarymo metu.
m <- cbind(X = x, Y = y)
m

dim(m)
colnames(m)

# Naudojant funkcijà rbind, tuos paèius vektorius x ir y apjungiame á matricà su 
# dviem eilutëmis, kurioms suteikiami nauji vardai.
d <- rbind(A = x, B = y)
d

dim(d)
rownames(d)

# Jei apjungiamø vektoriø ilgis nesutampa, trumpesnis yra cikliðkai pratæsiamas.
cbind(1, 1:10) 

# Su funkcijomis cbind ir rbind galima apjungti ne tik vektorius, bet ir kitas 
# matricas. Atkreipkite dëmesá -- stulpeliø vardai gali kartotis! Tokiu atveju 
# stulpelá parenkant pagal vardà, bus iðrenkamas pirmas pasikartojantá vardà 
# turintis stulpelis, bet ne visi.

cbind(m, m)


# UÞDUOTIS ------------------------------ 

# 1. Naudojant cbind paraðykite kiek ámanomà trumpesnæ komandà, kuri sukurtø 10 
#    eiluèiø matricà, kurios pirmojo stulpelio visi elementai bûtø lygûs 1, 
#    antrojo lygûs 2 ir treèiojo -- 3.
# 2. Uþraðykite komandà, kuri ið vektoriø x ir y sudarytø matricà ið 4 nesikartojanèiø 
#    stulpeliø.

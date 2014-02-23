
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Ávairûs kintamøjø iðvedimo á ekranà bûdai.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-07-25 | 2013-07-26 | 2014-02-22
#


# TURINYS -------------------------------

#
#   1. Kintamøjø iðvedimas:
#      * procedûra cat
#      * procedûra print
#
#   2. Kintamøjø struktûros uþraðymas:
#      * funkcija dput
#      * funkcija dget
#      * funkcija dump
#      * funkcija source
#


# PASTABOS ------------------------------

#
# Paraðyti apie funkcijas sink ir capture.output.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# KINTAMØJØ IÐVEDIMAS Á EKRANÀ            #
# --------------------------------------- #

# Pats paprasèiausias bûdas pamatyti vektoriaus, matricos arba bet kokio kito R 
# kintamojo reikðmæ -- iðvesti á ekranà. Tam konsolëje reikia paraðyti kintamojo
# vardà ir paspausti klaviðà Enter. Raðant programà á failà (skriptà), kintamojo
# reikðmë á ekranà iðvedama paspaudus ant jo klaviðà F5. Pavyzdþiui, taip galima 
# pamatyti standartinio R kintamojo konstantos pi reikðmæ.
pi

# Raðant programà ir atliekant skaièiavimus, rezultatus tenka iðvesti tam tikru
# pavidalu. Pvz., "Kintamojo pi reikðmë yra 3.141593". Ðiuo atveju tekstà reikia
# apjungti su kintamojo pi reikðme. Tokiu atveju rezultato iðvedimui á ekranà
# naudojama procedûra cat. Jos parametrai:
#
#     ... -- R kintamasis: vektorius arba matrica,
#    file -- kabutëse uþraðomas duomenø failo vardas arba kelias iki failo,
#     sep -- simbolis, kuriuo atskiriami objektai,
#    fill -- pagal nutylëjimà FALSE, nurodo kaip uþpildomos eilutës,
#  labels -- character tipo vektorius su eiluèiø vardais,
#  append -- jei TRUE, vektoriaus reikðmës áraðomos á jau esantá failà.

# Pagal nutylëjimà parametro file reikðmë yra tuðèios kabutës, todël rezultatas
# iðvedamas á konsolæ. Nurodþius failo vardà, rezultatas bus iðvedamas á failà
# darbiniame kataloge. 

# Vietoje parametro ... raðomi kintamøjø vardai, kurie vienas nuo kito atskiriami 
# kableliu. Taip pat kabutëse galima raðyti tekstà, kuris bus prijungtas prie kitø
# kintamøjø.

# Paèiu paprasèiausiu atveju procedûra cat kintamojo reikðmæ iðveda á konsolæ.
cat(pi)

# Kad kursorius po rezultato iðvedimo konsolëje bûtø perkeliamas á kità eilutæ, 
# procedûrai papildomai perduodame eilutës galo simbolá \n.
cat(pi, "\n")


# Uþraðysime komandà, kuri iðveda tekstà "Kintamojo pi reikðmë yra 3.141593". Já 
# galima suskaidyti á tris sudëtines dalis: tekstà, kintamàjá pi ir kursoriaus 
# perkëlimo á kità eilutæ simbolá \n. Juos reikia apjungti. Sudarome atitinkamus 
# kintamuosius ir perduodame juos procedûrai.

txt <- "Apytikslë skaièiaus pi reikðmë yra"
var <- pi
new <- "\n"

cat(txt, var, new)

# Kad bûtø paprasèiau, tokias nesudëtingas komandas galima apjungti á vienà.
cat("Apytikslë skaièiaus pi reikðmë yra", pi, "\n")


# NAUDINGA ------------------------------

# Procedûrà cat galima panaudoti nesudëtingø duomenø rinkiniø iðvedimui á failà.
# Tam reikia nurodyti failo vardà arba pilnà kelià iki failo.
cat(pi, file = "test.dat")

# Pagal nutylëjimà kintamojo reikðmës atskiriamos tarpu, todël faile suraðomos á
# vienà eilutæ.
v <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
cat(v, file = "test.dat")

# Nurodþius, kad kintamojo reikðmës bus atskirtos eilutës galo simboliu \n, jos 
# faile bus suraðomos po vienà á vienà eilutæ.
cat(v, file = "test.dat", sep = "\n")


# UÞDUOTIS ------------------------------ 

# 1. Tegu kintamasis k lygus 3, o kintamasis n lygus 8. Naudodami procedûrà cat,
#    uþraðykite komandà, kuri á konsolæ iðvestø tekstà "Atlikta: 3 ið 8".
# 2. Naudodami procedûrà cat, uþraðykite komandà, kuri á ekranà iðveda tekstà: 
#    "Data: 2013-07-26". Datà parodo standartinë R funkcija Sys.Date(). 
# 3. Naudodami procedûrà cat, sukurkite tekstiná failà, kurio pirma eilutë yra 
#    uþkomentuota simboliu #, uþ jo áraðyta data ir laikas, antra eilutë tuðèia, 
#    treèioje eilutëje skaièiai 1, 2 ir 3. Datà ir laikà parodo funkcija date().
#    Toká failà galima sukurti su viena komanda, bet naudojant parametrà append 
#    visas tris eilutes á tà patá failà galima áraðyti atskirai vienà po kitos.


# Sudëtingesniø kintamøjø, pvz., daþniø lentelës, iðvedimui naudojama procedûra 
# print. Jos parametrai priklauso nuo kintamojo klasës, pagrindiniai yra tokie:
#
#          x -- R kintamasis,
#      quote -- jei TRUE, tai tekstas iðvedamas kabutëse,
#     digits -- reikðminiø skaitmenø skaièius, pagal nutylëjimà 7,
#   na.print -- simbolis, kuris spausdinamas vietoje praleistos reikðmës,
# zero.print -- simbolis, kuris spausdinamas vietoj nulio daþniø lentelëje.

# Jei vektorius turi praleistø reikðmiø, jos þymimos ir ekrane matomos kaip NA. 
v <- c(0, 1, 2, 3, NA, 5, NA, 7, 8, 9)
v

# Be papildomø nustatymø procedûra print vektoriø su praleistomis reikðmëmis 
# iðveda toká, koks jis ir yra.
print(v)

# Kartais praleistas reikðmes NA galima pakeisti kitu simboliu, pvz., brûkðniu, 
# arba ir visai nespausdinti.
print(v, na.print = "-")


# Jei vektoriaus reikðmës yra simboliai, þodþiai arba jø junginiai, jie raðomi 
# kabutëse ir á ekranà taip pat iðvedami kabutëse.
t <- c("A", "B", "C", "D")
t

print(t)

# Parametro quote reikðmæ pakeitus á FALSE, character tipo vektoriaus reikðmës á
# ekranà bus iðvedamos be kabuèiø.
print(t, quote = FALSE)


# Keièiant parametro digits reikðmæ, galima keisti á ekranà iðvedamø reikðminiø
# skaitmenø skaièiø.

print(pi)
print(pi, digits = 1)
print(pi, digits = 3)
print(pi, digits = 5)


# Parametras zero.print gali bûti naudingas, kai á ekranà iðvedama "reta" daþniø
# lentelë, kuri turi daug nuliniø reikðmiø ir kurios vizualiai trukdo áþvelgti
# kitas lentelës reikðmes. Tokiu atveju galima nurodyti, kad vietoje nulio bûtø
# atspausdinamas koks nors kitas simbolis.

# Sukursime testinæ daþniø lentelæ ið automobiliø greièio ir stabdymo atstumo
# duomenø rinkinio cars.
cars

# Gaunama gana didelë daþniø lentelë, taèiau didþioji dauguma jos reikðmiø yra 
# nuliai ir pastebëti nenulines reikðmes sunku.
l <- table(cars)
l

# Vietoje nulio galima atspausdinti taðkà, ir vaizdas pasidaro þymiai geresnis.
print(l, zero.print = ".")


# UÞDUOTIS ------------------------------ 

# 1. Naudodami procedûrà print, vektoriø v iðveskite á ekranà taip, kad vietoje
#    praleistø reikðmiø bûtø tuðèias tarpas.
# 2. Duomenø lentelëje co2 yra 1959-1997 metø duomenys apie CO2 koncentracijà.
#    Naudodami procedûrà print, iðveskite duomenis á ekranà taip, kad matavimø
#    reikðmës bûtø sveiki skaièiai.


# --------------------------------------- #
# KINTAMØJØ STRUKTÛROS UÞRAÐYMAS          #
# --------------------------------------- #

# Daþnai vektoriai, matricos arba kitos duomenø struktûros sukuriamos uþraðant
# tam tikrà komandà. Pvz., vieno tipo reikðmës á vektoriø apjungiamos naudojant 
# komandà c.
v <- c(1, 2, 3, 4, 5, 6)
v

# Naudojant komandà matrix ið vektoriaus v sukursime 2x3 dydþio matricà.
m <- matrix(v, nrow = 2, ncol = 3)
m

# Duomenø lentelæ galima sukurti naudojant komandà data.frame.
d <- data.frame(var = c("a", "b", "c"), ats = c("taip", "ne", "neþinau"))
d

# Kartais iðkyla atvirkðtinis uþdavinys -- turint vektoriø, matricà arba duomenø
# lentelæ reikia uþraðyti tà duomenø struktûrà sukurianèià komandà. Tam naudojama 
# funkcija dput. Pagrindiniai jos parametrai:
#
#       x -- R kintamasis,
#    file -- failo, á kurá iðvedama kintamàjá sukurianti komanda, vardas,
# control -- kintamojo struktûros detalumo parametras, "all", NULL.

# Pagal nutylëjimà parametro file reikðmë yra "", todël nenurodþius failo vardo, 
# funkcijos dput rezultatas automatiðkai iðvedamas á konsolæ (ekranà). Kintamojo
# struktûros detalumà nusako parametras control. Pagal nutylëjimà jo reikðmë yra 
# "all", todël kintamojo struktûra atstatoma kiek ámanoma tiksliau. Norint gauti
# minimalià kintamojo struktûrà, parametrui control galima nurodyti reikðmæ NULL.

# Tekstinio pavidalo kintamojo struktûrà galima nukopijuoti, pataisyti, perkelti 
# á kità programà ir taip atkartoti kintamàjá.


# Kadangi vektorius -- labai paprasta duomenø struktûra, jà sukurianti komanda 
# taip pat yra nesudëtinga.
dput(v)

# Matrica m nuo vektoriaus v skiriasi tuo, kad turi eiluèiø ir stulpeliø skaièiø
# nusakantá atributà (dimensijà).
dput(m)

# Á konsolæ iðvedama komanda, kurià suvykdþius gaunama tokia pati matrica.
n <- structure(c(1, 2, 3, 4, 5, 6), .Dim = 2:3)
n

# Duomenø lentelës struktûra þymiai sudëtingesnë. Kiekviena data.frame kintamojo
# eilutë yra sàraðas, o stulpeliai yra vektoriai, kurie gali bûti skirtingo tipo.
# Taip pat lentelë turi eiluèiø numerius ir stulpeliø pavadinimus.
dput(d)

# Á konsolæ iðvedamas toks data.frame tipo kintamojo struktûrà apraðantis kodas.

structure(list(var = structure(1:3, .Label = c("a", "b", "c"), class = "factor"), 
    ats = structure(c(3L, 1L, 2L), .Label = c("ne", "neþinau", 
    "taip"), class = "factor")), .Names = c("var", "ats"), row.names = c(NA, 
-3L), class = "data.frame")

# Esminë ðios lentelës dalis yra du kategoriniai kintamieji var ir ats, kuriø
# reikðmes galima sutapatinti su sveikais skaièiais. Tokià minimalià kintamojo
# struktûrà galima gauti parametrui control nurodæ reikðmæ NULL.
dput(d, control = NULL)


# Kintamojo struktûros kodà galima iðsaugoti tekstiniame faile.
dput(d, file = "duom.dmp")

# Kintamasis atkuriamas naudojant funkcijà dget, kuriai nurodomas failo vardas.
# Ið failo nuskaityta struktûra paverèiama á kintamàjá ir iðvedama á konsolæ.
dget(file = "duom.dmp")

# Funkcijos dget rezultatà galima priskirti kitam kintamajam. Pvz., nuskaitysime
# failà "duom.dmp" ir sukursime naujà duomenø lentelæ b.
b <- dget(file = "duom.dmp")
b


# Panaðiu bûdu tekstiná kintamojo pavidalà galima gauti naudojant fukcijà dump. 
# Pagrindiniai jos parametrai:
#
#    list -- character tipo kintamøjø vardø vektorius,
#    file -- failo, á kurá iðvedama kintamàjá sukurianti komanda, vardas,
# control -- kintamojo struktûros detalumo parametras, "all", NULL,
#  append -- jei TRUE, vektoriaus reikðmës áraðomos á jau esantá failà.

# Parametrui file nurodþius failo vardà, darbiniame kataloge sukuriamas R script 
# failas, kurá suvykdþius gaunami list vektoriuje nurodyti kintamieji.


# Pavyzdþiui, á konsolæ iðvesime kintamojo v kodà.
dump(list = "v", file = "")

# Tokiu bûdu galima gauti ið karto keliø kintamøjø kodà.
dump(list = c("v", "m"), file = "")


# Sukursime keletos kintamøjø script failà. 
dump(list = c("v", "m"), file = "dump.R")

# Naudojant funkcijà source toká failà galima suvykdyti ir atkurti jame áraðytus 
# kintamuosius.
source(file = "dump.R")


# UÞDUOTIS ------------------------------ 

# 1. Naudodami funkcijà dput, sukurkite duomenø lentelës cars struktûros kodà.
#    Nukopijuokite ið jo tà dalá, kuri atitinka kintamàjá speed ir naudodami jà 
#    sukurkite naujà vektoriø s.
# 2. Darbiniame kataloge sukurkite tekstiná failà "vector.R", jo viduje áraðykite
#    komandà, kuri sukuria bet koká skaièiø vektoriø. Naudodami funkcijà source
#    nuskaitykite ðá failà.

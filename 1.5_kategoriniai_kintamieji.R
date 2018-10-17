
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Kategoriniai kintamieji -- faktoriai.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-03-18 | 2013-05-06
#


# TURINYS -------------------------------

# 
#   1. Faktoriø sudarymas ir jø sàvybës:
#      * komanda factor
#      * komanda class
#      * komanda mode
#      * komanda levels
#      * komanda nlevels
#      * komanda length
#      * komanda attributes
#      * komanda str
#      * komanda is.ordered
#      * komanda gl
#
#   2. Faktoriø reikðmø keitimas:
#      * komanda relevel
#      * komanda droplevels
#      * operatorius [
#      * komanda ordered
#


# PASTABOS ------------------------------

#
# Paraðyti apie funkcijos reorder taikymà.
# Pridëti funkcijà interaction.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# FAKTORIAI IR JØ SAVYBËS                 #
# --------------------------------------- #

# Programavimo kalboje R faktoriais vadinami vardø arba rangø skalës kintamieji,
# kurie ágyja baigtiná skaièiø skirtingø reikðmiø. Statistikoje tokie kintamieji
# vadinami kategoriniais. Kategoriniø kintamøjø reikðmës daþnai bûna uþkoduotos 
# simboliais, þodþiais, pavadinimais ar skaièiais. Jei faktorius sudarytas ið 
# vardø skalëje iðmatuoto kategorinio kintamojo, tai jo reikðmiø iðrikiavimas 
# neturi jokios prasmës. Jei tai ranginis kintamasis, tai rango didëjimo tvarka 
# iðrikiuotos reikðmës turi tam tikrà prasmæ.

# Tokiems kintamiesiems sukurti R naudojama funkcija factor. Jos parametrai:
# 
#        x -- kategorinio kintamojo reikðmiø vektorius,
#   levels -- skirtingø kategorinio kintamojo reikðmiø vektorius,
#   labels -- kintamojo reikðmiø pavadinimø vektorius,
#  ordered -- loginë reikðmë, jei TRUE, tai nurodo, kad kintamasis yra ranginis.


# Turime vektoriø, kurio reikðmës nurodo pvz. anketà pildanèiø þmoniø lytá.
# Pagal nutylëjimà galimos faktoriaus reikðmës bus iðrikiuotos pagal abëcëlæ.

x <- c("Vyras", "Moteris", "Vyras", "Moteris", "Moteris", "Moteris", "Vyras")
f <- factor(x)
f


# Faktorius kaip duomenø struktûra yra specialaus factor tipo.
class(f)

# Nepriklausomai nuo to, kokias reikðmes ágyja kategorinis kintamasis, faktorius
# yra sveikøjø skaièiø 1, 2, ... , k vektorius, kur k yra skirtingø kintamojo 
# reikðmiø skaièius, o kiekvienam jo nariui priskirtas pavadinimas -- kategorinio 
# kintamojo reikðmë. Todël funkcija mode nurodo, kad faktoriaus kaip vektoriaus 
# reikðmës yra numeric tipo.

mode(f)


# Kokias skirtingas reikðmes turi kategorinis kintamasis parodo funkcija levels.
levels(f)

# Kiek skirtingø reikðmiø turi kategorinis kintamasis parodo funkcija nlevels.
nlevels(f)

# Kaip ir kiekvieno vektoriaus, faktoriaus ilgis reiðkia visø jo elementø skaièiø.
length(f)


# Faktorius kaip R kintamasis turi keletà pagrindiniø atributø: tai yra kintamojo 
# reikðmiø vektorius ir faktoriaus kaip duomenø struktûros klasë.
attributes(f)

# Faktoriaus struktûrà galima pamatyti naudojant funkcijà str. Matosi, kad faktorius 
# yra tam tikrà skirtingø reikðmiø skaièiø turintis sveikøjø skaièiø vektorius.
str(f)


# Funkcija is.ordered nurodo, ar faktorius yra ranginis kintamasis, ðiuo atveju ne.
is.ordered(f)


# Tam tikra ið anksto nustatyta tvarka iðdëstytø faktoriø seka generuojama su 
# funkcija gl. Jos parametrai:
# 
#       n -- kintamojo ágyjamø reikðmiø skaièius,
#       k -- reikðmiø pakartojimø skaièius,
#  length -- bendras faktoriaus elementø skaièius,
#  labels -- faktoriaus ágyjamø reikðmiø pavadinimø vektorius,
# ordered -- loginis kintamasis, nurodantis ar faktorius yra ranginis.


# Sukursime faktoriø turintá dvi kategorijas, kurios pakartotos po penktis kartus.
# Kadangi kategorijø vardai nenurodyti, juos atstoja kategorijø numeriai: 1 ir 2.
g <- gl(n = 2, k = 5)
g

# Galima sukurti dvi periodiðkai pasikartojanèias kategorijas turintá faktoriø.
g <- gl(n = 2, k = 1, length = 10)
g

# Kategorijoms galima suteikti vardus, kurie nebûtinai turi bûti þodis ar skaièius.
g <- gl(2, 1, 10, labels = c("Mësa", "><(((°>"))
g

table(g)


# NAUDINGA ------------------------------

# Tà patá rezultatà galima gauti ir nenaudojant procedûros gl, taèiau komanda 
# gaunasi ne tokia kompaktiðka: su funkcija rep generuojame pasikartojanèià sekà,
# kurià vëliau paverèiame á faktoriø ir priskiriame kategorijoms pavadinimus.
g <- rep(1:2, length = 10)
g <- factor(g, labels = c("Mësa", "><(((°>"))
g


# UÞDUOTIS ------------------------------ 

# 1. Sugeneruokite faktoriø h, kuris turëtø po 5 kartus pasikartojanèias tris 
#    kategorijas, ir suteikite joms vardus "I lygis", "II lygis" ir "III lygis".
# 2. Faktoriø h su tokiais pat kategorijø pavadinimais sudarykite naudodami 
#    funkcijas rep ir factor.
# 3. Sugeneruokite faktoriø d, kuris reikðtø visas vieno mënesio savaitës dienas.
#    Tarkime, kad mënuo turi 30 dienø, o savaitës dienas pradedame skaièiuoti nuo
#    pirmadienio. Savaitës dienoms suteikite pilnus vardus.


# --------------------------------------- #
# FAKTORIØ REIKÐMIØ KEITIMAS              #
# --------------------------------------- #

# Iðvedant faktoriø á ekranà, uþraðomi visi skirtingi kintamojo reikðmiø variantai 
# (levels). Jei kategorinis kintamasis buvo uþraðytas kaip tekstiniø arba simboliniø 
# reikðmiø vektorius, tai faktoriuje tos reikðmës bus iðrikiuotos abëcëlës tvarka, 
# jei kintamojo reikðmiø vektorius buvo ið skaièiø -- tada iðrikiuotos jø didëjimo 
# tvarka. Taèiau tokia tvarka dar nereiðkia, kad faktorius yra ranginis kintamasis!

# Faktoriaus visø galimø reikðmiø vektoriø ir jo elementø iðdëstymo tvarkà parodo 
# funkcija levels. Pavyzdþiui, kintamojo reikðmës "Moteris" ir "Vyras" yra tekstinës,
# todël pagal nutylëjimà faktoriuje jos iðrikiuotos pagal abëcëlæ.
levels(f)


# Naudojant funkcijà levels, jau sukurto faktoriaus ágyjamø reikðmiø vektoriø galima 
# pervadinti. Èia svarbu iðlaikyti tà paèià reikðmiø tvarkà: ("Moteris", "Vyras"), o
# naujas reikðmiø vektorius gali bûti pvz., ("Mot", "Vyr"), ("M", "V") ar panaðiai.

levels(f) <- c("Mot", "Vyr")
levels(f)
f


# Su funkcija levels atliekamas faktoriaus ágyjamø reikðmiø iðdëstymo pakeitimas 
# yra nekorektiðkas! Pavyzdþiui, pakeitus faktoriaus reikðmiø "Moteris" ir "Vyras" 
# iðdëstymo tvarkà, á prieðingas pasikeièia ir visø faktoriaus reikðmiø prasmës!
# Padarius tokià klaidà, visos statistinës iðvados apie kintamàjá bus neteisingos.

levels(f) <- c("Vyras", "Moteris")
levels(f)
f


# Pagal nutylëjimà abëcëlës tvarka iðdëstytà kategorinio kintamojo ágyjamø reikðmiø 
# vektoriø galima pakeisti faktoriaus sudarymo metu nurodant reikiamà tø reikðmiø 
# iðdëstymo vektoriø levels. 

f <- factor(x, levels = c("Vyras", "Moteris"))
levels(f)
f

# Kartu su vektoriumi levels nurodþius já atitinkantá vektoriø labels, faktoriaus
# sudarymo metu kategorinio kintamojo ágyjamas reikðmes galima pervadinti. 

f <- factor(x, levels = c("Vyras", "Moteris"), labels = c("Vyr", "Mot"))
levels(f)
f


# Tuo atveju, kai reikia nustatyti arba pakeisti bazinæ (reference) jau sudaryto 
# faktoriaus reikðmæ, naudojama funkcija relevel. Èia reikðmæ "Mot" vël padarysime 
# bazine.

f <- relevel(f, ref = "Mot")
levels(f)
f


# NAUDINGA ------------------------------

# Gana daþnai pasitaiko situacija, kad dël patogumo kategorinio kintamojo reikðmës 
# koduojamos skaièiais. Pavyzdþiui, ávedus paþymëjimà "Vyras" = 0, "Moteris" = 1, 
# tà patá vektoriø x buvo galima uþraðyti taip: (0, 1, 0, 1, 1, 1, 0). Sudarant 
# faktoriø, tø kodø reikðmes galima atstatyti uþraðant pavadinimø vektoriø labels.

z <- c(0, 1, 0, 1, 1, 1, 0)
f <- factor(z, levels = c(0, 1), labels = c("Vyras", "Moteris"))
f


# UÞDUOTIS ------------------------------ 

# 1. Tarkime, kad vektoriaus c(1, -1, 0, -1, -1, 1, -1, 0, 1, 1, -1, 0, 1, 1, 0) 
#    reikðmës reiðkia atsakymus á testo klausimus. Sudarykite faktoriø a ir jo 
#    reikðmëms priskirkite tokius pavadinimus: 1 = Taip, -1 = Ne ir 0 = Neþinau.
# 2. Naudodami funkcijà levels, pakeiskite anksèiau sugeneruoto faktoriaus h 
#    ágyjamø reikðmiø vardus á "Pirmas", "Antras", "Treèias".
# 3. Naudodami funkcijà factor, pakeiskite jau sudaryto faktoriaus h ágyjamø 
#    reikðmiø tvarkà á prieðingà: "Treèias", "Antras", "Pirmas".


# Kartais kategorinis kintamasis ágyja tik dalá visø galimø reikðmiø. Tokiu atveju
# galima sudaryti faktoriø, kurio galimø reikðmiø vektorius levels bus didesnis, 
# nei atitinkamo kategorinio kintamojo reikðmiø aibë. 

# Pavyzdþiui, turime apklausoje dalyvaujanèiø gyventojø miestø vektoriø.
m <- c("Vilnius", "Vilnius", "Kaunas", "Vilnius", "Kaunas", "Vilnius", "Kaunas")

# Jei tyrimas buvo atliekamas apklausiant didþiøjø miestø gyventojus, nepriklausomai
# nuo to, kokias reikðmes ágijo kintamojo elementai, galimos kintamojo reikðmës 
# yra "Vilnius", "Kaunas" ir "Klaipëda". Sukuriame faktoriø su tokiomis reikðmëmis.

f <- factor(m, levels = c("Vilnius", "Kaunas", "Klaipëda"))
f

# Nors kategorinis kintamasis turi dvi skirtingas reikðmes, taèiau ið jo sudarytas
# faktorius ið viso turi tris galimas reikðmes.

unique(f)   # visos skirtingos faktoriaus reikðmës
nlevels(f)  # viso galimos faktoriaus reikðmës


# Sudarant tokio kintamojo daþniø lentelæ, bus átraukiamos ir tos reikðmës, kuriø
# kintamajame nepasitaikë. Tokiu bûdu daþniø lentelë sudaroma ne ið tø reikðmiø,
# kurias ágijo kintamasis, bet ið tø, kurias galëjo ágyti -- kartais tai svarbu.

table(m)    # pradinio kintamojo daþniø lentelë    --   dvi reikðmës
table(f)    # kategorinio kintamojo daþniø lentelë -- visos reikðmës


# Tuo atveju, kai nenaudojamos faktoriaus reikðmës yra nereikalingos, jas galima
# paðalinti naudojant funkcijà droplevels. Pvz., ið faktoriaus f paðalinsime 
# nenaudojamà kintamojo kategorijà "Klaipëda", bet pats kintamasis nepasikeis.

f <- droplevels(f)
nlevels(f)
f


# Kadangi faktorius tuo paèiu yra ir vektorius, ið jo galima iðskirti tam tikrus
# elementus. Tokiu bûdu gautas faktorius nebûtinai turi turëti visas pradines
# kintamojo reikðmes, todël kai kurios faktoriaus reikðmës taip pat gali bûti 
# nereikalingos. Reikðmiø ið faktoriaus iðskyrimui naudojant operatoriø [, yra
# galimybë per parametrà drop paðalinti nereikalingas kintamojo kategorijas.

# Atskiru atveju, nenurodþius faktoriaus indeksø aibës, gausime tà patá faktoriø, 
# taèiau be nenaudojamø kategorijø.

f <- f[ , drop = TRUE]
nlevels(f)
f


# UÞDUOTIS ------------------------------ 

# 1. Naudodami funkcijà factor, jau sudarytam faktoriui f pridëkite anksèiau 
#    paðalintà kategorijà "Klaipëda".
# 2. Naudodami operatoriø [, ið faktoriaus f iðskirkite tik tuos elementus, kurie 
#    atitinka reikðmæ "Vilnius". Paðalinkite neegzistuojanèias naujo faktoriaus 
#    kategorijas "Kaunas" ir "Klaipëda".
# 3. Ið faktoriaus d á naujà faktoriø iðskirkite darbo dienas ir paðalinkite 
#    nebereikalingas savaitgalio dienas atitinkanèias reikðmes.


# Jei kategorinis kintamasis yra ranginis, tai jo reikðmes galima iðrikiuoti rango
# didëjimo tvarka ir sudaryti ordered tipo faktoriø. Pavyzdþiui, pagal nutylëjimà
# faktoriaus reikðmës iðrikiuojamos abëcëlës tvarka, kuri ðiuo atveju nenatûrali.

y <- c("Pirmas", "Treèias", "Antras", "Treèias", "Pirmas", "Pirmas", "Antras")
r <- factor(y)
r

# Sukurdami faktoriø galime iðraðyti reikðmes jø didëjimo tvarka ir nurodyti, kad
# jos sudaro tam tikrà rangø sistemà.

r <- factor(y, levels = c("Treèias", "Antras", "Pirmas"), ordered = TRUE)
r


# Toká patá ranginá kintamàjá galima sudaryti naudojant funkcijà ordered.
# Nenurodþius reikðmiø iðdëstymo tvarkos, jos bus iðrikiuotos pagal abëcëlæ.
r <- ordered(y, levels = c("Treèias", "Antras", "Pirmas"))
r

# Taip sudarytas faktorius yra ranginis kintamasis, kurio reikðmës turi tvarkà.
is.ordered(r)


# UÞDUOTIS ------------------------------ 

# 1. Faktoriaus a reikðmes iðrikiuokite tokia tvarka: "Ne", "Neþinau", "Taip" ir 
#    sukurkite naujà ranginá kintamàjá -- faktoriø t.
# 2. Ið faktoriaus t iðskirkite tik reikðmes "Ne", "Taip" ir taip sukurkite naujà
#    ranginá kintamàjá.


# NAUDINGA ------------------------------

# Kartais faktoriai panaudojami gana ádomiose situacijose. Pvz., funkcija cut 
# tolydø kintamàjá suskaido á tam tikrus intervalus. Rezultatas yra tokio pat 
# ilgio vektorius, kur vietoj pradinio vektoriaus reikðmës yra intervalas, á 
# kurá ta reikðmë patenka.

# Sugeneruosime 100 standartiniø normaliøjø dydþiø ir suskirstysime á vienodo 
# ploèio intervalus (-3, -2], (-2, -1], ... (2, 3]. Suskaièiuosime, kiek reikðmiø 
# patenka á ðiuos intervalus.

r <- rnorm(100)
t <- cut(r, breaks = -3:3)
t

# Toks kintamasis yra kategorinis, o visas jo reikðmes gauname su komanda levels.
class(t)
levels(t)

# Sudarome duomenø lentelæ, kurioje pirmas kintamasis yra anksèiau sunegeneruotas
# skaièius, o antrasis kintamasis nurodo intervalà, á kurá tas skaièius patenka.
m <- data.frame(skaièius = r, intervalas = t)
head(m)

# Suskaièiuodami skirtingus intervalus, suþinome, po kiek reikðmiø patenka á 
# kiekvienà intervalà. Gautà daþniø lentelæ galima atvaizduoti kaip histogramà.
table(t)
plot(t)

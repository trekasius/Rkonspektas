
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Atsitiktinës imties sudarymas naudojant procedûrà sample.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-03-25 | 2013-04-17 | 2015-09-20
#


# TURINYS -------------------------------

#
#   1. Atsitiktinës imties ið vektoriaus elementø iðrinkimas:
#      * funkcija sample
#      * funkcija set.seed
#
#   2. Tikimybiniø eksperimentø modeliavimas:
#      * Bernulio bandymø schema
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
# ATSITIKTINËS IMTIES IÐRINKIMAS          #
# --------------------------------------- #

# Atsitiktinës imties ið vektoriaus elementø sudarymui naudojama komanda sample.
# Jos parametrai:
#
#          x -- vektorius, ið kurio renkamos imties reikðmës,
#       size -- ið vektoriaus x iðrenkamø elementø skaièius, 
#    replace -- loginis kintamasis, nurodo, ar iðrinkimas su pasikartojimais,
#       prob -- iðrenkamø elementø tikimybës, pagal nutylëjimà jos vienodos.


# Pvz., ið 5 elementus turinèios aibës x = {1, 2, 3, 4, 5} atsitiktine tvarka su 
# vienodomis tikimybëmis reikia iðrinkti 3 elementus. Sudarysime toká vektoriø x, 
# kurio elementø reikðmes sutapatinsime su aibës elementø numeriais.

x <- 1:5
n <- 3
sample(x, size = n)

# Kaip visada, jei procedûros parametrai uþraðomi numatyta tvarka, jø pavadinimø 
# galima neraðyti -- komanda bus ðiek tiek trumpesnë ir kompaktiðkesnë.

sample(x, n)


# Funkcijai sample nurodþius tik reikðmiø vektoriø x, imtis bus sudaryta ið visø
# atsitiktine tvarka iðdëstytø vektoriaus elementø -- gaunamas jo perstatinys.

x <- 1:5
sample(x)

# Jei parametro x reikðmë yra ne vektorius, bet vienas natûrinis skaièius m, tai 
# imtis bus renkama ið vektoriaus (1, 2, ..., m) elementø.

m <- 5
n <- 3
sample(m, n)


# Naudojant R procedûrà sample, pagal nutylëjimà sudaroma paprastoji atsitiktinë 
# negràþintinë imtis, todël imties elementai nesikartoja. Jeigu imties elementai 
# gali kartotis arba iðrenkamø elementø skaièius didesnis uþ vektoriaus elementø 
# skaièiø, loginio parametro replace reikðmë pakeièiama á TRUE.

sample(x, n, replace = TRUE)


# Pagal nutylëjimà visø vektoriaus elementø iðrinkimo tikimybës vienodos, taèiau 
# jas galima pakeisti; parametrui prob priskiriamas elementø iðrinkimo tikimybiø 
# vektorius. Tikimybiø vektoriaus elementø skaièius turi sutapti su vektoriaus x 
# elementø skaièiumi, o tikimybiø suma turi bûti lygi vienetui. 

# Pvz., sudarysime imtá ið aibës x = {1, 2, 3, 4, 5} rinkdami k = 1000 elementø. 
# Kadangi visø aibës elementø iðrinkimo á imtá tikimybës vienodos ir lygios 1/5, 
# tokiu bûdu sudarytoje imtyje jø skaièius turëtø bûti maþdaug vienodas ir lygus
# apie 200.

n <- 1000

imtis <- sample(x, n, replace = TRUE)
table(imtis)
barplot(table(imtis))

# Pavyzdþiui, iðrinkimo tikimybes pakeisime taip, kad pirmas ir paskutinis aibës
# elementai bûtø iðrenkami su tikimybe 0.1, antras ir ketvirtas su tikimybe 0.2, 
# o treèias --- su tikimybe 0.4. Tai reiðkia, kad gautoje imtyje treèio elemento 
# turëtø bûti apie 400, antro ir ketvirto apie 200, o pirmo ir paskutinio po 100.

n <- 1000
p <- c(0.1, 0.2, 0.4, 0.2, 0.1)

imtis <- sample(x, n, replace = TRUE, prob = p)
table(imtis)


# NAUDINGA ------------------------------

# Visiems atsitiktiniø dydþiø generatoriams galima nurodyti pradinæ generuojamos
# sekos reikðmæ, kuri vadinama seed. Su ta paèia seed reikðme gaunama tokia pati 
# skaièiø seka. Suprantama, kad atsitiktiniø dydþiø seka, kurià galima atkartoti,
# nëra atsitiktinë, todël tokiu bûdu gauti dydþiai vadinami pseudoatsitiktiniais.
# Ðià generatoriø savybæ galima naudoti tuo atveju, kai reikia visiðkai tiksliai 
# atkartoti tikimybinio modeliavimo eksperimentà: generuoti identiðkus duomenis,
# patikrinti, ar korektiðkai veikia nuo atsitiktinumo priklausantis algoritmas.

# Generatoriui seed reikðmë nustatoma per funkcijà set.seed, kuriai priskiriamas 
# sveikasis skaièius, kuris ir yra seed reikðmë.

set.seed(666)
sample(5)

# Norint gauti tà paèià ats. dydþiø sekà, seed reikðmæ reikia nurodyti ið naujo.

sample(5)
sample(5)
sample(5)

set.seed(666)
sample(5)
set.seed(666)
sample(5)
set.seed(666)
sample(5)


# NAUDINGA ------------------------------

# Funkcijà sample galima naudoti ne tik imties ið vektoriaus reikðmiø iðrinkimui, 
# bet ir imties sudarymui ið kitø duomenø struktûrø. Gana daþnai pasitaiko tokia
# situacija, kada ið didelës duomenø lentelës atsitiktine tvarka reikia iðrinkti 
# tik dalá jos eiluèiø. Pvz., ið duomenø lentelës iris iðrinksime 10 jos eiluèiø. 

m <- nrow(iris)  # duomenø lentelës eiluèiø skaièius
n <- 10          # iðrenkamø eiluèiø skaièius

# Sudarome atsitiktinai su vienodomis tikimybëmis iðrenkamø eiluèiø numeriø sekà.
i <- sample(m, n)
i

# Ið duomenø lentelës pasirenkame tik tas eilutes, kuriø numeriai pateko á imtá.
d <- iris[i, ]
d


# UÞDUOTIS ------------------------------ 

# 1. Naudodami procedûrà sample, paraðykite loterijos skaièiø generavimo komandà,
#    kuri ið 30 sunumeruotø kamuoliukø be pasikartojimø iðtrauktø 6.
# 2. Paraðykite antrà loterijos programos pusæ, kuri tokiu paèiu bûdu parinktø 6
#    þaidëjo skaièius ir apskaièiuotø, kiek ið jø sutampa su loterijos skaièiais.
# 3. Uþraðykite komandà, kuri vektoriaus LETTERS elementus iðdëliotø atsitiktine 
#    tvarka.
# 4. Uþraðykite komandà, kuri atsitiktine tvarka sudëliotø duomenø lentelës iris
#    eilutes.


# --------------------------------------- #
# BERNULIO BANDYMØ MODELIAVIMAS           #
# --------------------------------------- #

# Kadangi procedûra sample gali generuoti nepriklausomø atsitiktiniø dydþiø sekà,
# jà galima panaudoti nesudëtingø tikimybiniø eksperimentø modeliavimui. Plaèiai 
# taikoma nepriklausomø bandymø schema ir atskiras jos atvejis Bernulio bandymai.

# Tarkime, kad vykdome n nepriklausomø bandymø, kuriø metu atsitiktinis ávykis A
# pasirodo su tam tikra pastovia tikimybe p. Jei ávykis A pasirodo, toká bandymà 
# paþymime vienetu, jei ávykis nepasirodo --- bandymà paþymime nuliu. Tokiu bûdu 
# gautas atsitiktinis dydis vadinamas Bernulio dydþiu su parametru p. Sudarysime 
# komandà, kuri generuoja n Bernulio dydþiø sekà.

x <- 0:1          # sudarome eksperimento baigèiø vektoriø
p <- c(0.4, 0.6)  # nurodome eksperimento baigèiø tikimybes
n <- 10           # nurodome bandymø skaièiø

b <- sample(x, n, replace = TRUE, prob = p)
b

# Sëkmingø bandymø skaièius, atlikus n Bernulio bandymø serijà, yra atsitiktinis
# dydis. Toká dydá vadiname binominiu atsitiktiniu dydþiu su parametrais n ir p. 

sum(b)


# Klasikinis Bernulio bandymø schemos pavyzdys --- monetos mëtymo eksperimentas. 
# Pvz., sumodeliuosime eksperimentà, kuriame 100 kartø metama simetriðka moneta.
# Kad bûtø paprasèiau, monetos puses paþymësime raidëmis H ir S, ið jø sudarome
# vieno metimo baigèiø vektoriø, ið kurio renkane n reikðmiø su pasikartojimais.

moneta <- c("H", "S")
n <- 100

b <- sample(moneta, n, replace = TRUE)
b

# Modeliavimo rezultatus galima atvaizduoti daþniø lentele arba daþniø diagrama.
# Kadangi abi monetos pusës iðrenkamos su vienodomis tikimybëmis, jø pasirodymø 
# daþnis turi bûti apytiksliai lygus. Tà ir parodo daþniø lentelë.

l <- table(b)
l

barplot(l)


# UÞDUOTIS ------------------------------ 

# 1. Sumodeliuokite simetriðko loðimo kauliuko mëtymà. Sugalvokite komandà, kuri
#    modeliuotø ið karto 100 loðimo kauliukø metimà.
# 2. Kaip mëtant loðimo kauliukà galima imituoti monetos mëtymà? Uþraðykite toká 
#    procesà modeliuojantá algoritmà.
# 3. Sumodeliuokite dviejø simetriðkø monetø n = 100 metimø serijà ir sudarykite 
#    visø kombinacijø atsivertimø daþniø lentelæ. Ar visos kombinacijos pasirodo 
#    vienodai daþnai?
# 4. Tarkime, kad X yra bendra taðkø suma metant du simetriðkus loðimo kauliukus. 
#    Modeliavimo bûdu nustatykite, kokia suma pasitaiko daþniau, X = 9 ar X = 10.
#    Kaip keièiasi situacija, kai metami ið karto trys loðimo kauliukai?

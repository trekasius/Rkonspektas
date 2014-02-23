
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Matricø ir sàraðø ciklo funkcijos apply, lapply ir sapply.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-08-25 | 2013-08-29
#


# TURINYS -------------------------------

#
#   1. Kelios pastabos apie funkciná programavimà:
#      * trumpai apie duomenis ir ciklus
#
#   2. Matricos ir sàraðo ciklo funkcijos:
#      * funkcija apply
#      * funkcija lapply
#      * funkcija sapply
#


# PASTABOS ------------------------------

#
# Sugalvoti daugiau uþdaviniø.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# TRUMPAI APIE DUOMENIS IR CIKLUS         #
# --------------------------------------- #

# Paprastai statistiniai duomenys yra vektoriaus, matricos arba duomenø lentelës
# pavidalo. Visi vektoriaus elementai bûtinai yra to paties tipo: arba skaièiai, 
# arba simboliai ir t.t. Kadangi visi matricos elementai yra to paties tipo, tai 
# bet kuri matricos eilutë arba stulpelis taip pat yra vektorius.

v <- c(60, 9, 61, 62, 64, 4, 91, 6, 57, 2, 78, 76, 3, 41, 72, 95, 47, 11, 8, 96)

m <- matrix(v, ncol = 5)
m

class(m)           # m yra matricos tipo objektas
mode(m)            # matrica sudaryta ið skaièiø

is.vector(m[1, ])  # pirma matricos eilutë yra vektorius
is.vector(m[, 1])  # pirmas matricos stulpelis taip pat vektorius


# Duomenø lentelës stulpeliai gali bûti skirtingø tipø, todël eilutës elementai
# taip pat bus skirtingø tipø. Dël tos prieþasties viena atskirai paimta duomenø
# lentelës eilutë nëra vektorius, taèiau yra specialaus list tipo sàraðas, kurio 
# elementai gali bûti skirtingo tipo.

d <- data.frame(x = 1:5, y = letters[1:5], z = TRUE)
d

class(d)           # duomenø lentelë ið skirtingo tipo vektoriø stulpeliuose
mode(d)            # duomenø lentelë sudaryta ið list tipo áraðø eilutëse

# Priklausomai nuo to, kaip interpretuojama duomenø lentelë, yra keli bûdai kaip 
# ið lentelës kaip vektoriø iðskirti vienà jos stulpelá. Bet kokiu atveju reikia
# nurodyti arba kintamojo pavadinimà, arba stulpelio numerá duomenø lentelëje.

d$x                # á duomenø lentelæ þiûrim kaip á duomenø lentelæ

d[, 1]             # á duomenø lentelæ þiûrim kaip á matricà
d[, "x"]           #

d[[1]]             # á duomenø lentelæ þiûrim kaip á list tipo sàraðà
d[["x"]]           #


# R turi labai daug standartiniø funkcijø skaitinëms vektoriø charateristikoms 
# apskaièiuoti:

length(v)          # elementø skaièius
min(v)             # minimumas
max(v)             # maksimumas
sum(v)             # suma
median(v)          # mediana
mean(v)            # vidurkis

# Statistikoje ðias ir daug kitø charakteristikø tenka apskaièiuoti matricoms ir
# duomenø lentelëms. Kadangi matrica turi daug stulpeliø, o kiekvienas ið jø yra 
# vektorius, tam tikrai vektoriaus charakteristikai apskaièiuoti skirtà funkcijà 
# galima ádëti á ciklà ir tokiu bûdu jà apskaièiuoti visoms matricos eilutëms ar 
# stulpeliams ið karto.

# Pavyzdþiui, tokiu bûdu apskaièiuosime matricos eiluèiø sumas. Sukursime tuðèià
# vektoriø, kurio i-ajam elementui priskirsime i-osios eilutës m[i, ] elementø
# sumà. Sumavimas atliekamas cikle, ten ciklo kintamasis i ágyja reikðmes nuo 1 
# iki nrow(m) ir taip "perbëga" per visas matricos eilutes.

eilutës.suma <- vector()

for (i in 1:nrow(m)) {
  eilutë <- m[i, ]
  eilutës.suma[i] <- sum(eilutë)
}

eilutës.suma

# Tokia programa, kurioje detaliai apraðomos visos skaièiavimo instrukcijos, yra 
# tipiðkas imperatyvinio programavimo, kurio pagrindas yra kintamasis, pavyzdys. 

# R yra funkcinio programavimo kalba, ir pagal funkcinio programavimo paradigmà
# bet kokie skaièiavimai traktuojami kaip funkcijos (matematine prasme) reikðmës 
# apskaièiavimas, kuri priklauso nuo pradiniø duomenø ir kitø funkcijø rezultato.

# Funkcinis programavimas daugeliu dalykø ið esmës skiriasi nuo imperatyvinio 
# programavimo. Pavyzdþiui, grynai funkciniame programavime nëra ciklo sàvokos. 
# Vietoje ciklo iteracijos realizuojamos per rekursijà, kada funkcija iððaukia
# pati save. Dël tos prieþasties, programuojant su R reikia prisiminti taisyklæ: 

# JEI KYLA NORAS RAÐYTI FOR CIKLÀ, TAI GREIÈIAUSIAI JIS ÈIA VISAI NEREIKALINGAS.

# Ðiam tikslui R naudojamos apply ðeimos funkcijos, kuriø apraðymui skirtas ðis
# konspektas.


# --------------------------------------- #
# FUNKCIJA APPLY                          #
# --------------------------------------- #

# Daug statistiniø skaièiavimø atliekama su matricomis. Jei tam tikrus veiksmus 
# reikia atlikti su visomis matricos eilutëmis ar stulpeliais, ir tuos veiksmus
# galima uþraðyti kaip funkcijà, tai tokiais atvejais naudojama funkcija apply.
# Jos parametrai:
# 
#        X -- matricos pavadinimas,
#   MARGIN -- indekso reikðmë: eilutëms 1, stulpeliams 2,
#      FUN -- funkcija,
#      ... -- papildomi funkcijos parametrai (jei tokie yra).

# Parametras FUN gali bûti bet kokia standartinë R funkcija, kurios argumentas
# yra vektorius. 

# Pavyzdþiui, naudodami funkcijà apply apskaièiuosime matricos m eiluèiø sumas.
apply(m, 1, sum)

# Analogiðkai gaunamos matricos stulpeliø sumos.
apply(m, 2, sum)

# Funkcijos reikðmë nebûtinai turi bûti vienas skaièius. Pavyzdþiui, nurodþius
# funkcijà summary, kiekvienai matricos eilutei arba stulpeliui apskaièiuojamos 
# ið karto kelios skaitinës charakteristikos.
apply(m, 2, summary)


# Atliekant specifinius skaièiavimus, nevisada galima rasti tinkamà standartinæ 
# R funkcijà. Tokiais atvejais tenka sukurti savo funkcijà. Tarkime, kad reikia 
# apskaièiuoti maþiausios ir didþiausios vektoriaus reikðmës vidurká. Konkreèiai 
# tokios funkcijos R neturi, todël jà uþraðysime. 

minmax.vidurkis <- function (x) {
  min <- min(x)
  max <- max(x)
  vid <- (min + max)/2
  return(vid)
}

# Tokià funkcijà jau galima áraðyti á funkcijà apply.
apply(m, 2, minmax.vidurkis)


# Tà paèià funkcijà uþraðysime vadovaudamiesi funkcinio programavimo paradigma, 
# pagal kurià vienos funkcijos rezultatas tiesiogiai perduodamas kitai funkcijai.
# Standartinë funkcija range gràþina vektoriø su maþiausia ir didþiausia reikðme, 
# kurá be tarpiniø kintamøjø perduodame vidurkio skaièiavimo funkcijai mean. 

minmax.vidurkis <- function (x) mean(range(x))

apply(m, 2, minmax.vidurkis)

# Tais atvejais, kai funkcijà pavyksta uþraðyti labai kompaktiðkai, jà galima 
# áraðyti tiesiai á funkcijà apply. Toks apply naudojimas yra áprasta praktika
# programuojant su R.

apply(m, 2, function (x) mean(range(x)))

# Èia funkcijos argumentas x yra matricos eilutë, jei apply parametras MARGIN
# lygus 1, arba stulpelis, jei MARGIN reikðmë yra 2.


# Á apply ástatomos funkcijos daþnai paèios turi savo parametrus. Pvz., funkcija
# sum ir daugelis kitø R funkcijø turi parametrà na.rm, kuriam priskyrus reikðmæ 
# TRUE, praleistos reikðmës duomenyse ignoruojamos. Tokie papildomi parametrai
# perduodami kaip ... parametras.

u <- c(60, 9, NA, 62, 64, 4, 91, 6, 57, 2, NA, 76, 3, 41, 72, 95, 47, 11, 8, 96)

n <- matrix(u, ncol = 5)
n

# Pavyzdþiui, apskaièiuosime matricos su praleistomis reikðmëmis stulpeliø sumas.
# Kadangi pirmame ir treèiame stulpeliuose yra praleistø reikðmiø, apskaièiuoto
# sumø vektoriaus pirmas ir treèias elementai taip pat turi praleistas reikðmes.

apply(n, 2, sum)

# Pakeitus funkcijos sum parametro na.rm reikðmæ á TRUE, sumos apskaièiuojamos
# visiems matricos stulpeliams (reikia nepamirðti, kad sumos gautos atmetus NA
# reikðmes ir susumavus skirtingà elementø skaièiø, todël nelabai palyginamos).

apply(n, 2, sum, na.rm = TRUE)


# UÞDUOTIS ------------------------------ 

# 1. Naudojant funkcijà apply, uþraðykite komandà, kuri apskaièiuotø matricos m 
#    stulpeliø vidurká. Uþraðykite tokià komandos versijà, kuri apskaièiuotø tik
#    pirmø dviejø stulpeliø vidurkius.
# 2. Naudojant f-jà apply, uþraðykite komandà, kuri matricos stulpeliø elementus 
#    iðrikiuotø didëjimo tvarka. Vektoriaus elementø iðrikiavimui naudojama f-ja 
#    sort.
# 3. Naudojant f-jà apply, uþraðykite komandà, kuri ið skaièiø matricos eiluèiø 
#    iðrinktø po du didþiausius elementus. Funkcijà dviejø didþiausiø vektoriaus 
#    elementø iðrinkimui galima uþsiraðyti atskirai ir ástatyti jà á f-jà apply.
# 4. Naudodami funkcijà apply, apskaièiuokite, kiek matricos m stulpeliuose yra
#    elementø, kuriø reikðmës didesnës nei 50.


# --------------------------------------- #
# FUNKCIJOS LAPPLY IR SAPPLY              #
# --------------------------------------- #

# Ne visus duomenis galima pateikti matricos pavidalu. Pvz., nevienodà elementø
# skaièiø turinèiø vektoriø negalima apjungti á matricà. Be to, nei vektorius,
# nei matrica negali turëti skirtingo tipo elementø. Tokios struktûros duomenims
# naudojamas list tipo sàraðas. Labai daþnai á sàraðà apjungiami to paties tipo, 
# taèiau gana sudëtingi objektai. Tai gali bûti vektoriø ar matricø sàraðas, net 
# duomenø lenteliø ar dar sudëtingesniø objektø sàraðas.

# Funkcijos apply analogas sàraðams yra funkcijos lapply ir sapply. Pagrindiniai
# jø parametrai:
# 
#        X -- sàraðo pavadinimas,
#      FUN -- funkcija,
#      ... -- papildomi funkcijos parametrai (jei tokie yra).

# Tais atvejais, kai funkcijos FUN reikðmë yra vektorius arba dar sudëtingesnis
# objektas, ir rezultatai turi bûti sàraðo pavidalu, naudojama funkcija lapply. 
# Jeigu funkcijos FUN reikðmë yra vienas skaièius, simbolis arba loginë reikðmë, 
# patogiau, kai bendras rezultatas yra vektorius, todël tokiu atveju naudojama 
# funkcija sapply. Rezultatø pateikimo forma vienintelis ðiø funkcijø skirtumas.

# Pvz., apskaièiuosime sàraðo, kurá sudaro nevienodà elementø skaièiø turintys
# vektoriai, vidurkius.

v1 <- c(11, 21, 38, 32,  7, 41, 14, 10, 32, 19, 42, 28, 33, 38, 5, 17)
v2 <- c(30, 38, 22, 38, 45, 23, 23,  3, 18, 38)
v3 <- c(61, 71, 98, 81, 59, 76, 92, 31, 89, 32, 83, 43)
v4 <- c(81, 95, 74, 61, 27, 73, 60, 72, 50, 32, 79, 32, 10, 74)
v5 <- c(12, 14, 56, 45, 6, 85, 64, 8, 59, 59, 69, 5, 50, 34)


l <- list(Pirmas = v1, Antras = v2, Treèias = v3, Ketvirtas = v4, Penktas = v5)

# Naudojant lapply rezultatas bus sàraðas ið penkiø elementø, kuriø reikðmës yra
# atskirai kiekvieno vektoriaus vidurkis.
lapply(l, mean)

# Naudojant sapply rezultatas yra penkis elementus turintis vidurkiø vektorius.
# Kadangi pradinio sàraðo elementai turi vardus, tai ir rezultatø vektorius taip 
# pat turi elementø vardus.
sapply(l, mean)


# Jei funkcijos FUN rezultatas yra vektorius, tai lapply rezultatas bus sàraðas,
# kurio elementai yra tie vektoriai, o sapply rezultatas bus matrica, kuri turës
# tiek stulpeliø, kiek elementø turëjo pradinis sàraðas.

# Pavyzdþiui, naudojant funkcijà summary, apskaièiuosime kiekvieno vektoriaus ið 
# sàraðo l pagrindines skaitines charakteristikas. Patogumo dëlei, ðiø funkcijø 
# rezultatus priskirsime kintamiesiems.

rez.l <- lapply(l, summary)
rez.l

rez.s <- sapply(l, summary)
rez.s

# Paprastai tokiø skaièiavimø rezultatai naudojami tolimesnei duomenø analizei,
# kur, priklausomai nuo gautø rezultatø pavidalo (vektorius, matricà ar sàraðas) 
# vël galima taikyti kurià nors apply ðeimos ar kità funkcijà.

# Pavyzdþiui, galima nesunkiai atsakyti á klausimà, kurio vektoriaus minimumas
# didþiausias. Tam reikia surasti didþiausià pirmosios eilutës (Min) elementà.
# Tam panaudosime funkcijà which.max.

which.max(rez.s[1, ])


# Funkcijos lapply ir sapply gali bûti naudojamos ne tik skaièiavimams, bet ir 
# duomenø pertvarkymams. Pvz., uþraðysime komandà, kuri ið kiekvieno vektoriaus 
# iðskirs pirmuosius k elementø, k yra maþiausias vektoriaus elementø skaièius.
# Vektoriaus elementø skaièiø apskaièiuosime naudojant funkcijà length.

sapply(l, length)

# Matome, kad vektoriø elementø skaièius nevienodas, vadinasi, pirmiausia reikia
# susirasti maþiausià vektoriaus elementø skaièiø. 

k <- min(sapply(l, length))
k

# Vektoriaus elementø iðskyrimui sudarysime specialià funkcijà, kurià áraðysime
# tiesiai á funkcijà lapply.

lapply(l, function(x) x[1:k])


# Funkcinio programavimo apologetai visas komandas apjungtø á vienà iðraiðkà!

lapply(l, "[", 1:min(sapply(l, length)))

# Vektoriaus elementø iðskyrimui naudojamas operatorius [, kurá galima panaudoti 
# ir kaip funkcijà, kurios parametras yra iðskiriamø elementø indeksø vektorius.
# Ðiuo atveju tai bûtø sveikieji skaièiai nuo 1 iki k.

lapply(l, "[", 1:k)
sapply(l, "[", 1:k)

# Pirmuoju atveju gaunamas sàraðas, kuriame visi vektoriai turi vienodà elementø
# skaièiø, antruoju atveju gaunama matrica, kurios stulpeliuose yra vektoriai.


# NAUDINGA ------------------------------

# Nors funkcijos lapply ir sapply skirtos sàraðams, jas lygiai taip pat galima 
# panaudoti pasikartojantiems veiksmams su vektoriais ir duomenø lentelëmis. 

# Pavyzdþiui, sugeneruosime n skirtingø vektoriø, kuriø elementai yra sveikieji 
# skaièiai nuo 1 iki n. Tam naudosime kaip funkcijà uþraðytà iðraiðkà 1:n, kur n 
# ágyja reikðmes 1, 2 ir t.t. iki 5. Kadangi visø vektoriø elementø skaièius yra
# skirtingas ir á matricà jø apjungti negalima, todël galutinis rezultatas bus 
# tokiø vektoriø sàraðas.

lapply(1:5, function(n) 1:n)


# Á funkcijà lapply arba sapply ástaèius duomenø lentelæ, funkcija "perbëga" per
# stulpelius. Pavyzdþiui, naudodami funkcijà class, nustatysime duomenø lentelës
# kintamøjø tipà.

sapply(d, class)

# Elementø iðskyrimo operatoriø [ naudojant kaip funkcijà, galima uþraðyti tokià
# komandà, kuri á atskirus vektorius iðskirtø duomenø lentelës stulpelius.

lapply(d, "[")

# Funkcija complete.cases nustato, ar duomenø lentelës eilutë turi bent vienà
# praleistà reikðmæ. Naudojant funkcijà sapply, galima uþraðyti komandà, kuri
# patikrina, ar lentelës stulpelyje yra bent viena praleista reikðmë.

sapply(d, function(x) any(is.na(x)))


# UÞDUOTIS ------------------------------ 

# 1. Naudojant f-jà sapply, uþraðykite iðraiðkà, kuri surastø atskirai kiekvieno
#    vektoriaus ið sàraðo l didþiausià reikðmæ. Uþraðykite iðraiðkà, kuri rastø 
#    paèià didþiausià visø vektoriø reikðmæ (bendrà maksimumà ið visø maksimumø).
# 2. Naudojant funkcijà sapply, uþraðykite iðraiðkà, kuri apskaièiuotø kiekvieno
#    vektoriaus ið sàraðo l elementø kvadratø sumà.
# 3. Uþraðykite tokià iðraiðkà, kuri apskaièiuotø, kuris sàraðo l vektorius turi
#    didþiausià skirtumà tarp savo didþiausios ir maþiausios reikðmës. Atsakymas
#    turi bûti sàraðo elemento, t.y. vektoriaus numeris.
# 4. Naudojant funkcijà sapply, apskaièiuokite, kiek kiekvienas sàraðo vektorius 
#    turi elementø, kuriø reikðmës didesnës uþ 50.
# 5. Naudojant funkcijà lapply, uþraðykite komandà, kuri ið kiekvieno sàraðo l
#    vektoriaus suformuotø matricà su dviem stulpeliais.
# 6. F-jà lapply pritaikant vektoriui, uþraðykite komandà, kuri intervalà [0, 1] 
#    lygiomis dalimis padalina á 10, 20 ir 30 daliø. Intervalà dalinanèiø taðkø
#    sekos generavimui naudokite funkcijà seq su parametru length.out.
# 7. Naudojant f-jà sapply patikrinkite, kurie duomenø lentelës d stulpeliai yra
#    numeric tipo. Uþraðykite iðraiðkà, kuri suskaièiuotø, kiek tokiø stulpeliø
#    lentelëje yra ið viso.

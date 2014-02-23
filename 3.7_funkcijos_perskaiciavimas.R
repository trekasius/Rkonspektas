
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Funkcijos perskaièiavimas keièiant ir nekeièiant parametrø.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-08-29 | 2013-09-07
#


# TURINYS -------------------------------

#
#   1. Ciklas per funkcijos parametrø vektoriø:
#      * funkcija mapply
#
#   2. Funkcijø ir kitø iðraiðkø pakartojimas:
#      * funkcija replicate
#


# PASTABOS ------------------------------

#
# Pastabø nëra.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# FUNKCIJA MAPPLY                         #
# --------------------------------------- #

# Funkcijos apply, lapply arba sapply perbëga per duomenø rinkinio elementus ir 
# kaip argumentus juos perduoda kitai funkcijai. Tas duomenø rinkinys gali bûti
# ir funkcijos kokio nors vieno parametro reikðmiø vektorius. Tokiu bûdu galima
# reguliuoti funkcijos veikimà.

# Pavyzdþiui, uþraðysime funkcijà, kuri kiekvienà vektoriaus elementà pakartoja 
# po k kartø. Èia parametras k yra sveikasis skaièius, kurio reikðmë kinta nuo 1 
# iki m = 4.

m <- 4
w <- c("A", "B", "C")

sapply(1:m, function(k) rep(w, each = k))


# Tuo atveju, kai funkcijai reikia perduoti ið karto keliø parametrø reikðmes, 
# naudojama funkcija mapply. Jos parametrai:
#
#      FUN -- funkcijos pavadinimas arba iðraiðka,
#      ... -- funkcijai perduodami parametrai,
# MoreArgs -- nekintanèiø funkcijos parametrø sàraðas.

# Pavyzdþiui, naudodami standartinæ funkcijà seq, intervalà [0, 1] padalinsime á 
# 10, 50 ir 100 vienodø daliø. Taðkø, kuriø reikia intervalà padalinti á k lygiø
# daliø, yra k + 1, o jø skaièiø nusako funkcijos seq parametras length.out. Èia
# parametrø from ir to reikðmës fiksuotos, nes dalinamas tas pats intervalas. 

mapply(seq, from = 0, to = 1, length.out = c(11, 51, 101))

# Nekintanèius funkcijos parametrus ar jai reikalingus duomenis galima perduoti
# per parametrà MoreArgs. Pavyzdþiui, perraðysime tà paèià funkcijà taip, kad
# fiksuoti parametrai from ir to bûtø perduodami atskiru sàraðu.

mapply(seq, length.out = c(11, 51, 101), MoreArgs = list(from = 0, to = 1))

# Ðiuo atveju keièiasi tik vieno parametro reikðmë, todël funkcija mapply nëra
# pilnai iðnaudojama. Pvz., tà patá rezultatà galima gauti naudojant sapply.

sapply(c(11, 51, 101), function(k) seq(0, 1, length.out = k))


# Uþraðysime paprastà funkcijà, kuri ið ilgos simboliø sekos iðkarpo trumpesnes
# sekas. Ðios f-jos argumentai yra trumpesniø sekø pradþios ir pabaigos indeksø
# vektoriai. Kadangi funkcijos duomenys - ilgoji seka - nesikeièia, jà áraðome á
# fiksuotø parametrø sàraðà MoreArgs. Galutinis rezultatas yra keliø trumpesniø 
# sekø sàraðas.

s <- c("G", "C", "T", "T", "T", "T", "C", "A", "T", "T", "C", "T", "G", "A", "C")

a <- c(1, 5, 8)
b <- c(7, 10, 15)

mapply(function(seka, i, j) seka[i:j], i = a, j = b, MoreArgs = list(seka = s))

# Jei tokia funkcija skirta visada tos paèios sekos karpymui, jos vardà galima 
# áraðyti tiesiai á funkcijà ir tokiu bûdu atsisakyti vieno parametro.

mapply(function(i, j) s[i:j], i = a, j = b)


# NAUDINGA ------------------------------

# Funkcija mapply daþnai naudojama atsitiktiniø dydþiø su skirtingais skirstinio
# parametrais generavimui. Pavyzdþiui, normalusis ats. dydis turi du parametrus: 
# vidurká ir standartiná nuokrypá. Tokio dydþio generavimui naudojama funkcija
# rnorm, kuri turi tris parametrus: imties tûrá n, vidurká mean ir std. nuokrypá 
# sd. Sugeneruosime tris normaliasias imtis, kurios skiriasi abiem parametrais. 

vid <- c(A = 9, B = 5, C = 1)    # ats. dydþio vidurkiø vektorius
std <- c(a = 1, b = 2, c = 3)    # standartiniø nuokrypiø vektorius

# Uþraðome funkcijà, kuri turi du parametrus - vidurkio ir nuokrypiø vektorius.
# Imties tûris áraðytas tiesiai á funkcijà. Galutinis rezultatas yra matrica su
# sugeneruotomis imtimis stulpeliuose, kurià priskirsim kintamajam.

rnd <- mapply(function(m, s) rnorm(20, mean = m, sd = s), m = vid, s = std)
rnd

# Kaip ir kitose funkcijose, jei parametrai raðomi nustatyta tvarka, jø vardø 
# galima neraðyti visai. Taip funkcijos iðraiðka tampa trumpesnë ir aiðkesnë.

rnd <- mapply(function(m, s) rnorm(20, m, s), vid, std)
rnd


# Ðià funkcijà galima supaprastinti, generavimo funkcijai parametrus perduodant
# tiesiogiai.

rnd <- mapply(rnorm, n = 20, mean = vid, sd = std)
rnd

# Neraðant parametrø vardø, gaunama labai kompaktiðka iðraiðka!

rnd <- mapply(rnorm, 20, vid, std)
rnd


# Gautas atsitiktiniø dydþiø imtis galima perduoti ávairioms kitoms funkcijoms.
# Pvz., apskaièiuosime imèiø vidurkius ir nubraiþysime jø sklaidos grafikus.

apply(rnd, 2, mean)
boxplot(rnd)


# UÞDUOTIS ------------------------------ 

# 1. Deriniø skaièiui apskaièiuoti naudojama R funkcija choose. Naudodami mapply, 
#    uþraðykite funkcijà ið karto keletos deriniø skaièiaus radimui, kai dydþiai
#    n ir k yra keletà reikðmiø turintys vektoriai. Pavyzdþiui, tegu n = (5, 10), 
#    o k = (2, 3). Ðiuo atveju reikia gauti deriniø skaièiø ið 5 po 2 ir deriniø
#    skaièiø ið 10 po 3.
# 2. Siekiant eliminuoti iðsiskirianèiø stebiniø átakà, vietoje vidurkio kartais
#    skaièiuojamas nukirstas vidurkis (truncated mean). Tai vidurkis skaièiuotas
#    imèiai, ið kurios atmesta k*100% didþiausiø ir maþiausiø reikðmiø. Vidurkio
#    funkcija mean turi tam skirtà parametrà trim, reikðmë ið intervalo [0, 0.5]. 
#    Naudojant mapply, uþraðykite funkcijà, kuri apskaièiuotø 0.10, 0.15, 0.20 
#    lygio "nukirstus" vidurkius. Tokià paèià funkcijà uþraðykite su f-ja sapply.
# 3. Naudodami funkcijà mapply, sugeneruokite tris tolygiai intervaluose [0, 1], 
#    [0, 5] ir [-1, 1] pasiskirsèiusiø dydþiø imtis po 100 elementø kiekvienoje. 
#    Tolygø pasiskirstymà turinèio ats. dydþio generavimui naudojama standartinë 
#    funkcija runif.


# --------------------------------------- #
# FUNKCIJA REPLICATE                      #
# --------------------------------------- #

# Atliekant tikimybiná modeliavimà, eksperimentà labai daþnai reikia pakartoti 
# daug kartø. Tokiais atvejais galima naudoti funkcijà replicate. Jos parametrai:
#
#        n -- pakartojimø skaièius,
#     expr -- funkcija ar bet kokia kita iðraiðka, kurià reikia pakartoti,
# simplify -- loginis parametras nurodantis, kad rezultatas turi bûti vektorius.

# Pavyzdþiui, sumodeliuosime n = 10 normaliøjø imèiø po 50 elementø kiekvienoje. 
# Tegul atsitiktinio dydþio vidurkis lygus 20, o standartinis nuokrypis lygus 5.
# Rezultatas yra matrica, kurios stulpeliuose yra ats. dydþiø imtys.

replicate(10, rnorm(50, mean = 20, sd = 5))

# Parametro simplify reikðmæ pakeitus á FALSE, vietoje matricos gaunamas sàraðas, 
# kurio elementai yra atsitiktiniø dydþiø imtys.

replicate(10, rnorm(50, 20, 5), simplify = F)

# Kaip visada, toká sàraðà galima perduoti kitoms skaièiavimø funkcijoms. Pvz.,
# apskaièiuosime tokiø sugeneruotø imèiø vidurkius. Pirmu atveju naudosime f-jà
# apply ir skaièiuosime vidurkius stulpeliuose, antru atveju naudosime funkcijà
# sapply.

apply(replicate(10, rnorm(50, 20, 5)), 2, mean)

sapply(replicate(10, rnorm(50, 20, 5), simplify = F), mean)


# Pavyzdþiui, sumodeliuosime monetos mëtymo eksperimentà, kur moneta metama 1000
# kartø. Atliksime 10 tokiø eksperimentø ir apskaièiuosime, kiek vienos serijos
# metu atsivertë herbø ir skaièiø.

# Vienos monetos mëtymo eksperimentà galima uþraðyti naudojant funkcijà sample.
sample(c("H", "S"), 1000, replace = TRUE)

# Ðià iðraiðkà ástaèius á funkcijà replicate, gaunama 1000 x 10 dydþio matrica, 
# kurios stulpeliuose yra bandymø serijos.
replicate(10, sample(c("H", "S"), 1000, TRUE))

# Naudojant funkcijà apply, kiekvienam eksperimentø matricos stulpeliui sudaroma 
# herbø ir skaièiø daþniø lentelë. Galima pastebëti, kad herbø ir skaièiø daþnis
# apytiksliai lygus, koks ir turi bûti mëtant simetriðkà monetà.
apply(replicate(10, sample(c("H", "S"), 1000, TRUE)), 2, table)


# Þinoma, funkcijà replicate naudojama ne tik atsitiktiniø dydþiø generavimui ar 
# tikimybiniam modeliavimui. Pavyzdþiui, sudarysime 10x10 dydþio matricà, kurios 
# pirmos eilutës elementai lygûs 1, antros lygûs 2 ir t.t. Visi tokios matricos 
# stulpeliai yra vienodi, todël reikia sugeneruoti 10 vienodø vektoriø, kuriø
# elementai kinta nuo 1 iki 10. 

replicate(10, 1:10)


# UÞDUOTIS ------------------------------ 

# 1. Naudojant f-jas replicate ir sample, sudarykite 10 atsitiktiniø kodø sàraðà. 
#    Vienas kodas gaunamas ið vektoriaus LETTERS atsitiktine tvarka iðrenkant po
#    tris raides ir, naudojant f-jà paste su parametru collapse = "", apjungiant
#    jas á vienà simboliø sekà.
# 2. Naudodami funkcijà replicate, sugeneruokite tris tolygiai intervale [0, 10]
#    pasiskirsèiusio atsitiktinio dydþio imtis po n = 100 elementø. Sugalvokite, 
#    kaip tokias imtis gauti nenaudojant funkcijos replicate.


#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Pseudoatsitiktiniø dydþiø generavimo algoritmai.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-05-13 | 2016-03-16
#


# TURINYS -------------------------------

#
#   1. Pseudoatsitiktiniø dydþiø generavimo algoritmai:
#      * komanda RNGkind
#      * komanda set.seed
#      * standartiniai R algoritmai
#
#   2. Tiesinis kongruentinis generatorius ir jo atmainos:
#      * miðrus generatorius
#      * multiplikatyvinis
#      * standartiniai parametrai
#      * generatoriaus savybiø tyrimas
#
#   3. Generavimas naudojant ats. dydþiø transformacijà:
#      * eksponentinio dydþio generavimas
#


# PASTABOS ------------------------------

#
# Anyone who considers arithmetical methods of producing random digits is, of
# course, in a state of sin. -- John von Neumann
#


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# STANDARTINIAI ATS. DYDÞIØ GENERATORIAI  #
# --------------------------------------- #

# Pseudoatsitiktiniø dydþiø generatorius -- tai algoritmas, kuris generuoja sekà
# tokiø skaièiø, kuriø statistinës savybës panaðios á tikrø ats. dydþiø savybes.
# Tokiu bûdu gauta skaièiø seka ið tikro nëra atsitiktinë, kadangi sekos savybës
# priklauso nuo algoritmo parametrø, o pati seka visiðkai priklauso nuo pradinës
# sekos reikðmës, kuri vadinama seed. Dël ðios prieþasties skaièiai, sugeneruoti
# naudojant deterministiná algoritmà, ir vadinami pseudoatsitiktiniais.

# Tam tikrà pasiskirstymo dësná turinèiø pseudoatsitiktiniø dydþiø generavimui R
# naudoja standartines funkcijas. Jø yra daug, paminësime tik keletà, pavyzdþiui:
#
#     rbinom -- binominis,
#      rpois -- Puasono,
#      runif -- tolydusis,
#      rnorm -- normalusis,
#       rexp -- eksponentinis.


# Pvz., sugeneruosime tolygiai intervale [0, 1] pasiskirsèiusiø ats. dydþiø sekà.

runif(10)

# Sugeneruosime 10 standartiná normaløjá pasiskirstymà turinèiø ats. dydþiø sekà.

rnorm(10)


# Tolygiøjø ir normaliøjø pseudoatsitiktiniø dydþiø generatorius galima nurodyti 
# su komanda RNGkind. Ði komanda turi du parametrus:
#
#         kind -- tolygiøjø dydþiø generatoriaus pavadinimas,
#  normal.kind -- normaliøjø dydþiø generatoriaus pavadinimas.


# Tolygiojo atsitiktinio dydþio generavimui R galima naudoti ðiuos standartinius 
# generatorius:
#
#         Wichmann-Hill -- periodas 6.9536*10^12
#  Marsaglia-Multicarry -- periodas 2^60
#           Super-Duper -- periodas 4.6*10^18
#      Knuth-TAOCP-2002 -- periodas 2^129
#         L'Ecuyer-CMRG -- periodas 2^191
#      Mersenne-Twister -- periodas 2^19937 - 1 

# Normaliøjø dydþiø generavimui naudojami tokie generatoriai:
#
#      Kinderman-Ramage
#         Ahrens-Dieter
#            Box-Muller
#             Inversion


# Pagal nutylëjimà tolygiøjø dydþiø generavimui naudojamas "Mersenne-Twister", o
# normaliøjø dydþiø -- "Inversion" generatorius.

RNGkind()

# Tolygaus atsitiktinio dydþio generavimo algoritmà pakeisime á gerai þinomà bei
# praeityje plaèiai paplitusá generatoriø "Super-Duper" (Margsalia, 1972).

RNGkind(kind = "Super-Duper")
RNGkind()

set.seed(666)
runif(1)

# Pagal nutylëjimà tolygaus ats. dydþio generavimui R naudoja "Mersenne-Twister" 
# algoritmà. Gràþiname já atgal.

RNGkind(kind = "default")
RNGkind()

set.seed(666)
runif(1)

# Matome, kad su ta paèia seed reikðme skirtingi algoritmai generuoja skirtingus
# dydþius.


# NAUDINGA ------------------------------

# Visiems pseudoatsitiktiniø dydþiø generatoriams reikia nustatyti pradinæ sekos 
# reikðmæ, kuri vadinama seed. Jei nenurodyta kitaip, seed reikðmë priklauso nuo 
# kompiuterio laiko, todël kiekvienà kartà generuojama vis kita ats. dydþiø seka.
# Pavyzdþiui, sugeneruosime 3 tolygiai pasiskirsèiusiø atsitiktiniø dydþiø sekas.
# Visos trys bus skirtingos.

runif(10)
runif(10)
runif(10)

# Su ta paèia seed reikðme pseudoatsitiktiniø dydþiø generavimo algoritmas visad
# generuos tà paèià skaièiø sekà. Tai reiðkia, kad eksperimentà galima atkartoti 
# visiðkai tiksliai. Kartais tokia galimybë labai reikalinga. Norint gauti tokià 
# paèià pseudoatsitiktiniø dydþiø sekà, kiekvienà kartà reikia nurodyti tà paèià 
# seed reikðmæ. 

# Pradinës reikðmës nustatymui naudojama komanda set.seed, kurios argumentas yra 
# bet koks sveikasis skaièius, kuris ir yra seed reikðmë. Pvz., nustatysime seed
# reikðmæ, sugeneruosime normaliøjø ats. dydþiø sekà ir, naudodami tà paèià seed
# reikðmæ, dar kartà sugeneruosime tokià paèià ats. dydþiø sekà.

set.seed(1234)
rnorm(10)

set.seed(1234)
rnorm(10)


# --------------------------------------- #
# MIÐRUS KONGRUENTINIS GENERATORIUS       #
# --------------------------------------- #

# Egzistuoja keletas skirtingø metodø pseudoatsitiktiniø dydþiø generavimui. Èia
# aptarsime vienà plaèiai paplitusá algoritmà, kuris turi keletà modifikacijø ir 
# naudojamas iki ðiol.

# Tarkime, kad X -- atsitiktinis dydis. Tiesinis kongruentinis algoritmas dydþiø 
# X sekà generuoja pasinaudojant tokiu rekurentiniu sàryðiu:
#
#      X := (aX + c) mod m, kur
# 
#   daugiklis a >= 0,
#  prieauglis c >= 0,
#     modulis m > a, m > c.


# Kongruentiniams pseudoatsitiktiniø dydþiø generavimo algoritmams bûdingas tam
# tikras generuojamos skaièiø sekos periodas T. Tai reiðkia, kad sekos elementai
# pradeda kartotis. Kad pseudoatsitiktiniai dydþiai bûtø panaðûs á atsitiktinius 
# dydþius, jie turi bûtø neprognozuojami ir bent jau nesikartoti. Sekos periodas 
# priklauso nuo algoritmo parametrø, taèiau visada T < m. Kad priklausomybë tarp 
# generuojamø dydþiø bûtø kuo silpnesnë, parametras m turi bûti didelis, nors ir
# tai negarantuoja dydþiø nepriklausomumo, nes periodas T gali bûti maþas net ir 
# prie didelës parametro m reikðmës. Be to, didelis periodas T negarantuoja, kad 
# skaièiø seka bus atsitiktinë. Pavyzdþiui, jeigu parametrai a = c = 1, tada bus
# gaunama maksimalaus ilgio, bet visai neatsitiktinë seka, kurioje visi skaièiai 
# nuo 0 iki m-1 iðsidësto tam tikra tvarka, taèiau paskui vël kartojasi ta paèia 
# tvarka. Tiesiniø kongruentiniø algoritmø teorija gerai iðnagrinëta, ir þinomos
# sàlygos, kokie turi bûti parametrai, kad sekos periodas bûtø maksimalus.

# TEOREMA (Greenberger, 1961, Hull-Dobell, 1966). Sekos periodas T maksimalus ir 
# lygus m tada ir tik tada, kai iðpildytos sàlygos:
#
#    -- c ir m yra tarpusavyje pirminiai,
#    -- a-1 yra visø parametro m pirminiø dalikliø kartotinis,
#    -- a-1 yra skaièiaus 4 kartotinis, jei ir m yra 4 kartotinis.


# Praktikoje parametras m paprastai lygus didþiausiam teigiamam skaièiui w, koks 
# telpa á vienà maðininá þodá. Pavyzdþiui, jei vienam skaièiui skiriama 32 bitai, 
# tai w = 2^31 - 1. R ðá skaièiø galima suþinoti su komanda .Machine

.Machine$integer.max   # tai ir yra skaièius w = 2^31 - 1

# Kita daþnai parenkama parametro m reikðmë -- tai didþiausias pirminis skaièius
# maþesnis uþ skaièiø w. Ðiuo atveju taip sutampa, kad m = 2^31 - 1 yra pirminis
# Merseno skaièius.


# Kai parametras c = 0, tai algoritmas vadinamas multiplikatyviniu kongruentiniu 
# generatoriumi (Lehmer, 1949). Dël supaprastëjusiø skaièiavimø, tokia algoritmo 
# modifikacija veikia ðiek tiek greièiau, bet maksimalus periodas T yra maþesnis 
# nei m. Periodo T ilgá ir parametrø parinkimo sàlygas nusako Carmichael teorema
# ið kurios seka, kad multiplikatyvinio kongruentinio generatoriaus generuojamos 
# sekos periodas T lygus m-1 tada ir tik tada, kai iðpildytos sàlygos:
#
#    -- m yra pirminis,
#    -- a yra primityvusis m elementas.

# Paskutinæ sàlygà galima performuluoti taip: kiekvienam pirminiui m-1 dalikliui 
# p skaièius a^(m-1)/p - 1 nesidalina ið m. 


# --------------------------------------- #
# GENERATORIAUS PARAMETRØ RINKINIAI       #
# --------------------------------------- #

# Naudojama daug tiesinio kongruentinio algoritmo parametrø rinkiniø. Pateiksime 
# keletà labiausiai paplitusiø generatoriø, kuriø savybës gerai iðtirtos, o kai 
# kurie ið jø yra tarp standartiniø R generatoriø.

# Plaèiai paplitæs generatorius MINSTD (Lewis et al., 1969), kuris dar vadinamas 
# minimaliu standartiniu generatoriumi (Park, Miller, 1988). Èia naudojamas toks 
# parametrø rinkinys: 

a <- 7^5                        # kai a = 48271 arba 69621 generatorius geresnis
c <- 0
m <- 2^31 - 1

# Ðio generatoriaus versija su parametru a = 397204094 buvo naudojama programoje
# SAS/IML.


# Plaèiai buvo paplitæs generatorius SUPER-DUPER (Margsalia, 1972). Jo parametrø
# reikðmës tokios:

a <- 69069
c <- 1                          # kartais naudojama versija su parametru c = 0
m <- 2^32


# Ið naujesniø generatoriø Fortran kalboje buvo naudojamas generatorius NAG, kur 
# parametrø reikðmës tokios:

a <- 13^13
c <- 0                
m <- 2^59
X <- 123456789*(2^32 + 1)       # tokia naudojama seed reikðmë


# Maple programoje buvo naudojamas multiplikatyvinis kongruentinis generatorius 
# su tokiais parametrais:

a <- 427419669081
c <- 0                
m <- 10^12 - 11

# Èia m yra pirminis skaièius, o parametro a reikðmë yra primityvusis elementas, 
# todël pagal Carmichael teorema, ðis generatorius turi maksimalø periodà.


# Ðiuo metu R, Python, C++, Ruby ir daugelyje kitø programavimo kalbø naudojamas 
# "Mersenne-Twister" algoritmas (Matsumoto, Nishimura, 1998). Tai ið esmës visai
# kitokio tipo generatorius, kurio periodas lygus net 2^19937 - 1.


# --------------------------------------- #
# PAPRASTAS GENERATORIAUS SAVYBIØ TYRIMAS #
# --------------------------------------- #

# Ne visi atsitiktiniø dydþiø generatoriai vienodai geri, todël generuojamø sekø 
# savybëms patikrinti naudojami ávairûs statistiniai testai. Pavyzdþiui, Diehard
# testas apima serijà ið keletos skirtingø testø, kurie patikrina vis kità sekos
# savybæ: atstumø tarp skaièiø sekoje pasiskirstymà, keliø skaitmenø kombinacijø 
# pasiskirstymà, ats. dydþiø sumø normaliðkumà ir t.t. Èia apsiribosime vizualiu 
# sekos nariø pasiskirstymo ir tarpusavio priklausomybës ávertinimu.

# Nustatome algoritmo parametrus.

a <- 21
c <- 1
m <- 2048

# Nustatome ats. dydþiø sekos X elementø skaièiø n ir sukuriame sveikøjø skaièiø 
# vektoriø, kuris vëliau ir bus uþpildytas atsitiktiniais dydþiais.

n <- 2000
X <- integer(n)

# Nustatome pradinæ atsitiktiniø dydþiø sekos X reikðmæ -- seed.

seed <- 1
X[1] <- seed

for (i in 2:n) {
  X[i] <- (a*X[i-1] + c) %% m
}

X

# Algoritmo parametrai parinkti taip, kad sekos periodas T maksimalus ir lygus m. 
# Sekos ilgis n < T, todël visi sekos elementai be pasikartojimø sutelpa á vienà 
# periodà ir papildomos priklausomybës tarp tolimø sekos nariø nëra. Patikriname
# ar sekoje yra pasikartojanèiø nariø.

anyDuplicated(X)

# Jei kongruentinio algoritmo sugeneruotos sekos narius padalintume ið parametro 
# m, gautume tolygiai intervale (0, 1] pasiskirsèiusá atsitiktiná dydá.

X <- X/m
X

# Nubraiþome histogramà ir matome, kad atsitiktinis dydis X tikrai gana tolygiai 
# pasiskirstæs intervale (0, 1].

hist(X, main = "Histograma", ylab = "Daþnis")

# Patikrinsime, kaip gretimos sekos X reikðmës pasiskirsèiusios plokðtumoje. Tam 
# nubraiþysime taðkø (x, y) sklaidos diagramà, o koordinatës x ir y yra gretimos 
# sekos X reikðmës.

x <- X[seq(1, n-1, by = 2)]
y <- X[seq(2, n-0, by = 2)]

plot(x, y, xlab = "x", ylab = "y", main = "Sklaidos diagrama")

# Diagramoje matome, kad taðkai gana tolygiai uþpildo vienetiná kvadratà, taèiau 
# jø iðsidëstymas yra dësningas! Tai parodo, kad vien tik tolygaus pasiskirstymo 
# ant tiesës neuþtenka.

# Panaði gretimø sekos nariø priklausomybë iðryðkëja nubraiþius jø pasiskirstymà 
# trimatëje erdvëje.

x <- X[seq(1, n-2, by = 3)]
y <- X[seq(2, n-1, by = 3)]
z <- X[seq(3, n-0, by = 3)]

require(lattice)
cloud(z ~ x*y, main = "Atsitiktiniø dydþiø sklaidos diagrama") 

# Kad bûtø aiðkiau, galima sudaryti taðkø su koordinatëmis (x, y, z) projekcijas
# á atskiras plokðtumas.

par(mfrow=c(1, 3), mar = c(2, 2, 1, 1))

plot(x, y, xlab = "x", ylab = "y", main = "")
plot(x, z, xlab = "x", ylab = "z", main = "")
plot(y, z, xlab = "y", ylab = "z", main = "")


# UÞDUOTIS ------------------------------ 

# 1. Tarkime, kad parametras m = 1024. Parinkite tokias parametrø a, c reikðmes,
#    kad gauta atsitiktiniø dydþiø seka bûtø kaip galima tolygiau pasiskirsèiusi
#    ant tiesës ir plokðtumoje.


# --------------------------------------- #
# GENERAVIMAS NAUDOJANT TRANSFORMACIJÀ    #
# --------------------------------------- #

# Yra keletas bûdø, kaip gauti kità pasiskirstymo dësná turintá atsitiktiná dydá
# Y. Vienas ið jø -- transformuoti tolygiai intervale pasiskirsèiusá atsitiktiná
# dydá X. Pavyzdþiui, standartiniø normaliøjø dydþiø poros generavimui naudojama
# Box-Muller transformacija. Þinoma, yra ir kitø bûdø.

# Jeigu tolydus atsitiktinis dydis Y turi grieþtai monotoninæ pasiskirstymo f-jà
# F(y), tai ats. dydis X = F(Y) yra pasiskirstæs tolygiai intervale [0, 1]. Toká
# rezultatà galima iðnaudoti ats. dydþiø su norima pasiskirstymo f-ja sudarymui.
# Tarkim, kad funkcija G yra pasiskirstymo f-jos F atvirkðtinë, o X yra tolygiai
# intervale [0, 1] pasiskirstæs ats. dydis. Tada Y = G(X) yra atsitiktinis dydis
# su norima pasiskirstymo funkcija F.

# Pvz., sugeneruosime eksponentiná pasiskirstymo dësná turinèiø ats. dydþiø sekà. 
# Tikimybiø pasiskirstymo funkcija F(y) = 1 - exp(-lambda*y), o atvirkðtinë f-ja
# G(x) = -log(1-x)/lambda. Èia lambda yra pasiskirstymo dësnio parametras. Tegul

lambda = 0.5

# Tolygiai pasiskirsèiusiø atsitiktiniø dydþiø generavimui naudosime standartinæ 
# funkcijà runif.

X <- runif(1000)
Y <- -log(1-X)/lambda

# Nubraiþome santykiniø daþniø histogramà ir teorinæ eksponentinio dydþio tankio
# funkcijà.

hist(Y, freq = FALSE)
curve(dexp(x, lambda), add = TRUE)


# UÞDUOTIS ------------------------------ 

# 1. Jeigu nenurodomi papildomi parametrai, standartinë funkcija runif generuoja
#    tolygiai intervale [0, 1] pasiskirsèiusá atsitiktiná dydá X. Trumpai raðoma
#    X ~ U(0, 1). Turint dydþiø X sekà ir naudojant atvirkðtinës transformacijos 
#    metodà, sugeneruokite atsitiktiná dydá Y ~ U(-1, 1).


#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Funkcijø uþraðymas.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-08-16 | 2013-09-01
#


# TURINYS -------------------------------

#
#   1. Iðraiðkos ir iðraiðkø blokai:
#      * skliaustai {}
#
#   2. Naujø funkcijø uþraðymas:
#      * komanda function
#      * komanda return
#      * funkcija source
#      * funkcija body 
#
#   3. Sàlygø funkcijose tikrinimas:
#      * komanda stop
#      * komanda stopifnot
#      * komanda message
#      * komanda warning
#


# PASTABOS ------------------------------

#
# Sugalvoti uþdaviniø apie atskirus duomenø analizës etapus.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# IÐRAIÐKOS IR IÐRAIÐKØ BLOKAI            #
# --------------------------------------- #

# R programavimo kalboje objektui sukurti naudojami veiksmai vadinami iðraiðka.
# Iðraiðkos susideda ið aritmetiniø (+, *, ^) arba loginiø (!, &, |) operatoriø
# ir kitø objektø: konstantø, kintamøjø, funkcijø ir jø rezultatø. Pateiksime 
# keletà iðraiðkø su standartinëmis R konstantomis ir funkcijomis:

!TRUE

56 + 67

sin(3*pi/2)

exp(pi * 1i)

cat("Skaièius pi:", pi, "\n")

# Sudëtingi skaièiavimai paprastai iðskaidomi á keletà etapø -- vienos iðraiðkos 
# rezultatas priskiriamas kintamajam, kuris vëliau naudojamas kitoje iðraiðkoje.
# Pvz., sukursime sveikøjø skaièiø vektoriø ir apskaièiuosime jo elementø sumà.

v <- 1:10
s <- sum(v)
s

# Keletà ið eilës einanèiø iðraiðkø riestiniais skliaustais {} galima apjungti á 
# blokà. Toká blokà galima interpretuoti kaip dar vienà iðraiðkà, kurios reikðmë
# yra paskutinës bloko viduje esanèios iðraiðkos rezultatas.

# Pavyzdþiui, uþraðysime iðraiðkø blokà, kuriame sukuriamas sveikøjø skaièiø nuo
# 1 iki 10 vektorius, o tada suskaièiuojama to vektoriaus elementø suma. Kadangi
# gauta reikðmë niekam nepriskiriama, ji kaip bloko reikðmë iðvedama á konsolæ.

{
  v <- 1:10
  sum(v)
}

# Kintamajam priskirta paskutinës iðraiðkos reikðmë tuo paèiu yra ir viso bloko
# reikðmë. Á konsolæ ji neiðvedama, taèiau jà galima naudoti kitose iðraiðkose. 

{
  v <- 1:10
  s <- sum(v)
}

# Kaip ir bet kurios iðraiðkos reikðmæ, bloko gràþinamà reikðmæ galima priskirti 
# kintamajam.

b <- {
  v <- 1:10
  s <- sum(v)
}

# Matome, kad bloko reikðmë sutampa su paskutinës iðraiðkos reikðme.
b

# Bloko viduje sukuriami tarpiniai kintamieji yra savarankiðki objektai, kuriuos
# galima naudoti kituose skaièiavimuose. Pavyzdþiui, iðvesime á konsolæ tarpiná 
# bloko kintamàjá v.

v     # pirmos iðraiðkos rezultatas 
s     # antros iðraiðkos rezultatas


# NAUDINGA ------------------------------

# R programavimo kalboje naudojami dviejø rûðiø skliaustai: ( ) ir { }. Grieþtai
# kalbant, R skliaustai traktuojami kaip funkcijos. Iðraiðka (x) yra ekvivalenti 
# funkcijai f(x) = x. Kadangi funkcijos reikðmë automatiðkai iðvedama á konsolæ,
# tai skliaustuose áraðytos iðraiðkos reikðmë taip pat iðvedama á konsolæ.

# Ðià savybæ galima iðnaudoti. Pvz., priskyrimo operacijà áraðius á skliaustus, 
# gauta reikðmë iðvedama á konsolæ net nenurodþius kintamojo, kuriam ði reikðmë 
# priskiriama, vardo.

(a <- 2 + 2)

# Paprasti skliaustai naudojami aritmetinëms ar loginëms operacijoms apskliausti, 
# juose nurodomi visø funkcijø argumentai. Taèiau () skliaustuose galima áraðyti 
# tik vienà iðraiðkà.

# Riestiniai {} skliaustai naudojami keletos iðraiðkø apjungimui. Paprastai tai 
# reikalinga konstrukcijoje if-else, ciklo funkcijose for, while arba repeat ir 
# uþraðant funkcijas. Skliaustuose {} áraðytos iðraiðkos rezultatas iðvedamas á
# konsolæ tik tada, jei jis nepriskiriamas kintamajam. 

# Tuðti riestiniai skliaustai prilygsta NULL objektui.

a <- {}
a

# Lauþtiniai skliaustai [ ar [[ naudojami kaip operatoriai vektoriaus, matricos 
# arba sàraðo elementø indeksams uþraðyti. Pvz., ið didþiøjø raidþiø vektoriaus 
# iðskirsime 18-tà jo elementà.

LETTERS[18]


# --------------------------------------- #
# FUNKCIJOS UÞRAÐYMAS                     #
# --------------------------------------- #

# R turi visas pagrindines matematines funkcijas bei daug standartiniø funkcijø 
# skirtø statistinei duomenø analizei ir kitiems skaièiavimams. Daþnai duomenis
# tenka pertvarkyti, vienà po kito atlikti kelis veiksmus arba pritaikyti kelias
# skirtingas funkcijas. Tokiais atvejais kelias iðraiðkas galima uþraðyti kaip  
# funkcijà. Bendras funkcijos pavidalas yra toks:
#
#   funkcijos.vardas <- function(arg1, arg2, ...) {
#     
#   }

# Funkcijos vardas yra kintamasis, kuriam priskirta pati funkcija. Bet kuri R 
# funkcija yra "function" tipo objektas. Tai reiðkia, kad kintamajam priskirta 
# reikðmë gali bûti funkcija, o funkcijos reikðmë kaip argumentas gali bûti 
# perduota kitai funkcijai. Taip galima iðvengti tarpiniø kintamøjø ir uþraðyti 
# labai kompaktiðkas komandas. R yra funkcinio programavimo kalba, ir todël toks
# programavimo stilius yra labai natûralus.

# Funkcija gali turëti vienà ar daugiau argumentø, arba neturëti visai. Reikðmës 
# argumentams priskiriamos naudojant = þenklà. Pagrindinæ funkcijos dalá sudaro 
# viena arba kelios riestiniuose skliaustuose á blokà apjungtos iðraiðkos.

# Pavyzdþiui, uþraðysime paprastà funkcijà, kuri apskaièiuotø sveikøjø skaièiø 
# nuo m iki n suma. Skaièiai m ir n bus ðios funkcijos argumentai. Funkcija turi 
# dvi iðraiðkas: pirmoji sukuria sveikøjø skaièiø vektoriø, antroji suranda ðio 
# vektoriaus elementø sumà.

seq.suma <- function(m, n) {

    v <- m:n
    sum(v)
}

# Galima ásitikinti, kad nauja funkcija yra "function" tipo objektas. 
class(seq.suma)

# Jei nurodomi funkcijos argumentø pavadinimai, reikðmes jiems priskirti galima 
# bet kokia tvarka.
seq.suma(m = 1, n = 10)
seq.suma(n = 10, m = 1)

# Jei argumentai suraðomi nustatyta tvarka, jø pavadinimus galima praleisti.
seq.suma(1, 10)

# Funkcijos argumentai gali turëti numatytas reikðmes. Pvz., sumavimo funkcijà 
# pakeisime taip, kad, nurodþius tik vienà argumentà, bûtø sumuojami sveikieji 
# skaièiai nuo 1 iki n. Èia argumentas m turës numatytà reikðmæ lygià 1.

seq.suma <- function(n, m = 1) {

    v <- m:n
    sum(v)
}

# Dabar uþtenka nurodyti tik vienà argumentà n, kurio vardo galima ir neraðyti.
seq.suma(10)

# Jei reikia, numatytà argumento reikðmæ galima pakeisti.
seq.suma(n = 10, m = 5) 

# Funkcija gràþina paskutinës jos iðraiðkos reikðmæ. Jei ði reikðmë priskiriama
# kintamajam, papildomai reikia nurodyti, kurio kintamojo reikðmæ gràþinti. Tam 
# naudojama komanda return. Pvz., vektoriaus elementø sumà priskyrus kintamajam 
# s, reikia nurodyti, kad funkcija gràþina tà kintamàjá.

seq.suma <- function(m, n) {

    v <- m:n
    s <- sum(v)

    return(s)
}

# Funkcija gali gràþinti bet koká objektà. Pavyzdþiui, pakeisime funkcijà taip,
# kad jos rezultatas bûtø sàraðas ið trijø elementø: pirmas ir paskutinis sekos
# nariai ir sekos suma.

seq.suma <- function(m, n) {

    v <- m:n
    s <- sum(v)

    return(list(pirmas = m, paskutinis = n, suma = s))
}

seq.suma(1, 10)

# Atsisakius tarpiniø kintamøjø, funkcijos viduje lieka tik viena iðraiðka, tad
# riestiniø skliaustø galima ir neberaðyti. Tokiu bûdu funkcijà uþraðome labai 
# kompaktiðkai.

seq.suma <- function(m, n) sum(m:n)

# Kaip ir kiti R objektai, funkcijos reikðmë gali bûti priskirta kintamajam arba 
# kaip argumentas perduota dar kitai funkcijai. Pvz., sumavimo funkcijà ádësime 
# á procedûrà cat, kuri ið funkcijos argumentø ir jos rezultato suformuos sakiná 
# ir iðves já á konsolæ.
m = 10
n = 99

cat("Skaièiø nuo", m, "iki", n, "suma lygi", seq.suma(m, n), "\n")


# NAUDINGA ------------------------------

# Didelës apimties, ávairias pagalbines ar keliose skirtingose programose daþnai 
# naudojamas funkcijas galima áraðyti á atskirà tekstiná failà. Dël to programos 
# tekstas pasidaro kompaktiðkesnis, lengviau skaitomas. Labai svarbu ir tai, kad 
# pakoregavus funkcijà, visose jà naudojanèiose programose bus naudojama ta pati
# jos versija. Funkcijos ar visos programos kodo nuskaitymui ið tekstinio failo 
# naudojama procedûra source.

# Pavyzdþiui, ið internete patalpinto failo importuosime funkcijà visi.dalikliai, 
# kuri suranda visus natûrinio skaièiaus daliklius.

adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/funkcijos/divisors.R"
source(file = adresas)

# Funkcijos vardas be argumentø iðveda visà funkcijos kodà á konsolæ. Tokiu bûdu 
# galima pamatyti neþinomos funkcijos argumentus ir viduje esanèias iðraiðkas.
visi.dalikliai

# Neþinomos funkcijos viduje esanèias iðraiðkas á konsolæ iðveda funkcija body.
body(visi.dalikliai)

# Vienintelis ðios funkcijos argumentas yra natûrinis skaièius, o jos rezultatas 
# yra visø to skaièiaus dalikliø vektorius.
visi.dalikliai(666)


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite funkcijà Fibonaèio skaièiø sekos sudarymui. Pirmas ir antras jos 
#    nariai lygûs 1, o kiekvienas sekantis narys lygus dviejø paskutiniø sumai. 
#    Ðios funkcijos argumentas yra sekos nariø skaièius n, n > 0, o rezultatas
#    yra n elementø turintis vektorius.
# 2. Uþraðykite funkcijà sveikojo skaièiaus ið dvejetainës skaièiavimo sistemos 
#    pervedimui á deðimtainæ. Funkcijos argumentas -- vektorius, kurio elementø
#    reikðmës 0 arba 1. Pavyzdþiui, jei argumentas yra vektorius c(1, 1, 0, 1),
#    rezultatas yra 13, jeigu argumentas c(1, 1, 1), tai rezultatas turi bûti 7.
# 3. Tegu s yra n elementø turintis simboliø arba skaièiø vektorius. Uþraðykite 
#    funkcijà, kuri surastø visas slenkanèias k elementø dydþio sekas. Pvz., jei
#    s = c("A", "B", "C", "D"), o k = 3, tai funkcijos rezultatas yra vektoriai
#    c("A", "B", "C") ir c("B", "C", "D"). Gautas i-asis vektorius priskiriamas
#    i-ajam sàraðo elementui ir galutinis rezultatas yra tokiø vektoriø sàraðas.
 

# --------------------------------------- #
# KOREKTIÐKØ FUNKCIJØ RAÐYMAS             #
# --------------------------------------- #

# Funkcijos turi bûti uþraðytos taip, kad suveiktø korektiðkai ir nekorektiðkose
# situacijose. Tas labai svarbu dirbant su realiais duomenimis, kuriuose kartais
# bûna praleistø reikðmiø. Kadangi veiksmø su NA reikðmëmis rezultatas taip pat 
# yra NA reikðmë, negalima atlikti tam tikrø skaièiavimø. Kartais skaièiavimus
# tenka nutraukti nes duomenys netenkina tam tikrø specifiniø sàlygø, pvz., per
# maþa imtis, per daug iðsiskirianèiø stebiniø ir t.t. 

# Nekorektiðkos situacijos atveju iðraiðkos vykdymas nutraukiamas naudojant f-jà
# stop. Paprastai ði funkcija naudojama kartu su sàlygos konstrukcija if-else.

# Pavyzdþiui, uþraðysime funkcijà f(x) = 1/x. Prieð atliekant skaièiavimus, bus
# patikrinama, ar x nelygus 0. Jei taip, skaièiavimai nutraukiami.

fx.a <- function (x) {
  if (x == 0) stop("x negali bûti lygus 0.")

  y <- 1/x
  return(y)
}

fx.a(5)
fx.a(0)


# Prieð atliekant skaièiavimus kartais tenka patikrinti, ar f-jos argumentai yra 
# tam tikro tipo. Pavyzdþiui, uþraðysime funkcijà, kurios argumentas gali bûti 
# tik vektorius (bet kokio tipo), prieðingu atveju skaièiavimai neatliekami.

fx.b <- function (x) {
  if (!is.vector(x)) stop("x nëra vektorius.")

  y <- length(x)
  names(y) <- "Elementø skaièius"
  return(y)
}

fx.b(100:150)
fx.b(letters)


# Kartais funkcijos darbas turi bûti nutraukiamas jei netenkinama bent viena ið
# keletos loginiø sàlygø. Ðiø sàlygø patikrinimui galima naudoti keletà funkcijø 
# if, taèiau paprasèiau naudoti tam skirtà funkcijà stopifnot. Jos parametrai:
#
#    stopifnot(sàlyga1, sàlyga2, ...)

# Jei visø loginiø sàlygø reikðmë yra TRUE, funkcija gràþina NULL reikðmæ. Jeigu
# bent vienos sàlygos reikðmë nëra TRUE, suvykdoma funkcija stop, ir á konsolæ 
# iðvedamas praneðimas apie pirmà ne TRUE reikðmæ turinèià sàlygà (jei tokiø yra
# ne viena).

# Pavyzdþiui, uþraðysime funkcijà, kurios argumentas turi bûti ne maþiau kaip 10
# reikðmiø turintis skaitinis vektorius be praleistø reikðmiø.

fx.s <- function(x) {

  stopifnot(is.vector(x), is.numeric(x), length(x) >= 10, all(!is.na(x)))

  y <- mean(x)
  names(y) <- "Vidurkis"
  return(y)
}

x <- c(10.5, 14.2, 3.1)
y <- c(10.7, 10.4, 9.9, NA, 7, 13.8, 9.6, 9.1, 7.9, 9.4)
z <- c(11.5, 13.3, 8.2, 10, 9, 12.8, 8.6, 8.1, 7.9, 9.2)

fx.s(x)
fx.s(y)
fx.s(z)

# Kartais reikia, kad funkcija tam tikrais skaièiavimo etapais iðvestø praneðimà
# apie atliekamus veiksmus. Tam naudojama funkcija message. Jos parametrai:
#
#        ... -- vienas ar keli kintamieji, kuriø reikðmë yra tekstas,
#   appendLF -- TRUE, nurodo, kad kitas praneðimas bus naujoje eilutëje.

# Pavyzdþiui, anksèiau uþraðytà funkcijà papildysime informaciniais praneðimais 
# apie sàlygø duomenims tikrinimà ir skaièiavimø etapo pradþià.

fx.m <- function(x) {

  message("Tikrinamos sàlygos ... ", appendLF = FALSE)
  stopifnot(is.vector(x), is.numeric(x), length(x) >= 10, all(!is.na(x)))
  message("atlikta.")

  message("Atliekami skaièiavimai.")
  y <- mean(x)
  names(y) <- "Vidurkis"

  return(y)
}

fx.m(x)
fx.m(y)
fx.m(z)

# Ne visi praneðimai turi vienodà svarbà. Ávairiems perspëjimams naudojama f-jà
# warning. Jos parametrai:
#
#        ... -- vienas ar keli kintamieji, kuriø reikðmë yra tekstas,
#      call. -- TRUE, praneðime nurodoma iðraiðka, kurioje ávyko klaida,
# immediate. -- FALSE, nurodo, kad praneðimas bûtø iðvedamas ið karto.

# Pavyzdþiui, funkcijà perraðysime taip, kad skaièiavimai dël praleistø reikðmiø 
# duomenyse nebus nutraukiami. Sàlyga dël praleistø reikðmiø tikrinama atskirai,
# ir, jei tokiø reikðmiø yra, skaièiavimai atliekami, bet iðvedamas perspëjimas.

fx.w <- function(x) {

  stopifnot(is.vector(x), is.numeric(x), length(x) >= 10)
  if (any(is.na(x))) warning("Duomenyse yra praleistø reikðmiø.", call. = FALSE)

  y <- mean(x, na.rm = TRUE)
  names(y) <- "Vidurkis"

  return(y)
}

fx.w(x)
fx.w(y)
fx.w(z)


# NAUDINGA ------------------------------

# Tarkime, kad kintamasis n turi bûti sveikøjø skaièiø 1, 2, 3, 4 ir 5 vektorius. 
# Toká vektoriø galima uþraðyti keliais skirtingais bûdais, taèiau ne visi ið jø
# yra tinkami.

n.1 <- c(1.0, 2.0, 3.0, 4.0, 5.0)
is.integer(n.1)

n.2 <- c(1, 2, 3, 4, 5)
is.integer(n.2)

n.3 <- c(1L, 2L, 3L, 4L, 5L)
is.integer(n.3)

n.4 <- seq(from = 1, to = 5, by = 1)
is.integer(n.4)

n.5 <- seq(from = 1, to = 5)
is.integer(n.5)

n.6 <- 1:5
is.integer(n.6)

# Galima parodyti, kad funkcijai, kurios argumentas turi bûti sveikasis skaièius,
# tinka ne visi ið ðiø vektoriø.

fx.n <- function(x) {
  stopifnot(is.integer(x))

  message("Duomenys tinkami!")
}

fx.n(n.2)
fx.n(n.6)

# Ið ðiø pavyzdþiø aiðku, kad ið esmës geri duomenys gali bûti atmesti vien tik 
# dël netinkamo kintamojo tipo. Norint uþtikrinti, kad skaièiavimuose naudojami
# reikiamo tipo kintamieji, kartais funkcijos argumentai ið anksto konvertuojami.
# Tam naudojamos funkcijos as.numeric, as.character, as.vector, as.matrix ir t.t.

fx.k <- function(x) {
  x <- as.integer(x)

  message("Duomenys tinkami!")
}

fx.k(n.2)
fx.k(n.6)


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite funkcijà, kuri apskaièiuoja skaièiø vektoriaus elementø sandaugà. 
#    Naudojant funkcijà stop, nutraukite skaièiavimus, jei bent vienas elementas
#    lygus nuliui.
# 2. Naudodami f-jà stopifnot, uþraðykite iðraiðkà, kuri patikrina ar kintamasis 
#    x yra neneigiamø skaièiø vektorius.
# 3. Naudodami funkcijà stopifnot, patikrinkite, ar funkcijos argumentas yra 3x3
#    dydþio skaièiø matrica be praleistø reikðmiø.

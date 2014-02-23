
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Keletas klasikiniø algoritmø su ciklais.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-08-23 | 2013-08-25 | 2014-02-23
#


# TURINYS -------------------------------

#
#   1. Keletas klasikiniø algoritmø su ciklais:
#      * Newton-Raphson metodas kvadratinei ðakniai surasti
#      * vektoriaus elementø iðrikiavimas "burbuliuko" metodu
#      * Euklido algoritmas didþiausiam bendram dalikliui
#      * pseudoatsitiktiniø dydþiø generavimo algoritmas
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
# NEWTON-RAPHSON METODAS                  #
# --------------------------------------- #

# Newton-Raphson metodas taikomas lygties f(x) = 0 ðaknø radimui. Èia naudojama
# tokia iteracinë iðraiðka:
#
#   x := x - f(x)/f'(x)
#
# Pritaikysime ðá metodà apytiksliam ðaknies ið skaièiaus traukimui. Nagrinëkime
# funkcijà f(x) = x^2 - a. Jos iðvestinë f'(x) = 2x. Atlikæ pertvarkymus gauname 
# tokià iteracinæ iðraiðkà:
#
#   x := (x + a/x)/2

# Èia dydis a yra skaièius, ið kurio traukiama ðaknis, o kairëje lygties pusëje 
# esantis dydis x yra apytikslë tos ðaknies reikðmë. Algoritmui reikia nurodyti
# pradinæ x reikðmæ ir iteracijø skaièiø. 

# Tegu iteracijø skaièius fiksuotas ir lygus n, todël naudosime konstrukcijà for.
# Kadangi tarpiniø reikðmiø vektorius nesudaromas, ciklo kintamasis nenaudojamas. 

a <- 25   # skaièius, ið kurio traukiama kvadratinë ðaknis

n <- 10   # iteracijø skaièius
x <- 1    # pradinë reikðmë

for (i in 1:n) {
  x <- (x + a/x)/2
  print(x)
}

# Galima pastebëti, kad kuo pradinë reikðmë arèiau tikrosios ðaknies reikðmës, 
# tuo maþiau iteracijø reikia.
x

# Kvadratinës ðaknies traukimui naudojama standartinë funkcija sqrt.
sqrt(a)


# --------------------------------------- #
# VEKTORIAUS ELEMENTØ IÐRIKIAVIMAS        #
# --------------------------------------- #

# Apraðysime vienà paprastà vektoriaus elementø iðrikiavimo algoritmà. Pirmasis
# vektoriaus elementas lyginamas su antruoju, tada su treèiuoju ir taip toliau 
# iki paskutinio. Jei jo reikðmë didesnë, elementø reikðmes sukeièiame vietomis. 
# Tà patá pakartojame pradedant antruoju, treèiuoju ir likusiais elementais iki 
# prieðpaskutinio. Kadangi didelæ reikðmæ turintis elementas "kyla á virðø", ðis 
# metodas vadinamas "burbuliuko" metodu.

# Ðio algoritmo iteracijø skaièius þinomas, taèiau jis priklauso nuo vektoriaus 
# elementø skaièiaus, kuris ið anksto gali bûti neþinomas, todël jam nustatyti
# naudojame standartinæ funkcijà length.

v <- c(1, 6, 4, 3, 2, 8, 5, 10, 9, 0, 7)

for (i in 1:(length(v) - 1)) {
  for (j in (i + 1):length(v)) {
    if (v[i] > v[j]) {
      temp <- v[i]
      v[i] <- v[j]
      v[j] <- temp
    }
  }
}

v

# Vektoriaus elementø rikiavimui R turi standartinæ funkcijà sort.
sort(v)


# --------------------------------------- #
# BENDRAS DIDÞIAUSIAS DALIKLIS            #
# --------------------------------------- #

# Apraðysime Euklido algoritmà dviejø sveikø skaièiø a ir b didþiausiam bendram
# dalikliui surasti. Tarkime, a > b > 0. Skaièiø a iðreiðkiame tokiu pavidalu:
#
#   a = bq + r.
#
# Èia q yra sveikasis skaièius, dydis r vadinamas liekana, r < b. Tada dydþiams 
# a ir b priskiriamos naujos reikðmës:
#
#   a := b,
#   b := r.
# 
# Vël surandama liekana, priskiriamos naujos reikðmës ir veiksmai kartojami tol, 
# kol liekana r nepasidarys lygi nuliui. Paskutinë nelygi nuliui liekana ir yra
# didþiausias bendras daliklis.

a <- 776
b <- 544

# Kadangi iteracijø skaièius ið anksto neþinomas ir priklauso nuo sàlygos, èia 
# naudojame ciklà while. Veiksmus kartojame tol, kol liekana didesnë uþ nulá.

# Pirmà iteracijà taip pat ákeliame á ciklà, todël liekanai suteikiame pradinæ
# reikðmæ.

r <- b

while (r > 0) {
  r <- a %% b
  print(r)
  a <- b
  b <- r
}

# Pirmos iteracijos liekanos reikðmë antroje iteracijoje perduodama dydþiui b, o 
# treèioje -- dydþiui a. Tuo paèiu principu perduodamos visø iteracijø liekanos.
# Ciklo viduje liekanos reikðmë iðvedama á konsolæ. Kadangi reikðmiø priskyrimas 
# atliekamas ciklo pabaigoje, paskutinës nelygios nuliui liekanos reikðmæ ágyja 
# dydis a. 
a


# --------------------------------------- #
# ATSITIKTINIØ DYDÞIØ GENERAVIMAS         #
# --------------------------------------- #

# Èia apraðysime pseudoatsitiktiniø dydþiø generavimo algoritmà, kuris vadinamas
# tiesiniu kongruentiniu generatoriumi. Pagal ðá algoritmà atsitiktiniai dydþiai
# generuojami iteraciniu bûdu:
# 
#   X := a*X + c mod m, kur
#
#   daugiklis a >= 0,
#  prieauglis c >= 0,
#     modulis m > a, m > c.

# Parametras m daþniausiai yra didelis pirminis skaièius. Istoriðkai pirmas buvo
# naudojamas toks parametrø rinkinys:

a <- 7^5
c <- 0
m <- 2^31 - 1


# Nustatome atsitiktiniø dydþiø sekos ilgá, kuris sutampa su iteracijø skaièiumi.
n <- 100

# Sukuriame tuðèià vektoriø, kurio elementams priskirsime atsitiktines reikðmes.
X <- vector(length = n)

# Visi pseudoatsitiktiniø dydþiø generatoriai turi pradinæ sekos reikðmæ, seed.
# Su ta paèia seed reikðme visada gaunama ta pati dydþiø seka.

seed <- 1234
X[1] <- seed

for (i in 2:n) {
  X[i] <- (a*X[i-1] + c) %% m
}

# Vektoriaus elementus padalinus ið m, gaunamas dydis, kurio reikðmës tolygiai
# pasiskirsèiusios intervale (0, 1]. 
X <- round(X/m, 9)
X

# Tokio dydþio generavimui naudojama standartinë funkcija runif.
runif(100)


# UÞDUOTIS ------------------------------ 

# 1. Pataisykite Newton-Raphson algoritmo pavyzdá taip, kad skaièiavimai bûtø 
#    nutraukiami, kai skirtumas tarp dviejø paskutiniø ðaknies aproksimacijø yra 
#    maþesnis uþ tam tikrà ið anksto nustatytà dydá epsilon. Vietoje ciklo for 
#    panaudokite ciklà while.

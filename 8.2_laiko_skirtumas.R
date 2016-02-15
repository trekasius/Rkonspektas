
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Veiksmai su datos ir laiko duomenimis.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2015-11-05 | 2015-12-12
#


# TURINYS -------------------------------

#
#   1. Veiksmai su datos ir laiko kintamaisiais:
#      * funkcija weekdays
#      * funkcija months
#      * funkcija quarters
#      * funkcija trunc
#      * funkcija round
#      * funkcija seq
#      * funkcija cut
#
#   2. Skirtumas tarp dviejø laiko momentø:
#      * funkcija as.difftime
#      * funkcija difftime
#      * funkcija diff
#      * funkcija units
#      * funkcija proc.time()
#      * funkcija system.time
#


# PASTABOS ------------------------------

#
# Galima sugalvoti daugiau uþduoèiø.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# VEIKSMAI SU DATA IR LAIKU               #
# --------------------------------------- #

# Dirbant su datos ir laiko duomenimis, paprastai reikia atlikti tokius veiksmus:
# 
#  -- ið datos arba laiko iðskirti tam tikrà jo elementà;
#  -- prie datos ar laiko pridëti tam tikrà laiko intervalà;
#  -- apskaièiuoti skirtumà tarp dviejø laiko momentø;
#  -- suskirstyti laiko momentus á tam tikrus intervalus;
#  -- generuoti laiko momentø sekà.


# Jei laiko momentas uþraðytas kaip POSIXlt klasës objektas, kai kurias datos ir 
# laiko komponentes galima gauti be jokiø papildomø funkcijø, kadangi tokiu bûdu
# uþraðytas laiko momentas yra ávairiø laiko ir datos komponenèiø sàraðas. Pvz.,
# nustatysime, kelinta savaitës, mënesio ir metø diena yra ði diena.

t <- as.POSIXlt(Sys.time())
t

t$wday
t$mday
t$yday


# Savaitës dienos, mënesio pavadinimo ir metø ketvirèio nustatymui bendru atveju 
# gali bûti naudojamos ðios funkcijos: weekdays, months, quarters. Visø funkcijø 
# argumentai vienodi:
#
#          x -- data arba laikas,
# abbreviate -- loginis, nurodo, pavadinimas turi bûti sutrumpintas.

# Pavyzdþiui, þinomos keliø artimiausiø pilnø Saulës uþtemimø datos. Nustatysime, 
# kurià savaitës dienà vyks ðitie uþtemimai.

data <- c("2016-03-08", "2017-08-21", "2019-07-02", "2020-12-14", "2021-12-04")

d <- as.Date(data)
d

weekdays(d)


# Kadangi datos ir laiko kintamieji, nepriklausomai nuo jø formato, saugomi kaip 
# skaièiai, keletas standartiniø funkcijø turi metodus datos ir laiko objektams:
#
#                 datoms                         laikui
#              ------------                  --------------
#               trunc.Date                    trunc.POSIXt
#               round.Date                    round.POSIXt 
#                 seq.Date                      seq.POSIXt
#                 cut.Date                      cut.POSIXt
#                hist.Date                     hist.POSIXt
#                axis.Date                     axis.POSIXt
#
# Tai reiðkia, kad su datomis ir laiku galima elgtis kaip su áprastais skaièiais: 
# juos apvalinti iki norimo tikslumo, generuoti laiko momentø sekas arba turimus 
# laiko momentus grupuoti á intervalus.


# Jeigu duotà laiko momentà reikia uþraðyti dienø, valandø, minuèiø ar sekundþiø 
# tikslumu, naudojama funkcija trunc. Jeigu laiko momentà reikia suapvalinti iki 
# artimiausio laiko momento dienø, valandø, minuèiø arba sekundþiø tikslumu, tai 
# naudojama funkcija round. Abiejø funkcijø parametrai vienodi:
#
#          x -- laiko momentas,
#      units -- laiko apvalinimo vienetai, "secs", "mins", "hours" arba "days".


# Pavyzdþiui, duotas laiko momentas sekundës tûkstantøjø tikslumu. Uþraðysime já
# dienø, valandø, minuèiø ir sekundþiø tikslumu. Vienu atveju naudosime funkcijà 
# trunc, kitu -- funkcijà round.

t <- as.POSIXct("2015-11-22 18:39:12.683", format = "%Y-%m-%d %H:%M:%OS")
t

format(t, format = "%H:%M:%OS3")

trunc(t, "day")
round(t, "day")

trunc(t, "hours")
round(t, "hours")

trunc(t, "mins")
round(t, "mins")

trunc(t, "secs")
round(t, "secs")


# Datø ar laiko momentø sekos generavimui naudojama funkcija seq. Ði standartinë
# funkcija turi atskirus metodus "Date" ir "POSIXt" klasës objektams. Parametrai:
#
#       from -- pradinë data,
#         to -- galutinë data,
#         by -- datos kitimo þingsnis,
# length.out -- sekos elementø skaièius,
# along.with -- sekos elementø skaièius pagal kità vektoriø.
#
# Parametrui from priskiriame "Date" klasës reikðmæ. Parametras to neprivalomas,
# jeigu per parametrus length.out arba along.with nurodome bendrà sekos elementø 
# skaièiø. Parametrui by reikðmæ galima priskirti net keliais skirtingais bûdais,
# kadangi sekos kitimo þingsnis, intervalas tarp dviejø sekos elementø gali bûti:
# 
#  -- skaièius, kuris nurodo dienø skaièiø;
#  -- difftime klasës objektas;
#  -- þodinis laiko intervalas: "day", "week", "month", "quarter", "year";
#  -- kartotinis laiko intervalas: "7 days", "2 months", "-1 years" ir pan.

# Tarkime, kad sekos pradþia ir pabaiga yra pirma ir paskutinë 2015 metø dienos.
# Sudarysime keletà skirtingø sekø su ávairaus dydþio tarpais tarp gretimø datø.

pr <- as.Date("2015-01-01")
pb <- as.Date("2015-12-31")

# Sugeneruosime sekà, kurià sudaro visos sausio mënesio dienos.
seq(pr, by = "day", length.out = 31)      

# Sudarome sekà, kurioje á praeitá atidedame penkias datas kas du metus.
seq(pr, by = "-2 years", length.out = 5)

# Vieneriø metø intervalà suskirstome 4 savaièiø ilgio laiko intervalais. 
seq(pr, pb, by = "4 weeks")


# Jeigu funkcija seq naudojama laiko sekoms generuoti, tada parametrams from, to
# nurodome "POSIXt" laiko momentà, o parametrui by galima nurodyti ðias reikðmes:
# 
#  -- skaièiø, kuris reiðkia sekundþiø skaièiø;
#  -- difftime klasës objektà;
#  -- intervalà: "sec", "min", "hour", "day", "week", "month", "quarter", "year";
#  -- kartotiná laiko intervalà: "15 secs", "2 hour", "-1 years" ir pan.

# Pavyzdþiui, vienos valandos ilgio intervalà reikia padalinti á maþesnius laiko 
# intervalus po 90 sekundþiø. Pradinis momentas 08:00:00, galutinis -- 09:00:00.

pr <- as.POSIXlt("2015-01-01 08:00:00")
pb <- as.POSIXlt("2015-01-01 09:00:00")

seq(pr, pb, by = "90 secs")

# Tarkime, kad reikalinga seka ið 10 laiko momentø kas 45 minutes. Sugeneruosime
# tokià sekà.

seq(pr, by = "45 mins", length.out = 10)

# Jei laiko intervalai didesni, pradiniam ir galutiniam laiko momentams nurodyti 
# patogiau gali bûti naudoti funkcijà ISOdate arba ISOdatetime. Pvz., sudarysime
# kas vienà dienà iðdëstytø 30 laiko momentø sekà, pradedant nuo 2015-11-23.

seq(ISOdate(2015, 11, 23), by = "day", length.out = 30)


# Datø ir laiko momentø grupavimui naudojama funkcija cut; ji turi metodus "Date"
# ir "POSIXt" klasës objektams. Pagrindiniai ðios funkcijos parametrai yra tokie:
#
#          x -- datø arba laiko momentø vektorius,
#     breaks -- padalijimo taðkø vektorius arba norimas intervalø skaièius,
#     labels -- NULL, intervalø pavadinimø vektorius,
#      right -- FALSE, nurodo ar intervalo galas uþdaras ið deðinës.

# Grupuojant laiko intervalus parametrui breaks galima nurodyti tokias reikðmes:
# "sec", "min", "hour", "day", "DSTday", "week", "month", "quarter" arba "year".

# Pavyzdþiui, vienos paros bëgyje atidësime 100 atsitiktiniø laiko momentø, tada
# juos suskirstysime á intervalus po 6 valandas bei apskaièiuosime laiko momentø
# daþnius kiekviename tokiame intervale.

t <- ISOdatetime(2015, 11, 23, 0, 0, 0) + 24*3600*runif(100)
t

windows(9, 4)
plot(t, rep(0, 100), type = "n", xlab = "laikas", ylab = "", yaxt = "n")
rug(t)

intervalai <- cut(t, breaks = "6 hour")
intervalai

table(intervalai)


# Pavyzdþiui, visà parà suskirstysime á du nevienodo ilgio intervalus: nuo 00:00
# iki 05:59 ir nuo 06:00 iki 23:59. Tokiu atveju parametrui breaks nurodome tris
# laiko momentus POSIX formatu.

p <- c("2015-11-23 00:00:00", "2015-11-23 06:00:00", "2015-11-23 23:59:59")
p <- strptime(p, format = "%Y-%m-%d %H:%M:%S")
p

intervalai <- cut(t, breaks = p, labels = c("naktis", "diena"))
intervalai

table(intervalai)


# Analogiðkai á intervalus suskirstomos ir datos. Pvz., dviejø mënesiø intervale
# (pradedant nuo 2015-11-23) sugeneruosime 20 atsitiktiniø datø ir suskirstysime
# jas á dviejø savaièiø ilgio intervalus.

d <- as.Date("2015-11-23") + 2*30*runif(20)
d

intervalai <- cut(d, breaks = "2 weeks")
intervalai

table(intervalai)


# NAUDINGA ------------------------------

# Funkcija axis turi metodà POSIX klasës objektams, todël laiko momentus galima
# pavaizduoti grafike. Pavyzdþiui, paros bëgyje atvaizduosime 100 laiko momentø.
# Paprasèiausiu atveju tam galima naudoti funkcijà plot.

t <- ISOdatetime(2015, 12, 12, 0, 0, 0) + 24*3600*runif(100)

y <- rep(0, length(t))
plot(t, y, type = "n", ylab = "", yaxt = "n")
rug(t)

# Laiko aðá galima suformuoti tokià, kokia reikalinga. Pavyzdþiui, laiko momentø
# atidëjimui galima panaudosime funkcijà stripchart, kuri taðkus atvaizduoja ant
# tiesës. Taèiau ji netinkama POSIX klasës objektui, todël laikà konvertuojame á 
# skaièiø vektoriø. Ox aðá suformuojame ið naujo.

s <- as.numeric(t)

stripchart(s, pch = 19, axes = FALSE)
rug(s)

i <- pretty(extendrange(t), 6)
axis(1, at = i, labels = format(i, "%H:%M"))


# Tai, kad funkcija plot gali atvaizduoti POSIX klasës objektà, galima iðnaudoti 
# laiko eiluèiø braiþymui. Pavyzdþiui, pavaizduosime kaip per pastaràjá ðimtmetá 
# keitësi Lietuvos gyventojø skaièius.

g <- c(2.75, 2.146, 2.711, 3.1, 3.398, 3.69, 3.46, 3.054)
d <- ISOdate(c(1897, 1923, 1959, 1970, 1979, 1989, 2001, 2011), 12, 31)

plot(d, g, type = "b", xlab = "",  ylab = "gyventojø skaièius", ylim = c(0, 4))


# UÞDUOTIS ------------------------------ 

# 1. Apskaièiuokite, kiek ið viso penktadieniø per 2015 metus buvo 13-ta mënesio 
#    diena.
# 2. Þinoma, kad Mënulio fazë kartojasi vidutiniðkai kas 29 paras 12 val. 44 min.
#    ir 2,9 sekundes (sinodinis mënuo). Paskutinë 2015-øjø pilnatis prasidës nuo
#    gruodþio 25 d. 13:11 val. Nustatykite visø pilnaèiø datas 2016 metais.
# 3. Nubraiþykite grafikà, kuriame ant laiko aðies bûtø paþymëti Saulës uþtemimø 
#    momentai 2016--2021 metø laikotarpyje.


# --------------------------------------- #
# SKIRTUMAS TARP DVIEJØ LAIKO MOMENTØ     #
# --------------------------------------- #

# Turint datà ar laiko momentà, prie jo galima pridëti tam tikrà laiko intervalà. 
# Prie datos pridedamas skaièius nurodo dienø skaièiø, prie POSIX laiko - nurodo 
# sekundþiø skaièiø. Pavyzdþiui, prie ðios dienos datos pridësime ðimtà dienø ir
# gausime naujà datà.

Sys.Date() + 100

# Pavyzdþiui, prie laiko momento pridësime 120 sekundþiø ir tokiu bûdu gausime 2
# minutëmis vëlesná laiko momentà. 

ISOdatetime(2015, 11, 25, 21, 14, 00) + 120

as.POSIXlt("2015-11-25 21:14:00")     + 120


# Turint dvi datas arba du laiko momentus, galima apskaièiuoti skirtumà tarp jø.
# Pvz., nustatysime koks laiko skirtumas tarp atominës bombos sprogimø Japonijos
# miestuose Hiroshima ir Nagasaki.

Hiroshima <- as.POSIXlt("1945-08-06 08:15:00", tz = "Japan")
Nagasakis <- as.POSIXlt("1945-08-09 11:02:00", tz = "Japan")

Nagasakis - Hiroshima

# Pvz., apskaièiuosime, kiek laiko praëjo nuo Hiroshima atominës bombos sprogimo. 

Sys.time() - Hiroshima


# Gautas laiko skirtumas yra "difftime" klasës objektas. Skirtumà galima pridëti 
# arba atimti ið datos arba laiko momento.

d <- Nagasakis - Hiroshima
d

Hiroshima + d
Hiroshima + d == Nagasakis


# Jeigu reikia apskaièiuoti skirtumà tarp dviejø datø arba dviejø laiko momentø, 
# galima naudoti funkcijà difftime. Tada galima nurodyti, kokiais vienetais turi 
# bûti iðreikðtas gautas laiko skirtumas. Funkcijos parametrai:
#
#      time1 -- pradinis laiko momentas,
#      time2 -- galutinis laiko momentas,
#         tz -- laiko zona,
#      units -- laiko vienetai: "auto", "secs", "mins", "hours", "days", "weeks".

# Jeigu parametrui units priskiriama reikðmë "auto", tai laiko skirtumas rodomas
# didþiausiais laiko vienetais. Galima pastebëti, kad tarp laiko vienetø mënesiø
# nëra. Taip yra todël, kad skirtingus mënesius sudaro skirtingas dienø skaièius.

difftime(Nagasakis, Hiroshima, units = "days")
difftime(Nagasakis, Hiroshima, units = "hours")


# Jeigu turime datø arba laiko momentø vektoriø, skirtumus tarp gretimø reikðmiø
# galime nustatyti naudojant standartinæ funkcijà diff. Pavyzdþiui, taip gausime 
# dienomis iðreikðtus laiko skirtumus tarp didþiausiø LDK mûðiø datø.

#          Saulës        Durbës        Þalgirio      Orðos         "Salaspilio"
#         ------------  ------------  ------------  ------------  ------------ 
data <- c("1236-09-22", "1260-07-13", "1410-07-15", "1514-09-08", "1605-09-27")
data

t <- as.Date(data, format = "%Y-%m-%d")
t

diff(t)


# Jei duotas laiko skirtumø vektorius, tada á "difftime" formatà jis paverèiamas 
# naudojant funkcijà as.difftime. Jos parametrai tokie:
#
#        tim -- laiko skirtumø vektorius, "character" arba "numeric",
#     format -- formatas, kuriuo uþraðytas laiko skirtumas,
#      units -- laiko matavimo vienetai, standartiðkai "auto".

# Pavyzdþiui, þinomas tam tikrø ávykiø laiko trukmës vektorius. Sudarysime laiko
# skirtumø vektoriø.

s <- c("01:54:02", "02:11:32", "02:26:45", "02:44:49", "02:57:09", "03:11:08")

d <- as.difftime(s, format = "%H:%M:%S", units = "hours")
d

# "difftime" klasës laiko skirtumus galima apvalinti, sumuoti ir vidurkinti arba 
# skaièiuoti ávairias kitas statistines charakteristikas.

min(d)
max(d)
range(d)
quantile(d)

mean(d)
sum(d)

# Laiko skirtumai gali bûti duoti kaip skaitiniø reikðmiø vektorius. Pavyzdþiui, 
# tie patys laiko skirtumai galëjo bûti iðreikðti sekundëmis.

s <- c(6842, 7892, 8805, 9889, 10629, 11468)

d <- as.difftime(s, units = "secs")
d


# Laiko skirtumas iðmatuotas tam tikrais vienetais, taèiau juos galima pakeisti.
# Tam yra keli skirtingi bûdai. Vienas ið jø - naudoti specialià funkcijà units.
# Pavyzdþiui, laiko skirtumà tarp ðitø dviejø ávykiø perskaièiuosime á valandas.

units(d) <- "hours"
d

# Kitas bûdas -- laiko skirtumà galima konvertuoti á "numeric" klasës skaièiø ir 
# nurodyti, kokiais laiko matavimo vienetais jis turi bûti iðreikðtas.

as.numeric(d, units = "days")
as.numeric(d, units = "secs")


# NAUDINGA ------------------------------

# Funkcija sum turi metodà "difftime" klasës objektui. Tai leidþia sumuoti laiko 
# skirtumus. Taèiau funkcija cumsum tokio metodo (kaþkodël) neturi. Tad sukauptà 
# laiko skirtumø sumà tenka skaièiuoti naudojant standartinæ funkcijà sum. Pvz.,
# uþraðysime tokià funkcijà naudojant sapply konstrukcijà.

sapply(seq_along(d), function(n) sum(d[1:n]))


# NAUDINGA ------------------------------

# Kartais reikia þinoti, kiek laiko uþtrunka tam tikri skaièiavimai. Pavyzdþiui,
# gali dominti, kiek laiko uþtrunka viena ciklo iteracija arba reikia nustatyti,
# kuri ið dviejø alternatyviø komandø ávykdoma greièiau.

# Norint suþinoti skaièiavimø trukmæ, reikia uþfiksuoti laikà, kada prasideda ir
# kada baigiasi skaièiavimai. Tam galima naudoti standartinæ funkcijà Sys.time(). 
# Pavyzdþiui, apskaièiuosime, kiek laiko uþtrunka 100 vektoriø su normaliosiomis
# atsitiktinëmis reikðmëmis generavimas ir vidurkinimas.

start <- Sys.time()

  for (i in 1:100) {
    x <- rnorm(1000)
    v <- mean(x)   
  }

stop <- Sys.time()

difftime(stop, start, units = "secs")


# Tam paèiam tikslui galima panaudoti ir funkcijà proc.time(), kuri parodo, kiek 
# laiko veikia R.

start <- proc.time()
 
  for (i in 1:100) {
    x <- rnorm(1000)
    v <- mean(x)   
  }

stop <- proc.time()

stop - start


# Jeigu iðraiðka uþraðoma kompaktiðkai, tada jos vykdymo trukmæ galima nustatyti
# ádëjus jà á funkcijà system.time(). Pvz., nustatysime, kuri ið dviejø funkcijø 
# greièiau apskaièiuoja matricos stulpeliø vidurkius.

n <- 1000
m <- matrix(rnorm(n*n), ncol = n, nrow = n)

system.time(apply(m, 2, mean))
system.time(colMeans(m))


# UÞDUOTIS ------------------------------ 

# 1. Nustatykite laiko tarpus tarp gretimø pilnø Saulës uþtemimø 2016--2021 metø 
#    laikotarpyje.
# 2. Garsioji Halio kometa paskutiná kartà buvo matoma 1986 metais, o perihelyje
#    buvo tø paèiø metø vasario 9 d. Jos periodas kintantis, vidutiniðkai sudaro 
#    75,3 metus. Nustatykite, sekanèio perihelio datà. Kokia gauta paklaida, jei
#    tiksliai þinoma, kad sekantis perihelis bus 2061 liepos 28 dienà?

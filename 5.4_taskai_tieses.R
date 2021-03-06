
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            �emo lygio grafin�s funkcijos: ta�kai, linijos ir ties�s.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2014-04-25 | 2014-06-08 | 2015-02-28
#


# TURINYS -------------------------------

#
#   1. Grafikus papildan�ios funkcijos:
#      * funkcija points
#      * funkcija lines
#      * funkcija abline
#
#   2. Kintam�j� i� matricos stulpeli� brai�ymas:
#      * funkcija matplot
#      * funkcija matpoints
#      * funkcija matlines
#


# PASTABOS ------------------------------

#
# Sugalvoti daugiau u�davini�.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# AUK�TO IR �EMO LYGIO GRAFIN�S FUNKCIJOS #
# --------------------------------------- #

# Visas R grafines funkcijas s�lyginai galima padalinti � dvi dideles grupes:
#
#   1) auk�to lygio grafin�s funkcijos,
#   2) �emo lygio grafin�s funkcijos.
#
# Auk�to lygio grafin�s funkcijos yra skirtos baziniam tam tikro tipo grafiko ar
# diagramos brai�ymui. Toks grafikas turi suformuot� koordina�i� sistem�, a�is,
# antra�tes ir visus kitus tokio tipo grafikui reikalingus elementus. �emo lygio
# grafin�s funkcijos yra skirtos jau suformuot� grafik� papildymu tam tikrais jo
# elementais: papildomais ta�kais, linijomis, kitokiomis nei standartin�s a�imis,
# tekstu ir kitais elementais.

# Auk�to lygio grafin�s funkcijos visada suformuoja ir nubrai�o nauj� grafik�, o
# �emo lygio funkcijos ta�kus, linijas arba kitus grafinius elementus u�deda ant 
# jau sudaryto grafiko.

# Didel� dal� da�niausiai naudojam� grafik� galima nubrai�yti naudojant funkcij�
# plot, ta�iau kai kuriuos grafikus ir diagramas patogiau brai�yti naudojant tam
# skirtas specializuotas funkcijas. 


# --------------------------------------- #
# PAPILDOMI TA�KAI                        #
# --------------------------------------- #

# Ta�kai su koordinat�mis (x, y) ant jau nubrai�yto grafiko u�dedami naudojant 
# funkcij� points. Pagrindiniai jos parametrai:
#
#          x -- x reik�mi� vektorius,
#          y -- y reik�mi� vektorius,
#        pch -- ta�ko simbolis,
#        cex -- ta�ko simbolio dydis,
#        col -- ta�ko spalva.
#
# I� dalies galima sakyti, kad f-ja points(x, y) yra f-ja plot(x, y, type = "p"),
# ta�iau ji da�niausiai naudojama tuo atveju, kai ant kitos funkcijos nubrai�yto 
# grafiko tam tikrose vietose dar reikia u�d�ti vien� ar kelis papildomus ta�kus.

# Pavyzd�iui, ant ta�k� su koordinat�mis (x y) sklaidos diagramos u�d�sime vien�
# raudon� ta�k� su koordinat�mis (2, 2).

x <- c(2.0, 1.6, 1.2, 1.0, 1.0, 1.3, 1.6, 2.0, 2.3, 2.8, 2.8, 3.0, 2.8, 2.4, 2.1)
y <- c(0.8, 1.1, 1.3, 1.6, 2.2, 2.5, 2.9, 3.1, 3.0, 2.8, 2.4, 1.8, 1.4, 1.0, 0.9)

plot(x, y, asp = 1)
points(2, 2, pch = 19, col = "red")

# Ant jau nubrai�ytos diagramos u�d�sime vienetinio apskritimo su centru (2, 2)
# ta�kus. J� koordinates (a, b) apskai�iuosime atskirai.

k <- 1:360
a <- cos(k) + 2
b <- sin(k) + 2

points(a, b, pch = ".")


# Vien� ar kelis ta�kus galima u�d�ti ant bet kokios kitos diagramos. Gana da�na
# situacija, kada reikia papildyti kokios nors kitos grafin�s funkcijos sudaryt�
# standartin� diagram�. Pvz., naudojant duomen� lentel� airquality, nubrai�ysime
# atskir� m�nesi� oro temperat�ros boxplot diagramas. Ant j� papildomai u�d�sime
# vidutin� m�nesio temperat�r� �ymin�ius ta�kus.

temp.vid <- with(airquality, tapply(Temp, Month, mean))
temp.vid

# Kadangi lentel�je yra penki� m�nesi� duomenys, nubrai�omos penkios diagramos,
# kurios ant Ox a�ies atidedamos ties ta�kais x = 1, x = 2 ir t.t. 

boxplot(Temp ~ Month, data = airquality)
points(x = 1:5, y = temp.vid, col = "red", pch = 19, cex = 1.2)


# Funkcijai points ta�k� koordinates galima nurodyti ir per j� s�ry�io formul�.
# Pvz., ant pagal m�nesius suskirstytos temperat�ros boxplot diagramos u�d�sime 
# visas atitinkamo m�nesio temperat�r� reik�mes. 

# Pagal nutyl�jim� funkcija boxplot diagramas ant Ox a�ies atideda ties ta�kais 
# x = 1, x = 2 ir t.t., ta�iau kintamojo Month reik�m�s kinta nuo 5 iki 9. Tam,
# kad vieno m�nesio temperat�ros reik�m�s b�t� atidedamos ant atitinkamo m�nesio
# boxplot diagramos, jos taip pat turi b�ti atidedamos ties ta�kais x = 5, x = 6 
# ir t.t. Tok� diagramos post�m� ant a�ies Ox galima atlikti naudojant funkcijos 
# boxplot parametr� at.

boxplot(Temp ~ Month, data = airquality, at = 5:9)
points(Temp ~ Month, data = airquality, pch = 20, col = 3)


# I� pra�jusio pavyzd�io ai�ku, kad, norint teisingai u�d�ti ta�kus ant sudaryto
# grafiko, reikia prisiderinti prie to grafiko koordina�i� sistemos. �ia galima
# pasinaudoti tuo, kad auk�to lygio grafin�s funkcijos ne tik nubrai�o diagram�,
# bet ir leid�ia i�saugoti jai nubrai�yti reikalingas statistikas. 

# Pavyzd�iui, nubrai�ysime temperat�ros histogram� ir u�d�sime stulpeli� vidur� 
# �ymin�ius ta�kus. J� koordinates pasiimsime i� f-jos hist sukurto histogramos 
# objekto.

t <- as.numeric(nhtemp)

histat <- hist(t, xlim = c(46, 56), main = "Temperat�ros pasiskirstymas")
histat

# I� histogramos objekto pasiimame tik interval� centr� vektori�.

x <- histat$mids
y <- rep(0, length(x))

points(x, y, pch = 19, col = "red")


# Kei�iant parametro type reik�m�, galime keisti stili�, kuriuo funkcija points 
# vaizduoja ta�kus. Pavyzd�iui, nubrai�ysime f-jos y = sin(x) grafik� intervale
# [-pi, pi] ir kas pi/8 i�d�stytus ta�kus sujungsime laiptuota linija: viena po
# funkcijos grafiku, kita -- vir� jo.

curve(sin, -pi, pi)

x <- seq(-pi, pi, pi/8)
y <- sin(x)

points(x, y, pch = 19)
points(x, y, type = "s")
points(x, y, type = "S")


# Dar vienas pavyzdys. Nubrai�ysime standartinio normaliojo pasiskirstymo tankio 
# funkcijos grafik�, o plot� po tankio funkcija padalinsime � lygias dalis pagal 
# kvartilius. Kvartilius ir tankio funkcijos reik�mes juose pa�ym�sime ta�kais.
# Pasinaudosime tuo, kad kei�iant parametro type reik�m�, galima nustatyti ta�k�
# atvaizdavimo stili�.

# Pirmiausia sudarome kvartilius atitinkan�i� tikimybi� vektori� p, tada randame
# pa�i� kvantili� reik�mes ir apskai�iuojame tankio funkcijos reik�mes kvartili�
# ta�kuose. Kvantilius q atidedame ant Ox a�ies ir ant tankio funkcijos grafiko.

curve(dnorm, -3, 3, ylab = "p(x)", las = 1, frame = FALSE)

p <- c(0.25, 0.5, 0.75)
q <- qnorm(p)
d <- dnorm(q)

points(q, d, type = "h", col = "red")
points(q, d, pch = 19)
points(q, d-d, pch = 19)


# NAUDINGA ------------------------------

# Jei sud�tingoje diagramoje yra kelios pasikartojan�ios grafin�s konstrukcijos, 
# jas galima u�ra�yti kaip funkcij�. Kei�iant funkcijos parametrus galima keisti
# grafin�s konstrukcijos diagramoje viet�, dyd� ir kitas charakteristikas. 

# Pavyzd�iui, p lygio kvantil� atitinkan�i� atkarp� ant tankio funkcijos grafiko
# u�d�sime naudojant speciali� funkcij� add.line. Jos parametras p yra kvantilio
# lygis, 0 < p < 1. 

curve(dnorm, -3, 3, ylab = "p(x)", las = 1, frame = FALSE)


add.line <- function(p) {

  q <- qnorm(p)
  d <- dnorm(q)

  points(q, d, type = "h", col = "red")
  points(q, d, pch = 19)
  points(q, 0, pch = 19)
}

add.line(0.1)
add.line(0.2)
add.line(0.3)

# Jei toki� kvantilius atitinkan�i� atkarp� ant grafiko reikia u�d�ti ir daugiau, 
# jas brai�an�i� funkcij� galima �d�ti � cikl�.

p <- c(0.4, 0.5, 0.6, 0.7, 0.8, 0.9)

for (i in p) add.line(i)


# U�DUOTIS ------------------------------ 

# 1. Duotas da�ni� vektorius (3, 2, 5, 3, 1). Nubrai�ykite stulpelin� �i� da�ni� 
#    diagram�. Kiekvieno stulpelio centre (pagal plot� ir pagal auk�t�) u�d�kite
#    raudon� ta�k�.
# 2. Naudojant funkcij� plot, grafike atid�kite ta�k� su koordinat�mis (10, 10). 
#    Keisdami tik to paties vieno ta�ko simbolio dyd�, gaukite grafik�, kuriame 
#    yra keletas koncentri�k� apskritim�.


# --------------------------------------- #
# PAPILDOMOS KREIV�S                      #
# --------------------------------------- #

# Tuo atveju, kai papildomai u�d�tus ta�kus reikia sujungti, naudojama funkcija 
# lines. Galima sakyti, kad f-ja lines(x, y) yra f-ja plot(x, y, type = "l"). I� 
# esm�s skiriasi tik tuo, kad funkcija lines naudojama ta�k� ir linij� u�d�jimui 
# ant jau nubrai�yto grafiko. Pagrindiniai �ios funkcijos parametrai:
# 
#          x -- x reik�mi� vektorius,
#          y -- y reik�mi� vektorius,
#        lty -- linijos tipas,
#        lwd -- linijos storis,
#        col -- linijos spalva.

# Pavyzd�iui, ant anks�iau sudarytos temperat�ros histogramos u�d�sime poligon�. 
# Tai tokia kreiv�, kuri sudaryta i� atkarpomis sujungt� ta�k� (x, y). �ia x yra
# histogramos stulpelio vidurio ta�kas, o y -- to paties stulpelio auk�tis. �ias
# koordinates pasiimsime i� to paties anks�iau sudaryto histogramos objekto.

histat

x <- histat$mids
y <- histat$counts

plot(histat, xlim = c(46, 56), main = "Temperat�ros pasiskirstymas")
lines(x, y, type = "b", pch = 19, col = "red")


# Nubrai�ysime � m�nesius suskirstytos temperat�ros sklaidos diagram� ir m�nesi�
# temperat�ros vidurki� ta�kus sujungsime atkarpomis.

plot(Temp ~ Month, data = airquality, pch = 20)

temp.vid <- with(airquality, tapply(Temp, Month, mean))
temp.vid

lines(x = 5:9, y = temp.vid, type = "b", pch = 19, col = "red")


# U�DUOTIS ------------------------------ 

# 1. Duomen� lentel�je cars yra automobilio grei�io ir stabdymo atstumo duomenys.
#    Nubrai�ykite �i� kintam�j� sklaidos diagram�. Kiekvienai skirtingai grei�io
#    reik�mei apskai�iuokite stabdymo atstumo vidurk�. Gautus ta�kus u�d�kite ant
#    grafiko ir sujunkite juos ties�s atkarpomis.


# --------------------------------------- #
# TIES�S BRAI�YMAS                        #
# --------------------------------------- #

# Ties�s atkarp� galima nubrai�yti naudojant bendro pob�d�io funkcijas plot arba
# lines -- u�tenka nurodyti dviej� ta�k� koordinates. D�l tos pa�ios prie�asties
# �is b�das n�ra patogus. 

# Ties�s plok�tumoje lygtis y = a + bx. J� vienareik�mi�kai nusako du parametrai:
# a ir b. Norint nubrai�yti vertikali� ar horizontali� ties�, u�tenka �inoti tik
# ta�k�, kuriame �i ties� kerta Ox arba Oy a��. Toki� tiesi� brai�ymui naudojama
# funkcija abline. Pagrindiniai jos parametrai:
#
#          a -- ties�s y = a + bx parametras a,
#          b -- ties�s y = a + bx parametras b,
#          h -- ta�kas, kuriame a�� Oy kerta horizontali ties�,
#          v -- ta�kas, kuriame a�� Ox kerta vertikali ties�,
#        col -- ties�s spalvos pavadinimas arba numeris,
#       type -- ties�s tipas, 1 i�tisin�, 2 punktyrin� ir t.t.


# Pavyzd�iui, nubrai�ysime temperat�ros kitimo laike grafik� ir u�d�sime ant jo
# horizontali� linij� ties 80 laipsni� riba.

plot(Temp ~ 1, data = airquality, pch = 20)
abline(h = 80)

# Ties� galima u�d�ti ant bet kokio grafiko. Pavyzd�iui, nubrai�ysime stulpelin�
# diagram�, kurioje pavaizduotas Titaniko keleivi� skai�ius atskirose klas�se ir
# ant jos u�d�sime vidutin� keleivi� skai�i� �ymin�i� horizontali� linij�.

d <- margin.table(Titanic, 1)
barplot(d)
abline(h = mean(d))


# Norint nubrai�yti pasvir� ties� y = a + bx, funcijai abline nurodome parametr� 
# a ir b reik�mes. Pavyzd�iui, taip u�d�sime funkcijos f(x) = x + 1/x vertikali�
# ir pasvir�j� asimptotes.

fx <- function(x) x + 1/x
curve(fx, -5, 5, col = "red", main = "Funkcijos y = x + 1/x asimptot�s")
abline(a = 0, b = 1, v = 0, lty = 5)


# Parametrams v ir h galima nurodyti i� karto kelias reik�mes. Tokiu b�du galima
# nubrai�yti i� karto daug horizontali� ar vertikali� linij�. 

plot(Temp ~ Month, data = airquality, type = "n")
abline(v = 5:9, h = 60:90, col = "gray")
points(Temp ~ Month, data = airquality, pch = 19)


# NAUDINGA ------------------------------

# Vienas i� tipini� duomen� analiz�s u�davini� -- nustatyti kintam�j� tarpusavio
# ry��. Paprastai prie� sudarant statistin� modeli brai�omos kintam�j� diagramos.

x <- c(9.5, 4.0, 4.9, 8.1, 9.9, 2.6, 8.7, 4.4, 4.3, 3.2, 2.2, 9.2, 5.0, 3.2, 7.4)
y <- c(8.7, 6.1, 6.0, 7.7, 9.9, 5.1, 9.5, 5.3, 5.6, 5.8, 4.5, 8.8, 6.6, 5.9, 8.2)

plot(x, y, pch = 19)

# I� sklaidos diagramos matome, kad ta�kai i�sibarst� apie ties�. Kad kintamieji
# tiesi�kai susij�, rodo ir artimas vienetui koreliacijos koeficientas.

cor(x, y)

# Paprastai kintam�j� y ir x regresijos ties�s y = a + bx parametrai ne�inomi ir 
# vertinami i� duomen�. Tiesin�s regresijos modelio parametrams a ir b �vertinti 
# naudojama standartin� funkcija lm.

lm(y ~ x)

# Turint parametr� a ir b �ver�ius, juos galima sura�yti � funkcij� abline. Taip
# gauname regresijos ties�s grafik�.

abline(a = 3.3900, b = 0.6103)

# Tam, kad ties�s parametr� nereik�t� kopijuoti ar perra�in�ti, funkcijai abline
# kaip parametr� galima perduoti funkcijos lm gr��inam� rezultat� objekt�.

modelis <- lm(y ~ x)
modelis

abline(modelis)


# Tokiu b�du, apjungiant kai kurias komandas, dviej� kintam�j� sklaidos diagram�
# ir j� regresijos ties�s grafik� galima gauti labai paprastai ir greitai.

plot(x, y)
abline(lm(y ~ x))


# U�DUOTIS ------------------------------ 

# 1. Kintamasis Nile yra vandens lygio Nilo up�je laiko eilut�. Nubrai�ykite jos
#    grafik� ir u�d�kite vidutin� vandens lyg� �ymin�i� raudonos spalvos linij�.
# 2. Nubrai�ykite temperat�ros i� duomen� lentel�s airquality kitimo laike ta�k�
#    sklaidos diagram�. Tada vertikaliomis ties�mis atskirkite kiekvieno m�nesio 
#    stebinius.


# --------------------------------------- #
# MATRICOS STULPELI� BRAI�YMAS            #
# --------------------------------------- #

# Gana da�nai pasitaiko situacija, kada reikia nubrai�yti i� karto daug kreivi�,
# kuri� koordinat�s sura�ytos matricos stulpeliuose. �iuo atveju �prasta naudoti
# specialias funkcijas:
#
#    matplot -- nubrai�o kreives arba ta�k� sklaidos diagram�,
#  matpoints -- u�deda ant grafiko ta�kus,
#   matlines -- u�deda ant grafiko linijas.


# �ios f-jos yra standartini� funkcij� plot, points ir lines matricin�s versijos.
# Pagrindiniai parametrai yra �ie:
#
#          x -- vektorius arba matrica su x koordinat�mis,
#          y -- vektorius arba matrica su y koordinat�mis.

# Matric� x ir y eilu�i� skai�ius turi b�ti vienodas. Tada ta�kus (x, y) gauname
# i� matric� x ir y imdami stulpelius su vienodais numeriais. Stulpeli� skai�ius
# gali b�ti nevienodas. Pavyzd�iui, jei kelios y reik�m�s gautos prie tos pa�ios
# x reik�m�s, tai u�tenka, kad matrica x tur�t� tik vien� stulpel�.

# Pavyzd�iui, nubrai�ysime 1000 atsitiktinio klaid�iojimo su dreifu trajektorij�.
# Vien� trajektorij� sudaro 100 ta�k�, kuri� x koordinat� sutampa, tod�l matrica
# X turi tik vien� stulpel�.

X <- matrix(1:100)
X

Y <- replicate(1000, cumsum(rnorm(100)))
Y

# Jei nenurodyta kitaip, f-ja matplot kiekvienos kreiv�s ta�kus �ymi skirtingais 
# simboliais. Be to, kiekviena kreiv� turi savo spalv�. Tai kontroliuoja �prasti
# grafiniai parametrai: type, lty, lwd, col ir t.t. �ia nustatysime, kad kreiv�s
# b�t� permatomos i�tisin�s linijos.

matplot(X, Y, type = "l", lty = 1, col = rgb(0, 0, 0, 0.1))

# Tokiu atveju, kai x koordinat� nurodo tik ta�ko eil�s numer�, u�tenka nurodyti 
# tik Y koordina�i� matric�.

matplot(Y, type = "l", lty = 1, col = rgb(0, 0, 0, 0.1))


# Naudojant funkcij� matlines, ant jau nubrai�yto grafiko u�d�sime dvi kra�tines
# trajektorijas: �emiausi� ir auk��iausi�. J� koordinates atrinksime i� pradini� 
# duomen� matricos Y ir sudarysime matric� su dviem stulpeliais Z.

Z <- t(apply(Y, 1, range))
Z

matlines(X, Z, lty = 1, col = "red")


# U�DUOTIS ------------------------------ 

# 1. Ant 1000 kreivi� grafiko u�d�kite suvidurkintos trajektorijos ta�kus. Ta�ko
#    simbol� pakeiskite, nustatykite ta�ko spalv� ir dyd�.

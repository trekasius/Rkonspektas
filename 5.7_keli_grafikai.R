
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Keliø grafikø viename grafiniame lange braiþymas.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2015-02-26 | 2016-03-19
#


# TURINYS -------------------------------

#
#   1. Grafinio lango padalinimas á kelias dalis:
#      * funkcija par su parametrais mfcol ir mfrow
#      * funkcija layout
#      * funkcija layout.show
#
#   2. Braiþymo srities apribojimas:
#      * funkcija clip
#      * parametras add
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
# GRAFINIAI PARAMETRAI mfrow IR mfcol     #
# --------------------------------------- #

# Naudojant aukðto lygio grafinæ funkcijà, pavyzdþiui, plot, hist, barplot, arba 
# atidaromas naujas grafinis langas, arba iðvalomas jau atidarytas langas ir tik
# tada braiþomas naujas grafikas. Uþ tai atsakinga pagalbinë funkcija plot.new().
# Naujà grafiná langà galima atidaryti naudojant funkcijà windows(). 

windows()
plot.new()

# Tokiu bûdu galima atidaryti daug grafiniø langø, taèiau vis tiek viename lange 
# galima nubraiþyti tik vienà grafikà. 

# Tuo atveju, kai grafiniame lange reikia braiþyti keletà grafikø, grafiná langà 
# reikia padalinti á keletà daliø. Tam yra keletas bûdø. Vienas ið jø -- naudoti
# grafinius parametrus mfrow arba mfcol. Parametras mfrow parodo, á kiek eiluèiø 
# ir kiek stulpeliø padalintas grafinis langas.

par("mfrow")
par("mfcol")

# Jeigu nenurodyta kitaip, grafiniame lange yra viena eilutë ir vienas stulpelis.
# Parametro reikðmë yra du elementus turintis sveikøjø skaièiø vektorius. Pirmas
# skaièius nurodo eiluèiø, antras - stulpeliø skaièiø. Jeigu grafinis langas yra
# padalinamas á dalis keièiant parametro mfrow reikðmæ, tai tos dalys uþpildomos 
# grafikais pagal eilutes ið kairës á deðinæ. Jeigu keièiama mfcol reikðmë, tada
# grafikai braiþomi stulpeliais ið virðaus á apaèià. 

# Pavyzdþiui, grafiná langà padalinsime vertikaliai á dvi dalis, nubraiþysime du
# skirtingus grafikus.

par(mfrow = c(1, 2))

plot(Temp ~ 1, data = airquality, pch = 20, frame = FALSE)
boxplot(Temp ~ Month, data = airquality, frame = FALSE)


# NAUDINGA ------------------------------

# Daþnai tenka nagrinëti ir tarpusavyje palyginti daug tokio paties tipo grafikø. 
# Tam, kad visi grafikai bûtø matomi vienu metu, juos galima nubraiþyti á keletà
# daliø sudalintame grafiniame lange. Tarkime, kad eksperimentas pakartojamas 25 
# kartus. Reikia nubraiþyti kiekvieno bandymo matavimø histogramas. Èia duomenys 
# duoti matricos pavidalu.

duomenys <- replicate(25, rnorm(200, sample(20, 1)))


# Naujà grafiná langà padaliname á 25 maþesnius langus. Papildomai nurodome visø
# langø paraðèiø ploèius.

windows(10, 8)
par(mfrow = c(5, 5), mar = c(2, 2, 1, 1))

# Apskaièiuojame grafikø aðiø ribas.

xx <- round(range(duomenys) + c(-0.5, 0.5))
yy <- c(0, 60)


# Funkcijà hist ástatome á ciklà. Ant kiekvienos histogramos papildomai uþdedame
# duomenø matricos stulpelio numerá.

for (i in 1:ncol(duomenys)) {

  nr <- sprintf("%02d", i)

  hist(duomenys[, i], breaks = 10, xlim = xx, ylim = yy, ann = FALSE)
  mtext(nr, 3, -2, font = 2, adj = 0.9)
}


# NAUDINGA ------------------------------

# Vokieèiø dailininko Albrechto Diurerio paveikslas Melencolia I garsus tuo, kad
# jame pavaizduotas magiðkas kvadratas. Tai toks kvadratas, kuriame skaièiø suma
# eilutëse, stulpeliuose ir ástriþainëse yra vienoda. Nubraiþysime toká kvadratà.
#
#    +----+----+----+----+
#    | 16 | 3  | 2  | 13 |
#    +----+----+----+----+
#    | 5  | 10 | 11 | 8  |
#    +----+----+----+----+
#    | 9  | 6  | 7  | 12 |
#    +----+----+----+----+
#    | 4  | 15 | 14 | 1  |
#    +----+----+----+----+

kvadratas <- c(16, 5, 9, 4, 3, 10, 6, 15, 2, 11, 7, 14, 13, 8, 12, 1)

# Grafiná langà padaliname á 4 stulpelius ir 4 eilutes. Tokiu bûdu gauname 4 x 4 
# vienodø langeliø, kurie visi yra savarankiðki grafikai. Visi kartu jie sudarys
# magiðkà kvadratà. Kadangi kvadrato skaièiai suraðyti pagal stulpelius, grafiná 
# langà sudalinsime naudojant parametrà mfcol.

par(mfcol = c(4, 4))

# Kiekvieno tokio grafiko centre uþraðysime po vienà skaièiø ið magiðko kvadrato.
# Sudarome funkcijà, kuri skaièiø x uþraðo grafiko centre. Nurodome, kad grafiko
# paraðtës bûtø nulinës, uþdraudþiame braiþyti koordinaèiø aðis ir nurodome, kad
# bûtø rëmelis uþdedamas ant viso grafinio langelio.

centras <- function(x) {

  # Nurodome grafinio lango paraðèiø plotá.
  par(mar = rep(0, 4))

  plot(0, 0, type = "n", axes = FALSE, ann = FALSE, frame = FALSE)
  text(0, 0, label = x, cex = 4)
  box(which = "figure")
}

# Ðià funkcijà ástatome á ciklà ir taip skaièiais uþpildome visas grafinio lango
# dalis.

for (x in kvadratas) centras(x)


# UÞDUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    


# --------------------------------------- #
# FUNKCIJA LAYOUT                         #
# --------------------------------------- #

# Jeigu grafinis langas padalinamas á dalis naudojant grafinius parametrus mfrow
# arba mfcol, tada visos tos dalys yra vienodo dydþio. Be to, negalima nustatyti
# tø daliø uþpildymo tvarkos. Tokie apribojimai kartais gali sukelti nepatogumø.
# Jø galima iðvengti naudojant funkcijà layout. Ði f-ja leidþia sukurti grafinio
# lango padalijimo á dalis plano matricà ir nustatyti stulpeliø ir eiluèiø plotá.
# Pagrindiniai jos parametrai ðie:
#
#        mat -- matrica, kurios elementai nurodo lango daliø uþpildymo tvarkà,
#     widths -- grafinio lango stulpeliø ploèiø vektorius,
#    heights -- grafinio lango eiluèiø aukðèiø vektorius.

# Plano matricos elementø reikðmës gali bûti 0 arba sveikieji teigiami skaièiai. 
# Matricoje gali bûti pasikartojanèiø reikðmiø. Tà paèià reikðmæ turinèios lango
# dalys yra apjungiamos á vienà. Reikðmë 0 nurodo, kad atitinkama grafinio lango
# dalis nenaudojama.

# Pavyzdþiui, tarkime, kad grafiná langà reikia padalinti á dvi eilutes bei tris 
# stulpelius, o jø uþpildymo tvarkà nusako tokia matrica:
#
#    +----+----+----+
#    | 1  | 2  | 5  |
#    +----+----+----+
#    | 3  | 4  | 6  |
#    +----+----+----+

# Uþraðome grafikø braiþymo tvarkos vektoriø.
i <- c(1, 2, 5, 3, 4, 6)

# Sudarome 2 x 3 dydþio grafikø iðdëstymo plano matricà.
m <- matrix(i, nrow = 2, ncol = 3, byrow = TRUE)
m 

layout(m)

# Naudojant funkcijà layout.show, grafiniame lange galima parodyti atskirø langø
# numerius. Ðios funkcijos argumentas yra tokiø langø skaièius. Nurodysime visus
# ðeðis langus.

layout.show(6)

# Nubraiþome keturis statistinius grafikus. Jie grafiniame lange iðdëstomi pagal 
# duodà plano matricà.

plot(Nile)
boxplot(Nile)
hist(Nile)
qqnorm(Nile)


# Sudarysime tokià grafinio lango padalijimo plano matricà, kad tie patys keturi 
# grafikai bûtø iðdëstyti taip:
#
#    +----+----+----+
#    |      1       |
#    +----+----+----+
#    | 2  | 3  | 4  |
#    +----+----+----+

# Nors plano matrica yra tokio paties dydþio 2 x 3, taèiau ðiuo atveju ji apraðo 
# keturias grafinio lango dalis.

i <- c(1, 1, 1, 2, 3, 4)
m <- matrix(i, nrow = 2, ncol = 3, byrow = TRUE)

layout(m)
layout.show(4)

plot(Nile)
boxplot(Nile)
hist(Nile)
qqnorm(Nile)


# Jeigu parametrø widths ir heights reikðmës nenurodomos, tai santykinis eiluèiø 
# ir stulpeliø plotis pagal nutylëjimà yra vienodas ir lygus 1. Keièiant santyká,
# galima reguliuoti eiluèiø ir stulpeliø plotá. Pvz., jei viena eilutë turi bûti 
# du kartus platesnë uþ kità, tada jos ploèio koeficientas taip pat turi bûti du 
# kartus didesnis uþ kitos eilutës ploèio koeficientà. 

# Pavyzdþiui, grafiná langà padalinsime á dvi eilutes ir tris stulpelius, taèiau
# ðá kartà antros eilutës plotá padarysime dvigubai maþesná, o stulpeliø ploèiai 
# tegul lieka vienodi.

layout(m, heights = c(2, 1))
layout.show(4)

plot(Nile)
boxplot(Nile)
hist(Nile)
qqnorm(Nile)


# NAUDINGA ------------------------------

# Grafiná langà suskirstant á keletà ávairaus dydþio daliø, galima sudaryti gana
# sudëtingà diagramà. Pavyzdþiui, nubraiþysime dviejø kintamøjø sklaidos grafikà
# ir ðalia nubraiþysime atskirai vieno ir kito kintamojo staèiakampes diagramas.

# Grafiná langà suskirstysime á 4 dalis: pagrindinëje dalyje braiþomas kintamøjø 
# x ir y sklaidos grafikas, antroje ir treèioje staèiakampës diagramos, ketvirta
# dalis nenaudojama. Kadangi staèiakampës diagramos siauros, tai antra eilutë ir
# antras stulpelis bus 4 kartus siauresni nei pirma eilutë ir pirmas stulpelis.

layout(matrix(c(1, 2, 3, 0), 2, 2), widths = c(4, 1), heights = c(4, 1))
layout.show(3)

x <- airquality$Temp
y <- airquality$Ozone

# Pirmiausia nubraiþome pagrindinæ sklaidos diagramà. Nustatome paraðèiø ploèius.

par(mar = c(2, 3, 1, 1))
plot(x, y, pch = 19, frame = FALSE, las = 1)

# PASTABA. Atskiros grafinio lango dalys yra nesusijusios. Kad ið keleto grafikø 
# sudaryta diagrama bûtø teisinga, turi sutapti atskirø grafikø koordinaèiø aðys.
# Pvz., apaèioje braiþomos diagramos Ox aðis turi sutapti su pagrindinio grafiko
# Ox aðimi. Ðiuo atveju uþtenka nustatyti vienodas paraðtes ið kairës ir deðinës.
# Kadangi aðys sutapatintos, nurodome, kad naujame grafike aðys nebûtø braiþomos.

par(mar = c(0, 3, 0, 1))
boxplot(x, frame = FALSE, axes = FALSE, horizontal = TRUE)

# Kad sutaptø pagrindinio ir ðoninio grafiko Oy aðys, nustatome vienodà paraðèiø
# plotá ið apaèios ir virðaus. Kaip ir ankstesniu atveju, aðiø nebraiþome.

par(mar = c(2, 0, 1, 0))
boxplot(y, frame = FALSE, axes = FALSE)


# UÞDUOTIS ------------------------------ 

# 1. Naudojant funkcijà layout, nubraiþykite 8 x 8 dydþio ðachmatiðkai iðdëstytø 
#    juodø ir baltø kvadratø diagramà.
# 2. 
#    


# --------------------------------------- #
# BRAIÞYMO SRITIES APRIBOJIMAS            #
# --------------------------------------- #

# Kaip þinoma, visos aukðto lygio grafinës funkcijos atidaro naujà grafiná langà
# arba prieð braiþant grafikà iðvalo jau atidarytà langà. Papildomus taðkus arba
# linijas ant grafiko galima nubraiþyti naudojant þemo lygio grafines funkcijas. 
# Kai kurios aukðto lygio grafinës funkcijos turi parametrà add. Jeigu priskirta
# reikðmë TRUE, tai naujas grafikas uþdedamas ant jau nubraiþyto grafiko virðaus.

# Pavyzdþiui, nubraiþysime vandens lygio reikðmiø histogramà ir ant jos uþdësime
# normaliojo atsitiktinio dydþio teorinës tankio funkcijos grafikà. Toká grafikà
# grafikà nubraiþysime naudojant funkcijà curve su parametru add.

hist(Nile, freq = FALSE)

vid <- mean(Nile)
std <- sd(Nile)

curve(dnorm(x, vid, std), add = TRUE)


# Ðiuo atveju funkcijos grafikas uþdedamas ant visos histogramos. Taèiau grafiko
# sritá, kurioje bus matomas ant virðaus uþdedamas kitas grafikas, galima keisti.
# Tam naudojama funkcija clip, kuri sukuria savotiðkà staèiakampá trafaretà. Jos
# parametrai nurodo to staèiakampio ribas:
#
#         x1 -- kairysis kraðtas,
#         x2 -- deðinysis kraðtas,
#         y1 -- apatinis kraðtas,
#         y2 -- virðutinis kraðtas.

# Tarkim, kad reikia nubraiþyti funkcijos y = sin(x) grafikà intervale [-pi, pi], 
# taèiau intervale [-2, 1] grafiko linija turi bûti raudonos spalvos. Ið pradþiø
# nubraiþysime paprastà grafikà intervale [-pi, pi], o tada ant virðaus uþdësime 
# antrà kreivæ -- trafaretu apribotà raudonos spalvos sinusoidæ.

curve(sin, -pi, pi, xlab = "x", ylab = "y", las = 1, frame = FALSE)

# Trafareto ribos ið kairës ir deðinës þinomos, o apatinë ir virðutinë riba gali 
# sutapti su pradinio grafiko apatine ir virðutine riba. Bet kokio grafiko ribas 
# nurodo grafinis parametras usr. Pirmosios dvi reikðmës nurodo grafiko ribas ið 
# kairës ir deðinës, o kitos kitos dvi -- ribas ið apaèios ir virðaus. 

usr <- par("usr")
usr

# Nurodome trafareto ribas. Apatinæ ir virðutinæ ribas paimame ið parametro usr.

clip(-2, 1, usr[3], usr[4])

# Ant virðaus raudona linija braiþome antrà sinusoidæ. Funkcija curve yra aukðto 
# lygio grafinë funkcija, todël tam, kad antra kreivë bûtø braiþoma ant virðaus, 
# parametrui add priskiriame reikðmæ TRUE. Atkreipkite dëmesá á tai, kad grafiko
# ribos nurodytos [-pi, pi], bet raudona linija bus matoma tik intervale [-2, 1].

curve(sin, -pi, pi, add = TRUE, col = "red", lwd = 2)

# Kartà nustatytos trafareto ribos tokios ir iðlieka. Pvz., ant grafiko uþdësime 
# tinklelá, taèiau jis vis tiek bus matomas tik intervale [-2, 1].

grid()

# Norint sugràþinti pradinæ braiþymo sritá, trafareto ribas reikëtø iðplësti iki
# pradinio grafiko ribø. Tam galima panaudoti prieð tai iðsaugotas parametro usr
# reikðmes ir perduoti jas funkcijai clip per tokià konstrukcijà:

do.call(clip, as.list(usr))


# UÞDUOTIS ------------------------------ 

# 1. Nubraiþykite kintamojo Nile reikðmiø histogramà, kurioje stulpeliai á kairæ 
#    nuo pirmojo ir á deðinæ nuo treèiojo kvartilio bûtø nuspalvinti raudonai.
# 2. 
#    
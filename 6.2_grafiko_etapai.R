
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Pagrindiniai grafiko braiþymo etapai.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2015-03-05 | 2015-03-06
#


# TURINYS -------------------------------

#
#   1. Pagrindiniai sklaidos diagramos braiþymo etapai:
#      * plot.new,
#      * plot.window
#      * xy.coords
#      * plot.xy
#      * plot.default
#


# PASTABOS ------------------------------

#
# Sugalvoti uþdaviniø.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# PAGRINDINIAI GRAFIKO BRAIÞYMO ETAPAI    #
# --------------------------------------- #

# Bet kokio sudëtingumo grafiko braiþymas susideda ið keletos pagrindiniø etapø: 
# grafinio árenginio atidarymo, koordinaèiø sistemos sudarymo, taðkø arba linijø 
# koordinaèiø skaièiavimo ir jø atidëjimo grafiniame lange. Visus ðiuos veiksmus 
# atlieka tokios funkcijos:
#
#     plot.new -- sustabdo grafiko braiþymà viename lange ir sukuria naujà,
#  plot.window -- grafiniame lange sukuria koordinaèiø sistemà,
#    xy.coords -- apskaièiuoja taðkø grafiniame lange koordinates,
#      plot.xy -- grafiniame lange atideda taðkus,
# plot.default -- bazinë aukðto lygio grafinë funkcija.


# Pagrindinë aukðto lygio grafinë funkcija -- plot, kuri turi keletà metodø. Jos
# rezultatas priklauso nuo argumento. Jei argumentas yra taðkai su koordinatëmis 
# (x, y), tai grafiko braiþymas perduodamas funkcijai plot.default, kuri taðkams
# grafike atidëti naudoja funkcijà plot.xy. Ðios funkcijos argumentas -- sàraðas
# ið keturiø elementø: taðkø koordinatës x ir y ir koordinaèiø aðiø pavadinimai.
# Tada taðkai atidedami grafiniame lange su nustatyta koordinaèiø sistema. Tokiu 
# bûdu susidaro tam tikra funkcijø seka, kuri atspindi grafiko braiþymo etapus:
#
# plot(x, y)
#         |
#        plot.default(x, y)
#                        |
#                       plot.xy(xy.coords(x, y))
#                                             |
#                                            plot.window()
#                                                       |
#                                                      plot.new()


# Visos aukðto lygio grafinës funkcijos, tokios kaip plot, curve, hist ir kitos,
# grafikà braiþo arba naujame grafiniame lange, arba anksèiau atidarytame lange,
# kuris prieð tai iðvalomas. Ðiuos veiksmus, prieð grafiko braiþymà aukðto lygio
# grafine f-ja, automatiðkai atlieka funkcija plot.new. 

# Pavyzdþiui, jeigu nëra nei vieno grafinio lango, funkcija plot.new já atidaro. 

plot.new()

# Jeigu grafinis langas atidarytas, nepriklausomai nuo to, kas jame pavaizduota,
# funkcija plot.new já iðvalo.

curve(sin, -pi, pi)
plot.new()

# Funkcijos plot.new sukurtame grafiniame lange koordinaèiø aðiø ribos yra nuo 0 
# iki 1. Tuo nesunku ásitikinti naujame grafiniame lange nubraiþius aðis.

plot.new()
axis(1)
axis(2)


# Koordinaèiø sistemos sudarymui naudojama funkcija plot.window. Jos parametrai:
#
#       xlim -- aðies Ox ribos,
#       ylim -- aðies Oy ribos,
#        asp -- koordinaèiø santykis y/x.

# Pavyzdþiui, atidarysime naujà grafiná langà ir jame nustatysime reikiamas aðiø
# ribas: Ox intervalas [10, 20] ir Oy intervalas [0, 5].

plot.new()
plot.window(xlim = c(10, 20), ylim = c(0, 5))
axis(1)
axis(2)

# Taip galima pakeisti ir jau nubraiþyto grafiko koordinaèiø sistemà. Pavyzdþiui,
# nubraiþysime funkcijos y = sin(x) grafikà áprastoje koordinaèiø sistemoje, kur
# aðies Oy intervalas [-1, 1]. Pakeitus koordinaèiø sistemà tos paèios funkcijos 
# grafikas atrodo visiðkai kitaip.

par(mar = c(4, 4, 4, 4), las = 1)
plot.new()

plot.window(xlim = c(-pi, pi), ylim = c(-1, 1))
axis(1)
axis(2)
curve(sin, add = TRUE)

plot.window(xlim = c(-2*pi, 2*pi), ylim = c(-3, 3))
axis(3)
axis(4)
curve(sin, add = TRUE)


# Funkcija xy.coords sudaro sàraðà su taðkø koordinatëmis (x, y) bei koordinaèiø
# aðiø pavadinimais: x, y, xlab ir ylab. Ðis sàraðas naudojamas taðkø atidëjimui
# grafike, kurá atlieka bazinë taðkø ir linijø braiþymo funkcija plot.xy, taèiau
# prieð tai aptarsime f-jos xy.coords parametrus:
#
#          x -- taðkø x koordinaèiø vektorius,
#          y -- taðkø y koordinaèiø vektorius,
#       xlab -- Ox aðies pavadinimas,
#       ylab -- Oy aðies pavadinimas,
#        log -- nurodo, kuri aðis logaritminëje skalëje,
#    recycle -- nurodo, ar trumpesná koordinaèiø vektoriø cikliðkai pratæsti.

# Pavyzdþiui, turëdami taðkø koordinaèiø vektorius, sukursime tø taðkø braiþymui
# reikalinga sàraðà su taðkø koordinatëmis ir koordinaèiø aðiø pavadinimais.

x <- seq(-pi, pi, length = 100)
y <- sin(x)

xy.coords(x, y, xlab = "x", ylab = "sin(x)")

# Koordinaèiø vektorius galima susieti per formulæ y ~ x.

xy.coords(y ~ x, xlab = "x", ylab = "sin(x)")

# Loginiam parametrui recycle priskiriant reikðmæ TRUE, nustatome, kad trumpesná
# koordinaèiø vektoriø galima cikliðkai pratæsti ir tokiu bûdu juos suvienodinti.

xy.coords(1:10, 1:2, xlab = "x", ylab = "y", recycle = TRUE)


# Naudojant funkcijos xy.coords sudarytà sàraðà, funkcija plot.xy atideda taðkus
# grafiniame lange su nustatyta koordinaèiø sistema. Pagrindiniai jos parametrai:
#
#         xy -- sàraðas su taðkø koordinatëmis ir aðiø pavadinimais,
#       type -- diagramos tipas,
#        pch -- taðko simbolis arba jo numeris,
#        lty -- linijos tipas,
#        lwd -- linijos storis,
#        col -- linijos arba taðko spalva,
#        cex -- taðko mastelio koeficientas.

# Pavyzdþiui, sudarysime taðkø koordinaèiø sàraðà ir, naudojant funkcijà plot.xy 
# nubraiþysime taðkø sklaidos diagramà ið anksto atidarytame grafiniame lange su 
# nustatyta koordinaèiø sistema.

x <- c(2.0, 1.6, 1.2, 0.9, 1.0, 1.3, 1.6, 2.0, 2.3, 2.8, 2.9, 3.0, 2.8, 2.4, 2.1)
y <- c(0.8, 1.1, 1.3, 1.6, 2.2, 2.5, 2.9, 3.1, 3.0, 2.8, 2.4, 1.8, 1.4, 1.0, 0.9)

xy <- xy.coords(x, y, xlab = "x", ylab = "y")
xy

plot.new()
plot.window(xlim = c(0.8, 3.2), ylim = c(0.8, 3.2))
plot.xy(xy, type = "p")

# Funkcija plot.xy nëra aukðto lygio grafinë funkcija, todël taðkus ant anksèiau
# nubraiþyto grafiko atideda jo neiðtrynusi. Pvz., tuos paèius taðkus sujungsime
# tiesës atkarpomis, tam uþtenka pakeisti parametro type reikðmæ.

plot.xy(xy, type = "b", pch = 20, col = "red")
plot.xy(xy, type = "S")
plot.xy(xy, type = "s")


# Visà tokiam grafikui nubraiþyti reikalingà funkcijø sekà pakeièia viena aukðto
# lygio grafinë funkcija. Ðiuo atveju tai funkcija plot. Ji turi metodà sklaidos 
# diagramoms braiþyti ir tam naudoja funkcijà plot.default. Pavyzdþiui, tà paèià
# taðkø (x, y) sklaidos diagramà gausime naudojant tam skirtà f-jà plot.default.

plot.default(x, y, type = "b")

# Þinoma, toks pat rezultatas gaunamas diagramà braiþant su aukðto lygio grafine 
# funkcija plot, kuri taðkø atvaizdavimui ir naudoja f-jà plot.default.

plot(x, y, type = "b")


# UÞDUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    

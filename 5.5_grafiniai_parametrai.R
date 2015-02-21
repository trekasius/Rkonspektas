
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Grafiniai parametrai.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2014-06-24 | 0215-02-14
#


# TURINYS -------------------------------

#
#   1. Grafiniø parametrø reikðmës nustatymas:
#      * funkcija par
#      * parametras no.readonly
#      
#   2. Bendro pobûdþio grafiniai parametrai:
#      * ann
#      * adj
#      * bty
#      * lty
#      * lwd
#      * pch
#
#   3. Grafiko spalvos, mastelis ir antraðèiø ðriftas:
#      * bg
#      * fg
#      * col
#      * cex
#      * font
#      * family
#
#   4. Su aðiø braiþymu susijæ grafiniai parametrai:
#      * xaxt ir yaxt
#      * xaxp ir yaxp
#      * xaxs ir yaxs
#      * mgp
#      * lab
#      * tck ir tcl
#      * las
#
#   5. Parametrai, kuriø reikðmës pakeisti negalima:
#      * csi, cin, cra, cxy
#      * din
#      * page
#


# PASTABOS ------------------------------

#
# Apraðyti parametrus, kuriø reikðmës keièiamos tik per funkcijà par.
# Suraðyti uþduotis.
#


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# GRAFINIØ PARAMETRØ REIKÐMËS NUSTATYMAS  #
# --------------------------------------- #

# Bet kuri diagrama turi daug grafiniø elementø: koordinaèiø aðys, jø padalinimo
# taðkai, paraðtës, grafiko antraðtë ir atskirø aðiø pavadinimai, ðriftø, linijø 
# ir taðkø tipas, dydis, spalva ir visa kita. Priklausomai nuo grafiko kai kurie 
# jo elementai gali bûti ir nebraiþomi. Pavyzdþiui, kartais nubraiþoma tik viena 
# koordinaèiø aðis, nevisada reikalingas grafiko rëmelis, aðies ar viso grafiko 
# antraðtë ir pan.

# Visø grafiniø elementø iðvaizda kontroliuojama vienu ar keliais parametrais. 
# Visø parametrø reikðmes galima paþiûrëti naudojant funkcijà par().

par()

# Nurodþius grafiniø parametrø vardø vektoriø, funkcija par gràþina jø reikðmes.
# Pavyzdþiui, linijos tipà ir storá kontroliuoja parametrai lty ir lwd. Gausime
# jø reikðmes.

par(c("lty", "lwd"))


# Jei nenurodyta kitaip, visos grafinës funkcijos naudoja standartines parametrø
# reikðmes. Jas galima pakeisti naudojant tà paèià funkcijà par(). 

# Pavyzdþiui, loginis parametras ann nustato, ar grafikas bus braiþomas su aðies
# pavadinimu ir antraðte. Priskirdami reikðmæ FALSE, uþdrausime visas antraðtes.

par(ann = FALSE)
curve(sin, -pi, pi, main = "Grafiko antraðtë", xlab = "x", ylab = "sin(x)")

# Atstatome pradinæ parametro reikðmæ TRUE, todël visi grafikai vël bus braiþomi 
# su antraðtëmis ir aðiø pavadinimais.

par(ann = TRUE)
curve(sin, -pi, pi, main = "Grafiko antraðtë", xlab = "x", ylab = "sin(x)")


# Analogiðkai galima nustatyti ið karto keliø grafiniø parametrø reikðmes. Pvz.,
# nustatysime, kad visø grafikø fono spalvà bûtø pilka, o linijø spalva raudona.

par(bg = "gray", fg = "red")
curve(sin, -pi, pi, main = "Grafiko antraðtë", xlab = "x", ylab = "sin(x)")

par(bg = "transparent", fg = "black")
curve(sin, -pi, pi, main = "Grafiko antraðtë", xlab = "x", ylab = "sin(x)")


# Grafinio parametro reikðmës nustatymui naudojant funkcijà par, jo poveikis yra
# globalus - tà paèià parametro reikðmæ naudoja visos grafinës funkcijos. Taèiau
# dalies parametrø reikðmes galima pakeisti per grafines funkcijas. Tokiu atveju
# parametro reikðmës pasikeitimas turi átakos tik vienam grafikui.

# Pavyzdþiui, parametras font reguliuoja koordinaèiø aðiø ir kitø grafiko daliø 
# ðriftà. Pagal nutylëjimà jo reikðmë lygi 1, kurià atitinka plain text ðriftas.

par("font")

# Toká ðriftà naudoja visi grafikai, taèiau konkreèiame grafike naudojamà ðriftà 
# galima pakeisti nurodant jo reikðmæ per kokià nors grafinæ funkcijà. Parametro 
# font reikðmæ pakeisime á 2, kurià atitinka pastorintas ðriftas.

curve(sin, -pi, pi, main = "Grafiko antraðtë", xlab = "x", font = 2)

# Galima pastebëti, kad globali parametro reikðmë iðliko nepakitusi, todël visi
# kiti grafikai bus braiþomi naudojant standartiná ðriftà.

par("font")


# NAUDINGA ------------------------------

# Grafinio parametro reikðmës pakeitimui naudojant funkcijà par, pradinë reikðmë
# prarandama, todël pakeitus keliø parametrø reikðmes, vëliau atstatyti pradines 
# jø reikðmes ir gráþti prie áprasto grafikø vaizdo gali bûti sudëtinga. Kadangi
# visø parametrø reikðmës saugomos viename sàraðe, prieð atliekant pakeitimus já 
# galima iðsaugoti ir vëliau atstatyti.

# Pavyzdþiui, iðsaugosime keletos grafiniø parametrø reikðmes, kurias pakeisime,
# o nubraiþius grafikà, atstatysime atgal.

original.par <- par(c("adj", "bg", "col", "lwd", "bty"))

par(adj = 0.3, bg = "gray", col = "red", lwd = 2, bty = "n")
curve(sin, -pi, pi, main = "Grafiko antraðtë", xlab = "x", ylab = "sin(x)")

par(original.par)

# Atstaèius pradines parametrø reikðmes, braiþomas áprastas grafikas.
curve(sin, -pi, pi, main = "Grafiko antraðtë", xlab = "x", ylab = "sin(x)")


# Galima iðsaugoti ið karto visø grafiniø parametrø reikðmes. Problema tame, kad
# ne visø parametrø reikðmes galima pakeisti, dalis ið jø yra "read only". Todël
# parametrui no.readonly priskirdami reikðmæ TRUE, iðsaugome tik tuos parametrus, 
# kuriems vëliau bus galima gràþinti pradines jø reikðmes.

original.par <- par(no.readonly = TRUE)

par(adj = 0.3, bg = "gray", col = "red", lwd = 2, bty = "n")
curve(sin, -pi, pi, main = "Grafiko antraðtë", xlab = "x", ylab = "sin(x)")

par(original.par)

# Atstaèius pradines parametrø reikðmes, braiþomas áprastas grafikas.
curve(sin, -pi, pi, main = "Grafiko antraðtë", xlab = "x", ylab = "sin(x)")


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite dvi komandas, kurios a) apskaièiuotø grafiniø parametrø skaièiø,
#    b) sudarytø visø grafiniø parametrø pavadinimø vektoriø.
# 2. Uþraðykite komandà, kuri sudarytø vektoriø tø grafiniø parametrø, kurie yra
#    "read only".


# --------------------------------------- #
# BENDRO POBÛDÞIO GRAFINIAI PARAMETRAI    #
# --------------------------------------- #

# Yra keletas grafiniø parametrø, kurie nustato bendro pobûdþio grafikø savybes:
#
#        ann -- loginis, leidþia arba uþdraudþia grafiko ir aðiø antraðtes,
#        adj -- nustato horizontalø antraðtës ir aðiø pavadinimø iðlygiavimà,
#        bty -- nustato grafiko rëmelio tipà,
#        lty -- nustato linijos tipà,
#        lwd -- nustato linijos storá,
#        pch -- nustato taðko simbolá.

# Pavyzdþiui, loginis parametras ann nustato, ar grafike vaizduojama antraðtë ir 
# koordinaèiø aðiø pavadinimai. Pagal nutylëjimà ðio parametro reikðmë lygi TRUE,
# taèiau pakeitus á FALSE, visi grafikai bus braiþomi be antraðèiø ir pavadinimø.

par(ann = FALSE)
curve(sin, -pi, pi, main = "Grafiko antraðtë", xlab = "x", ylab = "sin(x)")
curve(cos, -pi, pi, main = "Grafiko antraðtë", xlab = "x", ylab = "cos(x)")

par(ann = TRUE)
curve(sin, -pi, pi, main = "Grafiko antraðtë", xlab = "x", ylab = "sin(x)")

# Kartais reikia uþdrausti konkretaus grafiko antraðtes. Tokiu atveju paprasèiau
# parametro ann reikðmæ keisti per grafinæ funkcijà. Pvz., funkcija curve uþdeda
# aðiø pavadinimus automatiðkai. Jeigu jie nereikalingi, tai naudojant parametrà 
# ann juos galima uþdrausti.

curve(sin, -pi, pi)
curve(sin, -pi, pi, ann = FALSE)


# Naudojant parametrà adj, nustatomas antraðtës ir aðiø pavadinimø iðlygiavimas.
# Parametro reikðmë 0.5 atitinka centravimà, 0 arba 1 atitinka iðlygiavimà pagal
# kairájá arba deðinájá eilutës kraðtà.

# Pavyzdþiui, nustatysime tokià parametro adj reikðmæ, kad antraðtë bûtø kairëje
# eilutës pusëje, bet ne prie pat kraðto.

par(adj = 0.3)
curve(sin, -pi, pi, main = "Grafiko antraðtë", xlab = "x", ylab = "sin(x)")

# Vieno grafiko antraðtës iðlygiaviams keièiamas per grafinæ funkcijà. Pvz., èia
# nurodysime, kad antraðtë bûtø iðlygiuota pagal deðinájá eilutës kraðtà.

curve(sin, -pi, pi, main = "Grafiko antraðtë", adj = 1)


# Parametras bty kontroliuoja grafiko rëmelio braiþymà. Jei parametrui priskirta
# reikðmë "o", rëmelis braiþomas, jeigu reikðmë "n" -- nebraiþomas.

par(bty = "n")
curve(sin, -pi, pi)

# Kai kurios aukðto lygio grafinës funkcijos rëmelio nebraiþo, net ir tuo atveju,
# jei parametrui bty priskiriama reikðmë "o". Pavyzdþiui, histograma, nubraiþyta
# naudojant funkcijà hist, visada yra be rëmelio.

par(bty = "o")
hist(Nile, main = "Histograma be rëmelio, nors jis turëtø bûti")

# Parametrui bty galima priskirti reikðmes "l", "7", "c", "u", "]". Tokiu atveju
# rëmelis bus braiþomas ne ið visø keturiø pusiø. Pavyzdþiui, reikðmë "l" nurodo,
# kad rëmelis bus braiþomas tik ið kairës ir apaèios.

par(bty = "l")
curve(sin, -pi, pi)

# Jei rëmelio braiþymo taisyklæ reikia pakeisti konkreèiam grafikui, tai reikðmæ 
# parametrui bty galima priskirti per grafinæ funkcijà. Pvz., uþdrausime rëmelio
# braiþymà vienam funkcijos grafikui.

curve(sin, -pi, pi, main = "Grafiko antraðtë", bty = "n")

# Jei grafikas braiþomas su funkcijomis plot, curve ir pan., leisti ar uþdrausti 
# rëmelá galima naudojant loginá parametrà frame.plot.

curve(sin, -pi, pi, main = "Grafiko antraðtë", frame.plot = FALSE)


# Parametras lty nustato linijos tipà. Jam galima priskirti tokias simbolines ar
# jas atitinkanèias skaitines reikðmes:
# 
#          0 -- blank,
#          1 -- solid,
#          2 -- dashed,
#          3 -- dotted,
#          4 -- dotdash,
#          5 -- longdash,
#          6 -- twodash.

# Paprastai diagramos braiþomos iðtisine (solid) linija. Jei viename grafike yra
# linijos, kurios turi iðsiskirti, jø tipà galima pakeisti per grafinæ funkcijà.
# Pavyzdþiui, iðtisine linija nubraiþysime funkcijos y = sin(x) grafikà, o tiesæ
# y = 0 tame paèiame grafike nubraiþysime punktyrine linija.

curve(sin, -pi, pi)
abline(h = 0, lty = 3)


# Parametras lwd nustato linijos storá. Laikoma, kad standartinës linijos storis
# lygus 1. Didesnës parametro reikðmës nurodo grafinëms funkcijoms, jog diagrama 
# turi bûti braiþoma naudojant storesnæ linijà.

par("lwd" = 2)
curve(sin, -pi, pi)
abline(h = 0)

# Galima pastebëti, kad pastorinta linija braiþomas ir grafiko rëmelis. Taip pat
# pastorinta linija braiþoma histograma, staèiakampë diagrama ir kitos diagramos.

hist(Nile)
boxplot(Nile)

graphics.off()


# Parametras pch nustato, kokiu simboliu grafike vaizduojamas taðkas. Jo reikðmë
# gali bûti skaièius nuo 0 iki 25, kuris atitinka specialø simbolá. Standartinis
# taðko simbolis yra nedidelis apskritimas, kurá atitinka parametro reikðmë 1.

# Pavyzdþiui, parametrui priskirsime reikðmæ 20. Tada sklaidos diagramoje taðkas
# bus vaizduojamas pilnu taðku.

par("pch" = 20)
plot(dist ~ speed, data = cars)

# Parametrui galima priskirti ir bet koká tekstiná simbolá ið klaviatûros. Pvz.,
# jei grafike yra labai daug taðkø, jø vaizdavimui galima parinkti áprasto taðko
# ið klaviatûros simbolá. Parametro reikðmæ pakeisime per grafinæ funkcijà.

plot(rnorm(100000), rnorm(100000), pch = ".")


# UÞDUOTIS ------------------------------ 

# 1. Naudojant parametrà lty, nubraiþykite funkcijos y = sin(x) grafikà, kuriame
#    pati sinusoidë bûtø nematoma! Sugalvokite dar kitø bûdø nubraiþyti nematomà
#    kreivæ.
# 2. Viename grafike nubraiþykite funkcijø sin(x) ir cos(x) grafikus. Kurià nors
#    vienà kreivæ pavaizduokite iðtisine, o kità -- punktyrine linija.
# 3. Pakeiskite grafinius parametrus taip, kad visos diagramos bûtø braiþomos be
#    rëmelio, taðko simbolis pakeistas á uþpildytà taðkà, o linijos plonesnës.


# --------------------------------------- #
# GRAFIKO SPALVOS, MASTELIS IR ÐRIFTAS    #
# --------------------------------------- #

# Dalis grafiniø parametrø reguliuoja grafiko fono, taðkø, linijø, aðiø, rëmelio
# spalvas, antraðèiø ðriftà ir simboliø dydá:
# 
#         bg -- grafiko fono spalva,
#         fg -- linijø, taðkø, rëmelio ir koordinaèiø aðiø spalva,
#        col -- linijø, taðkø, rëmelio spalva,
#        cex -- grafiko taðkø ir antraðèiø dydis,
#       font -- ðrifo tipas,
#     family -- ðrifto ðeima.

# Parametras bg nustato grafiko fono spalvà, o parametras fg -- bendrà diagramos
# taðkø ir linijø, koordinaèiø aðiø ir rëmelio spalvà. Fono spalva priklauso nuo
# árenginio tipo, bet paprastai fonas bûna baltas, o kitos linijos juodos.

par(c("bg", "fg"))

# Pavyzdþiui, pakeisime fono spalvà á pilkà, o linijø ir taðkø spalvà á raudonà.

par(bg = "gray", fg = "red")
plot(dist ~ speed, data = cars, pch = 20)


# Parametras col taip pat nustato linijø, taðkø ir rëmelio spalvà, taèiau negali
# pakeisti koordinaèiø aðiø spalvos!

par(col = "red")
plot(dist ~ speed, data = cars, pch = 20, frame = FALSE)


# Diagramos taðko simbolio, antraðèiø teksto, aðies padalø ir jø pavadinimø dydá 
# nustato mastelio parametras cex. Didinant parametro reikðmæ, taðkai ir tekstas 
# didëja, maþinant -- maþëja. Standartinë parametro reikðmë lygi 1.

# Pavyzdþiui, jeigu antraðtës tekstas ir diagramos taðkai turi bûti 20 % didesni, 
# tai parametrui cex priskiriame reikðmæ 1.2.

par(cex = 1.2)
plot(dist ~ speed, data = cars, pch = 20)


# Parametras font nustato, koks ðriftas naudojamas tekstui ant grafiko uþraðyti.
# Galimos reikðmës:
#
#          1 -- plain text,
#          2 -- bold face,
#          3 -- italic,
#          4 -- bold italic.

# Pvz., nustatysime, kad tekstas ant grafiko bûtø raðomas pastorintu ðriftu. Tam
# parametrui font priskiriame reikðmæ 2. Tekstà ant grafiko uþraðome su funkcija
# text.

par(font = 2)
plot(1, 1, type = "n", main = "Grafiko antraðtë")
text(1, 1, "Tekstas pastorintu ðriftu.")


# Ðriftø, kuriuo raðomos grafiko ir aðiø antraðtës bei padalø pavadinimai, ðeimà 
# nusako parametras family. Standartinë parametro reikðmë yra "", kiti variantai 
# tokie:
# 
#      serif -- lotyniðkas ðriftas, pvz., Times,
#       sans -- groteskinis ðriftas, pvz., Aria, Helvetica,
#       mono -- pastovaus ploèio ðriftas, pvz., Courier.

# Pavyzdþiui, pakeisime parametro reikðmæ taip, kad visos grafiko antraðtës bûtø
# raðomos pastovaus ploèio ðriftu.

par(family = "mono")
plot(dist ~ speed, data = cars, main = "Grafiko antraðtë")


# Keièiant parametrø col, cex ir font reikðmes, nustatoma bendra ávairiø grafiko 
# daliø spalva, vienodas mastelis arba tas pats ðrifto tipas. Spalvà, mastelá ir
# ðriftà galima pakeisti atskirai aðims, aðiø antraðtëms, bendrai bei papildomai 
# grafiko antraðtëms. Tam naudojami ðie grafiniai parametrai:
# 
#     col.axis    cex.axis    font.axis
#     col.lab     cex.lab     font.lab
#     col.main    cex.main    font.main
#     col.sub     cex.sub     font.sub

# Pavyzdþiui, nubraiþysime grafikà, kuriame skaièiai ties padalomis 20 % didesni,
# o aðies antraðtës uþraðytos pasvirusiu pastorintu ðriftu.

par(cex.axis = 1.2, font.lab = 4)
plot(dist ~ speed, data = cars, main = "Grafiko antraðtë", frame = F)


# NAUDINGA ------------------------------

# Spalvos, mastelio ir ðrifto parametrams reikðmæ priskiriant per grafines f-jas,
# jø poveikis yra lokalus, t.y. galioja tik vienam konkreèiam grafikui. Svarbiau
# yra tai, kad ðie parametrai skirtingai veikia reikðmæ priskiriant per f-jà par
# ir per grafinæ funkcijà!

# Pavyzdþiui, parametrui bg reikðmæ priskiriant per grafinæ funkcijà, jis keièia
# taðko simbolio fonà, bet ne grafiko fonà. Tai galima pastebëti, jei parametrui
# pch priskiriama reikðmë 21, 22 ir t.t. iki 25.

plot(dist ~ speed, data = cars, bg = "red", pch = 21)

# Pavyzdþiui, parametrui fg reikðmæ priskiriant per grafinæ funkcijà, jis keièia 
# tik aðiø ir rëmelio spalvà, bet nekeièia kitø grafiko linijø ir taðkø spalvos.

plot(dist ~ speed, data = cars, fg = "red")


# Analogiðkai, parametro col reikðmæ priskiriant per grafinæ funkcijà, nustatome
# tik taðko simbolio spalvà.

plot(dist ~ speed, data = cars, pch = 20)
plot(dist ~ speed, data = cars, pch = 20, col = "red")


# Pavyzdþiui, parametro cex reikðmæ priskiriant per grafinæ funkcijà, pakeièiame
# tik taðko simbolio dydá.

plot(dist ~ speed, data = cars)
plot(dist ~ speed, data = cars, cex = 2)


# Parametras font, jeigu jo reikðmë priskiriama per grafinæ funkcijà, keièia tik 
# padalø skaièiø ðriftà.

plot(dist ~ speed, data = cars, pch = 20)
plot(dist ~ speed, data = cars, pch = 20, font = 2)


# UÞDUOTIS ------------------------------ 

# 1. Nubraiþykite sklaidos diagramà plot(dist ~ speed, data = cars). Nustatykite
#    grafinius parametrus taip, kad taðkai bûtø raudoni, o aðys mëlynos spalvos.
#    Sugalvokite kelis skirtingus bûdus.
# 2. Tarkime, kad mastelio parametro cex reikðmë priskiriama taip: par(cex = 2).
#    Sugalvokite bûdà, kaip nubraiþyti diagramà, kad antraðtës joje bûtø áprasto
#    dydþio, lyg parametro cex reikðmë bûtø lygi 1.


# --------------------------------------- #
# KOORDINAÈIØ AÐIØ PARAMETRAI             #
# --------------------------------------- #

# Daug grafiniø parametrø kontroliuoja koordinaèiø aðiø sudarymà bei atskiras jø
# dalis. Tarp jø yra grupë parametrø, kurie nustato atskirø aðiø braiþymà:
#
#       xaxt -- uþdraudþia arba leidþia braiþyti Ox aðá,
#       yaxt
#       xaxp -- nustato Ox aðies ribas ir padalinimø skaièiø,
#       yaxp
#       xaxs -- nustato Ox aðies ilgio apskaièiavimo bûdà.
#       yaxs

# Braiþant grafikà, funkcija plot, hist ar kitos aukðto lygio grafinës funkcijos 
# automatiðkai nubraiþo ir koordinaèiø aðis. Parametrui xaxt arba yaxt nurodþius 
# reikðmæ "n", uþdraudþiama uþdëti atitinkamai Ox arba Oy aðá. Reikðmæ priskirti
# galima naudojant funkcijà par. Pavyzdþiui, nustatysime, kad visi grafikai bûtø
# braiþomi be Ox aðies.

par(xaxt = "n")

curve(sin, -pi, pi, frame = FALSE)
plot(Nile)

# Pagal nutylëjimà ðiø parametrø reikðmës yra "s". Atstatysime pradinæ parametro
# reikðmæ, prieðingu atveju visi kiti grafikai toliau bûtø braiþomi be Ox aðies.

par(xaxt = "s")

curve(sin, -pi, pi, frame = FALSE)
plot(Nile)


# Ðiø grafiniø parametrø reikðmes galima pakeisti naudojant aukðto lygio grafinæ 
# funkcijà. Tokiu atveju kuri nors aðis nebraiþoma tik ðiame konkreèiame grafike.
# Pavyzdþiui, nubraiþysime funkcijos grafikà ir, keisdami ðiø parametrø reikðmes,
# nurodysime, kuriø aðiø nerodyti.

curve(sin, -pi, pi)
curve(sin, -pi, pi, frame = FALSE)
curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
curve(sin, -pi, pi, frame = FALSE, yaxt = "n")
curve(sin, -pi, pi, frame = FALSE, xaxt = "n", yaxt = "n")


# Aðiø Ox ir Oy ribas ir padalijimo intervalø skaièiø kontroliuoja du parametrai 
# xaxp ir yaxp. Tokio parametro reikðmë yra vektorius c(min, max, k), kur min ir 
# max yra maþiausia ir didþiausia aðies ribos, o k yra intervalø, á kuriuos aðis
# padalijama, skaièius. Braiþant grafikà reikðmës ðiems parametrams priskiriamos 
# automatiðkai. Jas galima gauti naudojant funkcijà par.

curve(sin, -pi, pi, frame = FALSE)
par("xaxp")
par("yaxp")


# Galima pastebëti, kad funkcijos grafikas braiþomas intervale [-pi, pi], taèiau
# Ox aðies ribos nesutampa ir yra ðiek tiek siauresnës. Nubraiþius kità grafikà, 
# parametrams priskiriamos já atitinkanèios naujos reikðmës.

curve(sin, -2*pi, pi, frame = FALSE)
par("xaxp")
par("yaxp")

# Parametrui xaxp arba yaxp reikðmæ galima priskirti tiesiogiai per aukðto lygio 
# grafinæ funkcijà. Tokiu bûdu galima kontroliuoti aðies padalinimà á intervalus.
# Pvz., nubraiþysime grafikà, kuriame Ox aðis bus nuo -3 iki 1 ir padalinta á dvi 
# lygias dalis.

curve(sin, -pi, pi, frame = FALSE, xaxp = c(-3, 1, 2))


# Parametrai xaxs ir yaxs nustato taisyklæ, pagal kurià nustatomos aðiø Ox ir Oy
# ribos. Parametrui priskyrus reikðmæ "r", parenkamos tokios aðies ribos, kurios 
# yra 4 % didesnës nei duomenø kitimo intervalas ir pagal tai randami padalijimo 
# taðkai. Jei priskiriama reikðmë "i", tai aðies ribos sutampa su duomenø kitimo 
# riba.

# Pvz., nubraiþysime funkcijos y = sin(x) grafikà intervale [-pi, pi]. Priskyrus
# parametrams reikðmæ "i", funkcijos grafikas lieèia ir aðá Ox, ir aðá Oy. 

par(xaxs = "i", yaxs = "i")
curve(sin, -pi, pi)
abline(v = -pi, col = "red")

# Pagal nutylëjimà abiems parametrams priskiriama reikðmë "r", todël abiejø aðiø 
# ribos yra platesnës.

par(xaxs = "r", yaxs = "r")
curve(sin, -pi, pi)
abline(v = -pi, col = "red")


# Yra dar keletas grafiniø parametrø, kurie kontroliuoja abiejø koordinaèiø aðiø 
# ir atskirø jø daliø braiþymà:
# 
#        lab -- apytikslis aðies padalø skaièius,
#        mgp -- aðies antraðtës, padalø teksto ir aðies linijos pozicija,
#        tck -- padalø ilgis santykiniais vienetais,
#        tcl -- padalø ilgis eilutës aukðèio vienetais,
#        las -- nustatomas aðies padalos teksto pasukimas.

# Parametrui lab priskiriamas vektorius c(x, y, len), kur skaièiai x ir y nurodo
# apytikslá aðies Ox ir Oy padalø skaièiø. Paskutinis elementas nurodo antraðtës
# ilgá, taèiau R jis nenaudojamas. Standartinë parametro lab reikðmë c(5, 5, 7).

# Pvz., naudojant parametrà lab nurodysime, kad Ox aðis turëtø 3 padalas, o aðis 
# Oy -- 10 padalø.

par(lab = c(3, 10, 7))
curve(sin, -pi, pi, frame = FALSE)

# Kadangi parametro lab reikðmë yra tik rekomendacija aðiø sudarymui, konkreèios 
# aðies galø reikðmës ir jos padalø skaièius kiekvienam grafikui apskaièiuojamas 
# vis kitaip. Tai parodo parametrø xaxp ir yaxp reikðmës.

par(c("xaxp", "yaxp"))

# Grafikà su tokiomis pat aðimis galima gauti parametrams xaxp ir yaxp priskyrus
# konkreèias reikðmes per aukðto lygio grafinæ funkcijà.

curve(sin, -pi, pi, frame = FALSE, xaxp = c(-2, 2, 2), yaxp = c(-1, 1, 10))


# Parametras mgp nustato aðies antraðtës, teksto ties padalomis ir aðies linijos
# postûmá (eilutëmis) tikrosios aðies atþvilgiu. 

par("mgp")

# Parametro reikðmë c(3, 1, 0) nurodo, kad aðies antraðtë yra treèioje eilutëje,
# padalø pavadinimai pirmoje, o grafike braiþoma aðies linija sutampa su tikràja 
# aðimi. Þinoma, ðias reikðmes galima pakeisti. Pvz., padalø reikðmes perkelsime
# á kità aðies pusæ, o aðies linijà atitrauksime nuo tikrosios aðies linijos.

par(mgp = c(3, -0.3, 1.8))
curve(sin, -pi, pi, frame = FALSE)


# Brûkðneliø ties aðies sudalinimo taðkais ilgá reguliuoja parametrai tck ir tcl.
# Naudojant tck, brûkðnelio ilgis yra santykinis ir priklauso nuo grafiko ploèio
# arba ilgio. Naudojant tcl, brûkðnelio ilgis iðreiðkiamas per eilutës aukðtá ir 
# pagal nutylëjimà jo reikðmë lygi -0.5. Pakeitus þenklà, brûkðneliai perkeliami
# á kità aðies pusæ.

# Pavyzdþiui, nubraiþysime grafikà, kuriame padalos trumpesnës nei standartinës.
# Vienu atveju padalos bus nukreiptos á grafiko vidø, kitu -- á grafiko iðoræ.

par(tcl = -0.3)
curve(sin, -pi, pi, frame = FALSE)

par(tcl = 0.3)
curve(sin, -pi, pi, frame = FALSE)


# Naudojant parametrà tck, padalos ilgá galima susieti su grafiko dydþiu. Pvz.,
# nustatysime, kad padalos ilgis bûtø 1 % nuo grafiko dydþio.

par(tck = -0.01)
curve(sin, -pi, pi, frame = FALSE)

# Jei padalos ilgis keièiamas tik vienam konkreèiam grafikui, reikðmæ parametrui 
# galima priskirti per aukðto lygio grafinæ funkcijà. 

curve(sin, -pi, pi, frame = FALSE, tcl = -0.3)
curve(sin, -pi, pi, frame = FALSE, tck = 0.01)


# Parametras las nustato skaièiø ties padalomis orientacijà aðies atþvilgiu. Jam 
# galima priskirti tokias reikðmes:
# 
#          0 -- padalø pavadinimai raðomi lygiagreèiai aðiai,
#          1 -- padalø pavadinimai raðomi horizontaliai,
#          2 -- padalø pavadinimai raðomi statmenai aðiai,
#          3 -- padalø pavadinimai raðomi vertikaliai.

# Standartiðkai visuose grafikuose padalø pavadinimai raðomi lygiagreèiai aðiai, 
# todël aðies Oy padalø pavadinimai skaitomi ið apaèios á virðø, o tai nepatogu.
# Ðià taisyklæ galima pakeisti parametrui las priskiriant reikðmæ 1.

par("las" = 1)
curve(sin, -pi, pi)

# Parametro reikðmæ galima pakeisti ir per grafinæ funkcijà. Tai padalø uþraðymo
# taisyklæ pakeièiam tik tam vienam grafikui.

curve(sin, -pi, pi, las = 1)


# UÞDUOTIS ------------------------------ 

# 1. Nubraiþykite sklaidos diagramà plot(dist ~ speed, data = cars). Nustatykite
#    tokias grafiniø parametrø reikðmes, kad Ox aðies ribos bûtø 10 ir 20, o jos
#    padalø skaièius (áskaitant ir galus) lygus 6.
# 2. Naudojant parametrà tck, nubraiþykite bet kokios funkcijos y = f(x) grafikà 
#    su tinkleliu (paprastai tam naudojama funkcija grid).
# 3. Nubraiþykite bet kokios funkcijos y = f(x) grafikà su koordinaèiø aðimis be
#    padalø brûkðneliø, bet su skaièiais ties padalomis.


# --------------------------------------- #
#                                         #
# --------------------------------------- #

#  ask
#  new
#  fig, fin
#  #  mai, mar, mex
#  mfcol, mfrow
#  mfg
#  oma, omd, omi
#  pin, plt, ps, pty
#  xlog, ylog,
#  ylbias
#  lheight
#  crt, srt
#  lend, ljoin, lmitre
#  xpd
#  usr
#  err, mkh, smo


# UÞDUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    
# 3. 
#    


# --------------------------------------- #
# READ ONLY GRAFINIAI PARAMETRAI          #
# --------------------------------------- #

# Kai kuriø grafiniø parametrø reikðmës negali bûti pakeistos, nes priklauso nuo 
# árenginio, kuriame vaizduojamas grafikas. Tai gali bûti monitorius, pdf failas
# ir pan. Tokiø parametrø nëra daug, beveik visi jie nustato simbolio dydá:
# 
#        csi -- simbolio aukðtis coliais,
#        cin -- simbolio plotis ir aukðtis coliais,
#        cra -- simbolio plotis ir aukðtis pikseliais,
#        cxy -- simbolio plotis ir aukðtis standartizuotais vienetais,
#        din -- grafinio lango plotis ir aukðtis coliais,
#       page -- loginis, nurodo ar sekantis grafikas bus sudaromas ið naujo.

# Nors visi ðie parametrai yra "read only" ir jø reikðmës negali bûti pakeistos, 
# jas galima suþinoti ir tam tikrose situacijose panaudoti.

# Parametrai cin, cra ir cxy parodo grafiko simboliø plotá ir aukðtá skirtingais
# matavimo vienetais. Parametras csi parodo tik simbolio aukðtá coliais.

par(c("csi", "cin", "cra", "cxy"))


# Parametras cxy parodo simboliø dydá sàlyginiais vienetais, todël ðio parametro
# reikðmë priklauso nuo grafinio lango dydþio. Kuo didesnis grafinis langas, tuo
# simbolis yra sàlyginai maþesnis, todël ir parametro reikðmës maþesnës. 

windows(width = 7, height = 7)
par("cxy")

windows(width = 8, height = 4)
par("cxy")

graphics.off()


# Parametras din parodo grafinio lango iðmatavimus coliais.

windows(width = 7, height = 7)
par("din")

windows(width = 8, height = 4)
par("din")

graphics.off()


# Parametro page reikðmë TRUE nurodo, kad aukðto lygio grafinë funkcija sudarytø
# naujà grafikà vietoje seno. Tiksliau, tai yra nurodymas, kad funkcija plot.new,
# kuri ávykdoma prieð grafinæ f-jà, nutrauktø braiþymà ant dabartinio grafiko ir
# sukurtø pagrindà naujam grafikui.

par("page")


# UÞDUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    
# 3. 
#    

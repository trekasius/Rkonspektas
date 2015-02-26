
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Grafiniai parametrai.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2014-06-24 | 0215-02-14 | 2015-02-26
#


# TURINYS -------------------------------

#
#   1. Grafiniø parametrø reikðmës nustatymas:
#      * funkcija par
#      * parametras no.readonly
#      
#   2. Bendro pobûdþio grafiniai parametrai:
#      * new
#      * ask
#      * ann
#      * adj
#      * bty
#      * lty
#      * lwd
#      * lend
#      * ljoin
#      * lmitre
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
#      * xlog ir ylog
#      * lab
#      * mgp
#      * tck ir tcl
#      * las
#
#   5. Grafinio lango padalinimas, iðmatavimai ir paraðtës:
#      * mfrow ir mfcol
#      * mfg
#      * mar ir mai
#      * oma ir omi
#      * fin ir pin
#      * omd
#      * fig ir plt
#      * pty
#      * usr
#      * xpd
#
#   6. Teksto grafiniai parametrai:
#      * ylbias
#      * lheight
#      * mex
#      * srt ir crt
#      * ps
#
#   7. Parametrai, kuriø reikðmës pakeisti negalima:
#      * csi, cin, cra, cxy
#      * din
#      * page
#      * err
#      * mkh
#      * smo
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

# Grafiko braiþymui naudojant aukðto lygio grafinæ funkcijà, anksèiau atidarytas 
# grafinis langas yra iðvalomas. Tai atlieka funkcija plot.new(), kuri suvykdoma
# automatiðkai dar prieð aukðto lygio grafinæ funkcijà. Taip grafinis langas yra
# paruoðiamas naujo grafiko braiþymui. Taèiau ðià taisyklæ galima anuliuoti. Tam
# naudojami ðie grafiniai parametrai: 
# 
#        new -- loginis, nustato, ar naujas grafikas braiþomas ant senojo,
#        ask -- loginis, nustato, ar prieð braiþant grafikà reikia patvirtinimo.

# Pvz., naudojant funkcijà curve, nubraiþysime funkcijø y = sin(x) ir y = cos(x) 
# grafikus. F-ja curve yra aukðto lygio grafinë funkcija, todël kiekvienà naujà
# grafikà ji braiþo ið naujo.

curve(sin, -pi, pi)
curve(cos, -pi, pi)

# Matome, kad kiekvienas naujas grafikas panaikina prieð tai nubraiþytà grafikà.
# Parametrui new priskiriant reikðmæ TRUE, grafinis langas interpretuojamas kaip
# naujas, todël, prieð suvykdant aukðto lygio grafinæ funkcijà, jis neiðvalomas.
# Tokiu naujas grafikas braiþomas ant senojo virðaus.

curve(sin, -pi, pi)
par(new = TRUE)
curve(cos, -pi, pi, ann = FALSE, axes = FALSE, col = "red")


# Paprastai naujas grafikas nubraiþomas ið karto, kai tik ávykdoma grafinë f-ja.
# Ðià taisyklæ nustato parametras ask, kurio standartinë reikðmë yra FALSE.

par("ask")

# Jeigu parametrui priskiriame reikðmæ TRUE, tai, ávykdþius aukðto lygio grafinæ
# funkcijà, grafikas nubraiþomas ne ið karto, o laukiama patvirtinimo -- klaviðo
# Enter paspaudimo arba pelës klaviðo paspaudimo ant grafiko.

curve(sin, -pi, pi)
par(ask = TRUE)
plot(cars)
hist(Nile)


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


# Yra keli grafiniai parametrai, kurie reguliuoja linijø sujungimà ir galø formà.
# Plonoms linijoms jø poveikis yra praktiðkai nepastebimas, bet storoms - matosi. 
# Parametrai tokie:
#
#       lend -- nustato linijos galø suapvalinimo bûdà,
#      ljoin -- nustato linijø sujungimo bûdà,
#     lmitre -- nustato linijø sujungimo smaigalio nukirtimà.

# Parametrui lend galima priskirti reikðmæ 0 (standartinë), 1 arba 2. Pavyzdþiui,
# nubraiþysime grafikà, kuriame vienas ant kito pavaizduoti 3 tos paèios linijos
# galai. Raudona spalva nubraiþytas standartinis variantas.

y <- c(10, 1, 10)

par(lend = 2)
plot(y, type = "l", lwd = 40, xlim = c(0.5, 3.5), ylim = c(0, 11))

par(lend = 0)
points(y, type = "l", lwd = 40, col = "red")

par(lend = 1)
points(y, type = "l", lwd = 40, col = "blue")

graphics.off()


# Parametras ljoint nustato, kaip linija atvaizduojama lûþio ar sujungimo taðke. 
# Standartinë parametro reikðmë 0, kitos reikðmës - 1 arba 2. Pvz., nubraiþysime
# tris tos paèios lauþtës variantus, ið kuriø matosi, kaip gali bûti sujungiamos
# tiesës: sujungimas gali bûti suapvalintas, smailas arba nukirstas.

y <- c(10, 1, 10)

par(ljoin = 0)
plot(y, lwd = 40, type = "l", ylim = c(0, 18))

par(ljoin = 1)
lines(y + 3, lwd = 40, type = "l")

par(ljoin = 2)
lines(y + 6, lwd = 40, type = "l")

graphics.off()


# Parametras lmitre nustato, kaip atvaizduoti linijø sujungimo taðke susidarantá
# smaigalá -- trumpesná ar ilgesná. Parametrui galima priskirti skaièiø didesná 
# uþ 1, standartinë jo reikðmë lygi 10. Pvz., nubraiþysime du tos paèios lauþtës
# fragmento variantus, ið kur matyti, kad, didinant parametro reikðmæ, smaigalys
# paliekamas ilgesnis.

y <- c(0, 50, 0)
x <- c(-1, 0, 1)

par(ljoin = 1)
plot(x - 4, y, lwd = 10, type = "l", ylim = c(0, 70), xlim = c(-20, 20))

par(ljoin = 1, lmitre = 30)
lines(x + 4, y, lwd = 10, type = "l")

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

# 1. Grafinius parametrus pakeiskite taip, kad grafiko fonas bûtø juodas, taðkai
#    ir linijos -- balti.
# 2. Nubraiþykite sklaidos diagramà plot(dist ~ speed, data = cars). Nustatykite
#    grafinius parametrus taip, kad taðkai bûtø raudoni, o aðys mëlynos spalvos.
#    Sugalvokite kelis skirtingus bûdus.
# 3. Sugalvokite, kaip nubraiþyti apskritimà, jei grafike galima pavaizduoti tik
#    vienà taðkà.
# 4. Tarkime, kad mastelio parametro cex reikðmë priskiriama taip: par(cex = 2).
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
#       xaxs -- nustato Ox aðies ilgio apskaièiavimo bûdà,
#       yaxs
#       xlog -- loginis, nurodo ar Ox aðis bus logaritminëje skalëje.
#       ylog

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


# Parametro xlog reikðmë TRUE nurodo, kad Ox aðis yra logaritminëje skalëje. Kai
# nubraiþomas naujas grafikas, parametrui automatiðkai priskiriama reikðmæ FALSE.
# Ji pasikeièia, kai aukðto lygio grafinë funkcija sudaro grafikà su logaritmine
# aðimi. Lygiai tas pats galioja ir parametrui ylog.

# Pavyzdþiui, nubraiþysime dvi stulpelines diagramas, vienà su áprasta Oy aðimi,
# kità - su logaritmine. Galima pastebëti, kad pirmuoju atveju parametro reikðmë
# yra FALSE, o tuos paèius duomenis atvaizdavus logaritminëje skalëje, parametro 
# reikðmë pasikeièia á TRUE.

barplot(c(1, 10, 100))
par("ylog")

barplot(c(1, 10, 100), log = "y")
par("ylog")


# Yra dar keletas grafiniø parametrø, kurie kontroliuoja abiejø koordinaèiø aðiø 
# ir atskirø jø daliø braiþymà:
# 
#        lab -- apytikslis Ox ir Oy aðiø padalø skaièius,
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
# GRAFIKO DALYS, IÐMATAVIMAI IR PARAÐTËS  #
# --------------------------------------- #

# Grafinio lango suskaidymui á kelias vienodas dalis ir grafikø iðdëstymo tvarkà
# ðiose grafinio lango dalyse nustato ðie grafiniai parametrai:
# 
#      mfcol -- grafiná langà padalina á m x n dalis, uþpildo stulpeliais,
#      mfrow -- grafiná langà padalina á m x n dalis, uþpildo eilutëmis, 
#        mfg -- grafinio lango eilutë ir stulpelis, kuriame braiþomas grafikas.

# Paprastai viename grafiniame lange braiþomas vienas grafikas. Kartais susidaro
# situacija, kai grafiniame lange reikia nubraiþyti ið karto kelis grafikus. Tai
# áprastas dalykas, kai reikia palyginti kelis analogiðkus grafikus. Ðiuo atveju 
# grafinis langas iðskaidomas á kelias dalis. Tam naudojamas parametras mfrow ar
# mfcol. Parametrams priskiriamas du elementus turintis vektorius c(m, n), kur m 
# yra eiluèiø, o n stulpeliø skaièius. Taip sudaroma m x n dydþio matrica, kurià
# uþpildome grafikais. Grafikø iðdëliojimo tvarka priklauso nuo parametro. Jeigu
# naudojamas parametras mfcol, tai grafikai iðdëstomi stulpeliais, jei naudojame
# parametrà mfrow -- tada eilutëmis.

# Pavyzdþiui, naudojant parametrà mfrow, grafiná langà padalinsime á 2 x 2 dalis
# ir nubraiþysime keturis skirtingus grafikus. Grafikai bus iðdëstomi eilutëmis.

par(mfrow = c(2, 2))
curve(sin, -pi, pi)
plot(cars)
hist(Nile)
plot(Nile)


# Naudojant parametrà mfg, galima pakeisti standartinæ grafikø iðdëstymo tvarkà.
# Pvz., 3 x 3 grafiniame lange pirmas grafikas braiþomas pirmos eilutës pirmame
# stulpelyje. Sekanèio grafiko vietà nurodome per parametrà mfg, ðiuo atveju tai
# bus antros eilutës antrame stulpelyje, treèias ið eilës grafikas bus braiþomas 
# treèios eilutës antrame stulpelyje.

par(mfrow = c(2, 2))
curve(sin, -pi, pi)
par(mfg = c(2, 2))
plot(cars)
par(mfg = c(3, 2))
hist(Nile)


# Grafiniame lange yra kelios viena á kità ádëtos grafiko sritys. Pati maþiausia
# sritis (plot) apribota aðimis arba rëmeliu ir joje braiþoma diagrama. Diagrama 
# paprastai turi paraðtes, kuriose yra viso grafiko ir aðiø antraðtës. Kartu su 
# paraðtëmis diagrama sudaro paveikslëlio sritá (figure). Paveikslëlis turi savo
# paraðtes, su kuriomis ir uþima visà grafiná langà (device). Paraðtës priklauso 
# nuo ðiø grafiniø parametrø:
#
#        mar -- diagramos paraðèiø plotis eiluèiø skaièiumi,
#        mai -- diagramos paraðèiø plotis coliais,
#        oma -- viso grafiko paraðèiø plotis eiluèiø skaièiumi,
#        omi -- viso grafiko paraðèiø plotis coliais.
#
# Paraðtës turi savo numerius: 1 -- apaèia, 2 -- kairë, 3 -- virðus, 4 -- deðinë.
# Paraðtës ploèio parametrui priskiriamas vektorius su keturiø paraðèiø dydþiais.

# Kadangi diagramos paraðtëse raðomi koordinaèiø aðiø pavadinimai, padalø vardai
# ir viso grafiko antraðtë, tai kiekvienos pusës paraðtës plotis skiriasi. Pvz.,
# standartinës diagramos paraðtës eilutëmis yra c(5.1, 4.1, 4.1, 2.1).

par("mar")

# Pavyzdþiui, nustatysime, kad paraðtës ið visø pusiø bûtø dviejø eiluèiø ploèio.

par(mar = c(2, 2, 2, 2))
curve(sin, -pi, pi)

graphics.off()

# Galima pastebëti, kad diagramoje nesimato aðiø pavadinimø. Taip atsitiko todël,
# kad koordinaèiø aðiø pavadinimai raðomi ketvirtoje eilutëje, o paraðèiø plotis
# tik dvi eilutës.


# Jei nenurodyta kitaip, paveikslëlio paraðtës lygios nuliui, todël paveikslëlis
# uþima visà grafiná langà. Pavyzdþiui, nustatysime, kad paveikslo paraðtës bûtø
# po dvi eilutes ið visø pusiø. Papildomai nubraiþysime vidiná iðoriniø paraðèiø 
# rëmelá.

par(oma = c(2, 2, 2, 2))
curve(sin, -pi, pi)
box("inner")

graphics.off()


# Paprastai vienas grafikas uþima visà grafiná langà, taèiau ðià taisyklæ galima
# pakeisti. Kokià dalá grafinio lango uþims ávairios grafiko sritys nustato keli
# grafiniai parametrai:
#
#        fin -- nurodo viso grafiko dydá grafiniame lange,
#        pin -- nurodo diagramos srities dydá,
#        omd -- nurodo iðoriniø grafiko paraðèiø koordinates grafiniame lange,
#        fig -- nurodo, kokià dalá grafiko sritis uþims iðoriniø paraðèiø viduje,
#        plt -- nurodo, kokià dalá diagramos sritis uþims grafiko srityje,
#        pty -- nurodo, ar grafikas bus kvadratinis, ar staèiakampis,
#        usr -- koordinaèiø aðiø ribos,
#        xpd -- nurodo kokiose ribose galima braiþyti taðkus ir linijas.


# Standartiðkai grafinis langas yra 7 x 7 coliø dydþio. Tam tikrà ðio lango dalá 
# uþima diagrama, kuri kartu su aðimis, antraðtëmis ir paraðtëmis sudaro grafikà.
# Grafikas taip pat turi (iðorines) paraðtes, su kuriomis uþpildo grafiná langà.
# Grafiko bei diagramos srities iðmatavimai nustatomi per parametrus fin ir pin.

# Pvz., nustatysime, kad grafiko dalis grafiniame lange butø 5 x 5 coliø dydþio,
# o nuo iðoriniø paraðèiø jà atskirsime raudonos spalvos rëmeliu.

par(fin = c(5, 5))
hist(Nile)
box("figure", col = "red")

graphics.off()

# Analogiðkai, naudojant parametrà pin, nustatomi diagramos srities iðmatavimai.
# Pvz., nustatysime 3 x 3 coliø dydþio diagramos sritá, kurià apribosime mëlynos
# spalvos rëmeliu. Raudonas rëmelis, kaip ir anksèiau, þymi grafiko dalies ribas.

par(pin = c(3, 3))
hist(Nile)
box("plot", col = "blue")
box("figure", col = "red")

graphics.off()

# Kaip histograma ádëta á grafikà, o grafikas su iðorinëmis paraðtëmis á grafiná 
# langà, galima pademonstruoti pakeitus ið karto abiejø parametrø reikðmes.

par(fin = c(5, 5), pin = c(3, 3))
hist(Nile)
box("plot", col = "blue")
box("figure", col = "red")

graphics.off()


# Parametras omd nustato, kokiose grafinio lango ribose bus formuojamas grafikas.
# Jam priskiriamas 4 elementus turintis vektorius c(xmin, xmax, ymin, ymax), kur 
# elementø reikðmës yra ið intervalo [0, 1]. Tos reikðmës nurodo grafikui skirto 
# staèiakampio ribas grafiniame lange.

# Jei grafikas neturi iðoriniø paraðèiø, tada jis uþima visà grafiná langà. Tada
# parametras omd = c(0, 1, 0, 1).

par("omd")

# Nustatysime, kad grafikas uþimtø apatinæ grafinio lango pusæ. Kad bûtø matyti,
# kur yra grafiko ribos, nubraiþysime vidiná grafiko rëmelá.

par(omd = c(0, 1, 0, 0.5))
curve(sin, -pi, pi)
box("inner")

graphics.off()


# Nuo grafinio parametro fig priklauso, kokià dalá grafiko sritis (figure) uþims 
# iðorinëmis paraðtëmis apribotame staèiakampyje. Jei iðorinës paraðtës nulinës,
# tada parametras fig nurodo, kokià dalá grafikas uþims visame grafiniame lange.
# Paprastai grafiko sritis uþima visà iðorinëmis paraðtëmis apribotà staèiakampá,
# kuris tiesiog sutampa su grafiniu langu. Tai rodo pradinës parametrø reikðmës:

par(c("omd", "fig"))

# Pvz., nustatysime, kad grafikas uþimtø apatinæ iðorinëmis paraðtëmis apribotos
# srities dalá.

par(fig = c(0, 1, 0, 0.5))
curve(sin, -pi, pi)
box("figure")

graphics.off()

# Vizualiai ðis pavyzdys tarsi niekuo nesiskiria nuo ankstesnio, taèiau atidþiau
# paþvelgus, galima pastebëti, kad tà paèià grafinio lango dalá uþima skirtingos
# grafiko sritys. Pirmuoju atveju tuðèias plotas ið virðaus yra iðorinë paraðtë,
# antruoju atveju iðorinës paraðtës nulinës, o grafikas uþima tik pusæ paveikslo.

# Pvz., parametrø reikðmes nustatysime taip, kad grafikas uþimtø dalá paveikslui 
# skirtos srities, o paveikslas uþimtø tik dalá viso grafinio lango. Taip galima
# pastebëti, kad skirtingos grafiko sritys ádëtos viena á kità.

par(omd = c(0.1, 0.9, 0.1, 0.9), fig = c(0.1, 0.9, 0.1, 0.9))
curve(sin, -pi, pi)
box("figure", col = "red")
box("inner", col = "blue")

graphics.off()


# Parametras plt kontroliuoja, kokià dalá grafike (figure) uþima diagrama (plot).
# Kadangi diagramà riboja aðys, aðiø padalos, skaièiai ties padalomis, antraðtës
# yra uþ diagramos ribø. Dël tos prieþasties diagrama neuþima viso grafiko ploto.

par("plt")

# Pavyzdþiui, parametro plt reikðmæ pakeisime taip, kad grafike bûtø matytis tik 
# aðiø padalos ir jø pavadinimai, bet aðiø antraðtës jau nesimatytø.

par(plt = c(0.06, 0.99, 0.06, 0.99))
curve(sin, -pi, pi, xlab = "Ox aðies antraðtës nesimato")

graphics.off()


# Parametro pty reikðmës "s" arba "m" nustato diagramos srities formà, kuri gali 
# bûti kvadratinë ar staèiakampë. Pirmuoju atveju kvadrato kraðtinë lygi grafiko
# srities kraðtiniø minimumui, todël diagrama neuþpildys visos grafiko srities.
# Pavyzdþiui, nustatysime, kad grafiko sritis uþimtø pusæ grafinio lango ir joje
# nubraiþysime histogramà. Galima pastebëti, kad, priklausomai nuo parametro pty 
# reikðmës, histograma arba yra kvadratinë, arba uþima visà grafiko sritá.

par(pty = "s", fig = c(0, 1, 0, 0.5))
hist(Nile)

par(pty = "m", fig = c(0, 1, 0, 0.5))
hist(Nile)

graphics.off()


# Parametro usr reikðmë -- vektorius su 4 elementais: c(xmin, xmax, ymin, ymax).
# Ðio vektoriaus elementai nurodo diagramos braiþymo ribas, kurios paprastai yra
# ðiek tiek platesnës nei aðiø ribos.

curve(sin, -pi, pi, frame.plot = FALSE)
par("usr")

# Jeigu parametrø xaxs ir yaxs reikðmë "i", tada diagramos ribos sutampa su aðiø
# ribomis.

par(xaxs = "i", yaxs = "i")
curve(sin, -pi, pi, frame.plot = FALSE)
par("usr")


# Loginis parametras xpd nurodo, kurios srities ribose galima nubraiþyti linijas
# ar taðkus. Standartiðkai linijos ir taðkai braiþomi tik diagramos ribose.

par(omd = c(0.1, 0.9, 0.1, 0.9), xpd = FALSE)
curve(sin, -pi, pi, main = "Raudona linija tik diagramos ribose")
abline(v = pi/2, col = "red")
box("figure")

par(omd = c(0.1, 0.9, 0.1, 0.9), xpd = TRUE)
curve(sin, -pi, pi, main = "Raudona linija grafiko ribose")
abline(v = pi/2, col = "red")
box("figure")

par(omd = c(0.1, 0.9, 0.1, 0.9), xpd = NA)
curve(sin, -pi, pi, main = "Raudona linija viso grafinio lango ribose")
abline(v = pi/2, col = "red")
box("figure")

graphics.off()


# NAUDINGA ------------------------------

# Tradicinis bûdas nubraiþyti kelis grafikus viename lange -- naudoti parametrus
# mfrow arba mfcol. Tà patá galima padaryti ir naudojant parametrà fig, nurodant
# kaþkurià grafinio lango dalá ir nubraiþant joje grafikà. Tokiu bûdu grafiniame
# lange galima iðskirti kelias dalis, kuriose braiþomas vis kitas grafikas.

# Reikia þinoti, kad parametrui fig priskiriant naujà reikðmæ, sukuriamas naujas
# grafikas. Norint, kad anksèiau nubraiþytas grafikas iðliktø, reikia nustatyti,
# kad aukðto lygio grafinës funkcijos grafikà braiþytø ant virðaus. Ðiam tikslui
# naudojamas grafinis parametras new.

# Pvz., kairës pusës apatiniame ir deðinës pusës virðutiniame kampe nubraiþysime
# po vienà grafikà.

par(fig = c(0, 0.5, 0, 0.5))
curve(sin, -pi, pi)
box("figure")
par(fig = c(0.5, 1, 0.5, 1), new = TRUE)
hist(Nile)
box("figure")


# Analogiðkai galima iðnaudoti ir parametrà omd. Pavyzdþiui, naudojant parametrà
# omd, ið pradþiø iðskirsime apatinæ grafinio lango dalá, o vëliau ir virðutinæ.
# Abiejose dalyse nubraiþysime po funkcijos grafikà.

par(omd = c(0, 1, 0, 0.5))
curve(sin, -pi, pi)
par(omd = c(0, 1, 0.5, 1), new = TRUE)
curve(cos, -pi, pi)


# UÞDUOTIS ------------------------------ 

# 1. Naudojant parametrà mfcol, grafiniame lange nubraiþykite 3 duomenø rinkinio
#    Nile grafikus: laiko eilutæ, daþniø histogramà ir boxplot diagramà.
# 2. Nubraiþykite funkcijos y = sin(x) grafikà, kur bûtø tik funkcijos kreivë be
#    koordinaèiø aðiø, aðiø padalø ir antraðèiø.
# 3. Kiekvienas grafikas turi paraðtes, todël, viename grafiniame lange braiþant
#    kelis grafikus, tarp jø susidaro pernelyg dideli tarpai. Pirmoje uþduotyje
#    grafikus nubraiþykite taip, kad tarp jø nebûtø nereikalingø paraðèiø.
# 4. Uþraðykite tokià komandà, kuri bet kokio tipo diagramos centre uþdëtø þalià 
#    taðkà.


# --------------------------------------- #
# TEKSTO GRAFINIAI PARAMETRAI             #
# --------------------------------------- #

# Tekstas diagramoje arba jos paraðtëse taip pat yra grafiko dalis. Yra keletas
# grafiniø parametrø, kurie nustato papildomo teksto raðymo taisykles:
#
#     ylbias -- teksto paraðtëse postûmio koeficientas,
#    lheight -- diagramos eilutës aukðèio daugiklis,
#        mex -- paraðtës eilutës aukðtis,
#        srt -- teksto pasukimo kampas,
#        crt -- simbolio pasukimo kampas,
#         ps -- ðrifto dydis taðkais.


# Parametras ylbias nustato teksto eiluèiø paraðtëse pozicijà aðiø atþvilgiu. Jo
# reikðmë priklauso nuo árenginio, taèiau standartinë R reikðmë lygi 0.2. Keisti
# ðio parametro reikðmæ prasmës nëra.


# Parametras lheight yra ant diagramos raðomo teksto eilutës aukðèio daugiklis.
# Pvz., parametrui priskirsime reikðmæ 2, kuri atitinka dvigubà eilutës aukðtá.

par(lheight = 2)
curve(sin, -pi, pi)
text(pi/2, 0, "Èia tarpas tarp\n dviejø eiluèiø dvigubas.")


# Parametras mex nustato eilutës aukðtá diagramos paraðtëse. Standartinë reikðmë
# lygi 1. Skaièiai ties aðies padalomis raðomi pirmoje eilutëje, aðies antraðtës
# raðomos treèioje eilutëje. Pakeitus parametro mex reikðmæ, keièiasi ir eiluèiø
# aukðtis, todël pasikeièia ir paraðèiø plotis, nors eiluèiø skaièius jose lieka
# nepakitæs (jei nesikeièia kitø parametrø reikðmës).

# Pavyzdþiui, nubraiþysime grafikà su dvigubo aukðèio paraðtës eilutëmis. Teksto
# ant diagramos eiluèiø aukðtis lieka nepakitæs.

par(mex = 2)
curve(sin, -pi, pi)
mtext("Nulinë eilutë", side = 1, line = 0, at = 2)
mtext("Pirma eilutë",  side = 1, line = 1, at = 2)
mtext("Antra eilutë",  side = 1, line = 2, at = 2)
mtext("Treèia eilutë", side = 1, line = 3, at = 2)

text(pi/2, 0, "Èia tarpas tarp\n dviejø eiluèiø viengubas.")

graphics.off()


# Parametras srt nustato, kokiu kampu pasukama teksto eilutë. Parametras crt yra
# skirtas tam paèiam tikslui, taèiau jis veikia ne su visais árenginiais.

# Pvz., nubraiþysime funkcijos y = sin(x) grafikà ir ant jo uþdësime 70 laipsniø 
# kampu pasuktà tekstà.

par(srt = 70)
curve(sin, -pi, pi)
text(0, 0.3, "Pasukta eilutë.")


# Parametras ps nustato ðrifto dydá pikseliais. Standartinë jo reikðmë priklauso
# nuo árenginio, taèiau paprastai laikoma, kad pikselis lygus 1/72 colio. 

par("ps")

# Pavyzdþiui, pakeisime parametro reikðmæ ir sumaþinsime ðrifto dydá.

par(ps = 9)
curve(sin, -pi, pi)
text(pi/2, 0, "Tekstas ant grafiko.")


# UÞDUOTIS ------------------------------ 

# 1. Nubraiþykite paprastà stulpelinæ diagramà barplot(1:3). Kiekvieno stulpelio
#    viduje ðalia deðiniojo kraðto vertikaliu tekstu uþraðykite stulpelio numerá.


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


# Yra keli grafiniai parametrai, kuriø reikðmæ galima pakeisti, taèiau jie patys
# nieko nekeièia. Taip yra todël, kad funkcija ar grafiko savybë, kurià jie turi
# reguliuoti, R kalboje nerealizuota. Tai yra:
#
#        err -- nurodo, ar áspëti apie taðkus uþ diagramos ribø ir kitas klaidas,
#        mkh -- nustato specialaus taðko simbolio dydá,
#        smo -- reguliuoja braiþomø kreiviø glodumà.

par(c("err", "mkh", "smo"))

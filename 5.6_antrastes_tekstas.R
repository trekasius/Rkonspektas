
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Grafiko antraðtës ir kitas papildomas tekstas.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2014-06-10 | 2014-06-29
#


# TURINYS -------------------------------

#
#   1. Grafiko antraðtës formavimo funkcijos:
#      * funkcija title
#      * funkcija expression
#      * funkcija substitute
#
#   2. Papildomo teksto ant grafiko uþdëjimas:
#      * funkcija text
#      * funkcija mtext
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
# DIAGRAMOS ANTRAÐÈIØ FORMAVIMAS          #
# --------------------------------------- #

# Funkcija plot ir kitos aukðto lygio grafinës funkcijos turi standartinius aðiø
# ir pagrindinës grafiko antraðtës nustatymo parametrus: xlab, ylab ir main. Bet
# kartais aðiø ir viso grafiko antraðèiø formavimui gali bûti naudojama speciali 
# funkcija title. Pagrindiniai jos parametrai yra tokie:
#
#       main -- pagrindinës antraðtës tekstas,
#        sub -- pagalbinës antraðtës tekstas,
#       xlab -- aðies Ox antraðës pavadinimas,
#       ylab -- aðies Oy antraðës pavadinimas.

# Pavyzdþiui, naudojant funkcijà curve nubraiþysime funkcijos y = sin(x) grafikà. 
# Matome, kad grafike yra abiejø aðiø antraðtës, taèiau nëra pagrindinës grafiko 
# antraðtës. 

curve(sin, -pi, pi)

# Diagramos antraðtæ ant jau sudaryto grafiko uþdedame naudojant funkcijà title.

title(main = "Funkcijos y = sin(x) grafikas")


# Lygiai taip pat ant jau sudaryto grafiko uþdedamos aðiø antraðtës. Pavyzdþiui,
# braiþant funkcijos grafikà, uþdrausime aðies Oy antraðtæ, o vëliau jà uþdësime 
# naudojant funkcijà title ir jos parametrà ylab.

curve(sin, -pi, pi, ylab = "")
title(main = "Funkcijos y = sin(x) grafikas")
title(ylab = "y = sin(x)")


# Jei dël kokiø nors prieþasèiø visas grafiko antraðtes reikia uþdrausti, tokiam
# tikslui naudojamas loginis parametras ann. Ant tokio grafiko antraðtæ uþdedame
# naudojant funkcijà title.

curve(sin, -pi, pi, ann = FALSE)
title(main = "Funkcijos y = sin(x) grafikas", xlab = "x", ylab = "f(x)")


# Funkcija title daþniausiai naudojama tokiais atvejais, kai antraðtës yra labai
# ilgos, turi specialiø matematiniø simboliø ar priklauso nuo kaþkokiø papildomø 
# duomenø. Kartais antraðtæ tenka sudaryti ið keliø atskirø daliø. Iðnagrinësime 
# keletà tipiniø situacijø.


# Antraðtës tekste gali bûti ávairiø matematiniø simboliø. Tai graikiðkos raidës, 
# indeksai, laipsniai, ðaknies, sumos, integralo ir kiti specialûs simboliai. Jø
# uþraðymo sintaksë ðiek tiek primena LaTeX taisykles:
 
?plotmath

# Tokio uþraðymo bûdo galimybiø demonstracija:

demo(plotmath)

# Norint á antraðtës tekstà áraðyti matematinius simbolius, reikia kad funkcijos
# title parametrui bûtø priskirta R iðraiðka. Tam naudojama funkcija expression.
# Pavyzdþiui, nubraiþysime funkcijos y = sin(x) grafikà, bet antraðtëse vietoje 
# argumento x áraðysime alpha.

curve(sin, -pi, pi, xlab = "", ylab = "")
title(xlab = expression(alpha), ylab = expression(sin ~ alpha))

# Ant to paties grafiko uþdësime bendrà antraðtæ. Ðiuo atveju antraðtë susideda 
# ið teksto ir viduryje esanèios formulës. Tokiu bûdu gauname tris dalis: þodis,
# formulë ir vël þodis. Ðias tris dalis á iðraiðkà sujungsime naudojant funkcijà 
# paste. Èia simbolis ~ nurodo tarpà tarp þodþiø, o == reiðkia formulëje esanèià
# lygybæ.

curve(sin, -pi, pi, xlab = expression(alpha), ylab = expression(sin ~ alpha))
title(main = expression(paste("Funkcijos ", y == sin ~ alpha, " grafikas")))

# Nubraiþysime dar vienà grafikà, kurio antraðtëse bus keli specialûs simboliai. 
# Tai bus natûraliøjø skaièiø sumos diagrama. Jos antraðtëse panaudosime apatiná 
# indeksà ir sumos þenklà.

plot(cumsum(1:100), type = "h", ann = F)
title(xlab = "n", ylab = expression(S[n]))
title(main = expression(paste("Sumos ", S[n] == sum(k, k==1, n), " grafikas")))


# Kita daþnai pasitaikanti situacija, kada grafiko antraðtëje reikia áraðyti tam
# tikro kintamojo reikðmæ. Pavyzdþiui, tai gali bûti kreivës parametrø reikðmës,
# grafiko eilës numeris ir pan. Tokiu atveju naudojama funkcija substitute, kuri 
# iðraiðkoje esanèiam kintamajam priskiria tam tikrà reikðmæ. Pagrindiniai f-jos
# parametrai tokie:
#
#       expr -- R iðraiðka,
#        env -- iðraiðkoje esanèiø kintamøjø reikðmiø sàraðas.

# Pavyzdþiui, nubraiþysime funkcijos y = sin(kx) grafikà ir uþdësime antraðtæ su
# konkreèia parametro k reikðme.

k <- 5
curve(sin(k*x), -pi, pi, xlab = "x", ylab = "y")
title(substitute(paste("Funkcijos ", y == sin(m*x), " grafikas"), list(m = k)))

# Naudojant funkcijà substitute, galima perduoti keliø parametrø reikðmes. Pvz.,
# nubraiþysime tiesës y = b_0 + b_1*x grafikà, o tiesës lygtá su tokiø parametrø 
# reikðmëmis uþraðysime antraðtëje. Ðiuo atveju reikës perduoti parametrø b_0 ir 
# b_1 reikðmes.

b.0 <- 5.12
b.1 <- 0.53

curve(b.0 + b.1*x, 0, 10, ann = F, asp = 1)

title(xlab = "x", ylab = expression(y == beta[0] + beta[1]*x))
title(substitute(paste("Tiesë ", y == a + b*x), list(a = b.0, b = b.1)))


# Nubraiþysime chi-kvadrat skirstinio tankio funkcijos grafikà ir uþraðysime jam
# antraðtæ, kurioje áraðomas skirstinio parametro -- laisvës laipsniø skaièius k.

k <- 5
curve(dchisq(x, df = k), 0, 20, xlab = "x", ylab = "p(x)")

# Kadangi antraðtës tekstas gana ilgas, já galima iðskaidyti á atskiras dalis ir,
# naudojant funkcijà paste, á vientisà sakiná sudëti funkcijos substitute viduje. 
# Tokiu atveju teksto dalys taip pat yra kintamieji, todël jiems reikðmes reikia 
# priskirti.

t.1 <- " skirstinio su "
t.2 <- " laisvës l. tankio funkcijos grafikas"
title(main = substitute(paste(chi^2, a, b, c), list(a = t.1, b = k, c = t.2)))


# NAUDINGA ------------------------------

# Grafiko braiþymo funkcijas galima ádëti á ciklà. Jei tokiø funkcijø parametrai
# priklauso nuo ciklo kintamojo, gauname laikei besikeièiantá grafikà, animacijà.
# Tam, kad bûtø galima sekti funkcijø parametrø reikðmes arba tam tikras duomenø 
# statistikas, jas galima nurodyti grafiko antraðtëje.

# Pavyzdþiui, nubraiþysime funkcijos y = sin(x) grafikà, kuriame vienas po kito
# uþdedami sinusoidæ sudarantys taðkai. Antraðtëje nurodysime k-ojo taðko numerá.

n <- 1000
x <- seq(-2*pi, 2*pi, length.out = n)
y <- sin(x)

for (i in 1:n) {
  plot(x, y, type = "p", pch = ".", col = x <= x[i])
  title(main = substitute(k == nr, list(nr = i)))
}


# Èia matome, kad kiekvienos iteracijos metu braiþomas tas pats grafikas, taèiau
# dalis taðkø yra baltos spalvos, ir todël jø nesimato. Taip gaunamas animacijos
# efektas. Nubraiþysime dar vienà animuotà grafikà. Èia pavaizduosime normaliojo 
# dësnio su besikeièianèiu vidurkiu, taèiau pastovia dispersija tankio funkcijos 
# grafikà. Antraðtëje uþraðysime skirstinio parametro, t. y. vidurkio reikðmæ.

m <- seq(20, 80, by = 0.05)

for (i in m) {
  curve(dnorm(x, mean = i, sd = 5), 0, 100, ylim = c(0, 0.1), ylab = "p(x)")
  abline(v = i, col = "red")
  title(main = substitute(paste("Vidurkis ", mu == v), list(v = i)), adj = 0)
}


# UÞDUOTIS ------------------------------ 

# 1. Nubraiþykite f-jos y = x^3 - 10*x^2 - 10*x + 10 grafikà intervale [-10, 20]. 
#    Grafiko antraðtëje uþraðykite matematinæ ðios funkcijos formulæ, o aðies Oy
#    uþraðà pakeiskite á y.
# 2. Nubraiþykite trupmenø 1/2^k sumos, kai k - sveikieji skaièiai nuo 0 iki 10,
#    grafikà. Grafiko antraðtëje uþraðykite sumos matematinæ iðraiðkà.
# 3. Sudarykite programà, kuri pasirinktame taðke (x, y) nubraiþytø R spindulio 
#    apskritimà. Grafiko antraðtëje turi bûti nurodytos centro koordinatës ir R
#    reikðmë.
# 4. Sudarykite programà, kuri nubraiþytø normaliojo pasiskirstymo su pasirinktu
#    vidurkiu ir dispersija tankio funkcijos grafikà. Abiejø parametrø reikðmës 
#    turi bûti automatiðkai uþraðomos grafiko antraðtëje.
# 5. Sudarykite animuotà grafikà, kuriame pavaizduokite, kaip nuosekliai taðkas 
#    po taðko nubraiþomas apskritimas. Grafiko antraðtëje nurodykite taðko eilës
#    numerá. Apskritimà sudaranèiø taðkø skaièiø n galima pasirinkti laisvai.
# 6. Sudarykite animuotà grafikà, kuriame pavaizduota, kaip keièiasi chi-kvadrat
#    skirstinio tankio funkcija, kai laisvës laipsniø skaièius k kinta nuo 1 iki
#    100. Grafiko antraðtëje turi bûti rodoma besikeièianti k reikðmë.


# --------------------------------------- #
# PAPILDOMO TEKSTO ANT GRAFIKO UÞDËJIMAS  #
# --------------------------------------- #

# Teksto ant grafiko uþdëjimui taðkuose (x, y) naudojama cpeciali funkcija text. 
# Pagrindiniai jos parametrai tokie:
#
#          x -- taðko, kuriame uþdedamas tekstas, abscisë,
#          y -- taðko, kuriame uþdedamas tekstas, ordinatë,
#     labels -- taðkuose (x, y) uþdedamas tekstø vektorius,
#        pos -- taðko pusë, kurioje atidedamas tekstas, 1, 2 3 arba 4,
#     offset -- uþdedamo teksto postûmis nuo taðko (x, y),
#        cex -- uþdedamo teksto dydis,
#        col -- uþdedamo teksto spalva,
#       font -- ðrifto tipas,
#        srt -- kampas, kuriuo pasukamas tekstas.

# Ið pradþiø nubraiþysime paprastà keletos taðkø sklaidos diagramà. Kintamasis x 
# yra planetos pusiaujo skersmuo kilometrais, o y --- vidutinis tankis gramais á 
# kubiná centimetrà.

x <- c(5.427, 5.24, 5.5153, 3.934)
y <- c(4879.4, 12103.7, 12756.274, 6804.9)
t <- c("Merkurijus", "Venera", "Þemë", "Marsas")

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), pch = 19, ann = FALSE)

title(xlab = expression(paste("Tankis, ", g/cm^3)))
title(ylab = "Pusiaujo skersmuo, km")


# Tarkime, kad tuos taðkus plokðtumoje reikia tam tikru bûdu identifikuoti. Pats
# paprasèiausias bûdas juos atskirti -- pagal eilës numerá, kurá uþraðysime prie
# kiekvieno taðko. Pasinaudosime funkcija text. Jei funkcijai text nurodome vien
# tik taðkø (x, y) koordinates, pagal nutylëjimà ant taðkø uþraðomas jø numeris.

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), pch = 19, ann = FALSE)
text(x, y)

# Tam, kad tekstas bûtø uþdedamas ðalia taðko (x, y), naudojamas parametras pos. 
# Jei jam priskiriama reikðmë 1, tekstas uþdedamas þemiau taðko, jei 2 - kairëje 
# pusëje ir t.t.

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), pch = 19, ann = FALSE)
text(x, y, pos = 2)

# Daþniausiai taðkø numeriai patys savaime nieko nereiðkia, todël vien tik pagal 
# stebinio numerá negalima pasakyti kuo vienas taðkas skiriasi nuo kito. Tokiais
# atvejais taðkams galima priskirti koká nors kità poþymá. Ðiuo atveju naudosime
# naujà kintamàjá -- planetos pavadinimø vektoriø t.

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), pch = 19, ann = FALSE)
text(x, y, pos = 2, labels = t)

# Toje paèioje pozicijoje galima uþdëti kelis skirtingus tekstus. Tam, kad naujà
# uþdedamà tekstà bûtø galima pastumti á ðonà, naudojamas parametras offset.

text(x, y, pos = 2, offset = -1)

# Þinoma, nebûtina prisiriðti prie duomenø taðkø. Tekstà galima uþdëti ir kitoje
# grafiko vietoje. Pvz., ant sklaidos grafiko taðke (4, 10000) uþraðysime tekstà.

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), pch = 19, ann = FALSE)
text(4, 10000, labels = "Planetø iðsidëstymas pagal skersmená ir tanká")


# Parametrais galima reguliuoti uþdedamo teksto dydá, spalvà, ðrifto tipà ir pan.
# Pvz., taðkø numerius padidinsime, naudosime pastorintà ðriftà ir kiekvienam ið
# jø suteiksime vis kità spalvà.

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), pch = 19, ann = FALSE)
text(x, y, pos = 1, cex = 3, font = 2, col = 1:4)

# Jei tekstà reikia pasukti tam tikru kampu, naudojamas grafinis parametras srt.

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), pch = 19, ann = FALSE)
text(x, y, pos = 1, srt = 45)


# Grafikas paprastai turi pagrindinæ antraðæ ir aðiø antraðtes. Teksto uþraðymui 
# grafiko paraðtëse naudojama funkcija mtext. Jos parametrai:
#
#       text -- tekstas arba iðraiðka,
#       side -- taðko pusë, kurioje atidedamas tekstas, 1, 2 3 arba 4,
#       line -- paraðtës eilutës, kurioje uþraðomas tekstas numeris, 
#         at -- koordinatë, ties kuria paraðtëje atidedamas tekstas,
#        adj -- skaièius ið [0, 1], nurodo, pagal kurià pusæ lygiuoti tekstà,
#        cex -- uþdedamo teksto dydis,
#        col -- uþdedamo teksto spalva,
#       font -- ðrifto tipas.

# Dar kartà nubraiþysim planetø iðsidëstymo grafikà, kuriame taðkas proporcingas
# planetos dydþiui. Suformuosime grafiko aðis bei paraðtëse uþraðysime papildomà
# informacijà.

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), ann = F, fra = F, cex = y/2000)

title(main = "Þemës tipo planetø iðsidëstymas pagal tanká ir diametrà")
title(xlab = expression(paste("Tankis, ", g/cm^3)))
title(ylab = "Pusiaujo skersmuo, km")

text(x, y, labels = t, pos = 2, offset = 2)
text(x, y, labels = x, pos = 1, offset = 1.5, cex = 0.7)

# Grafiko paraðtëse uþraðysime papildomà informacijà: deðinëje nurodytas duomenø
# ðaltinis, apaèioje deðinëje uþraðoma grafiko sudarymo data.

informacija <- "Duomenys apie planetas paimti ið wikipedijos"

mtext(text = informacija, side = 4, at = 4000, adj = 0.0, cex = 0.8, col = 8)
mtext(Sys.Date(), side = 1, line = 3, adj = 1, font = 11, cex = 0.8, col = 8)


# NAUDINGA ------------------------------

# Papildomi uþraðai prie taðkø --- gana savotiðkas bûdas plokðtumoje atvaizduoti 
# daugiamaèius duomenis. Pavyzdþiui, paimsime keturiø ðaliø 2011-2013 m. nedarbo 
# ir infliacijos lygio duomenis. Èia tokie kintamieji: ðalis, metai, nedarbas ir 
# infliacijos lygis.

d <- read.table(header = TRUE, text = "
Ðalis    Metai  N     I
Lietuva  2011   15.3  4.1
Latvija  2011   16.2  4.4
Estija   2011   12.5  5.0
Ðvedija  2011   7.8   3.0
Lietuva  2012   13.2  3.1
Latvija  2012   15.0  2.3
Estija   2012   10.2  3.9
Ðvedija  2012   8.0   0.9
Lietuva  2013   11.5  1.5
Latvija  2013   11.6  0.4
Estija   2013   8.9   3.3
Ðvedija  2013   8.1   0.2")


# Pradþioje nubraiþysime paprastà infliacijos ir nedarbo lygio sklaidos diagramà.

plot(d$N, d$I, xlim = c(6, 17), ylim = c(0, 6), ann = FALSE)
title(xlab = "Nedarbo lygis, %", ylab = "Infliacija, %")

# Kadangi taðkai diagramoje niekaip neatskiriami, be papildomø paaiðkinimø tokia
# diagrama nieko neparodo. Todël prie kiekvieno taðko priraðysime, kuriai ðaliai
# ir kuriems metams jis priklauso.

text(d$N, d$I, labels = d$Ðalis, pos = 3)
text(d$N, d$I, labels = d$Metai, pos = 1, cex = 0.5, col = d$Metai - 2010)

points(d$N, d$I, col = d$Metai - 2010, pch = 19)


# Tà patá grafikà galima perbraiþyti dar kitaip. Sujungsime linijomis tos paèios
# ðalies skirtingø metø taðkus. Taip gausime jø judëjimo laike trajektorijà. Èia
# sklaidos grafikà nubraiþysime naudojant kintamøjø priklausomybës formulæ. Toks
# uþraðymo bûdas yra patogesnis, kai ið duomenø lentelës reikia iðskirti atskirø 
# ðaliø stebinius, tada galima pasinaudoti parametru subset.

plot(I ~ N, data = d, xlim = c(6, 17), ann = FALSE)
title(xlab = "Nedarbo lygis, %", ylab = "Infliacija, %")

text(I ~ N, data = d, labels = d$Metai, pos = 2, cex = .8, col = d$Metai - 2010)
points(I ~ N, data = d, col = d$Metai - 2010, pch = 19)

lines(I ~ N, data = d, subset = Ðalis == "Lietuva", type = "b", lty = 3)
lines(I ~ N, data = d, subset = Ðalis == "Latvija", type = "b", lty = 3)
lines(I ~ N, data = d, subset = Ðalis == "Estija",  type = "b", lty = 3)
lines(I ~ N, data = d, subset = Ðalis == "Ðvedija", type = "b", lty = 3)

text(I ~ N, data = d, subset = Metai == 2012, 
	labels = d$Ðalis, pos = 4, offset = 1, font = 2)


# UÞDUOTIS ------------------------------ 

# 1. Nubraiþykite parabolës x^2 + 2x - 15 grafikà. Grafike ðalia taðkø, kuriuose
#    parabolë kerta Ox aðá, uþdëkite tekstà su ðaknø x_1 ir x_2 reikðmëmis. Èia
#    indeksams 1 ir 2 uþraðyti naudokite expression.
# 2. Nubraiþykite laiko eilutës Nile grafikà. Ties didþiausia ir maþiausia laiko
#    eilutës reikðme uþdëkite tekstus su atitinkamo stebinio numeriu ir eilutës 
#    reikðme.
# 3. Nubraiþykite duomenø lentelës airquality kintamojo Temp reikðmiø histogramà.
#    F-jos hist parametrui labels priskyrus reikðmæ TRUE, daþniø reikðmes galima 
#    uþraðyti ant stulpeliø virðaus. Sugalvokite, kaip, naudojant funkcijà text, 
#    tuos paèius daþnius bûtø galima uþraðyti stulpelio viduryje.
# 4. Naudojant planetø skersmens ir tankio duomenis, sudarykite grafikà, kuriame
#    vietoje planetas atitinkanèiø taðkø bûtø pavaizduotas planetos pavadinimas.
# 5. Naudojant infliacijos ir nedarbo lygio duomenø lentelæ d, nubraiþykite 2013 
#    metø infliacijos ir nedarbo lygio sklaidos diagramà. Greta taðkø uþraðykite
#    ðalies pavadinimà. Apatinëje grafiko paraðtëje uþraðykite infliacijos lygio
#    vidurká, kuris turi bûti apskaièiuojamas automatiðkai.

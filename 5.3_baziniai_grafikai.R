
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Pagrindinës aukðto lygio grafinës funkcijos.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2014-03-29 | 2014-04-24
#


# TURINYS -------------------------------

#
#   1. Aukðto lygio grafinës funkcijos:
#      * funkcija curve
#      * funkcija barplot
#      * funkcija boxplot
#      * funkcija hist
#


# PASTABOS ------------------------------

#
# Sugalvoti uþdaviniø funkcijai boxplot.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# AUKÐTO IR ÞEMO LYGIO GRAFINËS FUNKCIJOS #
# --------------------------------------- #

# Visas R grafines funkcijas sàlyginai galima padalinti á dvi dideles grupes:
#
#   1) aukðto lygio grafinës funkcijos,
#   2) þemo lygio grafinës funkcijos.
#
# Aukðto lygio grafinës funkcijos yra skirtos baziniam tam tikro tipo grafiko ar
# diagramos braiþymui. Toks grafikas turi suformuotà koordinaèiø sistemà, aðis,
# antraðtes ir visus kitus tokio tipo grafikui reikalingus elementus. Þemo lygio
# grafinës funkcijos yra skirtos jau suformuotø grafikø papildymu tam tikrais jo
# elementais: papildomais taðkais, linijomis, kitokiomis nei standartinës aðimis,
# tekstu ir kitais elementais.

# Aukðto lygio grafinës funkcijos visada suformuoja ir nubraiþo naujà grafikà, o
# þemo lygio funkcijos taðkus, linijas arba kitus grafinius elementus uþdeda ant 
# jau sudaryto grafiko.

# Didelæ dalá daþniausiai naudojamø grafikø galima nubraiþyti naudojant funkcijà
# plot, taèiau kai kuriuos grafikus ir diagramas patogiau braiþyti naudojant tam
# skirtas specializuotas funkcijas. 


# --------------------------------------- #
# FUNKCIJA CURVE                          #
# --------------------------------------- #

# Funkcija curve naudojama vieno kintamojo funkcijos y = f(x) grafiko braiþymui. 
# Pagrindiniai jos parametrai:
#
#       expr -- funkcijos f(x) pavadinimas,
#       from -- intervalo [a, b] reikðmë a,
#         to -- intervalo [a, b] reikðmë b,
#          n -- taðkø skaièius intervale [a, b],
#        add -- FALSE, nurodo ar grafikà uþdëti ant jau sudaryto grafiko.

# Sudarant funkcijos f(x) intervale [a, b] grafikà, ðis intervalas padalinamas á 
# 100 lygiø daliø, kurias viena nuo kitos atskiria n = 101 taðkø. Tuose taðkuose
# skaièiuojamos funkcijos y = f(x) reikðmës ir gaunamos taðkø (x, y) koordinatës.

# Paprasèiausiu atveju funkcijai curve galima nurodyti bet kokios standartinës R 
# funkcijos pavadinimà ir intervalo, kuriame nubraiþomas ðios funkcijos grafikas, 
# ribas. Pvz., nubraiþysime funkcijos y = sin(x) grafikà intervale [-pi, pi].

curve(sin, from = -pi, to = pi)

# Kaip visada, jei parametrai uþraðomi nustatyta tvarka, jø pavadinimø galima ir
# neraðyti. Taip gaunama paprastesnës ir lengviau perskaitoma iðraiðka.

curve(sin, -pi, pi)

# Standartines R funkcijas galima panaudoti kitø funkcijø sudarymui. Pavyzdþiui,
# R turi funkcijà y = sin(x), taèiau neturi funkcijos y = sin(2x). Jos iðraiðkà 
# kaip argumentà galima áraðyti tiesiai á funkcijà plot.

curve(sin(2*x), -pi, pi)

# Sudëtingø funkcijø iðraiðkà geriau uþraðyti kaip R funkcija ir duoti jai vardà.
# Pvz., nubraiþysime racionalios trupmenos y = x/(x^2 + x + 1) intervale [-5, 5] 
# grafikà. Pirmiausia jos iðraiðkà uþraðysime kaip R funkcijà.

fun.rt <- function(x) {
  y <- x/(x^2 + x + 1)
  return(y)
}

curve(fun.rt, -5, 5)


# Funkcija curve yra aukðto lygio grafinë funkcija, todël kiekvienà kartà braiþo 
# naujà grafikà, taèiau jos parametrui add priskyrus reikðmæ TRUE, naujà grafikà 
# galima uþdëti ant jau nubraiþyto grafiko virðaus. Pvz., nubraiþysime funkcijos 
# y = sin(kx)/k intervale [-pi, pi] grafikus, kai parametro k reikðmë kinta nuo 
# 1 iki 4. Ið pradþiø uþraðysime tokios funkcijos iðraiðkà.

fun.si <- function(x, k) {
  y <- sin(k*x)/k
  return(y)
}

# Ði funkcija yra dviejø kintamøjø funkcija. Tam, kad funkcija curve jà parodytø
# teisingai, vienà parametrà fiksuosime -- priskirsime jam reikðmæ. Tokiu bûdu
# funkcija tampa vieno kintamojo funkcija, kurios grafikà curve gali nubraiþyti.

curve(fun.si(x, k = 1), -pi, pi)

# Grafikus su kitomis parametro k reikðmëmis uþdësime ant jau nubraiþyto grafiko
# virðaus.

curve(fun.si(x, k = 2), -pi, pi, add = TRUE)
curve(fun.si(x, k = 3), -pi, pi, add = TRUE)
curve(fun.si(x, k = 4), -pi, pi, add = TRUE)


# NAUDINGA ------------------------------

# Pasikartojanèià iðraiðkà galima ádëti á ciklà ir tokiu bûdu keisti parametro k 
# reikðmæ. Funkcinio programavimo apologetai gali naudoti konstrukcijà su sapply 
# ir viskà uþraðyti viena eilute. Pastaba, parametro add reikðmæ nustatome pagal
# loginæ sàlygà -- tikrinama ar parametro k reikðmë didesnë uþ vienetà. Jei taip, 
# tai add ágyja reikðmæ TRUE, prieðingu atveju priskiriama reikðmë FALSE.

sapply(1:16, function(k) curve(fun.si(x, k), -pi, pi, add = k > 1))


# UÞDUOTIS ------------------------------ 

# 1. Naudojant funkcijà curve nubraiþykite funkcijos y = ln(x) grafikà intervale 
#    (0, 1]. Pakeiskite komandà taip, kad grafike aðies Oy ribos bûtø [-5, 5].
# 2. Nubraiþykite standartinio normaliojo skirstinio tankio funkcijos grafikà
#    intervale [-4, 4]. 
# 3. Nubraiþykite atsiktinio dydþio, pasiskirsèiusio tolygiai intervale [2, 5],
#    tankio funkcijos grafikà. Aðies Ox ribos tegul bus [0, 7].
# 4. Ant vieno grafiko nubraiþykite funkcijø y = sin(x) ir y = cos(x) grafikus
#    intervale [-pi, pi]. Tegul vienos funkcijos grafikas bus raudonos spalvos.
# 5. Ant vieno grafiko nubraiþykite tris normaliojo skirstinio tankio funkcijos 
#    variantus: su vidurkiu 0, su vidurkiu 1 ir su vidurkiu 3. Visais atvejais
#    standartinis nuokrypis tegul bûna vienodas ir lygus 1.


# --------------------------------------- #
# FUNKCIJA BARPLOT                        #
# --------------------------------------- #

# Funkcija barplot naudojama stulpeliniø diagramø braiþymui. Paprastai naudojami
# ðie parametrai:
#
#     height -- stulpeliø aukðèiø vektorius arba matrica,
#      width -- stulpeliø ploèiø vektorius,
#      space -- tarpo tarp stulpeliø reikðmë,
#      horiz -- FALSE, nurodo ar stulpeliai bus braiþomi horizontaliai,
#     beside -- FALSE, nurodo ar tos paèios grupës stulpelius braiþyti greta,
#        add -- FALSE, nurodo ar diagramà uþdëti ant jau sudaryto grafiko.

# Paèiu paprasèiausiu atveju funkcijai barplot galima nurodyti sveikøjø skaièiø
# vektoriø. Kiekvienas vektoriaus elementas atitinka vienà diagramos stulpelá, o 
# jo aukðtis lygus atitinkamo vektoriaus elemento reikðmei.

h <- c(3, 2, 5, 3, 1)

barplot(height = h)

# Jei parametrai suraðomi nustatyta tvarka, tai jø pavadinimø galima ir neraðyti. 

barplot(h)

# Paèiu bendriausiu atveju, vektoriaus, pagal kurá braiþoma diagrama, elementai 
# gali bûti bet kokie realûs skaièiai. Neigiamus vektoriaus elementus diagramoje 
# atitinka "neigiamo" aukðèio stulpeliai.

h <- c(-2, 2.5, 5, 3, -0.5)

barplot(h)

# Stulpeliø plotis nustatomas keièiant parametro width reikðmæ. Stulpeliai gali
# bûti ir nevienodo ploèio. Tokiu atveju parametrui width perduodamas stulpeliø 
# ploèiø reikðmiø vektorius.

barplot(h, width = 1:5)

# Stulpeliai vienas nuo kito atskirti tarpu, kurio plotis proporcingas stulpelio
# ploèiui. Pagal nutylëjimà proporcingumo koef. lygus 0.2 ir gali bûti pakeistas 
# nustatant kità parametro space reikðmæ. Jeigu parametras space = 1, tai tarpai 
# tarp stulpeliø bus tokio paties ploèio kaip ir stulpeliai.

barplot(h, space = 0)
barplot(h, space = 1)

# Tam, kad stulpeliai diagramoje bûtø braiþomi horizontaliai, naudojamas loginis 
# parametras horiz. Pagal nutylëjimà jo reikðmë yra FALSE.

barplot(h, horiz = TRUE)

# Suprantama, galima keisti standartinius grafinius parametrus. Pvz., papildomai 
# nustatysime aðies Oy ribas, stulpeliø spalvà ir pagrindinæ diagramos antraðtæ.

barplot(h, ylim = c(-5, 8), col = "red", main = "Stulpelinë diagrama")


# Labai daþnai funkcija barplot naudojama ávairioms daþniø lentelëms atvaizduoti.
# Kaip pavyzdá panaudosime laivo "Titanic" ávairiø kategorijø keleiviø skaièiaus
# duomenø lentelæ Titanic.

Titanic

dimnames(Titanic)

# Titanic yra keturiø kintamøjø kryþminë daþniø lentelë. Sumuodami tokià lentelæ 
# pagal vienà kurá nors kintamàjá, gauname to kintamojo reikðmiø daþniø lentelæ. 
# Pavyzdþiui, sudarysim skirtinga klase keliavusiø keleiviø skaièiaus lentelæ ir
# nubraiþysime jà atitinkanèià stulpelinæ diagramà.

d <- margin.table(Titanic, 1)
d

barplot(d)

# Analogiðkai ið pradinës lentelës galima gauti dviejø kintamøjø kryþminæ daþniø 
# lentelæ. Pavyzdþiui, sudarysime keleivio klasës ir lyties daþniø lentelæ ir jà
# atvaizduosime diagramos pavidalu.

d <- margin.table(Titanic, c(2, 1))
d

barplot(d)

# Matome, kad daþniai atskirai paimtoje kategorijoje vaizduojami vienu stulpeliu.
# Naudojant parametrà beside, juos galima iðskaidyti á atskirus stulpelius.

barplot(d, beside = TRUE)

# Keièiant atstumà tarp stulpeliø, parametrui space reikia perduoti vektoriø su
# dviem reikðmëmis: antroji nurodo tarpà tarp skirtingø grupiø, o pirmoji nurodo
# tarpà tarp stulpeliø grupës viduje.

barplot(d, beside = TRUE, space = c(0.1, 0.8))


# NAUDINGA ------------------------------

# Funkcija barplot turi nemaþai kitø parametrø, kuriais galima keisti diagramos
# iðvaizdà: stulpeliø ir atskirø jø daliø spalvà, leisti arba uþdrausti braiþyti 
# aðis ir raðyti jø pavadinimus. Keletas ið jø:
#
#        col -- stulpeliø spalvø numeriø ar pavadinimø vektorius,
#     border -- stulpeliø rëmelio spalva,
#  names.arg -- stulpeliø pavadinimø vektorius,
#  axisnames -- TRUE, nurodo ar rodyti aðiø pavadinimus,
#       axes -- TRUE, nurodo ar rodyti aðis,
#       plot -- TRUE, nurodo ar braiþyti diagramà.

# Naudojant parametrà col, galima keisti stulpeliø spalvà. Kadangi kiekvienoje
# grupëje yra po du stulpelius, parametrui priskiriame vektoriø su dviem spalvø
# pavadinimais.

barplot(d, beside = TRUE, col = c("lightblue", "cornsilk"))

# Vietoje konkreèiø spalvø galima nurodyti kokià nors spalvø paletæ. Pavyzdþiui,
# parametrui col nurodysime trijø pilkos spalvos atspalviø paletæ.

barplot(d, col = gray.colors(3))

# Naudojant parametrà border, galima pakeisti stulpelio rëmelio spalvà.

barplot(d, border = 3)

# Parametrui border priskyrus reikðmæ NA, rëmelis apie stulpelá nebraiþomas.

barplot(d, border = NA)


# Jei daþniø lentelë turi vardus, funkcija barplot juos naudoja grupëms paþymëti. 
# Naudojant parametrà names.arg ðiuos grupiø uþraðus galima pakeisti. Pavyzdþiui,
# pakeisime daþniø lentelës d keleiviø klasës pavadinimus.

barplot(d, names.arg = c("Pirma", "Antra", "Treèia", "Águla"))

# Uþraðus ant aðiø galima uþdrausti naudojant parametrà axisnames.

barplot(d, axisnames = FALSE)

# Naudojant parametrà axes, galima uþdrausti aðiø rodymà.

barplot(d, axes = FALSE)

# Naudojant parametrà plot, galima uþdrausti braiþyti ir paèià diagramà. Tokiu
# atveju funkcijos rezultatas yra matrica su stulpeliø aukðèiais.

barplot(d, plot = FALSE)


# Funkcija barplot ne tik nubraiþo stulpelinæ diagramà, bet jos rezultatà galima
# priskirti kintamajam. Taip gauname diagramos stulpeliø vidurio taðkø vektoriø. 
# Jei sudaroma grupuota stulpelinë diagrama, tai rezultatas yra gaunama matrica, 
# kurios stulpeliuose yra diagramos vienos grupës stulpeliø vidurio taðkai. 

barstat <- barplot(d)
barstat


# UÞDUOTIS ------------------------------ 

# 1. Sukurkite vektoriø n = (1, 3, 2, 5, 4). Nubraiþykite tokià ðio vektoriaus n 
#    stulpelinæ diagramà, kurioje visø stulpeliø spalva bûtø skirtinga.
# 2. Nubraiþykite vektoriaus n stulpelinæ diagramà ir kiekvienam jos stulpeliui 
#    suteikite vardà.
# 3. Nubraiþykite vektoriaus n stulpelinæ diagramà, kurioje kiekvieno stulpelio 
#    plotas bûtø lygus vienetui.
# 4. Naudodami duomenø lentelæ HairEyeColor, sudarykite kryþminæ akiø ir plaukø 
#    spalvos daþniø lentelæ. Parametrui legend priskirkite reikðmæ TRUE ir taip
#    ant diagramos uþdëkite legendà. Kokia akiø spalva reèiausia tarp blondinø?


# --------------------------------------- #
# FUNKCIJA BOXPLOT                        #
# --------------------------------------- #

# Vieno arba keliø kintamøjø staèiakampei diagramai braiþyti naudojama funkcija 
# boxplot. Pagrindiniai jos parametrai:
#
#          x -- kiekybinio kintamojo reikðmiø vektorius,
#       data -- duomenø lentelës pavadinimas,
#     subset -- loginë sàlyga, kuri iðskiria dalá duomenø lentelës stebiniø,
#         at -- vektorius su reikðmëmis, kuriose atidedama staèiakampë diagrama,
# horizontal -- FALSE, nurodo ar diagrama bus braiþoma horizontaliai,
#        add -- FALSE, nurodo ar diagramà uþdëti ant jau sudaryto grafiko.

# Pavyzdþiui, nubraiþysime kiekybinio kintamojo s staèiakampæ diagramà.

s <- c(0.6, 3.4, 6.1, 0.7, 5.2, 1.4, 2.3, 3.4, 2.5, 9.4, 2.7, 4.1, 2.9, 0.1, 7.5)
k <- c("T", "N", "N", "T", "T", "T", "N", "T", "T", "N", "T", "N", "T", "T", "N")

boxplot(s)

# Diagramoje matome, kokiose ribose kinta kintamojo reikðmës, kam lygi kintamojo
# mediana, atskirai paþymimos labai maþos arba labai didelës kintamojo reikðmës.
# Jei kiekybinio kintamojo s reikðmës yra ið skirtingø grupiø, galima nubraiþyti
# staèiakampes diagramas kiekvienoje grupëje atskirai.

boxplot(s ~ k)

# Jei vienas ar keli staèiakampei diagramai nubraiþyti reikalingi kintamieji yra 
# data.frame tipo duomenø lentelëje, funkcijai boxplot galima nurodyti jos vardà. 
# Pavyzdþiui, nubraiþysime lentelës airquality temperatûros kiekvienam stebëjimø
# mënesiui diagramas.

boxplot(Temp ~ Month, data = airquality)

# Jei diagrama braiþoma ne ið visø duomenø lentelëje esanèiø duomenø, parametrui
# subset galima nurodyti loginæ sàlygà ir taip iðrinkti tik tam tikrus stebinius.
# Pavyzdþiui, naudojant tà paèià duomenø lentelæ, nubraiþysime temperatûros iki
# rugpjûèio mënesio staèiakampes diagramas.

boxplot(Temp ~ Month, data = airquality, subset = Month < 8)


# NAUDINGA ------------------------------

# Yra keletas kitø parametrø, kuriais galima keisti boxplot diagramos iðvaizdà:
# 
#        col -- diagramos dëþutës spalva,
#      names -- kintamojo x grupiø vardø vektorius,
#    outline -- TRUE, nurodo ar diagramoje bus paþymimos iðskirtys,
#   varwidth -- FALSE, nurodo ar stulpelio plotis proporcingas imties tûriui,
#      width -- vektorius su santykiniø diagramos stulpeliø ploèiø reikðmëmis.

# Pavyzdþiui, sudarysime grupuoto kintamojo s diagramà ir ant to paties grafiko
# palyginimui uþdësime bendrà kintamojo s diagramà.

# Ið pradþiø nubraiþysime grupuotà kintamojo s diagramà. Kad vëliau ant jos bûtø
# galima uþdëti bendrà diagramà, iðplësime aðies Ox ribas ir nurodysime, kad tos
# dëþutës bûtø atidedamos ties x = 3 ir x = 4. Tada ant jau sudarytos diagramos 
# uþdësime bendrà kintamojo s staèiakampæ diagramà. 

boxplot(s ~ k, xlim = c(0, 5), at = 3:4, names = c("Taip", "Ne"))
boxplot(s, add = TRUE, width = 1, col = "red")


# Nubraiþysime dar vienà tokià kombinuotà diagramà. Ant kintamøjø Temp ir Month 
# sklaidos diagramos uþdësime grupuotà staèiakampæ diagramà.

plot(Temp ~ Month, data = airquality, pch = 20, xlim = c(4, 10), col = 3)
boxplot(Temp ~ Month, data = airquality, add = TRUE, at = 5:9)


# Tam, kad staèiakampës dëþutës ant diagramos bûtø nubraiþytos tam tikra tvarka,
# reikia, kad tokia paèia tvarka bûtø iðrikiuotos kategorinio kintamojo reikðmës. 
# Tam naudojama funkcija reorder. Pvz., nubraiþysime vidurkio didëjimo tvarka
# iðdëstytas atskirø mënesiø temperatûros staèiakampes diagramas.

M <- with(airquality, reorder(Month, Temp, mean))
boxplot(Temp ~ M, data = airquality)


# Funkcija boxplot ne tik nubraiþo staèiakampæ diagramà, bet ir gali sukurti jai 
# nubraiþyti reikalingà duomenø rinkiná - boxplot objektà. Jame suraðytos grupës,
# ir jø vardai, reikðmiø ir iðsiskirianèiø elementø kiekvienoje grupëje skaièius, 
# dëþutei nubraiþyti reikalingos statistikos: mediana, kvartiliai ir "ûsø" galai.

boxstat <- boxplot(Temp ~ Month, data = airquality)
boxstat

names(boxstat)

boxstat$stats     # visø grupiø dëþuèiø statistikos: galai, kvartiliai, mediana
boxstat$n         # reikðmiø grupëse skaièius
boxstat$conf      # medianos pasikliautinasis intervalas
boxstat$out       # iðsiskirianèiø stebiniø reikðmës
boxstat$group     # iðsiskirianèiø stebiniø grupës numeriai
boxstat$names     # grupiø vardai


# UÞDUOTIS ------------------------------ 

# 1. Nubraiþykite duomenø lentelës iris kintamojo Sepal.Length boxplot diagramà
#    grupëse pagal kintamojo Species reikðmes. Kurioje grupëje mediana didesnë?
# 2. Uþraðykite komandà, kuri, naudojant diagramos objektà boxstat, automatiðkai
#    nustatytø, kurioje duomenø grupëje yra iðsiskirianèiø reikðmiø.


# --------------------------------------- #
# FUNKCIJA HIST                           #
# --------------------------------------- #

# Histogramos sudarymui ir jos braiþymui naudojama standartinë R funkcija hist. 
# Pagrindiniai jos parametrai:
# 
#          x -- kiekybinio kintamojo reikðmiø vektorius,
#     breaks -- kintamojo x padalinimo á intervalus taðkø vektorius,
#       freq -- TRUE, nurodo ar bus braiþoma daþniø histograma,
#      right -- TRUE, nurodo, kad histogramos intervalai yra (a, b] pavidalo,
#     labels -- FALSE, daþniai arba uþraðø ant histogramos stulpeliø vektorius,
#       plot -- TRUE, nurodo ar braiþyti histogramà,
#        add -- FALSE, nurodo ar histogramà uþdëti ant jau sudaryto grafiko.


# Kaip pavyzdá panaudosime Nilo vandens lygio stebëjimo duomenis. Patogumo dëlei 
# sukursime atskirà kintamàjá x ir nubraiþysime jo histogramà.

x <- as.numeric(Nile)
x
  
hist(x)

# Be papildomø nustatymø histogramos stulpeliø skaièius parenkamas automatiðkai. 
# Naudojant parametrà breaks, kintamojo reikðmiø sritá galima padalinti á kelis 
# intervalus, pagal kuriuos ir sudaroma histograma. Pats paprasèiausias bûdas --
# nurodyti intervalø padalijimo taðkø vektoriø. Reikia priminti, kad histogramos
# stulpeliø bus vienu maþiau nei taðkø skaièius.

hist(x, breaks = c(400, 600, 800, 1000, 1200, 1400))

# Toká pat padalinimo taðkø vektoriø galima sudaryti naudojant aritmetinës sekos 
# generavimo funkcijà seq. Tarkime, kad intervalo plotis bus lygus 200.

hist(x, breaks = seq(400, 1400, by = 200))

# Intervalø sudarymo komandà galima visiðkai automatizuoti. Paprastai histograma 
# braiþoma intervale nuo minimalios iki maksimalios kintamojo reikðmës. Tada jas
# galima apskaièiuoti naudojant funkcijas min ir max. Intervalø skaièiø nurodome
# per funkcijos seq parametrà length.out. PASTABA! Intervalai yra (a, b] formos,
# ir formaliai minimalià reikðmæ turintis imties elementas á pirmàjá intervalà
# turëtø nepatekti, taèiau parametras include.lowest nurodo, kad reikia átraukti.

hist(x, breaks = seq(min(x), max(x), length = 6))

# Kintamojo reikðmes padalinti á intervalus galima ir naudojant funkcijà pretty.
# Ði funkcija padalinimo taðkus parenka taip, kad visi intervalai bûtø "graþûs".

hist(x, breaks = pretty(x))


# Ant histogramos stulpeliø galima uþraðyti atitinkamø intervalø daþnius. Tam
# naudojama funkcija labels. Vietoj loginës parametro reikðmës galima nurodyti 
# reikðmiø, kurias reikia uþraðyti ant stulpeliø, vektoriø.

hist(x, breaks = pretty(x), labels = TRUE)


# NAUDINGA ------------------------------

# Kaip ir kitos grafinës funkcijos, funkcija hist priima standartinius grafinius
# parametrus, kuriais galima keisti histogramos iðvaizdà.

# Kartais ant histogramos reikia uþdëti kokio nors skirstinio tankio funkcijos
# grafikà. Nubraiþysime temperatûros histogramà ir ant jos uþdësime normaliojo
# skirstinio tankio funkcijos grafikà, o kadangi skirstinio parametrai neþinomi,
# juos ávertinsime ið imties.

t <- as.numeric(nhtemp)

vid <- mean(t)
std <- sd(t)

# Pirma nubraiþome histogramà. Kadangi ant jos virðaus braiþysime tankio f-jos
# grafikà, èia reikalinga ne daþniø, o santykiniø daþniø histograma. Jà gauname
# parametrui freq priskirdami reikðmæ FALSE.

hist(t, freq = FALSE, xlim = c(46, 56), main = "Temperatûros pasiskirstymas")
curve(dnorm(x, mean = vid, sd = std), col = "red", add = TRUE)


# Funkcija hist ne tik nubraiþo histogramà, bet ir gali sukurti ðiai histogramai 
# nubraiþyti reikalingà duomenø rinkiná - histogramos objektà. Jei pats grafikas 
# nereikalingas, jo braiþymà galima uþdrausti naudojant parametrà plot.

histat <- hist(x, breaks = pretty(x), plot = FALSE)
histat

# Ið jo galima suþinoti, kokie yra kintamojo daþniai intervaluose, ðiø intervalø
# padalinimo taðkus, intervalø vidurio taðkus ir pan.

names(histat)

histat$breaks  # intervalø padalinimo taðkai
histat$mids    # intervalø vidurio taðkai
histat$counts  # daþniai intervaluose

# Funkcija plot turi metodà histogramos objektui atvaizduoti.

plot(histat)


# UÞDUOTIS ------------------------------ 

# 1. Nubraiþykite duomenø lentelës airquality birþelio mën. temperatûros daþniø 
#    histogramà. Nurodykite aðiø pavadinimus ir visos histogramos pavadinimà.
# 2. Nubraiþykite tokià kintamojo y histogramà, kad ant stulpeliø bûtø uþraðyti
#    ne daþniai, bet didþiosios abëcëlës raidës. Tokie vardai stulpeliams turi 
#    bûti priskiriami automatiðkai ir nepriklausomai nuo stulpeliø skaièiaus.
# 3. Uþraðykite komandà, kuri naudodama histogramos objektà, surastø aukðèiausià 
#    histogramos stulpelá atitinkanèio intervalo vidurá.
# 4. Sugalvokite bûdà, kaip nubraiþyti Nilo vandens lygio histogramà panaudojant 
#    daþnius intervaluose ið anksèiau jau sukurto histogramos objekto -- histo.
# 5. Sugalvokite bûdà, kaip nubraiþyti bet kokio kintamojo x histogramà visiðkai 
#    nenaudojant funkcijos hist.

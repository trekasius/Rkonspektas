
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Pagrindiniai funkcijos plot metodai.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2014-03-07 | 2014-03-24
#


# TURINYS -------------------------------

#
#   1. Funkcijos plot metodai sklaidos diagramoms:
#      * plot.default
#      * plot.data.frame
#      * plot.formula
#
#   2. Metodas vieno kintamojo funkcijø grafikams:
#      * plot.function
#
#   3. Metodai daþniø lentelëms atvaizduoti:
#      * plot.table
#      * plot.factor
#


# PASTABOS ------------------------------

#
# Jokiø pastabø nëra.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# FUNKCIJA PLOT IR JOS METODAI            #
# --------------------------------------- #

# Pagrindinë grafikø ir ávairiø diagramø braiþymo funkcija yra plot. Tai bendro 
# pobûdþio (generic) funkcija, kuri skirtingo tipo duomenims atvaizduoti naudoja 
# skirtingus metodus. Pavyzdþiui, kaip argumentà nurodþius du skaièiø vektorius 
# x ir y, nubraiþoma taðkø su koordinatëmis (x, y) sklaidos diagrama, nurodþius 
# daþniø lentelæ, nubraiþoma stulpelinë diagrama, nurodþius bet kokios skaitinës
# R funkcijos pavadinimà arba uþraðius jos iðraiðkà, nubraiþomas tos funkcijos 
# grafikas. Funkcija plot atpaþásta daþniausiai naudojamø statistiniø procedûrø 
# rezultatø objektus ir jø atvaizdavimui naudoja specifinius metodus. Pavyzdþiui, 
# kaip argumentà nurodþius tiesiniø modeliø procedûros lm rezultatø objektà, bus 
# braiþoma paklaidø sklaidos diagrama ir kiti diagnostiniai to modelio grafikai, 
# o nurodþius hierarchinio klasterizavimo procedûros hclust rezultatà, braiþoma 
# dendrograma. Galima paminëti keletà daþniausiai naudojamø metodø:
# 
#   plot.default    --  skaitiniø kintamøjø x ir y sklaidos diagramos braiþymui,
#   plot.data.frame --  skaitiniø duomenø lenteliø atvaizdavimui,
#   plot.formula    --  duomenø pagal jø priklausomybës modelá atvaizdavimui,
#   plot.function   --  ávairiø funkcijø grafikø braþymui,
#   plot.table      --  daþniø ir kryþminiø daþniø lenteliø atvaizdavimui,
#   plot.factor     --  kategoriniø kintamøjø (faktoriø) atvaizdavimui,
#   plot.histogram  --  histogramos braiþymui,
#   plot.density    --  tankio funkcijos áverèio braiþymui,
#   plot.ecdf       --  empirinës pasiskirstymo funkcijos braiþymui,
#   plot.ts         --  laiko eilutës grafiko braiþymui,
#   plot.dendrogram --  dendrogramos atvaizdavimui,
#   plot.lm         --  tiesinio modelio diagnostiniø grafikø braiþymui.

# Visus funkcijos plot metodus galima suþinoti naudojant funkcijà methods.
methods(plot)


# --------------------------------------- #
# METODAI SKLAIDOS DIAGRAMOMS SUDARYTI    #
# --------------------------------------- #

# Pats paprasèiausias grafikas - taðkø su koordinatëmis (x, y) sklaidos diagrama.
# Tokiu atveju funkcijai plot perduodami ðiø taðkø koordinaèiø vektoriai x ir y.

x <- c(2.0, 1.6, 1.2, 1.0, 1.0, 1.3, 1.6, 2.0, 2.3, 2.8, 2.8, 3.0, 2.8, 2.4, 2.1)
y <- c(0.8, 1.1, 1.3, 1.6, 2.2, 2.5, 2.9, 3.1, 3.0, 2.8, 2.4, 1.8, 1.4, 1.0, 0.9)
z <- c(2.8, 6.1, 4.5, 8.0, 6.7, 9.0, 9.2, 9.3, 7.2, 9.6, 8.6, 8.4, 7.3, 6.1, 3.9)

d <- data.frame(x, y, z)
l <- list(x, y, z)

# Nubraiþysime tris skirtingas ðiø kintamøjø sklaidos diagramas.

plot(x, y)
plot(x, z)
plot(y, z)

# Diagramoje pavaizduotø taðkø koordinatës (x, y) gali bûti apskaièiuotos. Tokiu 
# bûdu galima nubraiþyti ávairias kreives. Pavyzdþiui, nubraiþysime gerai þinomà
# Lisaþu kreivæ, kuri uþraðyta parametriniu pavidalu.

t <- seq(0, 2*pi, length = 1000)
x.i <- sin(3*t + pi/8)
y.i <- cos(4*t)

plot(x.i, y.i, pch = ".", main = "Lissajous kreivë")


# Tokiu paèiu bûdu galima braiþyti ávairiø funkcijø grafikus. Pvz., nubraiþysime 
# racionalios trupmenos y = P(x)/Q(x) grafikà intervale [-5, 5].

x <- seq(-5, 5, length = 100)
y <- x/(x^2 + x + 1)

plot(x, y, type = "l")


# Jei funkcijai plot kaip argumentas nurodoma data.frame tipo lentelë, sudaromas
# grafikas, kuriame atvaizduojamos visø tokios lentelës skaitiniø kintamøjø porø 
# sklaidos diagramos. Pavyzdþiui, atvaizduosime anksèiau sudarytos lentelës visø 
# trijø kintamøjø porø sklaidos diagramas.

plot(d)

# Lentelëje iris yra 3 rûðiø gëliø þiedlapiø matavimai. Pirmi keturi kintamieji 
# yra skaitiniai, paskutinis yra kategorinis ir nurodo, kuriai rûðiai priklauso 
# stebiniai. Nubraiþysime ðiø kintamøjø sklaidos diagramas.

plot(iris)

# Kategoriná lentelës kintamàjá galima panaudoti sklaidos diagramos taðkø spalvai 
# nustatyti. Tokiu bûdu tuos paèius duomenis galima nagrinëti ávairiais pjûviais.

plot(iris[, 1:4], col = iris[, 5])


# NAUDINGA ------------------------------

# Dviejø kintamøjø sklaidos diagrama yra vienas ið bûdø pastebëti statistinæ ðiø
# kintamøjø priklausomybæ. Ði priklausomybë yra akivaizdi, kai taðkø koordinates
# (x, y) sieja ryðys y = f(x). Nagrinëjant atsitiktiniø dydþiø priklausomybæ yra
# raðomas statistinis modelis, kuris R kalboje iðreiðkiamas per formulæ. Kairëje
# jos pusëje raðomas kintamasis, kuris atitinka koordinatæ y, o deðinëje pusëje
# uþraðomas kintamasis x. Funkcija plot, naudodama metodà plot.formula, pagal ðá
# modelá sudaro dviejø kintamøjø sklaidos diagramà.

modelis <- y ~ x
modelis

# Pavyzdþiui, sudarysime duomenø lentelës d kintamøjø x ir y sklaidos diagramà.
# Funkcijai plot kaip parametrà perduodame kintamøjø sàryðio modelá ir nurodome 
# duomenø lentelæ, ið kurios ir paimami modelyje áraðyti kintamieji x ir y.

plot(modelis, data = d)

# Jeigu modelis, pagal kurá braiþoma sklaidos diagrama, nesikeièia, jo iðraiðkà 
# galima áraðyti tiesiai á funkcijà plot.

plot(y ~ x, data = d)

# Formulëje áraðyti kintamieji nebûtinai turi bûti duomenø lentelëje. Pavyzdþiui,
# nubraiþysime sàraðo l kintamøjø x ir y sklaidos diagramà.

plot(y ~ x, data = l)

# Pastaba. Nenurodþius nei duomenø lentelës, nei sàraðo pavadinimo, bus braiþoma 
# tokius pat pavadinimus turinèiø kintamøjø (jei tokie yra) sklaidos diagrama.
# Ðiuo atveju kintamieji x ir y apraðo aukðèiau paminëtos rac. trumpenos taðkus.

plot(y ~ x)

# Naudojant modelá, galima uþraðyti labai ávairias tø paèiø kintamøjø tarpusavio
# priklausomybes. Uþraðysime keletà daþniausiai pasitaikanèiø modeliø:
# 
#   y ~ x         -- taðkø su koordinatëmis (x, y) sklaidos diagrama,
#   y ~ 1         -- taðkø (i, y.i) diagrama, kai i -- y elementø eilës numeris, 
#     ~ x         -- taðkø su koordinatëmis (x, 1) iðsidëstymo tiesëje diagrama,
#     ~ x + y     -- ta pati taðkø (x, y) sklaidos diagrama,
#     ~ x + y + z -- trijø kintamøjø x, y ir z porø sklaidos diagramos.

# Naudodami duomenø lentelës d kintamuosius, pagal ðiuos modelius nubraiþysime 
# visas ðias sklaidos diagramas.

plot(y ~ x, data = d)

plot(x ~ 1, data = d)
plot(y ~ 1, data = d)

plot( ~ x, data = d)
plot( ~ y, data = d)
plot( ~ z, data = d)

plot( ~ x + y,     data = d)
plot( ~ x + y + z, data = d)


# UÞDUOTIS ------------------------------ 

# 1. Naudojant funkcijà plot, nubraiþykite brëþiná, kur 10 x 10 dydþio kvadrate
#    bûtø paþymëti visi taðkai, kuriø koordinatës yra natûriniai skaièiai.
# 2. Nubraiþykite apskritimà su centru taðke (2, 2) ir spinduliu R=2. Apskritimo
#    taðkai turi bûti sujungti iðtisine raudona linija. Kad apskritimo grafikas
#    vizualiai nepavirstø á elipsës grafikà, naudojant parametrà asp nurodykite 
#    fiksuotà 1:1 kraðtiniø santyká.
# 3. Nubraiþykite elipsës su centru koordinaèiø pradþioje grafikà. Tegul ilgoji
#    elipsës pusaðë lygi 5, o trumpoji -- 3.
# 4. Apskaièiuokite Archimedo spiralës 1000 taðkø koordinates, nubraiþykite jos
#    grafikà. Braiþant grafikà, reikia nurodyti fiksuotà 1:1 kraðtiniø santyká.
# 5. Lentelëje cars yra automobilio greièio ir stabdymo kelio matavimø duomenys.
#    Sudarykite stabdymo kelio ir automobilio greièio tarpusavio priklausomybës 
#    modelá ir nubraiþykite já atitinkantá kintamøjø sklaidos diagramà.


# --------------------------------------- #
# METODAS FUNKCIJOS GRAFIKUI NUBRAIÞYTI   #
# --------------------------------------- #

# Funkcija plot turi metodà vieno kintamojo funkcijø y = f(x) grafikams braiþyti.
# Pagrindiniai parametrai:
#
#       x -- funkcijos f(x) pavadinimas arba jos iðraiðka,
#    from -- intervalo [a, b] reikðmë a,
#      to -- intervalo [a, b] reikðmë b,
#       n -- taðkø skaièius intervale [a, b].
#
# Sudarant funkcijos f(x) intervale [a, b] grafikà, ðis intervalas padalinamas á 
# 100 lygiø daliø, kurias viena nuo kitos atskiria n = 101 taðkø. Tuose taðkuose
# skaièiuojamos funkcijos y = f(x) reikðmës ir gaunamos taðkø (x, y) koordinatës.

# Pavyzdþiui, sudarysime tos paèios racionalios trupmenos y = P(x)/Q(x) grafikà. 
# Pirmiausia jos iðraiðkà uþraðysime kaip R funkcijà.

fx <- function(x) {
  y <- x/(x^2 + x + 1)
  return(y)
}

plot(fx)


# Be papildomø nustatymø nubraiþomas funkcijos intervale [0, 1] grafikas, taèiau 
# intervalo ribas galima pakeisti.

plot(fx, from = -5, to = 5)

# Jei parametrø reikðmës priskiriamos nustatyta tvarka, tai parametrø pavadinimø 
# galima ir neraðyti.

plot(fx, -5, 5)

# Taðkø (x, y), ið kuriø sudaromas funkcijos grafikas, skaièiø galima pakeisti.

plot(fx, -5, 5, n = 10)
plot(fx, -5, 5, n = 1000)


# Kartais gali bûti naudinga galimybë iðsaugoti taðkø (x, y), ið kuriø sudarytas 
# funkcijos y = f(x) grafikas, koordinates. 

xy.list <- plot(fx, -5, 5)
xy.list

plot(xy.list)


# Gana daþnai reikalingas kokios nors standartinës funkcijos grafikas. Já galimà
# nubraiþyti net keliais bûdais. Pavyzdþiui, nubraiþysime standartinio normaliojo
# pasiskirstymo tankio funkcijos grafikà.

# Pirmas bûdas. Galima apskaièiuoti tankio funkcijos y = p(x) reikðmes taðkuose 
# x ir taðkus (x, y) atidëti plokðtumoje.

x <- seq(-3, 3, len = 100)
y <- 1/sqrt(2*pi)*exp(-x^2/2)

plot(x, y, type = "l")


# Antras bûdas. Reikiamos funkcijos iðraiðkà galima uþraðyti kaip R funkcijà ir 
# nubrëþti jos grafikà.

norm.tankis <- function(x) {
  y <- 1/sqrt(2*pi)*exp(-x^2/2)
  return(y)
}

plot(norm.tankis)
plot(norm.tankis, -3, 3)


# R turi daug praktikoje reikalingø ir daþnai naudojamø funkcijø ir atskirai jø 
# uþraðinëti nereikia -- uþtenka þinoti jø pavadinimus. Standartinio normalinio 
# dydþio tankio funkcija yra dnorm, o tikimybiø pasiskirstymo funkcija -- pnorm.

plot(dnorm, -3, 3)
plot(pnorm, -3, 3)

plot(sqrt)
plot(log)
plot(exp)

plot(sin, -pi/2, pi/2)

# Standartines R funkcijas galima panaudoti kitø funkcijø sudarymui. Pavyzdþiui,
# R turi funkcijà y = sin(x), taèiau neturi funkcijos y = sin(2x). Jos iðraiðkà 
# kaip argumentà galima áraðyti tiesiai á funkcijà plot.

plot(function(x) sin(2*x), -pi/2, pi/2)


# UÞDUOTIS ------------------------------ 

# 1. Panaudojant standartinæ R funkcijà, nubraiþykite funkcijos y = |x| grafikà 
#    intervale [-1, 1].
# 2. Naudodami standartines trigonometrines R funkcijas, nubraiþykite funkcijos
#    y = arcsin(sin(x)) grafikà intervale [-2pi, 2pi].
# 3. Nubraiþykite normaliojo skirstinio su vidurkiu 10 ir standartiniu nuokrypiu 
#    lygiu 3 tankio funkcijos grafikà. Intervalà parinkite taip, kad funkcijos
#    reikðmës galuose bûtø labai artimos nuliui.
# 4. Panaudojant funkcijà plot, nubraiþykite chi-kvadrat skirstinio su 5 laisvës 
#    laipsniais tankio funkcijos grafikà intervale [0, 20]. Chi-kvadrat tankio
#    funkcijos pavadinimas dchisq.


# --------------------------------------- #
# METODAI DAÞNIØ LENTELËMS IR FAKTORIAMS  #
# --------------------------------------- #

# Funkcija plot gali atvaizduoti daþniø lenteles. Vieno kintamojo daþniø lentelë
# atvaizduojama kaip stulpelinë diagrama, kurioje kintamojo reikðmæ atitinkanèio 
# stulpelio aukðtis lygus tos reikðmës pasikartojimø skaièiui -- daþniui.

# Pavyzdþiui, turime vektoriø, kurio elementai yra didþiosios raidës. Sudarysime 
# ðio vektoriaus raidþiø daþniø lentelæ ir jà atvaizduosime.

g <- c("A", "B", "D", "A", "C", "C", "C", "C", "C", "C", "A", "A", "D", "B", "B")

t <- table(g)
t

plot(t)
plot(t, main = "Daþniø pasiskirstymas grupëse", xlab = "Grupë", ylab = "")


# Jei funkcijos plot argumentas yra kategorinis kintamasis (faktorius), sudaroma
# to kintamojo daþniø lentelæ atitinkanti stulpelinë diagrama.

# Pavyzdþiui, kintamàjá g paversime á faktoriø ir sudarysime tà paèià stulpelinæ 
# diagramà neskaièiuodami tarpinës daþniø lentelës.
 
g <- factor(g)
g

plot(g)

# Vienas ið funkcijos plot argumentø gali bûti kategorinis, o kitas -- skaitinis.
# Priklausomai nuo to, kokio tipo kintamasis bus priskirtas parametrui x, o koks
# parametrui y, funkcija plot sudarys du skirtingus grafikus. Abiem atvejais tai
# bus skaitinio kintamojo sklaidos diagramos atskirose grupëse pagal kategorinio
# kintamojo reikðmes. Skiriasi tik atvaizdavimo bûdas.

s <- c(0.6, 3.4, 6.1, 0.7, 5.2, 1.4, 2.3, 3.4, 2.5, 9.4, 2.7, 4.1, 2.9, 0.1, 7.5)
k <- c("T", "N", "N", "T", "T", "T", "N", "T", "T", "N", "T", "N", "T", "T", "N")

k <- factor(k, levels = c("T", "N"), labels = c("Taip", "Ne"))

plot(k)

# Jei funkcijos plot parametrui x priskiriamas skaitinis vektorius, o parametrui 
# y -- kategorinis (faktorius), tai skirtingoms grupëms priklausanèios skaitinio 
# kintamojo reikðmës iðdëstomos ant tas grupes atitinkanèiø horizontaliø tiesiø. 
# Tokiu bûdu gaunamos vienmatës sklaidos diagramos.

plot(s, k)

# Jei parametrui x priskiriamas kategorinis kintamasis (faktorius), o parametrui 
# y --- skaitinis, tada ið skirtingoms grupëms priklausanèiø skaitinio kintamojo 
# reikðmiø sudaromos atskiros tø kategorijø boxplot diagramos, kurios iðdëstomos 
# ant x aðies.

plot(k, s)

# Jei ið karto abiems funkcijos plot parametrams x ir y priskiriami kategoriniai 
# kintamieji, nubraiþoma specifinë stulpelinë diagrama, kuri vadinama spineplot. 
# Ðioje diagramoje ant Ox aðies iðdëstomi skirtingas pirmojo kintamojo reikðmes 
# atitinkantys vienetinio aukðèio stulpeliai. Kiekvienas stulpelis padalinamas á
# tiek daliø, kiek skirtingø antrojo kintamojo reikðmiø yra atitinkamoje pirmojo
# kintamojo grupëje, o kiekvienos dalies dydis proporcingas tø reikðmiø daþniui.

plot(k, g)
plot(g, k)


# NAUDINGA ------------------------------

# Á kintamøjø ryðius apraðantá modelá galima átraukti kategorinius kintamuosius.
# Tokiu atveju deðinëje modelio pusëje áraðytas kategorinis kintamasis grupuoja
# kairës pusës kintamojo stebinius. Diagramos pavidalas priklauso nuo to, kokio
# tipo kintamieji yra vienoje ir kitoje modelio pusëje. Tarkime, kad kintamasis 
# x yra skaitinis, o kintamieji k ir g -- kategoriniai (faktoriai). Tokiu atveju
# galima uþraðyti daþniausiai naudojamus modelius:
# 
#     ~ k     -- kategorinio kintamojo k stulpelinë daþniø diagrama,
#   x ~ k     -- skaitinio kintamojo x boxplot diagrama kintamojo k grupëse,
#     ~ k + x -- skaitinio kintamojo x boxplot diagrama kintamojo k grupëse,
#   g ~ k     -- kategorinio kintamojo g spineplot diagrama grupëse pagal k,
#     ~ k + g -- kategorinio kintamojo g spineplot diagrama grupëse pagal k.

# Nubraiþysime skaitinio kintamojo s boxplot diagramas grupëse suformuotas pagal 
# skirtingas kintamojo k reikðmes.

plot(s ~ k)

# Naudojant modelá, nubraiþysime kategorinio kintamojo g daþniø diagramà.

plot( ~ g)

# Dviejø kategoriniø kintamøjø spineplot diagramà galima nubraiþyti uþraðant du 
# ekvivalenèius jø priklausomybës modelius. Galima atkreipti dëmesá, kad pirmas
# kintamasis deðinëje visada yra grupuojantis. Ðiuo atveju tai yra kintamasis g.

plot(k ~ g)
plot(  ~ g + k)


# UÞDUOTIS ------------------------------ 

# 1. Sudarykite vektoriø ið ðios uþduoties pirmojo sakinio raidþiø. Visos raidës
#    vektoriuje turi bûti vienodos: arba maþosios, arba didþiosios. Sudarykite
#    raidþiø daþniø lentelæ ir atvaizduokite jà kaip stulpelinæ diagramà.
# 2. Pirmoje uþduotyje sudarytà raidþiø vektoriø paverskite á faktoriø. Gaukite
#    tokià paèià raidþiø pasikartojimo daþniø stulpelinæ diagramà a) nenaudojant
#    kategorinio kintamojo sklaidos modelio, b) naudojant modelá.
# 3. Naudojant pirmoje uþduotyje sudarytà raidþiø vektoriø, sudarykite papildomà
#    vektoriø, kurio elementams priskiriama reikðmë "B", jei raidë yra balsë, ir
#    reikðmë "P", jei raidë yra priebalsë. Paverskite ðá vektoriø á kategoriná 
#    kintamàjá. Atvaizduokite balsiø ir priebalsiø daþniø diagramà ir atsakykite,
#    kokiø raidþiø yra daugiau?
# 4. Uþraðykite toká kintamøjø sàryðio modelá, kad pagal já bûtø galima nubrëþti
#    duomenø lentelës iris kintamojo Sepal.Length boxplot diagramas atskirai 
#    kiekvienai kategorinio kintamojo Species grupei.

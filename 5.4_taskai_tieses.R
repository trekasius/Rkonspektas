
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Þemo lygio grafinës funkcijos: taðkai, linijos ir tiesës.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2014-04-25 | 2014-06-08
#


# TURINYS -------------------------------

#
#   1. Grafikus papildanèios funkcijos:
#      * funkcija points
#      * funkcija lines
#      * funkcija abline
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
# PAPILDOMI TAÐKAI                        #
# --------------------------------------- #

# Taðkai su koordinatëmis (x, y) ant jau nubraiþyto grafiko uþdedami naudojant 
# funkcijà points. Pagrindiniai jos parametrai:
#
#        x -- x reikðmiø vektorius,
#        y -- y reikðmiø vektorius,
#      pch -- taðko simbolis,
#      cex -- taðko simbolio dydis,
#      col -- taðko spalva.
#
# Ið dalies galima sakyti, kad f-ja points(x, y) yra f-ja plot(x, y, type = "p"),
# taèiau ji daþniausiai naudojama tuo atveju, kai ant kitos funkcijos nubraiþyto 
# grafiko tam tikrose vietose dar reikia uþdëti vienà ar kelis papildomus taðkus.

# Pavyzdþiui, ant taðkø su koordinatëmis (x y) sklaidos diagramos uþdësime vienà
# raudonà taðkà su koordinatëmis (2, 2).

x <- c(2.0, 1.6, 1.2, 1.0, 1.0, 1.3, 1.6, 2.0, 2.3, 2.8, 2.8, 3.0, 2.8, 2.4, 2.1)
y <- c(0.8, 1.1, 1.3, 1.6, 2.2, 2.5, 2.9, 3.1, 3.0, 2.8, 2.4, 1.8, 1.4, 1.0, 0.9)

plot(x, y, asp = 1)
points(2, 2, pch = 19, col = "red")

# Ant jau nubraiþytos diagramos uþdësime vienetinio apskritimo su centru (2, 2)
# taðkus. Jø koordinates (a, b) apskaièiuosime atskirai.

k <- 1:360
a <- cos(k) + 2
b <- sin(k) + 2

points(a, b, pch = ".")


# Vienà ar kelis taðkus galima uþdëti ant bet kokios kitos diagramos. Gana daþna
# situacija, kada reikia papildyti kokios nors kitos grafinës funkcijos sudarytà
# standartinæ diagramà. Pvz., naudojant duomenø lentelæ airquality, nubraiþysime
# atskirø mënesiø oro temperatûros boxplot diagramas. Ant jø papildomai uþdësime
# vidutinæ mënesio temperatûrà þyminèius taðkus.

temp.vid <- with(airquality, tapply(Temp, Month, mean))
temp.vid

# Kadangi lentelëje yra penkiø mënesiø duomenys, nubraiþomos penkios diagramos,
# kurios ant Ox aðies atidedamos ties taðkais x = 1, x = 2 ir t.t. 

boxplot(Temp ~ Month, data = airquality)
points(x = 1:5, y = temp.vid, col = "red", pch = 19, cex = 1.2)


# Funkcijai points taðkø koordinates galima nurodyti ir per jø sàryðio formulæ.
# Pvz., ant pagal mënesius suskirstytos temperatûros boxplot diagramos uþdësime 
# visas atitinkamo mënesio temperatûrø reikðmes. 

# Pagal nutylëjimà funkcija boxplot diagramas ant Ox aðies atideda ties taðkais 
# x = 1, x = 2 ir t.t., taèiau kintamojo Month reikðmës kinta nuo 5 iki 9. Tam,
# kad vieno mënesio temperatûros reikðmës bûtø atidedamos ant atitinkamo mënesio
# boxplot diagramos, jos taip pat turi bûti atidedamos ties taðkais x = 5, x = 6 
# ir t.t. Toká diagramos postûmá ant aðies Ox galima atlikti naudojant funkcijos 
# boxplot parametrà at.

boxplot(Temp ~ Month, data = airquality, at = 5:9)
points(Temp ~ Month, data = airquality, pch = 20, col = 3)


# Ið praëjusio pavyzdþio aiðku, kad, norint teisingai uþdëti taðkus ant sudaryto
# grafiko, reikia prisiderinti prie to grafiko koordinaèiø sistemos. Èia galima
# pasinaudoti tuo, kad aukðto lygio grafinës funkcijos ne tik nubraiþo diagramà,
# bet ir leidþia iðsaugoti jai nubraiþyti reikalingas statistikas. 

# Pavyzdþiui, nubraiþysime temperatûros histogramà ir uþdësime stulpeliø vidurá 
# þyminèius taðkus. Jø koordinates pasiimsime ið f-jos hist sukurto histogramos 
# objekto.

t <- as.numeric(nhtemp)

histat <- hist(t, xlim = c(46, 56), main = "Temperatûros pasiskirstymas")
histat

# Ið histogramos objekto pasiimame tik intervalø centrø vektoriø.

x <- histat$mids
y <- rep(0, length(x))

points(x, y, pch = 19, col = "red")


# Keièiant parametro type reikðmæ, galime keisti stiliø, kuriuo funkcija points 
# vaizduoja taðkus. Pavyzdþiui, nubraiþysime f-jos y = sin(x) grafikà intervale
# [-pi, pi] ir kas pi/8 iðdëstytus taðkus sujungsime laiptuota linija: viena po
# funkcijos grafiku, kita -- virð jo.

curve(sin, -pi, pi)

x <- seq(-pi, pi, pi/8)
y <- sin(x)

points(x, y, pch = 19)
points(x, y, type = "s")
points(x, y, type = "S")


# Dar vienas pavyzdys. Nubraiþysime standartinio normaliojo pasiskirstymo tankio 
# funkcijos grafikà, o plotà po tankio funkcija padalinsime á lygias dalis pagal 
# kvartilius. Kvartilius ir tankio funkcijos reikðmes juose paþymësime taðkais.
# Pasinaudosime tuo, kad keièiant parametro type reikðmæ, galima nustatyti taðkø
# atvaizdavimo stiliø.

# Pirmiausia sudarome kvartilius atitinkanèiø tikimybiø vektoriø p, tada randame
# paèiø kvantiliø reikðmes ir apskaièiuojame tankio funkcijos reikðmes kvartiliø
# taðkuose. Kvantilius q atidedame ant Ox aðies ir ant tankio funkcijos grafiko.

curve(dnorm, -3, 3, ylab = "p(x)", las = 1, frame = FALSE)

p <- c(0.25, 0.5, 0.75)
q <- qnorm(p)
d <- dnorm(q)

points(q, d, type = "h", col = "red")
points(q, d, pch = 19)
points(q, d-d, pch = 19)


# NAUDINGA ------------------------------

# Jei sudëtingoje diagramoje yra kelios pasikartojanèios grafinës konstrukcijos, 
# jas galima uþraðyti kaip funkcijà. Keièiant funkcijos parametrus galima keisti
# grafinës konstrukcijos diagramoje vietà, dydá ir kitas charakteristikas. 

# Pavyzdþiui, p lygio kvantilá atitinkanèià atkarpà ant tankio funkcijos grafiko
# uþdësime naudojant specialià funkcijà add.line. Jos parametras p yra kvantilio
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

# Jei tokiø kvantilius atitinkanèiø atkarpø ant grafiko reikia uþdëti ir daugiau, 
# jas braiþanèià funkcijà galima ádëti á ciklà.

p <- c(0.4, 0.5, 0.6, 0.7, 0.8, 0.9)

for (i in p) add.line(i)


# UÞDUOTIS ------------------------------ 

# 1. Duotas daþniø vektorius (3, 2, 5, 3, 1). Nubraiþykite stulpelinæ ðiø daþniø 
#    diagramà. Kiekvieno stulpelio centre (pagal plotá ir pagal aukðtá) uþdëkite
#    raudonà taðkà.
# 2. Naudojant funkcijà plot, grafike atidëkite taðkà su koordinatëmis (10, 10). 
#    Keisdami tik to paties vieno taðko simbolio dydá, gaukite grafikà, kuriame 
#    yra keletas koncentriðkø apskritimø.


# --------------------------------------- #
# PAPILDOMOS KREIVËS                      #
# --------------------------------------- #

# Tuo atveju, kai papildomai uþdëtus taðkus reikia sujungti, naudojama funkcija 
# lines. Galima sakyti, kad f-ja lines(x, y) yra f-ja plot(x, y, type = "l"). Ið 
# esmës skiriasi tik tuo, kad funkcija lines naudojama taðkø ir linijø uþdëjimui 
# ant jau nubraiþyto grafiko. Pagrindiniai ðios funkcijos parametrai:
# 
#        x -- x reikðmiø vektorius,
#        y -- y reikðmiø vektorius,
#      lty -- linijos tipas,
#      lwd -- linijos storis,
#      col -- linijos spalva.

# Pavyzdþiui, ant anksèiau sudarytos temperatûros histogramos uþdësime poligonà. 
# Tai tokia kreivë, kuri sudaryta ið atkarpomis sujungtø taðkø (x, y). Èia x yra
# histogramos stulpelio vidurio taðkas, o y -- to paties stulpelio aukðtis. Ðias
# koordinates pasiimsime ið to paties anksèiau sudaryto histogramos objekto.

histat

x <- histat$mids
y <- histat$counts

plot(histat, xlim = c(46, 56), main = "Temperatûros pasiskirstymas")
lines(x, y, type = "b", pch = 19, col = "red")


# Nubraiþysime á mënesius suskirstytos temperatûros sklaidos diagramà ir mënesiø
# temperatûros vidurkiø taðkus sujungsime atkarpomis.

plot(Temp ~ Month, data = airquality, pch = 20)

temp.vid <- with(airquality, tapply(Temp, Month, mean))
temp.vid

lines(x = 5:9, y = temp.vid, type = "b", pch = 19, col = "red")


# UÞDUOTIS ------------------------------ 

# 1. Duomenø lentelëje cars yra automobilio greièio ir stabdymo atstumo duomenys.
#    Nubraiþykite ðiø kintamøjø sklaidos diagramà. Kiekvienai skirtingai greièio
#    reikðmei apskaièiuokite stabdymo atstumo vidurká. Gautus taðkus uþdëkite ant
#    grafiko ir sujunkite juos tiesës atkarpomis.


# --------------------------------------- #
# TIESËS BRAIÞYMAS                        #
# --------------------------------------- #

# Tiesës atkarpà galima nubraiþyti naudojant bendro pobûdþio funkcijas plot arba
# lines -- uþtenka nurodyti dviejø taðkø koordinates. Dël tos paèios prieþasties
# ðis bûdas nëra patogus. 

# Tiesës plokðtumoje lygtis y = a + bx. Jà vienareikðmiðkai nusako du parametrai:
# a ir b. Norint nubraiþyti vertikalià ar horizontalià tiesæ, uþtenka þinoti tik
# taðkà, kuriame ði tiesë kerta Ox arba Oy aðá. Tokiø tiesiø braiþymui naudojama
# funkcija abline. Pagrindiniai jos parametrai:
#
#        a -- tiesës y = a + bx parametras a,
#        b -- tiesës y = a + bx parametras b,
#        h -- taðkas, kuriame aðá Oy kerta horizontali tiesë,
#        v -- taðkas, kuriame aðá Ox kerta vertikali tiesë,
#      col -- tiesës spalvos pavadinimas arba numeris,
#     type -- tiesës tipas, 1 iðtisinë, 2 punktyrinë ir t.t.


# Pavyzdþiui, nubraiþysime temperatûros kitimo laike grafikà ir uþdësime ant jo
# horizontalià linijà ties 80 laipsniø riba.

plot(Temp ~ 1, data = airquality, pch = 20)
abline(h = 80)

# Tiesæ galima uþdëti ant bet kokio grafiko. Pavyzdþiui, nubraiþysime stulpelinæ
# diagramà, kurioje pavaizduotas Titaniko keleiviø skaièius atskirose klasëse ir
# ant jos uþdësime vidutiná keleiviø skaièiø þyminèià horizontalià linijà.

d <- margin.table(Titanic, 1)
barplot(d)
abline(h = mean(d))


# Norint nubraiþyti pasvirà tiesæ y = a + bx, funcijai abline nurodome parametrø 
# a ir b reikðmes. Pavyzdþiui, taip uþdësime funkcijos f(x) = x + 1/x vertikalià
# ir pasviràjà asimptotes.

fx <- function(x) x + 1/x
curve(fx, -5, 5, col = "red", main = "Funkcijos y = x + 1/x asimptotës")
abline(a = 0, b = 1, v = 0, lty = 5)


# Parametrams v ir h galima nurodyti ið karto kelias reikðmes. Tokiu bûdu galima
# nubraiþyti ið karto daug horizontaliø ar vertikaliø linijø. 

plot(Temp ~ Month, data = airquality, type = "n")
abline(v = 5:9, h = 60:90, col = "gray")
points(Temp ~ Month, data = airquality, pch = 19)


# NAUDINGA ------------------------------

# Vienas ið tipiniø duomenø analizës uþdaviniø -- nustatyti kintamøjø tarpusavio
# ryðá. Paprastai prieð sudarant statistiná modeli braiþomos kintamøjø diagramos.

x <- c(9.5, 4.0, 4.9, 8.1, 9.9, 2.6, 8.7, 4.4, 4.3, 3.2, 2.2, 9.2, 5.0, 3.2, 7.4)
y <- c(8.7, 6.1, 6.0, 7.7, 9.9, 5.1, 9.5, 5.3, 5.6, 5.8, 4.5, 8.8, 6.6, 5.9, 8.2)

plot(x, y, pch = 19)

# Ið sklaidos diagramos matome, kad taðkai iðsibarstæ apie tiesæ. Kad kintamieji
# tiesiðkai susijæ, rodo ir artimas vienetui koreliacijos koeficientas.

cor(x, y)

# Paprastai kintamøjø y ir x regresijos tiesës y = a + bx parametrai neþinomi ir 
# vertinami ið duomenø. Tiesinës regresijos modelio parametrams a ir b ávertinti 
# naudojama standartinë funkcija lm.

lm(y ~ x)

# Turint parametrø a ir b áverèius, juos galima suraðyti á funkcijà abline. Taip
# gauname regresijos tiesës grafikà.

abline(a = 3.3900, b = 0.6103)

# Tam, kad tiesës parametrø nereikëtø kopijuoti ar perraðinëti, funkcijai abline
# kaip parametrà galima perduoti funkcijos lm gràþinamà rezultatø objektà.

modelis <- lm(y ~ x)
modelis

abline(modelis)


# Tokiu bûdu, apjungiant kai kurias komandas, dviejø kintamøjø sklaidos diagramà
# ir jø regresijos tiesës grafikà galima gauti labai paprastai ir greitai.

plot(x, y)
abline(lm(y ~ x))


# UÞDUOTIS ------------------------------ 

# 1. Kintamasis Nile yra vandens lygio Nilo upëje laiko eilutë. Nubraiþykite jos
#    grafikà ir uþdëkite vidutiná vandens lygá þyminèià raudonos spalvos linijà.
# 2. Nubraiþykite temperatûros ið duomenø lentelës airquality kitimo laike taðkø
#    sklaidos diagramà. Tada vertikaliomis tiesëmis atskirkite kiekvieno mënesio 
#    stebinius.

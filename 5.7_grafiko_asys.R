
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Grafiko aðiø, rëmelio ir tinklelio formavimas.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2014-06-10 | 2014-06-27
#


# TURINYS -------------------------------

#
#   1. Grafiko aðiø sudarymas:
#      * funkcija axis
#
#   2. Koordinaèiø aðiø padalijimo taðkø radimas:
#      * funkcija axTicks
#      * funkcija axisTicks
#
#   3. Rëmelio ir tinklelio braiþymas:
#      * funkcija box
#      * funkcija grid
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
# GRAFIKO AÐIØ FORMAVIMAS                 #
# --------------------------------------- #

# Aukðto lygio grafinës funkcijos diagramos aðis suformuoja automatiðkai, taèiau
# jas galima pakeisti. Taip daroma tada, kada automatiðkai sudaryta aðis netinka 
# ir sudaroma nauja. Tam naudojama speciali funkcija axis. Daþniausiai naudojami 
# ðie funkcijos parametrai:
#
#       side -- aðies pozicija: 1 apaèioje, 2 kairëje, 3 virðuje, 4 deðinëje,
#         at -- padalinimo taðkø vektorius,
#     labels -- loginis arba padalinimo taðkø pavadinimø vektorius.

# Naudojant grafinius parametrus xaxt ir yaxt galima uþdrausti braiþyti vienà ar 
# abi grafiko aðis. Ið karto abi aðis galima uþdrausti per loginá parametrà axes.

curve(sin, -pi, pi, axes = FALSE)

# Standartines aðis grafikui galima atstatyti vien tik nurodþius parametrà side.
# Èia parametro reikðmë 1 nurodo, kad aðis bus apaèioje, o 2 --- kairëje pusëje.
# Kadangi side yra pirmas f-jos axes parametras, jo vardo galima neraðyti.

axis(1)
axis(2)

# Sinusoidës grafike Ox aðá natûraliau sudalinti ne kas vienetà, taèiau kas pi/2. 
# Sudalinimo taðkø vektoriø sudarysime su funkcija seq ir priskirsime parametrui 
# at.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, at = seq(-pi, pi, by = pi/2))


# Matome, kad aðies padalinimo taðkuose uþraðytos teisingos reikðmës, taèiau jos
# dël savo uþraðymo pavidalo nelabai informatyvios. Ðiuo atveju galima iðnaudoti
# funkcijà expression ir tas reikðmes uþraðyti per skaièiø pi. Taip bus graþiau.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")

Ox.tas <- seq(-pi, pi, by = pi/2)
Ox.pav <- expression(-pi, -pi/2, 0, pi/2, pi)

axis(1, at = Ox.tas, labels = Ox.pav)


# Reikðmës gali bûti suraðytos nebûtinai ties kiekvienu aðies padalinimo taðku.
# Tokiu atveju parametrui label priskiriame vektoriø su praleistomis reikðmëmis.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")

Ox.tas <- seq(-pi, pi, by = pi/4)
Ox.pav <- expression(-pi, NA, -pi/2, NA, 0, NA, pi/2, NA, pi)

axis(1, at = Ox.tas, labels = Ox.pav)


# Toje paèioje pozicijoje galima pridëti kelias aðis. Kiekviena aðis gali turëti
# savo padalinimo taðkus ir jø pavadinimus.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")

Ox.tas <- seq(-pi, -pi/4, by = pi/4)
Ox.pav <- expression(-pi, -3*pi/4, -pi/2, -pi/4)

axis(1, at = Ox.tas, labels = Ox.pav)
axis(1, at = seq(0, 3, by = 0.5), labels = c(0, NA, 1, NA, 2, NA, 3))


# Dar vienas pavyzdys, kaip toje paèioje pozicijoje atidedamos 2 skirtingos aðys.
# Viena ið jø padalina aðá á intervalus, o kita --- tø intervalø viduryje uþdeda
# jø pavadinimus. Todël pirmoje aðyje neraðomi sudalinimo taðkai, o antroje nëra
# aðies linijos.

curve(sin, -pi, pi, axes = FALSE, ann = FALSE)

Ox.ta1 <- seq(-pi, pi, pi/2)
Ox.ta2 <- seq(-3*pi/4, 3*pi/4, pi/2)

axis(1, at = Ox.ta1, labels = FALSE)
axis(1, at = Ox.ta2, labels = LETTERS[1:4], tick = FALSE)

abline(v = Ox.ta1, lty = 2, col = "gray")


# Funkcija axis turi ir daugiau parametrø, kuriais galima nustatyti bendrà aðies 
# arba atskirø jos daliø vaizdà:
# 
#       tick -- loginis, nurodo ar braiþyti aðies linijà,
#       line -- eilutës, kurioje braiþoma aðis, numeris,
#        pos -- koordinatë, ties kuria nubrëþiama aðis, 
#       hadj -- nustato aðies uþraðø poslinká horizontaliai,
#       padj -- nustato aðies uþraðø poslinká vertikaliai,
#        lty -- linijos tipas: 0 -- nebraiþoma, 1 -- iðtisinë ir taip iki 7,
#        lwd -- linijos storis,
#        col -- linijos spalva,
#  lwd.ticks -- padalijimo brûkðneliø storis,
#  col.ticks -- padalijimo brûkðneliø spalva.

# Kartais grafike uþraðai ant aðies nereikalingi. Tokiu atveju parametrui labels 
# priskiriame reikðmæ FALSE.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, labels = FALSE)

# Galima ir prieðinga situacija, kai aðies linija nereikalinga, o reikalingi tik 
# aðies padalijimo taðkø uþraðai. Tada parametrui tick priskiriame reikðmæ FALSE.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, tick = FALSE)

# Toká patá efektà galima pasiekti ir naudojant linijos tipo parametrà lty. Ðiam
# parametrui priskyrus nulinæ reikðmæ, aðis ið viso nebraiþoma.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, lty = 0)


# Paprastai aðys braiþomos uþ funkcijos grafiko ar kitokios diagramos ribø, t.y. 
# paraðtëse. Paraðtës eilutës, kurioje atidedama aðis, numerá nurodome naudojant 
# parametrà line. Pagal nutylëjimà aðis braiþoma nulinëje eilutëje. 

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, line = 0)
axis(1, line = 2)

# Aðies pozicijà grafike galima nurodyti uþraðant kitos aðies kirtimo koordinatæ.
# Tam naudojamas parametras pos.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, pos = -0.5)
axis(1, pos =  0.5)


# Uþraðus ties aðies padalinimo taðkais galima pastumti á kairæ arba deðinæ. Tam
# naudojamas parametras hadj. Pagal nutylëjimà jam priskiriama reikðmë 0.5, kuri
# reiðkia, kad uþraðai ties padalinimo taðkais centruojami. Didinant ðià reikðmæ,
# uþraðai pastumiami á kairæ. Jei uþraðus ties padalinimo taðkais reikia pakelti 
# virð aðies linijos arba nuleisti dar þemiau, naudojamas parametras padj.

# Pavyzdþiui, nubraiþysime sinusoidës grafikà, kuriame Ox aðis Oy aðá kertà ties
# nuliu. Galime pastebëti, kad funkcijos grafikas kerta kairájá padalinimo taðkø
# uþraðà. Ðá grafiko defektà galima iðtaisyti dviem bûdais: arba nerodyti uþraðo 
# "-3", arba já pakelti virð aðies. Antruoju atveju naudojamas parametras padj.
# Jam priskiriame visø uþraðø ties padalinimo taðkais postûmio reikðmiø vektoriø.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, pos = 0, at = -3:3, labels = c(NA, -2:3))

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, pos = 0, padj = c(-4, rep(0, 6)))


# NAUDINGA ------------------------------

# Ne visi grafikai turi áprastas koordinaèiø aðis. Pvz., stulpelinëje diagramoje 
# svarbiausia yra stulpeliø aukðtis, o stulpeliai ant tiesës gali bûti iðdëstyti 
# bet kokia tvarka - nuo to ið esmës niekas nesikeièia. Pavyzdþiui, nubraiþysime
# Titaniko keleiviø pasiskirstymo pagal lytá skirtingose keleiviø klasëse daþniø
# diagramà.

d <- margin.table(Titanic, c(2, 1))
d

barplot(d)

# Uþraðus po kategorijø stulpeliais galima keisti parametrui names.arg priskyrus 
# kità reikðmiø vektoriø. 

barplot(d, names.arg = c("Pirma", "Antra", "Treèia", "Águla"))

# Parametrui axes priskyrus reikðmæ FALSE, dingsta tik Oy aðis, o uþraðai ant Ox 
# aðies iðlieka. Galima sakyti, kad stulpelinë diagrama formaliai turi tik vienà 
# Oy aðá, kadangi Ox aðis pagal nutylëjimà ið viso nebraiþoma.

barplot(d, axes = FALSE)

# Stulpelinës diagramos Ox aðies linijos tipà reguliuoja parametras axis.lty. Jo
# reikðmë pagal nutylëjimà lygi nuliui. Priskyrus vienetà, aðis jau bus braiþoma.

barplot(d, axis.lty = 1)

# Uþraðø ant Ox aðies rodymas priklauso nuo loginio parametro axisnames reikðmës.
# Jei ji lygi FALSE, nepriklausomai nuo to, kam lygi parametro axis.lty reikðmë,
# Ox aðis nebraiþoma visai.

barplot(d, axisnames = FALSE)

# Þinoma, aðis galima uþdrausti ir naudojant standartinius grafinius parametrus 
# xaxt ir yaxt.

barplot(d, xaxt = "n")
barplot(d, yaxt = "n")


# Naudojant standartinius funkcijos axis nustatymus, nubraiþyti tokià pat Ox aðá
# nepavyksta. Tuo galima nesunkiai ásitikinti.

barplot(d, axisnames = FALSE)
axis(1)

# Problema tame, kad stulpeliø centrai nesutampa su aðies Ox padalinimo taðkais. 
# Ðioje situacijoje galima pasinaudoti tuo, kad f-ja barplot gali iðsaugoti visø
# stulpeliø centrø koordinates, kurias vëliau galima panaudoti aðies sudalinimui.

barstat <- barplot(d, axisnames = FALSE)
barstat

axis(1, at = barstat)


# Kadangi stulpelinëje diagramoje skaièiai ant kategorinio kintamojo aðies nieko 
# nereiðkia, juos pakeisime á kategorijø pavadinimus, o aðies linijà uþdrausime.

barstat <- barplot(d, axisnames = FALSE)
axis(1, at = barstat, labels = c("Pirma", "Antra", "Treèia", "Águla"), tick = F)


# UÞDUOTIS ------------------------------ 

# 1. Nubraiþykite funkcijos y = sin(x) grafikà intervale [-pi, pi]. Grafike turi
#    bûti dvi Ox aðys: apaèioje sugraduota kas pi/2, o virðuje kas vienetà.
# 2. Nubraiþykite lentelës airquality kintamojo Temp kitimo laike grafikà, kuris
#    turëtø dvi Oy aðis. Vienoje ið jø temperatûra matuojama Farenheito skalëje, 
#    kitoje -- pagal Celsijø.
# 3. Nubraiþykite daþniø lentelës d stulpelinæ diagramà be Oy aðies ir be uþraðø
#    ant Ox aðies. Tam naudokite tik standartinius funkcijos barplot parametrus.
# 4. Nubraiþykite daþniø lentelës d stulpelinæ diagramà su parametru beside = T.
#    Gaunamos keturios grupës po 2 stulpelius, kurie rodo vyrø ir moterø skaièiø. 
#    Grafikà pakeiskite taip, kad po kiekvienu stulpeliu bûtø paraðyta lytis, o
#    dar þemiau bûtø uþraðytas kategorijos, kuriai priklauso kiekviena stulpeliø 
#    pora, pavadinimas.
# 5. Nubraiþykite kintamojo Nile histogramà. Ant Ox aðies turi bûti paþymëti tik
#    stulpeliø vidurio taðkai, kurie korektiðkai atidedami nepriklausomai nuo to,
#    kiek stulpeliø yra histogramoje.
# 6. Nubraiþykite lentelës airquality kintamojo Temp kitimo laike grafikà. Aðies
#    Ox sudalinimo taðkai turi sutapti su vieno mënesio pradþia ir kito pabaiga.
#    Ties sudalinimo taðkais ant grafiko nubraiþykite vertikalias pilkas linijas, 
#    o tarpuose tarp padalinimo taðkø uþraðykite atitinkamo mënesio pavadinimà.


# --------------------------------------- #
# AÐIES PADALIJIMO TAÐKØ RADIMAS          #
# --------------------------------------- #

# Nubraiþyto grafiko aðiø padalinimo taðkus galima gauti naudojant f-jà axTicks. 
# Jos rezultatas yra padalinimo taðkø koordinaèiø vektorius. Paprastai naudojami 
# ðie funkcijos parametrai:
#
#       side -- aðies pozicija: 1 apaèioje, 2 kairëje, 3 virðuje, 4 deðinëje,
#        axp -- aðies ribø ir intervalø skaièiaus vektorius c(min, max, k),
#        usr -- grafiko ribø vektorius c(xmin, xmax, ymin, ymax),
#        log -- jei TRUE, tai nurodo, kad aðis logaritminëje skalëje.

# Pavyzdþui, nubraiþysime funkcijos y = sin(x) grafikà be aðiø. Nustatysime, kam 
# lygios aðies Ox sudalijimo taðkø koordinatës, kurios bûtø naudojamos, jei aðis 
# bûtø braiþoma.

curve(sin, -pi, pi, axes = FALSE)
axTicks(1)

# Aðies padalijimo taðkø vektorius priklauso nuo grafiko. Norint, kad rezultatas
# nepriklausytø nuo konkretaus grafiko, reikia nurodyti visø parametrø reikðmes.
# Pavyzdþiui, apskaièiuosime intervalo nuo 5 iki 20, padalijimo á 6 lygias dalis 
# taðkø koordinates, kai viso grafiko ribos pagal Ox aðá nustatytos nuo 0 iki 25.

axTicks(side = 1, axp = c(5, 20, 6), usr = c(0, 25, -10, 10), log = FALSE)

# Tokiø koordinaèiø vektoriø galima panaudoti automatiniam grafiko padalinimui á 
# sektorius pagal aðies sudalinimo taðkus. Pavyzdþiui, nubraiþysim laiko eilutës 
# grafikà ir já padalinsime á keletà laiko intervalø.

plot(Nile)
abline(v = axTicks(1), col = "red")


# Negrieþtam intervalo sudalijimui lygiomis dalimis naudojama funkcija axisTicks. 
# Funkcijos rezultatas yra intervalo sudalijimo lygiomis dalimis taðkø vektorius.
# Tam, kad taðkø koordinatës bûtø tam tikra prasme "graþios", pradinio intervalo 
# galai ir padalijimo taðkø skaièius gali bûti automatiðkai ðiek tiek pataisyti. 
# Funkcijos parametrai:
#
#        usr -- grafiko ribø pagal vienà aðá vektorius c(min, max),
#        log -- jei TRUE, tai nurodo, kad aðis logaritminëje skalëje,
#        axp -- aðies ribø ir intervalø skaièiaus vektorius c(min, max, k),
#       nint -- pageidaujamas intervalø daliø skaièius.

# Pavyzdþiui, lygiomis dalimis sudalinsime intervalà [-5, 15]. Jei intervalø sk.
# nenurodome, jis parenkamas automatiðkai. Matome, kad nedaug pakeitus intervalo 
# galus, funkcijos rezultatas nepasikeièia - gaunami tie patys sudalinimo taðkai.

axisTicks(usr = c(-5.0, 15.0), log = FALSE)
axisTicks(usr = c(-5.3, 15.9), log = FALSE)

# Nurodþius intervalo daliø skaièiø, á pageidavimus atsiþvelgiama tik ið dalies.

axisTicks(usr = c(-5, 15), log = FALSE, nint = 4)
axisTicks(usr = c(-5, 15), log = FALSE, nint = 5)
axisTicks(usr = c(-5, 15), log = FALSE, nint = 6)
axisTicks(usr = c(-5, 15), log = FALSE, nint = 7)


# --------------------------------------- #
# RËMELIO IR TINKLELIO BRAIÞYMAS          #
# --------------------------------------- #

# Kai kurios aukðto lygio grafinës funkcijos grafikà apriboja rëmeliu. Paprastai 
# toks rëmelis visiðkai nereikalingas. Parametrui frame priskyrus reikðmæ FALSE, 
# rëmelis nebus braiþomas. Palyginsime keletà tipiniø grafikø su rëmeliu ir be. 

curve(sin, -pi, pi)
curve(sin, -pi, pi, frame = FALSE)

plot(Nile)
plot(Nile, frame = FALSE)

boxplot(Temp ~ Month, data = airquality)
boxplot(Temp ~ Month, data = airquality, frame = FALSE)


# Globaliai rëmelio braiþymà arba nebraiþymà reguliuoja grafinis parametras bty.
# Pagal nutylëjimà jo reikðmë lygi "o". Jei reikia, kad rëmelis bûtø nebraiþomas
# visuose grafikuose, parametrui bty priskiriame reikðmæ "n".

par("bty" = "n")

curve(sin, -pi, pi)
plot(Nile)
boxplot(Temp ~ Month, data = airquality)

par("bty" = "o")


# Jei parametrui bty reikðmë priskiriama kaip grafinës funkcijos argumentui, tai
# jo poveikis pasireiðkia tik tos funkcijos sudarytam grafikui. Pavyzdþiui, taip
# galima vienai konkreèiai funkcijai uþdrausti braiþyti rëmelá.

curve(sin, -pi, pi)
curve(sin, -pi, pi, bty = "n")


# Rëmeliui ant jau nubraiþyto grafiko uþdëti naudojama funkcija box. Pavyzdþiui, 
# histograma braiþoma be rëmelio, bet já galima uþdëti papildomai.

hist(Nile)
box()

# Kaip ir kitoms funkcijoms, funkcijai box kaip argumentà galima perduoti bendro 
# pobûdþio grafiniø parametrø reikðmes. Pvz., galima pakeisti rëmelio spalvà.

hist(Nile)
box(col = "red")


# Koordinaèiø tinklelis ant jau nubraiþyto grafiko uþdedamas naudojant f-jà grid. 
# Jos parametrai:
#
#         nx -- tinklelio langeliø skaièius ant Ox aðies, 
#         ny -- tinklelio langeliø skaièius ant Oy aðies,
#        col -- tinklelio linijø spalva, 
#        lty -- tinklelio linijø tipas: 1 -- iðtisinë, 2 -- punktyras ir t.t.,
#        lwd -- tinklelio linijø storis.

# Pagal nutylëjimà parametrø nx ir ny reikðmës yra NULL, todël tinklelio linijos 
# sutampa su aðiø padalijimo taðkais, kurie bûtø gauti su f-ja axTicks. 

curve(sin, -pi, pi)
grid()

curve(sin, -pi, pi)
grid(nx = 2, ny = 2)

# Jei parametrui nx arba ny priskiriama reikðmë NA, tinklelio linijos atitinkama
# kryptimi nebraiþomos.

curve(sin, -pi, pi)
grid(nx = NA, ny = NULL)

# Jei kitaip nenurodyta, braiþomos ðviesiai pilkos "lightgray" taðkinës "dotted"
# linijos. Þinoma, ðiø parametrø reikðmes galima pakeisti.

curve(sin, -pi, pi)
grid(col = "red", lty = 2)


# NAUDINGA ------------------------------

# Rëmelio ribos priskiriamos grafiniam parametrui usr. Jo reikðmë -- koordinaèiø 
# c(xmin, xmax, ymin, ymax) vektorius. Turint jau nubraiþytà grafikà, jas galima 
# gauti naudojant funkcijà par.

hist(Nile)

ribos <- par("usr")
ribos

# Turint tokias koordinates, rëmelá ant grafiko galima uþdëti naudojant funkcijà
# abline. Tam reikia nubraiþyti dvi vertikalias ir dvi horizontalias linijas.

abline(v = ribos[1:2], h = ribos[3:4])


# Funkcijos grid galimybës gan ribotos, todël tinklelio braiþymui galima naudoti 
# funkcijà abline. Pavyzdþiui, nubraiþysime sinusoidës grafikà, kuriame Ox aðies 
# sudalinimo taðkai kas pi/2, o tinklelio linijos dvigubai tankesnës -- kas pi/4.

curve(sin, -pi, pi, xaxt = "n")

axis(1, at = seq(-pi, pi, pi/2), labels = expression(-pi, -pi/2, 0, pi/2, pi))

abline(v = seq(-pi, pi, pi/4), col = "lightgray", lty = "dotted")
abline(h = seq(-1., 1., 0.25), col = "lightgray", lty = "dotted")


# Tinklelis nebûtinai turi bûti tolygus. Pvz., nubraiþysime eksponentës grafikà,
# kuriame tarpai tarp vertikaliø tinklelio linijø taip pat eksponentiðkai didëja.

curve(exp, 0, 4)
abline(v = exp(0:30/10) - 1, col = "gray")


# Tinklelá galima nubraiþyti ir gana egzotiðku bûdu. Galima pasinaudoti tuo, kad
# aðies padalijimo brûkðneliø ilgá galima iðreikðti per grafiko ilgá arba plotá. 
# Jeigu parametrui tck priskiriame reikðmæ 1, tai brûkðnelio ilgis, priklausomai 
# aðies, sutampa su viso grafiko aukðèiu arba ploèiu.

curve(sin, -pi, pi)
axis(1, tck = 1, col.ticks = "lightgray", lty = "dotted")
axis(2, tck = 1, col.ticks = "lightgray", lty = "dotted")


# UÞDUOTIS ------------------------------ 

# 1. Nubraiþykite daþniø lentelës d stulpelinæ diagramà. Papildomai uþdëkite jai
#    rëmelá, taèiau taip, kad aukðèiausias stulpelis su rëmeliu nesiliestø.
# 2. Nubraiþykite funkcijos y = x*sin(x) grafikà intervale [0, 5pi]. Suformuokit
#    toká tinklelá, kur vertikalios ir horizontalios linijos eitø per funkcijos
#    lokaliø minimumø ir maksimumø taðkus.
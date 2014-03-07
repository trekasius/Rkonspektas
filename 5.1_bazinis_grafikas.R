
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Funkcija plot ir pagrindiniai jos parametrai.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2014-02-26 | 2014-03-06
#


# TURINYS -------------------------------

#
#   1. Funkcija plot ir pagrindiniai jos parametrai:
#      * parametrai x ir y 
#      * parametras type 
#      * parametras pch 
#      * parametras cex 
#      * parametras lty 
#      * parametras lwd 
#      * parametras col 
#
#   2. Papildomi funkcijos plot parametrai:
#      * parametrai main ir sub 
#      * parametrai xlab ir ylab
#      * parametrai xlim ir ylim
#      * parametras asp 
#      * parametras ann 
#      * parametras frame 
#      * parametras axes 
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
# FUNKCIJA PLOT IR JOS PARAMETRAI         #
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
#   plot.function   --  ávairiø funkcijø grafikø braþymui,
#   plot.data.frame --  skaitiniø duomenø lenteliø atvaizdavimui,
#   plot.table      --  daþniø ir kryþminiø daþniø lenteliø atvaizdavimui,
#   plot.histogram  --  histogramos braiþymui,
#   plot.ts         --  laiko eilutës grafiko braiþymui,
#   plot.ecdf       --  empirinës pasiskirstymo funkcijos braiþymui,
#   plot.dendrogram --  dendrogramos atvaizdavimui,
#   plot.lm         --  diagnostiniø tiesinio modelio grafikø braiþymui,
#   plot.density    --  tankio funkcijos áverèio braiþymui.

# Visus funkcijos plot metodus galima suþinoti naudojant funkcijà methods.
methods(plot)


# Pradþioje susipaþinsime su plot.default medodu, kuris naudojamas tais atvejais, 
# kai sudaroma taðkø su koordinatëmis x ir y sklaidos diagrama. Pagrindiniai jos
# parametrai:
# 
#      x -- x reikðmiø vektorius (abscisë),
#      y -- y reikðmiø vektorius (ordinatë).
#
# Diagramos iðvaizdà galima pakeisti nurodant kitas grafiniø parametrø reikðmes. 
# Daþniausiai naudojami ðie parametrai:
#
#   type -- sklaidos diagramos tipas,
#    pch -- taðko simbolis,
#    cex -- taðko simbolio dydis,
#    lty -- linijos tipas,
#    lwd -- linijos storis,
#    col -- taðko arba linijos spalva.


# Nubraiþysime paprastà taðkø (x, y) sklaidos diagramà. Ðiuo atveju vektoriaus y 
# elementai yra tam tikros funkcijos y = f(x) reikðmës taðkuose x.

x <- -5:15
y <- x^3 - 10*x^2 - 10*x + 3

# Parametrams x ir y priskirsime kintamuosius x ir y. Jei parametrø pavadinimai
# nurodomi, reikðmes jiems galima priskirti bet kokiu eiliðkumu.

plot(x = x, y = y)
plot(y = y, x = x)

# Jei parametrai suraðomi nustatyta tvarka, tai jø pavadinimø galima ir neraðyti. 

plot(x, y)


# Pademonstruosime, kaip, keièiant parametro type reikðmæ, gaunami kiti sklaidos
# diagramos variantai. Vienas nuo kito jie skiriasi taðkø (x, y) atvaizdavimo ir 
# jø sujungimo bûdais.

plot(x, y, type = "p")       # diagramoje atidedami nesujungti taðkai
plot(x, y, type = "l")       # nubraiþoma taðkus jungianti lauþtë
plot(x, y, type = "b")       # taðkai sujungiami tiesës atkarpomis
plot(x, y, type = "o")       # braiþomi ir taðkai, ir juos jungianti lauþtë
plot(x, y, type = "s")       # braiþoma laiptuota lauþtë I
plot(x, y, type = "S")       # braiþoma laiptuota lauþtë II
plot(x, y, type = "h")       # taðkuose x atidedami y aukðèio stulpeliai

plot(x, y, type = "n")       # suformuojamas grafikas be taðkø


# Keièiant parametro pch reikðmæ, galima nurodyti, kokiu simboliu ðioje sklaidos 
# diagramoje bus vaizduojamas taðkas. Sveikieji skaièiai nuo 0 iki 25 þymi spec.
# daugiausiai naudojamus simbolius, skaièiai nuo 32 iki 127 þymi ASCII simbolius.
# Be to, parametro pch reikðmë gali bûti ir bet koks kabutëse áraðytas tekstinis 
# simbolis.

plot(x, y)

plot(x, y, pch = 1)          # pagal nutylëjimà naudojamas tuðèias taðkas
plot(x, y, pch = 19)         # tokio pat dydþio, taèiau uþpildytas taðkas
plot(x, y, pch = "*")        # taðko simbolis gali bûti nurodomas kabutëse
plot(x, y, pch = ".")        # taðko simbolis gali bûti ir paprastas taðkas


# Diagramos taðko simbolio dydis priklauso nuo mastelio parametro cex reikðmës. 
# Pagal nutylëjimà ði reikðmë lygi 1 ir tai atitinka standartiná simbolio dydá.

plot(x, y, cex = 1)          # standartinis bet kokio taðko simbolio dydis
plot(x, y, cex = 2)          # du kartus padidintas taðkas
plot(x, y, cex = 0.5)        # du kartus sumaþintas taðkas


# Keièiant parametro lty reikðmæ, galima keisti taðkus jungianèios linijos tipà:
# "blank", "solid", "dashed", "dotted", "dotdash", "longdash", "twodash". Ðiuos
# linijos tipus atitinka sveikieji skaièiai nuo 0 iki 6.

plot(x, y, type = "l", lty = 1)   # taðkai jungiami iðtisine linija
plot(x, y, type = "l", lty = 2)   # taðkai jungiami punktyrine linija
plot(x, y, type = "l", lty = 3)   # taðkai sujungiami taðkine linija


# Keièiant parametro lwd reikðmæ, keièiamas diagramos taðkus jungianèios linijos 
# storis. Pagal nutylëjimà ðio parametro reikðmë lygi 1.

plot(x, y, type = "l", lwd = 1)   # standartinis linijos storis
plot(x, y, type = "l", lwd = 2)   # dvigubas linijos storis


# Diagramos taðkø ir juos jungianèiø linijø spalva nustatoma naudojant parametrà
# col, kurio reikðmë yra spalvos pavadinimas. Standartiniø R spalvø sàraðas toks: 

colors()

# Vietoje spalvø pavadinimø galima naudoti spalvø numerius tam tikroje paletëje. 
# Pagal nutylëjimà naudojama paletë turi 8 pagrindines spalvas, todël parametro
# col reikðmë 1 ðioje paletëje atitinka spalvà "black", reikðmë 2 - spalvà "red" 
# ir t.t. Kitoje spalvø paletëje tie patys numeriai gali reikðti kitas spalvas!

palette()

plot(x, y, col = "black")
plot(x, y, col = "red")

plot(x, y, col = 1)
plot(x, y, col = 2)


# Naudojant parametrà bg, simboliams su numeriais nuo 21 iki 25 galima nurodyti 
# uþpildymo spalvà. Kaip ir anksèiau, tam galima naudoti spalvos numerá paletëje.

plot(x, y, pch = 21, col = 2)     # simbolio kontûro spalva
plot(x, y, pch = 21,  bg = 2)     # simbolio uþpildymo spalva


# NAUDINGA ------------------------------

# Sklaidos diagramoje kiekvienas taðkas gali bûti vaizduojamas vis kitu simboliu.
# Tam parametrui pch reikia nurodyti simboliø vektoriø. Jei jo elementø skaièius
# maþesnis negu diagramos taðkø skaièius, taðko simboliai cikliðkai pakartojami. 
# Pavyzdþiui, nubraiþysime sklaidos diagramà naudojant du pasikartojanèius taðko 
# simbolius.

plot(x, y, pch = 1:2)

# Taðko simbolius nurodantys numeriai nebûtinai turi eiti ið eilës, todël galima
# sudaryti bet koká parametro reikðmiø vektoriø.

plot(x, y, pch = c(1, 13))

# Taðkus sklaidos diagramoje galima pavaizduoti net ir raidëmis.

plot(x, y, pch = letters)


# Keletos reikðmiø vektoriø galima nurodyti ir kitiems parametrams. Pavyzdþiui,
# visi diagramos taðkai gali bûti skirtingø dydþiø ir spalvø. Vienu metu galima 
# keisti ið karto keliø parametrø reikðmes.

plot(x, y, pch = 22, cex = 1:3, col = 1:3)
plot(x, y, pch = 22, cex = 1:3,  bg = 1:3)


# Grafinius diagramos taðko parametrus galima kontroliuoti panaudojant papildomà
# kintamàjá. Tokiu bûdu kiekvieno taðko dydis arba spalva keisis proporcingai to
# kintamojo reikðmëms. Jei tas papildomas kintamasis yra kategorinis, tai galima 
# vizualiai atskirti skirtingas to kintamojo reikðmes atitinkanèius taðkus.

# Pavyzdþiui, nubraiþysime diagramà, kur neigiamà y koordinatæ turintys taðkai
# bus atvaizduojami kita spalva. Tam sukursime papildomà kategoriná kintamàjá ir
# já priskirsime spalvos parametrui col.

plot(x, y, pch = 20, col = factor(y < 0))


# UÞDUOTIS ------------------------------ 

# 1. Nubraiþykite funkcijos v = sin(u) grafikà intervale [-pi, pi]. Grafike turi
#    bûti pavaizduoti: a) nesujungti taðkai (u, v), b) iðtisinë linija be taðkø, 
#    c) taðkai ir juos jungianti mëlyna punktyrinë linija.
# 2. Nubraiþykite taðkø su koordinatëmis (x, y) sklaidos diagramà, kurioje taðko 
#    simbolio dydis bûtø proporcingas koordinatës x reikðmei. Proporcingumo koef.
#    galima pasirinkti laisvai.
# 3. Nubraiþykite tokià taðkø su koordinatëmis (x, y) sklaidos diagramà, kurioje
#    ant visus taðkus jungianèios kreivës bûtø pavaizduoti tik tie taðkai, kuriø  
#    koordinatë y < 0.
# 4. Ið failo "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_1b.dat" 
#    nuskaitykite duomenø lentelæ. Nubraiþykite: a) ðios lentelës kintamøjø x ir 
#    y sklaidos diagramà, b) diagramà, kurioje taðkø (x, y) spalva priklauso nuo
#    tos paèios lentelës kintamojo z reikðmës.


# --------------------------------------- #
# PAPILDOMI FUNKCIJOS PLOT PARAMETRAI     #
# --------------------------------------- #

# Funkcija plot turi papildomø parametrø, kurie nustato diagramos aðiø ir bendrà
# grafiko antraðtæ, nustato atskirø aðiø atraðtes, keièia aðiø ribas arba kitaip
# formuoja grafiko iðvaizdà. Èia daþniausiai naudojami tokie parametrai:
#
#   main -- bendra diagramos antraðtë, 
#    sub -- papildoma antraðtë,
#   xlab -- aðies Ox antraðtë,
#   ylab -- aðies Oy antraðtë,
#   xlim -- aðies Ox reikðmiø kitimo ribos, vektorius c(x1, x2),
#   ylim -- aðies Oy reikðmiø kitimo ribos, vektorius c(y1, y2),
#    asp -- nustatomas grafiko y/x kraðtiniø santykis,
#    ann -- jei FALSE, grafikas rodomas be antraðèiø,
#  frame -- jei FALSE, grafikas braiþomas be rëmelio,
#   axes -- jei FALSE, grafikas braiþomas be aðiø.


# Pagrindinë grafiko antraðtë suformuojama naudojant parametrà main. Jo reikðmë
# yra á kabutes áraðytas antraðtës tekstas, kuris uþraðomas virðutinëje grafiko 
# dalyje. Parametrui galima priskirti ir kintamàjá su antraðtës tekstu.

plot(x, y, main = "Kintamøjø x ir y sklaidos diagrama")

# Naudojant naujos eilutës simbolá \n, labai ilgà antraðtæ galima uþraðyti per
# kelias eilutes. Ðiuo atveju antraðtës tekstas priskirtas atskiram kintamajam.

antraðtë <- "Per dvi eilutes uþraðytas\n labai ilgas grafiko pavadinimas"
plot(x, y, main = antraðtë)

# Parametras sub naudojamas papildomai antraðtei, kuri raðoma grafiko apaèioje.

plot(x, y, sub = "Papildoma antraðtë")


# Be papildomø nustatymø aðiø Ox ir Oy pavadinimai sutampa su parametrams x ir y 
# priskirtø kintamøjø vardais. Jiems pakeisti naudojami parametrai xlab ir ylab. 

plot(x, y)

plot(x, y, xlab = "x", ylab = "y = f(x)")

# Parametrams xlab ir ylab priskyrus kabutëse áraðytà tarpo simbolá, pavadinimai
# ant aðiø bus nematomi. 

plot(x, y, xlab = "", ylab = "")


# Pagal nutylëjimà aðiø Ox ir Oy ribos nustatomos automatiðkai ir jos parenkamos 
# taip, kad diagramoje bûtø atvaizduoti visi taðkai (x, y). Jei tas ribas reikia
# padidinti arba sumaþinti, naudojami parametrai xlim ir ylim. Pavyzdþiui, jeigu
# aðies Ox reikðmiø kitimo ribos turi bûti [a, b], tai parametrui xlim nurodomas
# vektorius c(a, b).

# Ið pradþiø nustatysime, kokiose ribose kinta taðkø (x, y) koordinatës x ir y. 
# Vektoriaus elementø ágyjamø reikðmiø ribos nustatomos naudojant komandà range.

range(x)
range(y)

# Galima parodyti, kad parametrams xlim ir ylim nustaèius tokias ribas, gaunamas
# grafikas nesiskiria nuo automatiðkai sudaromo grafiko. 

plot(x, y)
plot(x, y, xlim = range(x), ylim = range(y))

# Parametrams xlim ir ylim nurodomos ribos gali bûti ir platesnës, ir siauresnës. 
# Tokiu bûdu aðies reikðmiø ribas galima apriboti ir parodyti tik dalá diagramos 
# taðkø. Pavyzdþiui, diagramoje nerodysime taðkø (x, y), kuriø koordinatë y < 0.

plot(x, y, ylim = c(0, 1000), type = "b")

# Pavyzdþiui, iðplësime aðies Ox reikðmiø ribas nuo [-5, 15] iki [-10, 30].

plot(x, y, xlim = c(-10, 30))

# Jeigu parametrui nurodomos tokios ribos [a, b], kad a > b, tai atitinkama aðis 
# grafike nukreipiama á prieðingà pusæ. Pavyzdþiui, diagramoje apsuksime aðá Ox.

plot(x, y, xlim = c(30, -10))


# Bet kokios diagramos ar funkcijos grafiko iðvaizda priklauso nuo aðiø Ox ir Oy 
# mastelio. Keièiant grafinio lango dydá, keièiasi ir grafiko kraðtiniø santykis,
# todël iðtemptas ar suspaustas grafikas atrodo skirtingai. Naudojant parametrà 
# asp, kraðtiniø santyká y/x galima uþfiksuoti.

plot(x, y)
plot(x, y, asp = 1/50)
plot(x, y, asp = 1/200)


# NAUDINGA ------------------------------

# Naudojant parametrà ann, galima uþdrausti rodyti visas diagramos antraðtes ið 
# karto, net jei jos ir yra nustatytos atitinkamais parametrais.

plot(x, y, main = "Diagramos antraðtë", xlab = "x", ylab = "f(x)")
plot(x, y, main = "Diagramos antraðtë", xlab = "x", ylab = "f(x)", ann = FALSE)

# Naudojant parametrà frame, galima nuimti grafiko rëmelá. Grafiko aðys iðlieka.

plot(x, y, frame = FALSE)

# Naudojant parametrà axes, galima nurodyti, kad grafikas bûtø braiþomas be aðiø.
# Tokiu atveju nelieka ir rëmelio, taèiau iðlieka grafiko aðiø pavadinimai.

plot(x, y, axes = FALSE)


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite komandà, kuri taðkø (x, y) sklaidos diagramoje aðies Ox ribas 
#    automatiðkai praplëstø: a) po 10 vnt. á abi puses, b) po 10 % á abi puses.
# 2. Nubraiþykite taðkø (x, y) sklaidos diagramà, kurioje bûtø atvaizduoti tik
#    patys taðkai, bet nebûtø nei aðiø, nei aðiø pavadinimø, nei kitø antraðèiø. 

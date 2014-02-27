
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Vektoriaus elementø iðrikiavimas ir duomenø lenteliø pertvarkymai.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-09-09 | 2013-09-22
#


# TURINYS -------------------------------

#
#   1. Vektoriø ir duomenø lenteliø iðrikiavimas:
#      * funkcija rev
#      * funkcija sort
#      * funkcija order
#
#   2. Duomenø lenteliø pertvarkymas:
#      * funkcija stack
#      * funkcija unstack
#      * funkcija reshape
#


# PASTABOS ------------------------------

#
# Átraukti funkcijas rank ir xtfrm.
# Sugalvoti uþdaviniø su funkcija reshape.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# VEKTORIAUS REIKÐMIØ RIKIAVIMAS          #
# --------------------------------------- #

# Prieð atliekant statistinæ duomenø analizæ, turimus duomenis daþniausiai tenka 
# sutvarkyti ir suteikti jiems tam tikrà standartinæ formà, kuri leidþia taikyti
# standartines statistines procedûras. Analizuojant gautus rezultatus, juos taip
# pat daþniausiai reikia pertvarkyti, iðrikiuoti, agreguoti ir t.t.

# Vektoriaus elementø iðrikiavimui prieðinga tvarka naudojama funkcija rev.
x <- c(7.7, 3.8, -0.5, 5.3, 8.9, 1.5, -3.2, 4.1, -1.4, -4.7)

rev(x)


# Vektoriaus reikðmiø iðrikiavimui nemaþëjimo arba nedidëjimo tvarka naudojama 
# funkcija sort. Jos parametrai:
# 
#          x -- vektorius,
# decreasing -- pagal nutylëjimà FALSE, nurodo rikiavimo tvarka,
#    na.last -- pagal nutylëjimà NA, gali bûti TRUE arba FALSE arba.

# Pagal nutylëjimà skaitinio vektoriaus elementai iðrikiuojami nemaþëjimo tvarka.

sort(x)

# Statistikoje taip gaunama imties variacinë eilutë, kurios i-asis elementas yra
# vadinamas i-àjà pozicine statistika. Pavyzdþiui, 1-oji pozicinë statistika yra
# imties minimumas. Uþraðysime pirmosios pozicinës statistikos nustatymo komandà 
# funkcinio programavimo stiliumi.

sort(x)[1]


# Rikiuojant nedidëjimo tvarka, parametro decreasing reikðmë pakeièiama á TRUE.
sort(x, decreasing = TRUE)

# Rikiuojant vektoriø su praleistomis reikðmëmis, jos pagal nutylëjimà iðmetamos.
y <- c(7.7, 3.8, NA, 5.3, 8.9, 1.5, NA, 4.1, NA, NA)

sort(y)

# Kad iðrikiuoto vektoriaus su praleistomis reikðmëmis elementø skaièius iðliktø 
# toks pat, praleistas reikðmes galima nukelti á vektoriaus pradþià arba galà.

sort(y, na.last = TRUE)
sort(y, na.last = FALSE)


# Pagal nutylëjimà raidës iðrikiuojamos abëcëlës tvarka.
r <- c("Y", "M", "S", "F", "I", "Q", "Z", "E", "O", "H", "A", "W", "J", "R", "T")

sort(r)

# Ilgesnës simboliø sekos (nebûtinai vienodo ilgio) iðrikiuojamos leksikografine 
# tvarka: ið pradþiø pagal pirmà þodþio simbolá, tada pagal antrà ir t.t.
s <- c("ZSZ", "LFB", "IY", "OWJV", "WL", "LNXCO", "ZS", "ARIHB", "TUCYS", "KRHU")

sort(s)


# Vektoriaus elementø numerius iðrikiuotame vektoriuje nustato f-ja order. Jos
# parametrai:
#
#        ... -- vienas arba keli vektoriai,
#    na.last -- pagal nutylëjimà NA, gali bûti TRUE arba FALSE arba,
# decreasing -- pagal nutylëjimà FALSE, nurodo rikiavimo tvarka.

# Funkcijos order reikðmë yra vektoriaus elementø perstatinys. Tai reiðkia, kad
# ði funkcija gràþina ne iðrikiuotus vektoriaus elementus, o jø numerius. 

z <- c("c", "a", "b")

i <- order(z)
i

# Pirmojo gauto vektoriaus elemento reikðmë 2 nurodo, kad pirmas tarp iðrikiuotø 
# vektoriaus elementø bûtø antrasis vektoriaus elementas z[2], kurio reikðmë "a".
# Antrasis elementas lygus 3 ir tai reiðkia, kad antras tarp iðrikiuotø elementø
# bûtø z[3], kurio reikðmë "b". Treèiasis elementas lygus 1, vadinasi treèiasis
# tarp iðrikiuotø elementø bûtø z[1], kurio reikðmë lygi "c".

# Parodysime, kad vektoriaus elementus iðdësèius pagal funkcijos order gràþinamà 
# numeriø vektoriø, gaunamas iðrikuotas vektorius, koká gautume su funkcija sort.

z[i]


# Funkcijos order gràþinamas vektorius naudojamas matricos arba duomenø lenteliø 
# eiluèiø iðrikiavimui pagal kurio nors stulpelio reikðmes. Pavyzdþiui, lentelës 
# tyrimas eilutes iðrikiuosime pagal kintamàjá "X".

tyrimas <- read.table(header = TRUE, text = "
X     Y     Z
b   1.3  TRUE
a   5.2  TRUE
b   2.5  TRUE
c   1.2  FALSE
a   3.8  FALSE
c   2.4  FALSE
")

i <- order(tyrimas$X)

tyrimas[i, ]

# Laikantis funkcinio programavimo stiliaus viskà galima uþraðyti viena iðraiðka.

tyrimas[order(tyrimas$X), ]

# Kad funkcijos order viduje bûtø galima tiesiogiai naudoti lentelës kintamøjø
# pavadinimus, jà galima ákelti á funkcijà with. Tai ypaè patogu tuo atveju, kai
# reikia uþraðyti ið karto kelis vienos lentelës kintamuosius.

with(tyrimas, tyrimas[order(X), ])

# Eilutes galima iðrikiuoti ið karto pagal kelis stulpelius. Pvz., iðrikiuosime 
# eilutes kintamojo "X" didëjimo (abëcëlës) tvarka, bet tuo atveju kai kintamojo 
# "X" reikðmës sutampa, eilutes iðrikiuosime pagal kintamàjá "Y".

with(tyrimas, tyrimas[order(X, Y), ])


# NAUDINGA ------------------------------

# Funkcija order sukuria toká perstatiná, kuris vektoriaus elementus iðrikiuoja 
# nemaþëjimo tvarka. Jei lentelës eilutes reikia iðrikiuoti vektoriaus maþëjimo 
# tvarka, nurodomas parametras decreasing = TRUE. Jei vektorius arba kintamasis, 
# pagal kurá atliekamas rikiavimas, yra skaitinis, paprasèiau pakeisti jo þenklà.

# Pvz., iðrikiuosime lentelës tyrimas eilutes kintamojo "X" didëjimo tvarka, bet 
# kintamojo "Y" maþëjimo tvarka.

with(tyrimas, tyrimas[order(X, -Y), ])

# Kategoriniams kintamiesiems þenklo pakeisti negalima, todël tokiais atvejais
# gali bûti naudojama speciali funkcija xtfrm. Pavyzdþiui, iðrikiuosime lentelæ 
# kintamojo "X" maþëjimo tvarka ir kintamojo "Y" didëjimo tvarka.

with(tyrimas, tyrimas[order(-xtfrm(X), Y), ])


# UÞDUOTIS ------------------------------ 

# 1. Vektoriø x iðrikiuokite maþëjimo tvarka nenaudojant f-jos sort parametro
#    decreasing = TRUE. Sugalvokite kelis bûdus tokiam iðrikiavimui atlikti.
# 2. Lentelës tyrimas eilutes iðrikiuokite pagal visus tris jos kintamuosius ið 
#    karto: pagal "Z", tada pagal "X", o esant vienodoms jø reikðmëms pagal "Y".


# --------------------------------------- #
# DUOMENØ LENTELIØ PERTVARKYMAS           #
# --------------------------------------- #

# Á tekstinius failus ar Excel lenteles suraðomi duomenys daþniausiai bûna taip
# vadinamo "wide" formato: viename stulpelyje suraðytos vieno kintamojo reikðmës, 
# kintamøjø paprastai bûna ne vienas, o vienà objektà apraðo viena eilutë. Tai 
# natûralus duomenø suraðymo bûdas, bet jis ne visada patogus duomenø analizei.

# Vienos duomenø lentelës keliø kintamøjø apjungimui á vienà kintamàjá naudojama 
# funkcija stack. Jos parametrai:
#
#        x -- "wide" formato duomenø lentelë,
#   select -- duomenø lentelës kintamasis arba keliø kintamøjø vardø vektorius,

# Funkcijos rezultatas yra lentelë, kur stulpelyje "values" suraðomos kintamøjø 
# reikðmës, o stulpelyje "ind" -- tø kintamøjø pavadinimai.

# Tarkime, kad yra lentelë, kurioje kiekvienas matavimas pakartotas tris kartus,
# reikðmës suraðytos á kintamuosius X, Y ir Z. Sudarysime lentelæ, kurioje visi 
# trys kintamieji apjungti á vienà bendrà kintamàjá.

kintamieji <- read.table(header = TRUE, text = "
  X    Y    Z
1.5  3.2  0.2
1.2  3.9  0.7
1.9  3.5  0.5
1.7  3.4  0.1
")

kintamieji

# Apjungimo rezultatas yra taip vadinamo "long" formato lentelë, kurioje á vienà 
# kintamàjá apjungtos visø trijø lentelës kintamøjø reikðmës.

matavimai <- stack(kintamieji)
matavimai

# Naudojant parametrà select, galima nurodyti, kuriuos kintamuosius apjungti. Su 
# minuso þenklu nurodyti kintamieji neapjungiami. Pvz., apjungsime kintamuosius
# "X" ir "Y". Toks pats rezultatas gaunamas iðmetus kintamàjá "Z".

stack(kintamieji, select = c(X, Y))
stack(kintamieji, select = -Z)


# Galima ir atvirkðtinë duomenø lentelës transformacija, kai apjungti stulpeliai 
# iðskaidomi á atskirus kintamuosius. Tam naudojama funkcija unstack. Parametrai:
#
#        x -- "long" formato duomenø lentelë,
#     form -- formulë, kuri nurodo, kaip á stulpelius iðskaidyti kintamàjá.

# Formulë raðoma taip: X ~ G. Èia X yra kintamasis, kurá reikia suskaidyti, o G 
# yra grupavimo kintamasis.

# Jeigu "long" formato lentelë buvo gauta naudojant funkcijà stack, atvirkðtinë 
# transformacija atliekama nenurodant jokiø parametrø (jie áraðyti atributuose).

unstack(matavimai)

# Jei kintamojo reikðmes grupuojanèiø kintamøjø lentelëje yra ne vienas, galima
# nurodyti, pagal kurá ið jø atliekamas iðskaidymas á stulpelius. Tam nurodomas
# parametras form. 

matavimai <- read.table(header = TRUE, text = "
reikðmë  tipas  grupë
1.5      X      Pirmas
1.2      X      Pirmas
1.9      X      Pirmas
1.7      X      Pirmas
3.2      Y      Pirmas
3.9      Y      Pirmas
3.5      Y      Antras
3.4      Y      Antras
0.2      Z      Antras
0.7      Z      Antras
0.5      Z      Antras
0.1      Z      Antras
")

unstack(matavimai, form = reikðmë ~ tipas)
unstack(matavimai, form = reikðmë ~ grupë)


# Sudëtingesnës struktûros duomenø lentelës pertvarkymams naudojama f-ja reshape. 
# Pagrindiniai jos parametrai:
# 
#      data -- "wide" arba "long" formato duomenø lentelë,
#   varying -- pasikartojanèius matavimus atitinkantys lentelës kintamieji,
#   v.names -- kintamojo, á kurá apjungiami pasikartojantys matavimai, vardas,
#     idvar -- vienas ar keli grupavimo kintamieji, 
#   timevar -- kintamasis, kuris "long" lentelëje nurodo vienà matavimø serijà,
# direction -- "long" arba "wide", nurodo á kokio formato lentelæ transformuoti.

# Pertvarkant lentelæ ið "wide" formato á "long", lentelëje atsiranda kintamasis
# "time". Já atitinkantis kintamasis nurodomas parametrui timevar, kai lentelë 
# pertvarkoma ið "long" formato á "wide".

# Pavyzdþiui, turime lentelæ, kurioje yra trys to paties kintamojo matavimai ir
# grupavimo kintamasis. Sudarysime lentelæ, kurioje kintamieji "X.1", "X.2" ir 
# "X.3" apjungiami á vienà kintamàjá.

d.ww <- read.table(header = TRUE, text = "
nr  grupë   X.1   X.2   X.3
 1      A  2.84  2.08  1.06
 2      B  2.95  2.08  0.96
 3      A  2.85  2.03  1.10
 4      B  3.07  1.90  0.96
 5      A  3.21  1.99  1.11
 6      B  2.87  1.97  0.90
")

# Paprasèiausiu atveju funkcijai uþtenka nurodyti tik pasikartojanèius matavimus
# atitinkanèiø kintamøjø vardus, kiti automatiðkai priskiriami parametrui idvar.
d.wl <- reshape(d.ww, varying = c("X.1", "X.2", "X.3"), direction = "long")
d.wl

# Kintamuosius parametrams galima iðvardinti nurodant jø stulpeliø numerius. 
d.wl <- reshape(d.ww, varying = 3:5, v.names = "X", idvar = 1:2, direc = "long")
d.wl

# Tokià pertvarkytà lentelæ galima atversti atgal panaudojant tà paèià funkcijà 
# reshape be jokiø parametrø (visø jø reikðmës áraðytos lentelës atributuose).

reshape(d.wl)


# Jei pradiniai duomenys yra "long" formato, naudojant f-jà reshape, juos galima 
# pertvarkyti á "wide" formato duomenø lentelæ.

d.ll <- read.table(header = TRUE, text = "
nr grupë bandymas    X
1      A        1 2.84
2      B        1 2.95
3      A        1 2.85
4      B        1 3.07
5      A        1 3.21
6      B        1 2.87
1      A        2 2.08
2      B        2 2.08
3      A        2 2.03
4      B        2 1.90
5      A        2 1.99
6      B        2 1.97
1      A        3 1.06
2      B        3 0.96
3      A        3 1.10
4      B        3 0.96
5      A        3 1.11
6      B        3 0.90
")

# Kintamàjá "time", kuris "long" formato lentelëje atskiria kintamojo matavimø 
# serijas, ðioje lentelëje atitinka kintamasis "bandymas". 

t <- "bandymas"
g <- c("nr", "grupë")

d.lw <- reshape(d.ll, v.names = "X", idvar = g, timevar = t, direction = "wide")
d.lw

# Taip pertvarkytos lentelës atvirkðtinë transformacija á "long" formato lentelæ 
# atliekama naudojant f-jà reshape be jokiø papildomø parametrø.

reshape(d.lw)


# UÞDUOTIS ------------------------------ 

# 1. Naudojant funkcijà unstack, lentelæ tyrimas pertvarkykite ið "long" formato 
#    á "wide". Suskaidyti reikia kintamàjá "Y", o jo grupavimas atliekamas pagal 
#    kintamàjá "X". Kodël tokios lentelës pervarkymui netinka funkcija reshape?
# 2. Sugalvokite bûdà, kaip lentelës duomenys kintamuosius "X.1", "X.2" ir "X.3" 
#    apjungti naudojant funkcijà stack.
# 3. Pertvarkykite lentelæ chickwts: kintamàjá weight padalinkite á grupes pagal 
#    kintamojo feed reikðmes.


#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Ávairûs kintamøjø ið teksto nuskaitymo bûdai.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-07-08 | 2013-07-12
#


# TURINYS -------------------------------

#
#   1. Duomenø ávedimas ið klaviatûros:
#      * komanda c
#      * procedûra scan
#
#   2. Duomenø importavimas kopijuojant:
#      * komanda clipboard
#      * procedûra readClipboard
#
#   3. Duomenø nuskaitymas ið teksto:
#      * parametras text
#      * funkcija textConnection
#


# PASTABOS ------------------------------

#
# Kol kas pastabø nëra.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# DUOMENØ ÁVEDIMAS IÐ KLAVIATÛROS         #
# --------------------------------------- #

# Tiesiai ið klaviatûros ávedami nedideli duomenø rinkiniai. Paprastai tai yra
# keletà elementø turintis vektorius, kuris sudaromas naudojant komanda c.

x <- c(2, 3, 5, 7, 11, 13, 17, 19)


# Toks bûdas paprastas ir labai daþnai naudojamas, taèiau dël ávairiø prieþasèiø 
# netinka dideliems duomenø masyvams. Kartais pasitaiko situacija, kai vektoriaus 
# reikðmës ávedamos tiesiai ið klaviatûros. Tada galima panaudoti procedûrà scan. 

x <- scan() 

# Vektoriø sudarantys elementai raðomi konsolëje ir ávedami paspaudþiant klaviðà 
# Enter. Á vienà eilutæ galima suraðyti kelis tarpu atskirtus elementus. Reikðmiø 
# ávedimas nutraukiamas klaviðà Enter paspaudus du kartus ið eilës. 

x


# Paèiu paprasèiausiu atveju taip galima ávesti tik ið skaièiø sudarytà vektoriø. 
# Norint ávesti kitokio tipo reikðmes, riboti jø skaièiø ar pan., reikia pakeisti 
# tam tikrus procedûros scan parametrus. Kai kurie ið jø:
#
#    what -- vektoriaus reikðmiø tipas: numeric(), character() ir kiti,
#     sep -- vektoriaus elementus atskiriantis simbolis, pagal nutylëjimà tarpas,
#       n -- maksimalus vektoriaus elementø skaièius.

# Pavyzdþiui, simboliniø reikðmiø ávedimui ið klaviatûros, parametro what reikðmæ
# pakeièiame á character(). Jei vektoriaus reikðmes sudaro atskiri simboliai arba 
# þodþiai, ávedinëjant juos galima raðyti be kabuèiø.

x <- scan(what = character())
x


# UÞDUOTIS ------------------------------ 

# 1. Naudodami procedûrà scan, uþraðykite komandà, kuri ið klaviatûros nuskaitytø 
#    simboliø eilutæ R-E-S-P-U-B-L-I-K-A. Turite gauti vektoriø ið 10 raidþiø.
# 2. Anksèiau uþraðytà komandà pakeiskite taip, kad bûtø nuskaitomos tik pirmos
#    trys simboliø eilutës raidës.


# --------------------------------------- #
# DUOMENØ IMPORTAVIMAS KOPIJUOJANT        #
# --------------------------------------- #

# Nedidelá vektoriø ar duomenø lentelæ galima importuoti copy-paste metodu. Tam
# galima panaudoti procedûrà scan. Vektoriaus sudarymo veiksmø seka yra tokia:
# 
#  -- ið teksto nukopijuojame skaièius ar kitas reikðmes,
#  -- nuskaitymo ið klaviatûros reþimu paleidþiame procedûra scan,
#  -- tiesiai á konsolæ ákeliame nukopijuotas vektoriaus reikðmes.

# Vektoriaus elementai gali bûti suraðyti nebûtinai vienoje eilutëje ar viename 
# stulpelyje. Pavyzdþiui, sukursime skaièiø vektoriø. Paþymëkite þemiau esanèius 
# skaièius ir su klaviðø kombinacija Ctrl + C nukopijuokite juos. 

# ---
1 2 3
4 5 6
7 8 9
# ---

# Kadangi visi vektoriaus elementai yra skaièiai, papildomø parametrø procedûrai
# nurodyti nereikia.
x <- scan()

# Su klaviðø kombinacijà Ctrl + V nukopijuotus skaièius ákelkite tiesiai á konsolæ.
# Rezultatas yra vektorius ið 9 elementø.
x


# Nukopijuotas tekstas gali bûti interpretuojamas kaip specialaus tipo failas,
# kurio vardas yra "clipboard". Já galima nurodyti bet kuriai duomenø nuskaitymo 
# procedûrai, kuri gali nuskaityti duomenis ið failo pvz., scan arba read.table.

# Pavyzdþiui, tà patá skaièiø vektoriø galima gauti naudojant tokià komandà.
x <- scan(file = "clipboard")
x


# Tokiu bûdu galima nuskaityti ir nedideles duomenø lenteles. Nukopijuokite ðià
# lentelæ su dviem kintamaisiais X ir Y.

# ---
X    Y
15,2 Vyras
41,5 Vyras
32,7 Moteris
28,1 Vyras
19,9 Moteris
# ---

# Kadangi pirmoje duomenø eilutëje suraðyti kintamøjø vardai, o trupmeninë dalis
# skiriama kableliu, tà reikia papildomai nurodyti procedûrai.
d <- read.table(file = "clipboard", header = TRUE, dec = ",")
d


# NAUDINGA ------------------------------

# Nukopijuoto teksto nuskaitymui eilutëmis skirta procedûra readClipboard. Jos 
# rezultatas visada yra character tipo vektorius, kuris turi tiek elementø, kiek 
# eiluèiø buvo nuskaityta.

# ---
1 2 3
4 5 6
7 8 9
# ---

# Pavyzdþiui, trys skaièiø eilutës nuskaitytos su ðia procedûra bus apjungtos á
# vektoriø ið trijø elementø: "1 2 3", "4 6 5" ir "7 8 9". Dël tos prieþasties
# ði procedûra tinka tik tekstiniams duomenims nuskaityti.

x <- readClipboard()
x


# UÞDUOTIS ------------------------------ 

# 1. Naudodami procedûrà scan ir komandà "clipboard", kopijavimo metodu sukurkite 
#    vektoriø ið 3 þodþiø JUODA PILKA BALTA. Kaip reikëtø suraðyti tuos þodþius,
#    kad toká pat vektoriø bûtø galima gauti su procedûra readClipboard?
# 2. Koks bûtø rezultatas, jei lentelës importavimo komandoje nebûtø nurodyta, 
#    kad kablelis skiria trupmeninæ dalá?


# --------------------------------------- #
# DUOMENØ NUSKAITYMAS IÐ TEKSTO           #
# --------------------------------------- #

# Duomenø ið tekstinio failo nuskaitymui skirtos procedûros gali bûti panaudotos
# character tipo vektoriø nuskaitymui. Tai reiðkia, kad nedidelius vektorius ar 
# duomenø lenteles galima uþraðyti kaip paprastà tekstà tiesiai programos tekste, 
# o vëliau juos nuskaityti. Procedûrai scan arba read.table vektoriø, kurá reikia
# nuskaityti, nurodome per parametrà text.

# Pavyzdþiui, nuskaitysime skaièiø vektoriø, kuris uþraðytas kaip simboliø seka.
v <- "1 2 3"

# Vektoriaus nuskaitymui naudojame áprastà procedûrà scan su parametru text.
x <- scan(text = v)
x

# Jei nuskaitomas vektorius sudarytas ne ið skaièiø, procedûrai reikia nurodyti 
# elementø tipà, ðiuo atveju elementai yra character tipo.
v <- "a b c"

x <- scan(text = v, what = character())
x

# Duomenø lentelæ uþraðyti kaip vektoriø galima panaudojant specialius simbolius: 
# \n reiðkia perkëlimà á kità eilutæ, \t reiðkia tabuliacijos þenklà. Pavyzdþiui, 
# uþraðysime kaip vektoriø tokià lentelæ:
#
#   X  Y
#   11 12
#   21 22

l <- "X Y\n 11 12\n 21 22"

# Pirmoje ðios duomenø lentelës eilutëje suraðyti stulpeliø pavadinimai, todël 
# parametro header reikðmæ pakeièiame á TRUE.
d <- read.table(text = l, header = TRUE)
d

# Teksto eilute uþraðytà lentelæ galima áraðyti tiesiai á nuskaitymo komandà.
d <- read.table(text = "X Y\n 11 12\n 21 22", header = TRUE)
d


# Didesnæ lentelæ patogiau uþraðyti taip, kaip ji atrodo, o ne viena eilute.
l <- "X  Y  Z
      11 12 13
      21 22 23
      31 32 33"

d <- read.table(text = l, header = TRUE)
d

# Tokiu pavidalu uþraðytà lentelæ taip pat galima áraðyti á nuskaitymo komandà.
d <- read.table(header = TRUE, text = "
X  Y  Z
11 12 13
21 22 23
31 32 33
")

d


# UÞDUOTIS ------------------------------ 

# 1. Naudodami procedûrà scan, nuskaitykite kaip simboliø vektoriø uþraðytà datà 
#    "2013-07-11". Rezultatas turi bûti 3 elementus turintis skaièiø vektorius: 
#    metai, mënuo ir diena.
# 2. Datos nuskaitymo komandà pakeiskite taip, kad bûtø nuskaitomas tik metus 
#    reiðkiantis skaièius.
# 3. Uþraðykite lentelës "X Y\n 11 12\n 21 22" nuskaitymo komandà, kuri pakeistø
#    kintamøjø vardus á A ir B.


# R procedûros gali nuskaityti duomenis ið labai ávairiø ðaltiniø (connections). 
# Duomenims uþraðyti naudojami tekstiniai failai -- tik vienas ið tokiø ðaltiniø.
# Kitas ðaltinis yra jau anksèiau naudotas clipboard. 

# Naudojant funkcijà textConnection teksto blokà galima paversti á dar vieno tipo 
# ðaltiná, su kuriuo tokios procedûros kaip scan ar read.table elgiasi kaip su
# tekstiniu failu.

# Pavyzdþiui, nuskaitysime kaip simboliø eilutæ uþraðytà skaièiø sekà.
v <- "1 2 3"

# Ið pradþiø character tipo vektoriø paverèiame á ðaltiná, o tada já nuskaitome 
# kaip paprastà tekstiná failà.
t <- textConnection(v)
x <- scan(file = t)
x

# Patogumo dëlei visas komandas galima apjungti á vienà.
x <- scan(textConnection("1 2 3"))
x

# Tokiu bûdu kaip failà galima nuskaityti ir tekste uþraðytà duomenø lentelæ.

t <- textConnection("
X    Y
15,2 Vyras
41,5 Vyras
32,7 Moteris
28,1 Vyras
19,9 Moteris
")

d <- read.table(file = t, header = TRUE, dec = ",")
d


# NAUDINGA ------------------------------

# Viename duomenø lentelës stulpelyje gali bûti keli þodþiai ar skaièiai. Pvz.,
#
#    Valdovas             Metai
#    Vytautas Didysis     1350-1430
#    Þygimantas Augustas  1520-1572
#
# Nuskaitant ið failo tokià duomenø lentelæ, þodþiai Vytautas ir Didysis bûtø
# skirtinguose stulpeliuose. Kadangi pirmoje eilutëje yra du stulpeliø vardai, 
# o stulpeliø yra trys, pirmame stulpelyje esantys þodþiai Vytautas ir Þygimantas 
# automatiðkai pavirstø á eiluèiø pavadinimus ir lentelë bûtø nuskaitoma blogai.

adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_5a.dat"
d <- read.table(file = adresas, header = TRUE)
d

# Kad to neatsitiktø, viename stulpelyje turinèius bûti þodþiø junginius galima 
# átraukti á kabutes.

adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_5b.dat"
d <- read.table(file = adresas, header = TRUE)
d

# Universalus sprendimas -- stulpelius vienà nuo kito atskirti kabliataðkiu.
adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_5c.csv"
d <- read.table(file = adresas, header = TRUE, sep = ";")
d

# Tà patá principà galima taikyti ir nuskaitant duomenis ið teksto. Nuskaitysime
# tà paèià duomenø lentelæ dviem skirtingais bûdais. Pirmas bûdas -- sukuriant 
# tekstiná vektoriø.

l <- "
Valdovas;           Metai
Vytautas Didysis;   1350-1430
Þygimantas Augustas;1520-1572
"

d <- read.table(text = l, header = TRUE, sep = ";")
d


# Antras bûdas -- naudojant funkcijà textConnection

t <- textConnection("
Valdovas;           Metai
Vytautas Didysis;   1350-1430
Þygimantas Augustas;1520-1572
")

d <- read.table(file = t, header = TRUE, sep = ";")
d

# Visà ðià teksto nuskaitymo komandà galima uþraðyti viena eilute.
d <- read.table(file = textConnection(l), header = TRUE, sep = ";")
d


# UÞDUOTIS ------------------------------ 

# 1. Naudodami funkcijà textConnection nuskaitykite loginiø reikðmiø vektoriø 
#    "F-T-T-T-F-T-F-F-F-T". Uþraðykite ðià komandà viena eilute.
# 2. Naudodami funkcijà textConnection nuskaitykite ðià paprastà duomenø lentelæ 
#    "X Y\n 11 12\n 21 22". Uþraðykite ðià komandà viena eilute.

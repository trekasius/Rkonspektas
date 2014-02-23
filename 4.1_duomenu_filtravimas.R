
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Sàlygà tenkinanèiø elementø paieðka ir duomenø filtravimas.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-07-27 | 2013-08-13
#


# TURINYS -------------------------------

#
#   1. Sàlygà tenkinanèiø elementø paieðka:
#      * funkcija which
#      * funkcijo which.min
#      * funkcijo which.max
#      * funkcija match
#
#   2. Pasikartojantys vektoriaus elementai:
#      * funkcija duplicated
#      * funkcija anyDuplicated
#      * funkcija unique
#
#   3. Praleistos reikðmës duomenyse:
#      * procedûra summary 
#      * funkcija is.na
#      * funkcija complete.cases
#      * funkcija na.exclude
#      * funkcija na.omit
#
#   4. Duomenø filtravimas:
#      * funkcija subset 
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
# SÀLYGÀ TENKINANÈIØ ELEMENTØ PAIEÐKA     #
# --------------------------------------- #

# Funkcija which nustato, kuriø loginio vektoriaus elementø reikðmës lygios TRUE. 
# Jos parametrai:
#
#        x -- loginiø reikðmiø vektorius arba matrica,
#  arr.ind -- jei x yra matrica, nurodo ar gràþinti ieðkomos reikðmës numerá.

# Jei x yra vektorius, tai rezultatas yra TRUE reikðmiø indeksø vektorius. Jeigu
# x yra loginiø reikðmiø matrica, tai parametrui arr.ind nurodþius reikðmæ TRUE,
# gràþinama matrica su reikðmës TRUE matricoje x eiluèiø ir stulpeliø indeksais.


# Pavyzdþiui, surasime tuos loginio vektoriaus elementus, kuriø reikðmë yra TRUE.
t <- c(FALSE, FALSE, TRUE, FALSE)

which(t)


# Ðià funkcijà galima pritaikyti ir kitokio tipo vektoriaus tam tikras sàlygas 
# tenkinanèiø elementø radimui. Pirmiausia sudarome loginá testà ir patikriname, 
# kurie vektoriaus elementai já tenkina. Tada gautas loginiø reikðmiø vektorius 
# perduodamas funkcijai which, kuri nustato, kurie elementai yra TRUE.

x <- c(7, -2, 4, 24, 22, 26, 27, -2, 12, -9, -6, 0, 29, 16, -7, 6, 26, 1, 5, 12)
x

# Pavyzdþiui, surasime, kuris vektoriaus x elementas lygus 0. Sudarant loginá 
# testà apie lygybæ, naudojamas == operatorius.
x == 0

# Loginæ sàlygà galima áraðyti tiesiai á funkcijà which. Gaunamas ðià sàlygà 
# atitinkanèiø vektoriaus elementø numeriø vektorius. Matome, kad vektorius x
# turi tik vienà nuliná elementà.
which(x == 0)

# Tokiu bûdu galima surasti ir kelias sàlygas tenkinanèius vektoriaus elementus.
# Surasime tuos vektoriaus x elementus, kuriø reikðmës yra ið intervalo [0, 10].
which(x >= 0 & x <= 10)


# Ieðkomo elemento vietà matricoje galima nurodyti dvejopai: nurodant jo eilës
# numerá vektoriuje, ið kurio elementø ir buvo sudaryta matrica, arba nurodant 
# eilutës ir stulpelio numerá. 

# Ið vektoriaus x elementø sudarysime 5x4 dydþio matricà.
m <- matrix(x, ncol = 4)
m

# Vektoriuje x nulinis elementas yra 12-tas, todël ir matricoje jo indeksas 12.
which(x == 0)
which(m == 0)

# Elemento vietà matricoje patogiau nustatyti uþraðant jo eilutës ir stulpelio
# numerá. Tam reikia pakeisti parametro arr.ind reikðmæ á TRUE.
which(m == 0, arr.ind = TRUE)


# Kartais tenka surasti maþiausio ar didþiausio vektoriaus elemento numerá. Tam 
# naudojamos specialios funkcijos which.min ir which.max.
which.min(x)
which.max(x)


# Jei reikia patikrinti, ar tam tikra reikðmë yra vektoriuje (aibëje), naudojama 
# funkcija match. Jos parametrai:
#
#        x -- ieðkoma reikðmë arba jø vektorius,
#    table -- vektorius, kuriame ieðkoma reikðmë x.

# Funkcijos match rezultatas yra pirmojo reikðmæ x atitinkanèio elemento numeris.
# Jei ieðkomos reikðmës vektoriuje nëra, gràþinama reikðmë NA.

# Pavyzdþiui, patikrinsime, ar vektoriuje x yra elementas, kurio reikðmë lygi 1.
match(x = 1, x)

# Jei vektorius turi kelis tuos paèius elementus, f-ja match gràþina tik pirmojo
# ið jø eilës numerá.
match(x = -2, x)


# NAUDINGA ------------------------------

# Funkcijos which rezultatas yra tam tikrà sàlygà tenkinanèiø vektoriaus elementø 
# numeriai. Juos galima panaudoti ieðkomø elementø iðskyrimui á atskirà vektoriø.

# Pavyzdþiui, surasime visus teigiamus vektoriaus x elementus.
i <- which(x > 0)
i 

# Vienas ið bûdø iðskirti reikiamus vektoriaus elementus -- nurodyti jø numerius.
x[i]

# Tai atvejais, kai ið vektoriaus reikia iðskirti tam tikrà sàlygà tenkinanèius
# elementus, jø numeriø nustatymà naudojant funkcijà which galima praleisti, ir 
# loginæ sàlygà áraðyti tiesiogiai. Taip yra ir paprasèiau, ir greièiau.

x[x > 0]


# UÞDUOTIS ------------------------------ 

# 1. Naudojant funkcijà which, suraskite numerius tø vektoriaus x elementø, kurie 
#    lygûs 6 arba -6.
# 2. Uþraðykite komandà, kuri surastø nelyginiø vienþenkliø vektoriaus x elementø
#    numerius.
# 3. Sugalvokite bûdà, kaip, nenaudojant funkcijos which.min, surasti maþiausio
#    vektoriaus elemento numerá.
# 4. Sugalvokite bûdà, kaip, naudojant funkcijà which.min, surasti didþiausià
#    vektoriaus elementà.


# --------------------------------------- #
# PASIKARTOJANTYS VEKTORIAUS ELEMENTAI    #
# --------------------------------------- #

# Pasikartojanèiø vektoriaus elementø nustatymui naudojama funkcija duplicated.
# Jos rezultatas yra tokio pat ilgio loginis vektorius, kur reikðmë TRUE raðoma
# tada, kai elementas pasikartoja. Visø kitø elementø reikðmës lygios FALSE.

s <- c("s", "u", "s", "i", "s", "u", "k", "o")

# Pavyzdþiui, nustatysime, kurios raidës þodyje kartojasi.
duplicated(s)

# Funkcija anyDuplicated patikrina, ar bent vienas elementas pasikartoja. Jos
# rezultatas yra pirmojo pasikartojimo vektoriuje numeris.
anyDuplicated(s)

# Vektoriaus elementø aibei gauti naudojama funkcija unique. Jos rezultatas
# yra pradinis vektorius, ið kurio paðalinami besidubliuojantys elementai.
unique(s)


# UÞDUOTIS ------------------------------ 

# 1. Sugalvokite komandà, kuri á atskirà vektoriø iðrinktø bent vienà kartà 
#    pasikartojanèius vektoriaus s elementus.
# 2. Uþraðykite komandà, kuri iðrinktø tuos vektoriaus s elementus, kurie
#    neturi pasikartojimø, t.y reikia gauti vektoriø c("i", "k", "o").


# --------------------------------------- #
# PRALEISTOS REIKÐMËS DUOMENYSE           #
# --------------------------------------- #

# Dël ávairiø prieþasèiø realiuose duomenyse kartais bûna praleistø reikðmiø. 
# Standartiðkai joms þymëti naudojama speciali konstanta NA. 

y <- c(7, -2, 4, NA, 22, 26, 27, -2, 12, -9, NA, 0, 29, 16, -7, 6, 26, 1, 5, 12)


d <- read.table(header = TRUE, text = "
   lytis  ûgis svoris grupë
  vyras   175     76     B
  vyras   180     NA     B
moteris   170     67     A
moteris   167     64     B
  vyras   178     80     A
moteris    NA     59    NA
  vyras   184     NA     A
moteris   171     68     B
moteris   177     70     A
  vyras   185     84     B
")


# Procedûra summary parodo pagrindines duomenø charakteristikas ir suskaièiuoja 
# praleistas reikðmes. Vektoriui surandamas bendras praleistø reikðmiø skaièius, 
# o duomenø lentelei - jø skaièius kiekvienam kintamajam atskirai.

y
d

summary(y)
summary(d)


# Praleistø reikðmiø vektoriuje nustatymui naudojama funkcija is.na. Rezultatas 
# yra loginis vektorius, kurio elementø reikðmë yra TRUE, jei tikrinamo elemento 
# reikðmë NA arba NaN, ir FALSE - kitais atvejais.
is.na(y)

# Jei praleistø reikðmiø ieðkoma matricoje arba duomenø lentelëje, tai funkcijos 
# rezultatas yra tokio pat dydþio loginiø reikðmiø matrica.
is.na(d)


# Atliekant duomenø analizæ, reikia þinoti, kurie duomenø lentelës áraðai neturi
# praleistø reikðmiø. Tam naudojama funkcija complete.cases. Jos rezultatas yra 
# loginis vektorius, kurio reikðmë lygi TRUE, jei duomenø lentelës eilutëje nëra
# praleistø reikðmiø, ir FALSE - jei eilutëje yra bent viena praleista reikðmë.

complete.cases(d)


# Funkcijos all ir any patikrina, ar visø loginio vektoriaus elementø reikðmës 
# yra TRUE, ir ar bent vieno elemento reikðmë yra TRUE. Naudojant ðias funkcijas, 
# galima patikrinti, ar vektorius turi praleistø reikðmiø.

all(is.na(y))   # ar visø vektoriaus elementø reikðmës praleistos
any(is.na(y))   # ar bent vieno vektoriaus elemento reikðmë praleista

# Analogiðkai galima patikrinti, ar visos duomenø lentelës eilutës uþpildytos, 
# ar yra bent viena eilutë, kuri neturi praleistø reikðmiø.

all(complete.cases(d))
any(complete.cases(d))


# Naudojant anksèiau apraðytà funkcijà which, galima nustatyti, kurie vektoriaus 
# elementai yra praleistos reikðmës.

which(is.na(y))

# Lygiai taip pat, galima nustatyti, kurios duomenø lentelës eilutës turi bent 
# vienà praleistà reikðmæ.

which(!complete.cases(d))


# Atliekant statistinæ duomenø analizæ, praleistos reikðmës ið duomenø turi bûti
# paðalintos. Sukuriame loginá indeksà, kur TRUE reikðmë nurodo, kad tà elementà
# reikia pasirinkti.

i <- !is.na(y)
y[i]

# Ið duomenø lentelës, paprastai, reikia paðalinti tas eilutes, kuriose yra bent
# viena praleista reikðmë. Sudarome loginá indeksà, kur TRUE reikðmë nurodo, kad
# tà eilutæ reikia pasirinkti.

i <- complete.cases(d)
d[i, ]


# Nepilnø stebiniø paðalinimui galima naudoti funkcijas na.exclude arba na.omit.

na.omit(d)


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite komandà, kuri apskaièiuotø elementø su praleistomis reikðmëmis
#    skaièiø vektoriuje y. 
# 2. Uþraðykite komandà, kuri apskaièiuotø eiluèiø su praleistomis reikðmëmis
#    skaièiø duomenø lentelëje d. Kiek ið viso yra praleistø reikðmiø lentelëje?
# 3. Sukurkite duomenø lentelæ, kurioje bûtø tik tie stebiniai (eilutës), kurios
#    turi bent vienà praleistà reikðmæ.


# --------------------------------------- #
# DUOMENØ FILTRAVIMAS                     #
# --------------------------------------- #

# Duomenø filtravimu vadinamas tam tikras sàlygas atitinkanèiø vektoriaus arba
# duomenø lentelës elementø iðrinkimas. Pavyzdþiui, duomenø lentelës eiluèiø, 
# kurios neturi praleistø reikðmiø iðrinkimas, taip pat yra duomenø filtravimas.

# Daþnai duomenø analizei reikalinga tik tam tikra dalis visø turimø duomenø.
# Pvz., ið duomenø lentelës iðrinksime tik vyrø stebinius. Paprasèiausiu atveju 
# reikiamø eiluèiø numerius galima suraðyti rankiniu bûdu, ir tokiu bûdu gautà 
# indeksø vektoriø naudojame konkreèiø eiluèiø iðrinkimui.

d

i <- c(1, 2, 5, 7, 10)
i

d[i, ]

# Tais atvejais, kai vektorius ar duomenø lentelë yra didelë, reikiamø elementø 
# iðrinkimà reikia atlikti automatiðkai. Uþraðysime sàlygà, kuri tikrina, kuriø 
# kintamojo "lytis" elementø reikðmë yra "vyras". Gauname loginá vektoriø, kur 
# TRUE reiðkia, kad sàlyga tenkinama, o FALSE - kad netenkinama.

i <- d$lytis == "vyras"
i 

d[i, ]

# Daþnai tenka iðrinkti stebinius, kurie tenkina ne vienà sàlygà. Pavyzdþiui, ið
# lentelës d iðrinksime aukðtesnius nei 180 cm vyrus.

i <- d$lytis == "vyras" & d$ûgis > 180

d[i, ]


# Svarbu atsiminti, kad bet koks loginis testas su NA reikðme, duoda NA, todël 
# duomenyse, kuriuose yra praleistø reikðmiø, papildomai reikia tikrinti ar 
# reikðmë yra nepraleista. Pavyzdþiui, ið duomenø lentelës iðrinksime B grupës
# stebinius.

i <- d$grupë == "B" & !is.na(d$grupë)     # 1 bûdas, sàlyga kartu su NA testu
i                                         #
d.1 <- d[i, ]                             #
d.1

i <- which(d$grupë == "B")                # 2 bûdas, trumpesnë komanda
i                                         #
d.2 <- d[i, ]                             #
d.2

# Galima ásitikinti, kad abiem bûdais gauti duomenø rinkiniai sutampa.
identical(d.1, d.2)


# Duomenø filtravimui naudojama procedûra subset. Jos parametrai:
#
#        x -- vektorius, matrica ar duomenø lentelë,
#   subset -- loginë sàlyga,
#   select -- paliekamø kintamøjø (stulpeliø) sàraðas.

# Naudojant ðià procedûrà, loginiai veiksmai su konstanta NA duoda reikðmæ FALSE. 
# Pavyzdþiui, ið lentelës d iðrinksime tik B grupës stebinius.
subset(d, grupë == "B")

# Kadangi naujai sudarytame duomenø rinkinyje kintamasis "grupë" turi vienintelæ
# reikðmæ "B", jis nebereikalingas, todël já galima iðmesti.
subset(d, grupë == "B", selec = -grupë)

# Galima nurodyti ir kelis kintamuosius, kuriuos reikia palikti arba iðmesti.
subset(d, grupë == "B", selec = c(lytis, ûgis))

# Ið eilës einanèiø kintamøjø aibæ galima nurodyti per dvitaðká uþraðant pirmojo 
# ir paskutinio kintamojo vardus.
subset(d, grupë == "B", selec = lytis:ûgis)


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite komandà, kuri surastø, kuriose duomenø lentelës d eilutëse yra
#    daugiau nei 80 kg sveriantys vyrai. Turite gauti eiluèiø numeriø vektoriø.
#    Naudojant ðá indeksø vektoriø sudarykite naujà duomenø lentelæ.
# 2. Uþraðykite komandà, kuri apskaièiuotø, kiek grupëje B yra moterø. Turite
#    gauti vienà skaièiø.
# 3. Ið duomenø lentelës d iðrinkite B grupës moterø stebinius. Uþraðykite dvi
#    tokios komandos versijas: naudojant procedûrà subset ir nenaudojant jos.
# 4. Ið duomenø lentelës mtcars iðrinkite tas maðinas, kuriø variklis turi 4 
#    cilindrus (kintamasis "cyl").

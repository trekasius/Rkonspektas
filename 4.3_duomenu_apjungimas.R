
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Vektoriø, matricø ir duomenø lenteliø apjungimas.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-09-09 | 2013-09-23
#


# TURINYS -------------------------------

#
#   1. Vektoriø, matricø ir lenteliø sujungimas:
#      * funkcija cbind
#      * funkcija rbind
#      * funkcija data.frame
#
#   2. Duomenø lenteliø apjungimas:
#      * funkcija merge
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
# DUOMENØ APJUNGIMAS                      #
# --------------------------------------- #

# Atliekant duomenø analizæ ar analizuojant gautus rezultatus labai daþnai tenka 
# juos apjungti á vienà vektoriø, matricà arba duomenø lentelæ. Tam naudojamos 
# kelios standartinës funkcijos. 

# Vektoriø apjungimui á matricà naudojamos funkcijos cbind ir rbind. Ðiuo atveju
# apjungiamø vektoriø elementai turi bûti vienodo tipo.

a <- c(1, 5, 8, 4, 6, 10, 9, 7, 2, 3)
b <- c(2.97, 6.93, 4.06, 6.83, 4.21, 6.28, 6.2, 3.7, 7.32, 6.21)

# Pavyzdþiui, sudarysime matricà, kurios vienas stulpelis yra skaièiø vektorius 
# a, o kitas stulpelis -- taip pat skaièiø vektorius b.

cbind(a, b)

# Tuos paèius vektorius galima apjungti eilutëmis.

rbind(a, b)

# Matricos stulpeliams ar duomenø lentelës kintamiesiems galima suteikti vardus.

cbind(pirmas = a, antras = b)

# Jei apjungiami nevienodà elementø skaièiø turintys vektoriai, tai trumpesnio 
# vektoriaus elementai cikliðkai pakartojami. Pvz., sukursime kintamàjá, kurio 
# visi elementai vienodi ir lygus 1.

cbind(pirmas = a, antras = b, treèias = 1)


# Jei á vienà lentelæ reikia apjungti skirtingo tipo vektorius, naudojama f-ja
# data.frame. Jos parametrai:
#
#              ... -- vienas arba keli vektoriai, lentelës kintamieji,
#        row.names -- eiluèiø pavadinimø vektorius, pagal nutylëjimà NULL, 
#       check.rows -- pagal nutylëjimà FALSE, patikrinami eiluèiø vardai,
#      check.names -- TRUE, patikrinama ar nesikartoja kintamøjø vardai,
# stringsAsFactors -- TRUE, kategoriniai kintamieji paverèiami faktoriais,

# Pavyzdþiui, á duomenø lentelæ apjungsime skaièiø vektorius a ir b.

data.frame(a, b)

# Kintamiesiems galima nurodyti naujus vardus.

data.frame(X = a, Y = b)

# Kadangi parametro check.names reikðmë pagal nutylëjimà TRUE, netyèia nurodþius 
# du vienodus kintamøjø vardus, vienas ið jø automatiðkai bus pakeistas.

data.frame(X = a, X = b)

# Pagal nutylëjimà duomenø lentelës eilutës sunumeruojamos, bet jø vardus galima 
# ir pakeisti. Tam reikia parametrui row.names nurodyti nesikartojanèiø reikðmiø
# vektoriø. Pavyzdþiui, sukursime lentelæ, kurios eiluèiø pavadinimai yra raidës.

data.frame(X = a, Y = b, row.names = letters[1:10])

# Kategoriniai kintamieji duomenø lentelëje tampa faktoriais. Pvz., prijungsime 
# vektoriø, kurio elementai yra didþiosios raidës.

c <- c("A", "A", "B", "B", "A", "A", "B", "B", "B", "B")

d <- data.frame(X = a, Y = b, Z = c)
d

# Galima nesunkiai parodyti, kad character tipo vektorius pavirto á factor tipo
# lentelës kintamàjá.

sapply(d, class)

# Tam, kad character tipo vektorius ir lentelëje liktø character tipo kintamuoju, 
# parametro stringsAsFactors reikðmæ reikia pakeisti á FALSE.

d <- data.frame(X = a, Y = b, Z = c, stringsAsFactors = FALSE)
d

sapply(d, class)

# Kintamojo tipo iðlaikymui naudojama funkcija I, todël ji irgi tinka character
# tipo vektoriaus átraukimui á lentelæ.

d <- data.frame(X = a, Y = b, Z = I(c))
d

# Vektoriø prie jau sukurtos lentelës galima prijungti ir naudojant f-jà cbind. 
# Pvz., prie lentelës d prijungsime loginá vektoriø, kurio visø elementø reikðmë
# yra TRUE. Nurodysime tik vienà reikðmæ, likusios bus pakartotos.

cbind(d, L = TRUE)


# NAUDINGA ------------------------------

# Duomenø analizëje pasitaiko situacija, kai á vienà lentelæ reikia sujungti ne
# dvi, o daug maþø duomenø lenteliø.

d.1 <- data.frame(x = 1:2, y = 11:12)
d.2 <- data.frame(x = 4:5, y = 14:15)
d.3 <- data.frame(x = 7:8, y = 17:18)

# Tokias lenteles paprastai galima apjungti naudojant funkcijà rbind.
rbind(d.1, d.2, d.3)

# Galima sukurti tokiø duomenø lenteliø sàraðà ir kaip parametrà já perduoti tai
# paèiai funkcijai rbind. Tam naudojama speciali funkcija do.call. 

d.list <- list(d.1, d.2, d.3)
d.list

do.call(rbind, d.list)


# Toks lenteliø sujungimo bûdas labai efektyvus tais atvejais, kai, analizuojant 
# duomenis, kaip rezultatas gaunamas list tipo sàraðas, kurio elementai yra tuos 
# paèius kintamuosius (kitaip nebûtø galima sujungti) turinèios duomenø lentelës. 

# Tokiu atveju pradiniai duomenys daþniausiai taip pat yra sàraðo pavidalo. Pvz.,
# tai gali bûti sàraðas, kurio elementai yra nevienodà elementø skaièiø turintys
# to paties tipo vektoriai, arba sàraðas, kurio elementai yra kokio nors teksto 
# sakiniai arba kokio nors organizmo DNR sekos. Pradinius duomenis gali sudaryti
# duomenø lentelës apie tà patá objektà skirtingais laiko momentais ir t.t.

# Sàraðo pavidalo duomenis labai patogu analizuoti naudojant funkcijas lapply ir
# sapply, kuriø rezultatas taip pat yra sàraðas. Jei ðiø funkcijø rezultatas yra
# duomenø lentelës, tai jas galima nesunkiai apjungti naudojant do.call funkcijà.

# Tarkime, kad atliekama DNR sekø analizë. Sekà sudaro nukleotidai A, C, G ir T. 
# Tarkime, kad turime 50 skirtingo ilgio DNR sekø, kurios apjungtos á list tipo 
# sàraðà. Vienas sàraðo elementas yra vienas nukleotidø vektorius. Sugeneruosime
# tokius duomenis.

dnr <- replicate(50, sample(factor(c("A", "C", "G", "T")), sample(20:50, 1), T))
dnr

# Pirma uþduotis -- apskaièiuoti kiekvienos sekos nukleoditø daþniø lentelæ. Tam
# panaudojame funkcijà table, kurià pritaikome kiekvienai sàraðo sekai. Gauname
# sàraðà, kurio elementai yra daþniø lentelës.

freq.list <- lapply(dnr, table)
freq.list

# Kadangi visos daþniø lentelës yra tokio paties pavidalo, jas galima nesunkiai
# apjungti á vienà didelæ lentelæ, kurios eilutëse bus sekø nukleotidø daþniai.

do.call(rbind, freq.list)


# Antra uþduotis -- kiekvienai DNR sekai sudaryti lentelæ, kurioje bûtø áraðytas
# sekos ilgis, pirmas ir paskutinis jos nukleotidai.

# Kadangi tokios standartinës funkcijos nëra, jà tenka pasiraðyti. 

dnr.info <- function(s) {

  ilgis   <- length(s)
  pradþia <- s[1]
  pabaiga <- s[ilgis]
  
  info <- data.frame(pradþia, pabaiga, ilgis)
  return(info)
}

# Funkcijà dnr.info, kuri suformuoja vienos sekos analizës lentelæ, ádedame á 
# ciklo funkcijà lapply ir perbëgame per sekø sàraðà.

stat.list <- lapply(dnr, dnr.info)
stat.list

# Gauname lenteliø sàraðà, kuri apjungiame naudojant do.call funkcijà.

do.call(rbind, stat.list)


# UÞDUOTIS ------------------------------ 

# 1. Sudarykite data.frame tipo lentelæ, kurios vienas stulpelis yra didþiøjø, o
#    kitas -- maþøjø raidþiø vektorius, atitinkamai LETTERS ir letters. Lentelës
#    kintamieji turi iðlikti character tipo.
# 2. Atlikite duomenø rinkinio dnr analizæ. Kiekvienai sekai sudarykite lentelæ,
#    kuri turi du kintamuosius. Vieno kintamojo reikðmë yra pirmi trys dnr sekos
#    nukleotidai, kito kintamojo reikðmë -- nukleotidø C ir G dalis DNR sekoje.
#    Naudojant funkcijà do.call gautà lenteliø sàraðà apjunkite á vienà lentelæ.


# --------------------------------------- #
# DUOMENØ APJUNGIMAS                      #
# --------------------------------------- #

# Kartais tenka apjungti duomenø lenteles, kurios turi bendrø kintamøjø. Tokiais
# atvejais rezultatas yra dviejø lenteliø sankirta, kuri gaunama naudojant f-jà
# merge. Pagrindiniai jos parametrai:
#
#        x -- pirmos lentelës vardas,
#        y -- antros lentelës vardas,
#       by -- bendras abiejø lenteliø kintamasis arba jø vektorius,
#      all -- FALSE, nurodo, kad á lentelæ átraukiamos tik bendros eilutës.

# Turime dvi lenteles: pirmoje suraðyti didþiausi Lietuvos miestai ir gyventojø
# skaièius juose 2001 ir 2011 metais, kitoje lentelëje yra miestai ir atstumas
# iki Vilniaus.

miestai <- read.table(header = TRUE, text = "
miestas       m2011  m2001
Alytus        63642  71491
Jonava        33172  34954
Kaunas       336912 378650
Klaipëda     177812 192954
Marijampolë   44885  48675
Maþeikiai     38819  42675
Panevëþys    109028 119749
Ðiauliai     120969 133883
Utena         31139  33860
Vilnius      542932 542287
")

atstumas <- read.table(header = TRUE, text = "
miestas   atstumas
Vilnius         0
Utena          96
Alytus        101
Jonava        102
Kaunas        102
Panevëþys     136
Marijampolë   138
Ðiauliai      213
Maþeikiai     291
Klaipëda      311
")

# Apjungsime ðias lenteles. Jos turi bendrà kintamàjá miestas, kurá nurodysime 
# parametrui by.

merge(miestai, atstumas, by = "miestas")

# Pagal nutylëjimà parametrui by priskiriamas abiejø lenteliø bendrø kintamøjø
# vardø vektorius. Kadangi ðiuo atveju toks kintamasis tik vienas, parametro by
# buvo galima ir nenurodyti -- jam reikðmë priskiriama vienareikðmiðkai.

merge(miestai, atstumas)


# Gali bûti, kad bendras abiejø lenteliø kintamasis, pagal kurá jos apjungiamos, 
# vienoje lentelëje turi vienas reikðmes, o kitoje -- kitas. Tokiu atveju galimi
# keli lenteliø apjungimo variantai.

# Tarkime, kad miestø ir atstumø lentelës turi vienodà áraðø (eiluèiø) skaièiø,
# bet miestø sàraðas vienoje lentelëje skiriasi nuo miestø sàraðo kitoje. Pvz.,
# miestø lentelëje áraðytas Vilnius, bet jo nëra atstumø iki sostinës lentelëje.

miestai <- read.table(header = TRUE, text = "
miestas       m2011  m2001
Jonava        33172  34954
Kaunas       336912 378650
Klaipëda     177812 192954
Marijampolë   44885  48675
Maþeikiai     38819  42675
Panevëþys    109028 119749
Utena         31139  33860
Vilnius      542932 542287
")

atstumas <- read.table(header = TRUE, text = "
miestas   atstumas
Utena          96
Alytus        101
Kaunas        102
Panevëþys     136
Marijampolë   138
Ðiauliai      213
Maþeikiai     291
Klaipëda      311
")

# Apjungiant lenteles pagal bendrà, taèiau nevienodas reikðmes turintá kintamàjá, 
# rezultatas yra lentelë, kurioje yra tik bendros abiem lentelëms eilutës. Ðiuo
# atveju kiekvienoje lentelëje yra po 8 miestus, taèiau bendri abiem lentelëms 
# yra tik 6 miestai.

merge(miestai, atstumas)

# Tam, kad bûtø átraukiamos visos abiejø lenteliø eilutës, pakeièiama parametro
# all reikðmë. Tada gaunama lentelë, kurioje kai kurie kintamieji turi praleistø
# reikðmiø.

merge(miestai, atstumas, all = TRUE)

# Pagal nutylëjimà á bendrà lentelæ átraukiamos bendros abiem lentelëms eilutës.
# Jei nurodomas parametras all = TRUE, tada átraukiamos visos abiejø lenteliø
# eilutës. Galima átraukti tik pirmos ar tik antros lentelës eilutes, kuriø nëra 
# kitoje lentelëje. Tam nurodomi parametrai atitinkamai all.x arba all.y.

merge(miestai, atstumas, all.x = TRUE)
merge(miestai, atstumas, all.y = TRUE)


# UÞDUOTIS ------------------------------ 

# 1. Sugalvokite bûdà, kaip pradines miestø ir atstumø lenteles, kurios abi turi
#    po 10 eiluèiø, apjungti nenaudojant funkcijos merge. Kada toká bûdà galima
#    taikyti lenteliø apjungimui?

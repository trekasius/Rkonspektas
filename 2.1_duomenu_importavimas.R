
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Duomenø importavimo ið tekstinio ar binarinio failo bûdai.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-07-08 | 2013-07-12
#


# TURINYS -------------------------------

#
#   1. Duomenø nuskaitymas ið tekstinio failo:
#      * procedûra scan
#      * procedûra readLines
#      * procedûra read.table
#      * procedûra read.csv
#      * procedûra read.delim
#
#   2. Duomenø nuskaitymas ið binarinio failo:
#      * procedûra save
#      * procedûra load
#


# PASTABOS ------------------------------

#
# Paraðyti apie funkcijà count.fields.
# Paraðyti apie funkcijà read.fwf.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# DUOMENØ NUSKAITYMAS IÐ TEKSTINIO FAILO  #
# --------------------------------------- #

# Daug elementø turintys vektoriai, didelës matricos, duomenø lentelës arba kiti 
# dideli duomenø masyvai paprastai laikomos failuose, kuriø nuskaitymui R turi 
# keletà procedûrø. Aptarsime daþniausiai pasitaikanèias situacijas.

# Vieno vektoriaus elementø nuskaitymui ið failo naudojama procedûrà scan. Galima 
# iðraðyti pagrindinius jos parametrus:
#
#    file -- kabutëse uþraðomas duomenø failo vardas arba kelias iki failo,
#    what -- vektoriaus reikðmiø tipas: numeric(), character() ir pan.,
#     sep -- vektoriaus elementus skiriantis simbolis, pagal nutylëjimà tarpas,
#     dec -- deðimtainio kablelio simbolis, pagal nutylëjimà tai taðkas ".",
#    skip -- pirmøjø nenuskaitomø eiluèiø faile skaièius,
#  nlines -- nuskaitomø failo eiluèiø skaièius,
#       n -- maksimalus vektoriaus elementø skaièius.

# Jei parametro file reikðmë nenurodoma, pagal nutylëjimà laikoma, jog jo reikðmë
# yra "" ir vektoriaus reikðmës bus ávedamos ið klaviatûros.

# Vektoriaus elementai nuskaitomi eilutëmis. Elementai faile gali bûti suraðyti 
# viename stulpelyje arba keliose eilutëse po kelis elementus vienoje eilutëje. 
# Elementø skaièius eilutëse nebûtinai turi sutapti ir gali skirtis.


# Sukursime tekstiná failà su keliomis skaitinëmis reikðmëmis. Reikðmës viena nuo
# kitos atskiriamos naujos eilutës simboliu \n, todël faile visos jos suraðomos 
# po vienà kiekvienoje eilutëje.

v <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
cat(v, file = "test.dat", sep = "\n")

# Ið sukurto tekstinio failo nuskaitome reikðmes ir ið jø sudarome vektoriø x.
x <- scan(file = "test.dat")
x

# Galima nesunkiai patikrinti, kad pradinis ir nuskaitytas vektoriai sutampa.
identical(v, x)


# Sukursime simboliniø reikðmiø vektoriø ir áraðysime á failà. Reikðmes atskirsime 
# tarpo þenklu, todël visos raidës faile bus vienoje eilutëje.

v <- c("a", "b", "c", "x", "y", "z")
cat(v, file = "test.dat", sep = " ")

# Kadangi dabar vektoriaus elementai yra simboliai, tai reikia nurodyti jø tipà.
x <- scan(file = "test.dat", what = character())
x


# Lietuviø kalboje deðimtainës trupmenos sveikoji ir trupmeninë dalys skiriamos
# kableliu, todël nuskaitant toká vektoriø reikia pakeisti parametro dec reikðmæ
# á ",". Sukursime failà, kuriame realieji skaièiai uþraðyti su kableliu.

v <- c("1,5", "2,1", "3,1", "4,9")
cat(v, file = "test.dat", sep = "\n")

# Norint korektiðkai nuskaityti toká failà, reikia nurodyti, kad trupmeninæ dalá
# skiria kablelis, o ne taðkas, kaip nurodyta pagal nutylëjimà.
x <- scan(file = "test.dat", dec = ",")
x


# Failo pradþioje gali bûti kelios tuðèios eilutës arba eilutës, kuriose suraðyta 
# papildoma informacija. Tada procedûrai reikia nurodyti ir praleidþiamø eiluèiø 
# skaièiø.

v <- c("praleisti", "praleisti", " ", "a", "b", "c")
cat(v, file = "test.dat", sep = "\n")

# Gautame faile pirmos trys eilutës neturi jokios informacijos, todël jas reikia
# praleisti. 

x <- scan(file = "test.dat", what = character(), skip = 3)
x


# NAUDINGA ------------------------------

# Daþnai duomenø failas yra internete. Tokiu atveju procedûros parametrui file 
# reikia nurodyti pilnà jo adresà.
adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/vekt_1a.dat"

x <- scan(file = adresas)
x


# Teksto eilutëms ið failo nuskaityti naudojama specialiai tam skirta procedûra 
# readLines. Pagrindiniai jos parametrai:
#
#     con -- duomenø failas arba simboliø eilutë,
#       n -- nuskaitomø eiluèiø skaièius.

# Procedûros rezultatas yra character tipo vektorius, kurio vienas elementas yra 
# viena teksto eilutë.

# Pavyzdþiui, nuskaitysime tekstiná failà, kuris turi penkias eilutes, po vienà
# sakiná kiekvienoje eilutëje.
adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/vekt_3a.dat"

x <- readLines(adresas)
x


# UÞDUOTIS ------------------------------ 

# 1. Ið failo "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/vekt_1b.dat" 
#    nuskaitykite pirmus 20 vektoriaus elementø. 
# 2. Ið failo "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/vekt_2a.dat" 
#    nuskaitykite kabliataðkiais atskirtus þodþius. Turite gauti character tipo
#    vektoriø ið 10 elementø.
# 3. Ið failo "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/vekt_3a.dat" 
#    nuskaitykite tik pirmas 3 eilutes. 


# Duomenø lentelës ið failo nuskaitomos naudojant procedûrà read.table. Baziniai
# jos parametrai tokie:
#
#       file -- kabutëse uþraðomas duomenø failo vardas arba kelias iki failo,
#     header -- TRUE nurodo, kad pirmoje eilutëje suraðyti kintamøjø vardai,
#        sep -- stulpelius atskiriantis simbolis, pagal nutylëjimà tarpas,
#        dec -- deðimtainio kablelio simbolis, pagal nutylëjimà tai taðkas ".",
#       skip -- skaièius pirmøjø eiluèiø, kurias reikia praleisti,
#      nrows -- skaièius eiluèiø, kurias reikia nuskaityti,
#  row.names -- eiluèiø vardø vektorius, jø stulpelio numeris arba pavadinimas,
#  col.names -- stulpeliø pavadinimø vektorius,
# na.strings -- praleistos reikðmës simbolis, pagal nutylëjimà "NA",
#      as.is -- jei TRUE, tai kategoriniai kintamieji nuskaitomi kaip faktoriai.


# Kaip ir procedûrai scan, èia galima nurodyti, kad duomenø failas yra internete.
adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_1a.dat" 

# Paèiu paprasèiausiu atveju stulpeliai faile gali bûti suraðyti be pavadinimø.
# Tada procedûrai uþtenka nurodyti tik duomenø failo adresà, o kintamøjø vardai
# sudaromi automatiðkai.

d <- read.table(file = adresas)
d

# Jei duomenø faile stulpeliai pavadinimø neturi, kintamiesiems vardus suteikti 
# galima nuskaitymo metu. Tam reikia sukurti jø vardø vektoriø. Vardø vektorius 
# turi turëti tiek elementø, kiek duomenø faile yra stulpeliø.
k.vardas <- c("x", "y", "z")

d <- read.table(file = adresas, col.names = k.vardas)
d

# Jei kintamieji vardus turi, jie bûna suraðyti pirmoje duomenø failo eilutëje.
adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_1b.dat"

# Tokiu atveju parametro header reikðmæ pakeièiame á TRUE.
d <- read.table(file = adresas, header = TRUE)
d


# Paprastai duomenø lentelës eiluèiø pavadinimai sutampa su jø eilës numeriais.
# Nuskaitymo ið failo metu eilutës sunumeruojamos automatiðkai. Taèiau naudojant
# parametrà row.names galima eilutëms suteikti kitus vardus, taèiau jie bûtinai 
# turi bûti unikalûs.

# Jei pirmoje failo eilutëje kintamøjø vardø yra vienu maþiau nei stulpeliø, tai 
# laikoma, kad pirmame stulpelyje yra eiluèiø vardai.
adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_2a.dat"

# Ið failo nuskaitome duomenø lentelæ, kurios eilutës turi savo raidinius kodus.
d <- read.table(file = adresas, header = TRUE)
d

# Eiluèiø pavadinimai gali bûti bet kuriame kitame duomenø lentelës stulpelyje.
adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_2b.dat" 

# Èia nurodome, kad eiluèiø kodai yra treèiame duomenø lentelës stulpelyje "E".
d <- read.table(file = adresas, header = TRUE, row.names = "E")
d


# Kartais duomenø failo pradþioje bûna áraðoma tam tikra papildoma informacija. 
# Jei duomenø failo eilutë prasideda komentaro simboliu #, tai nuskaitymo metu
# tokia eilutë automatiðkai praleidþiama. 
adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_3a.dat" 

# Ðio failo pradþioje paraðyta, kad trupmeninë skaièiaus dalis skiriama kableliu,
# todël pakeièiame parametro dec reikðmæ.
d <- read.table(file = adresas, header = TRUE, dec = ",")
d

# Jei failo pradþioje yra kelios neuþkomentuotos eilutës, kurias reikia praleisti, 
# tokiu atveju per parametrà skip nurodome tokiø eiluèiø skaièiø.
adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_3b.dat" 

d <- read.table(file = adresas, header = TRUE, dec = ",", skip = 6)
d


# NAUDINGA ------------------------------

# Jei kelias iki failo yra ilgas, o duomenø nuskaitymas atliekamas vienà kartà,
# kartais paprasèiau ir greièiau duomenø failà pasirinkti interaktyviai naudojant 
# komandà file.choose().

# Pvz., sukursime paprastà duomenø failà "test.dat", kuriame á vienà stulpelá 
# suraðytos visos didþiosios abëcëlës raidës. 
cat(LETTERS, file = "test.dat", sep = "\n")

# Nuskaitysime failà ne nurodydami jo pilnà vardà, o pasirinkdami interaktyviai. 
# Visø kitø procedûros read.table parametrø reikðmës paliktos pagal nutylëjimà.

d <- read.table(file = file.choose())
d


# UÞDUOTIS ------------------------------ 

# 1. Ið failo "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_1b.dat" 
#    duomenø lentelæ nuskaitykite be kintamøjø vardø eilutës. 
# 2. Pakeiskite duomenø failo "lent_1b.dat" nuskaitymo komandà, kad duomenø
#    lentelës kintamieji gautø vardus "a", "b" ir "c".
# 3. Duomenø failo "test.dat" nuskaitymo komandà pakeiskite taip, kad kintamajam
#    bûtø priskirtas vardas "Raidës".


# Kad duomenis bûtø galima nesunkiai perkelti ið vienos programos á kità, jie á 
# failus raðomi tam tikru standartiniu formatu. Vienas tekstinio duomenø failo 
# formatas yra taip vadinamas "comma separated value" arba sutrumpintai CSV. Jis
# skirtas lentelës pavidalo duomenims uþraðyti, kur stulpeliuose yra kintamieji,
# o eilutëse yra stebiniai.

# Toks failas pirmoje eilutëje turi stulpeliø pavadinimus. Jei stulpeliai vienas
# nuo kito atskiriami kableliu, tai trupmeninë skaièiaus dalis skiriama taðku.
# Tokio formato duomenø failui nuskaityti naudojama read.csv procedûra.

# Jei stulpeliai vienas nuo kito atskiriami kabliataðkiu, tai trupmeninë skaièiaus 
# dalis skiriama mums áprastu kableliu. Tokio formato duomenø failui nuskaityti 
# naudojama procedûra read.csv2.

adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_1c.csv" 

d <- read.csv2(file = adresas)
d

# Þinoma, CSV formato failà galima nuskaityti ir naudojant procedûrà read.table,
# taèiau ðiuo atveju nuskaitymo komanda yra paprastesnë. Jei stulpeliai duomenø
# faile atskiriami tabuliacijos þenklu "\t", tada tokiems duomenims nuskaityti 
# gali bûti taikoma procedûra read.delim arba read.delim2.


# NAUDINGA ------------------------------

# Kartais pasitaiko situacija, kai ið duomenø failo reikia nuskaityti tik dalá
# kintamøjø, pvz., pirmus penkis kintamuosius arba kas antrà. Vienas sprendimas 
# akivaizdus: ið pradþiø nuskaityti visus stulpelius, o tada ávairiais bûdais ið 
# lentelës galima iðmesti nereikalingus kintamuosius. 

# Kitas bûdas nuskaityti tam tikrus stulpelius -- panaudoti procedûros parametrà 
# colClasses, kuriam nurodomas visø nuskaitomø stulpeliø tipø vektorius. Vietoje
# áprasto reikðmës tipo numeric, character ar pan., galima nurodyti NULL tipà.
# Tada kintamasis, kuriam priskirtas NULL tipas á duomenø lentelæ neátraukiamas.

# Pavyzdþiui, ið failo "lent_1b.dat" nuskaitysime tik pirmus du kintamuosius. 
adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_1b.dat"

# Tam ið pradþiø sukursime pagalbiná duomenø lentelës kintamøjø tipø vektoriø.
k.tipas <- c("numeric", "numeric", "NULL")

d <- read.table(file = adresas, header = TRUE, colClasses = k.tipas)
d


# UÞDUOTIS ------------------------------ 

# 1. Ið failo "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_4a.dat" 
#    nuskaitykite kas antrà stulpelá. 
# 2. Ið failo "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_4b.dat" 
#    nuskaitykite tik paskutinius 2 ið 20 duomenyse esanèiø stulpeliø. Nuskaitymo 
#    metu jiems priskirkite vardus "X" ir "Y".


# --------------------------------------- #
# DUOMENØ NUSKAITYMAS IÐ BINARINIO FAILO  #
# --------------------------------------- #

# Jei duomenys sudëtingos struktûros, juos ne visada patogu laikyti tekstiniame 
# faile. Pavyzdþiui, tokie gali bûti sudëtingi sàraðai, R statistiniø procedûrø 
# rezultatø lentelës ir t.t. Tokiais atvejais kintamuosius ar duomenø rinkinius 
# patogiau uþsaugoti kaip binariná R duomenø failà su standartiniu tokio tipo
# failui iðplëtimu .RData (iðplëtimas gali bûti ir kitoks). Vienà ar kelis R 
# kintamuosius tokiu formatu eksportuojame naudojant funkcijà save.

# Pavyzdþiui, binariniu formatu iðsaugosime standartiná didþiøjø raidþiø vektoriø.
save(LETTERS, file = "test.RData")

# Tokio tipo failas importuojamas naudojant procedûrà load. Þinoma, kaip ir kitus 
# duomenis, binariná failà taip pat galima nuskaityti ir ið interneto.
load(file = "test.RData")


# UÞDUOTIS ------------------------------ 

# 1. Faile "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/rdat_1a.RData"
#    iðsaugotas kintamasis m su duomenø lentele. Importuokite ðá failà.

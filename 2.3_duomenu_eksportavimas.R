
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Duomenø eksportavimo á tekstiná ar binariná failà bûdai.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-07-22 | 2013-07-25
#


# TURINYS -------------------------------

#
#   1. Duomenø eksportavimas á tekstiná failà:
#      * procedûra write
#      * procedûra writeLines
#      * procedûra write.table
#      * procedûra write.csv
#
#   2. Duomenø áraðymas á binariná failà:
#      * procedûra save
#      * procedûra load
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
# DUOMENØ EKSPORTAVIMAS Á TEKSTINÁ FAILÀ  #
# --------------------------------------- #

# Vektoriaus ar matricos reikðmës á tekstiná failà áraðomos naudojant procedûrà 
# write. Pagrindiniai parametrai tokie:
#
#        x -- R kintamasis: vektorius arba matrica,
#     file -- kabutëse uþraðomas duomenø failo vardas arba kelias iki failo,
#      sep -- simbolis, kuriuo faile atskiriamos vektoriaus reikðmës,
# ncolumns -- vektoriaus elementø skaièius vienoje failo eilutëje,
#   append -- jei TRUE, vektoriaus reikðmës áraðomos á jau esantá failà.

# Jei parametrui file nurodomas tik duomenø failo vardas, tai darbiniame kataloge 
# sukuriamas failas, á kurá áraðomos kintamojo reikðmës. Darbiná katalogà galima 
# suþinoti su komanda getwd(), o pakeisti su komanda setwd (kaip ðiame skripte). 
# Nepriklausomai nuo darbinio katalogo, galima nurodyti ir pilnà kelià iki failo,
# taèiau toks uþraðymo bûdas ilgesnis ir daþnai nepatogus. Paprasèiau programos 
# pradþioje nurodyti reikiamà darbiná katalogà ir duomenis á já raðyti nurodant 
# tik failo vardà.

# Kintamojo reikðmës suraðomos á tekstiná failà, bet failo iðplëtimas nebûtinai 
# turi bûti txt. Pagal nutylëjimà skaitinio vektoriaus reikðmës faile suraðomos
# eilutëmis po 5 reikðmes vienoje eilutëje, o simbolinio -- po vienà elementà á 
# vienà eilutæ.

# Sukursime paprastà vektoriø ið skaitmenø ir já áraðysime á tekstiná failà.
v <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
v

write(x = v, file = "numb.vec")

# Galima pamatyti, kad kataloge "C:/Downloads" sukuriamas failas numb.vec, kurio
# viduje penkiuose stulpeliuose áraðytos vektoriaus reikðmës.

# Pagal nutylëjimà vektoriaus reikðmës faile atskiriamos tarpu. Tà patá vektoriø
# áraðysime á failà, kuriame reikðmës bus atskirtos tabuliacijos þenklu \t.
write(x = v, file = "numb.vec", sep = "\t")

# Jei elementai atskiriami naujos eilutës þenklu \n, tai faile jie bus suraðyti 
# á vienà stulpelá.
write(x = v, file = "numb.vec", sep = "\n")

# Jei dël kokiø nors prieþasèiø vektoriaus reikðmes faile reikia áraðyti á vienà
# ar kelis stulpelius, tai pakeièiama numatytoji parametro ncolumns reikðmë.
write(x = v, file = "numb.vec", ncolumns = 2)

# Kartais pasitaiko situacija, kai keletos vektoriø reikðmes reikia suraðyti á tà 
# patá failà. Tokiais atvejais parametro append reikðmæ reikia pakeisti á TRUE.
# Pavyzdþiui, á jau sukurtà failà dar kartà áraðysime tà patá vektoriø.

write(x = v, file = "numb.vec")
write(x = v, file = "numb.vec", append = TRUE)


# Kadangi R kalboje matrica suprantama kaip vektorius, kurio elementai iðdëstyti
# stulpeliais ar eilutëmis, tai matricà taip pat galima áraðyti á failà. Kadangi
# matricos elementai nuskaitomi stulpeliais, o á failà áraðomi eilutëmis, tam kad
# faile matrica turëtø tokius pat iðmatavimus, jà reikia transponuoti.

# Pavyzdþiui, sukursime 3x4 dydþio skaièiø matricà ir áraðysime jà á failà.
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
m <- matrix(x, ncol = 4)
m

# Transponavimui naudojama funkcija t. Stulpeliø skaièius nurodomas toks pat.
write(x = t(m), file = "numb.mat", ncolumns = 4)


# Tekstinio vektoriaus elementai pagal nutylëjimà á failà áraðomi stulpeliu. 
t <- c("P", "R", "O", "G", "R", "A", "M", "A", "V", "I", "M", "A", "S")
t

write(x = t, file = "text.vec")


# Jei vektoriaus elementai yra simboliø sekos, þodþiø junginiai ar sakiniai, tai
# patogumo dëlei faile tie sakiniai raðomi po vienà á vienà eilutæ -- stulpeliu. 
# Tokiu atveju galima naudoti specialià procedûrà writeLines. Jos parametrai:
#
#    text -- tekstinis vektorius,
#     con -- tekstinio failo ar kito iðvedimo árenginio pavadinimas,
#     sep -- simbolis, kuriuo faile atskiriamos vektoriaus reikðmës.

t <- c("Pirmas sakinys.", "Antras sakinys.", "Treèias sakinys.", "Jau pabaiga.")

writeLines(text = t, con = "text.txt")

# Vektoriaus elementus faile galima atskirti ne tik naujos eilutës, bet ir kokiu
# nors kitu simboliu. Pavyzdþiui, elementus faile atskirsime tarpo þenklu.

writeLines(text = t, con = "text.txt", sep = " ")


# NAUDINGA ------------------------------

# Procedûrai write nenurodþius failo vardo, pagal nutylëjimà darbiniame kataloge 
# automatiðkai sukuriamas tekstinis failas "data" be iðplëtimo.
write(x = v)

# Jei parametrui file vietoj failo vardo nurodomos tuðèios kabutës, tai vektorius
# "áraðomas" á konsolæ. 
write(x = v, file = "")

# Tokiu bûdu galima pakeisti á konsolæ iðvedamo vektoriaus formatà. Pavyzdþiui, 
# vektoriø á konsolæ iðvesime dviem stulpeliais.
write(x = v, file = "", ncolumns = 2)


# UÞDUOTIS ------------------------------ 

# 1. Naudodami procedûrà write, uþraðykite komandà, kuri matricos m elementus á
#    failà suraðytø viename stulpelyje.
# 2. Naudodami procedûrà write, uþraðykite komandà, kuri tekstinio vektoriaus t 
#    elementus á failà áraðytø dviem stulpeliais.
# 3. Naudodami procedûrà write, uþraðykite komandà, kuri vektoriaus t elementus
#    á failà suraðytø vienoje eilutëje. Papildykite komandà taip, kad elementai 
#    bûtø áraðomi be tarpø.
# 4. Naudodami procedûrà writeLines, uþraðykite tokià komandà, kuri vektoriaus t
#    elementus áraðytø vienoje eilutëje be tarpø.


# Duomenø lentelës á tekstiná failà áraðomos naudojant procedûrà write.table. 
# Daþniausiai naudojami parametrai:
#
#         x -- duomenø lentelë, data.frame tipo kintamasis,
#      file -- kabutëse uþraðomas duomenø failo vardas arba kelias iki failo,
#       sep -- simbolis, kuriuo faile atskiriamos vektoriaus reikðmës,
#       dec -- deðimtainio kablelio simbolis, pagal nutylëjimà tai taðkas ".",
# row.names -- jei TRUE, tai lentelë áraðoma su eiluèiø pavadinimais,
# col.names -- jei TRUE, tai lentelë áraðoma su stulpeliø pavadinimais,
#    append -- jei TRUE, vektoriaus reikðmës áraðomos á jau esantá failà,
#     quote -- jei TRUE, tekstiniai kintamieji ir faktoriai áraðomi á kabutes.

# Vietoje loginiø reikðmiø TRUE arba FALSE, parametrams row.names ir col.names
# galima priskirti atitinkamai eiluèiø arba stulpeliø vardø vektoriø. 

# Kategoriniø kintamøjø reikðmës gali bûti ne tik atskiri simboliai arba þodþiai,
# bet ir keletos simboliø ar þodþiø junginiai su tarpu, pvz., vardas ir pavardë.
# Kadangi pagal nutylëjimà duomenø lentelë á failà áraðoma stulpelius atskiriant
# tarpu, ið keliø þodþiø sudaryta kintamojo reikðmë uþraðoma per keletà stulpeliø. 
# Gali susidaryti situacija, kai stulpeliø faile yra daugiau nei kintamøjø. Toká 
# duomenø failà sunku korektiðkai nuskaityti, todël pagal nutylëjimà kategoriniø
# kintamøjø reikðmës á failà áraðomos kabutëse. Stulpelius faile atskiriant ne
# tarpu, bet tabuliacijos þenklu \t, kabliataðkiu arba kokiu nors kitu specifiniu 
# simboliu, kabuèiø galima atsisakyti.


# Sudarysime duomenø lentelæ d, kurios stulpeliuose yra trys skirtingo tipo 
# vektoriai: numeric, logical ir character.

x <- c(22.1, 37.5, 68.3, 47.7, 92.9, 87.2, 39.4, 19.6, 97.2, 32.4)
y <- c(FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE)
z <- c("P", "P",  "P",  "T",  "T",  "T",  "A",  "A",  "A",  "A")

# Duomenø lentelës stulpeliai turës pavadinimus X, Y ir Z.
d <- data.frame(X = x, Y = y, Z = z)
d

# Áraðysime gautà duomenø lentelæ á failà. Uþtenka nurodyti lentelës pavadinimà
# ir failo vardà. Jis bus áraðytas á darbiná katalogà.
write.table(x = d, file = "duom.dat")


# Be papildomø nustatymø á failà atskiru stulpeliu áraðomi eiluèiø pavadinimai.
# Tais atvejais, kai eiluèiø pavadinimai sutampa su numeriais, kurie nuskaitymo 
# metu priskiriami automatiðkai, á failà jø galima ir neraðyti.
write.table(x = d, file = "duom.dat", row.names = FALSE)

# Pagal nutylëjimà kategoriniø kintamøjø reikðmës áraðomos kabutëse. Tuo atveju,
# kai kintamojo reikðmës yra vienas simbolis arba vienas þodis, kabuèiø nereikia.
write.table(x = d, file = "duom.dat", row.names = FALSE, quote = FALSE)

# Pagal nutylëjimà stulpeliai faile atskiriami tarpu, taèiau daþnu atveju geriau
# atskirti tabuliacijos þenklu arba kabliataðkiu. Tai nurodoma per parametrà sep.
write.table(x = d, file = "duom.dat", row.names = FALSE, sep = ";")

# Pagal lietuviø kalbos taisykles trupmeninë skaièiaus dalis skiriama kableliu,
# tai nurodoma per parametrà dec. Èia duomenø lentelë á failà áraðoma stulpelius 
# atskiriant tabuliacijos þenklu.
write.table(d, file = "duom.dat", row.names = F, quote = F, sep = "\t", dec = ",")


# Kad duomenis bûtø galima nesunkiai perkelti ið vienos programos á kità, jie á 
# failus raðomi tam tikru standartiniu formatu. Vienas tekstinio duomenø failo 
# formatas yra taip vadinamas "comma separated value" arba sutrumpintai CSV. Jis
# skirtas lentelës pavidalo duomenims uþraðyti, kur stulpeliuose yra kintamieji,
# o eilutëse yra stebiniai.

# Toks failas pirmoje eilutëje turi stulpeliø pavadinimus. Jei stulpeliai vienas
# nuo kito atskiriami kableliu, tai trupmeninë skaièiaus dalis skiriama taðku.
# Duomenø tokiu formatu áraðymui naudojama write.csv procedûra. Jei stulpeliai 
# vienas nuo kito skiriami kabliataðkiu, tai trupmeninë skaièiaus dalis skiriama 
# mums áprastu kableliu. Duomenys tokiu formatu áraðomi su procedûra write.csv2.
# Ðiø procedûrø parametrai tokie patys kaip ir procedûros write.table, skirtumas
# toks, kad nereikia nurodyti parametrø sep ir dec reikðmiø.

# Pavyzdþiui, CSV formatu áraðysime tà paèià duomenø lentelæ d.
write.csv2(x = d, file = "duom.csv")

# Kaip ir anksèiau, èia nereikalingi eiluèiø numeriai ir kintamieji kabutëse.
write.csv2(d, "duom.csv", row.names = F, quote = F)


# UÞDUOTIS ------------------------------ 

# 1. Duomenø lentelëje iris yra duomenys apie keliø rûðiø augalø þiedø matavimus.
#    Naudodami procedûrà write.table, áraðykite ðiuos matavimus á tekstiná failà 
#    "irisas.txt": stulpeliai faile atskiriami tabuliacijos þenklu, kategoriniai 
#    kintamieji áraðomi be kabuèiø, eiluèiø numeriai nereikalingi.
# 2. Kintamasis Titanic yra laivo katastrofà iðgyvenusiø keleiviø kryþminë daþniø 
#    lentelë, sudaryta pagal lytá, amþiø ir klasæ. Konsolëje galima pamatyti, kad
#    jà sudaro keturios atskiros dalys. Naudodami procedûrà write.table, áraðykite 
#    ðià lentelæ á tekstiná failà: eiluèiø numeriø nereikia, stulpeliai atskirti
#    tabuliacijos þenklu, kategoriniø kintamøjø reikðmës raðomos be kabuèiø.
# 3. Naudodami procedûrà write.table, duomenø lentelæ cars áraðykite á tekstiná 
#    failà su lietuviðkais stulpeliø pavadinimais.
# 4. CSV formatu áraðykite duomenø lentelæ iris. Trupmeninë skaièiaus dalis turi
#    bûti skiriama kableliu.


# --------------------------------------- #
# DUOMENØ ÁRAÐYMAS Á BINARINÁ FAILÀ       #
# --------------------------------------- #

# Jei duomenys sudëtingos struktûros, juos ne visada patogu laikyti tekstiniame 
# faile. Pavyzdþiui, tokie gali bûti sudëtingi sàraðai, R statistiniø procedûrø 
# rezultatø lentelës ir t.t. Tokiais atvejais kintamuosius ar duomenø rinkinius 
# patogiau uþsaugoti kaip binariná R duomenø failà su standartiniu tokio tipo
# failui iðplëtimu .RData (iðplëtimas gali bûti ir kitoks). Taip daroma ir tada, 
# kai reikia iðsaugoti sudëtingø ar ilgai trunkanèiø skaièiavimø rezultus, o jø 
# pakartojimas uþtrunka ilgiau nei importavimas ið failo. Duomenis binariniu 
# formatu áraðome naudojant procedûrà save.

# Pavyzdþiui, binariniu formatu iðsaugosime duomenø lentelæ. Failas bus áraðytas
# á darbiná katalogà. Taip pat galima nurodyti ir pilnà kelià iki failo.
save(d, file = "duom.RData")

# Tokiu bûdu galima iðsaugoti ið karto keletà vektoriø, duomenø lenteliø ar kitø
# R kintamøjø. Jø vardai atskiriami kableliu.
save(x, y, z, file = "duom.RData")

# Jei kintamøjø, kuriuos reikia iðsaugoti, yra daug, jø vardus galima suraðyti á
# character tipo vektoriø. Tada procedûros parametrui list reikia nurodyti tø 
# kintamøjø vardø vektoriø. Pavyzdþiui, uþsaugosime keletà tokiø kintamøjø.
save(list = c("x", "y", "z", "d"), file = "duom.RData")


# Binarinio tipo failas importuojamas naudojant procedûrà load. Pademonstruosime
# jos veikimà importuodami failà "duom.RData".

# Iðtrinami visi kintamieji.
rm(list = ls())

# Ásitikiname, kad prieð importavimà nëra jokiø kintamøjø.
ls()

# Importuojame failà "duom.RData", kuriame áraðyti kintamieji, x, y, z ir d.
load(file = "duom.RData")

# Matome, kad atsirado anksèiau á failà áraðyti kintamieji.
ls()


# UÞDUOTIS ------------------------------ 

# 1. Vektoriø v ir matricà m áraðykite á vienà binariná failà "vecmat.RData".
#    Uþraðykite ir komandos variantà, kuriame naudojamas parametras list.

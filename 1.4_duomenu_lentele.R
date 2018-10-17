
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Duomenø lentelës sudarymas ir jos kintamieji.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2012-09-03 | 2013-05-06
#


# TURINYS -------------------------------

# 
#   1. Duomenø lentelës sudarymas:
#      * komanda data.frame
#      * komanda class
#      * komanda nrow ir ncol
#      * komanda names
#      * komanda row.names
#      * komanda attributes
#      * komanda str
#      * operatorius [
#      * operatorius [[
#      * operatorius &
#
#   2. Duomenø lenteliø apjungimas:
#      * kintamøjø prijungimas
#      * kintamøjø panaikinimas
#      * komanda cbind
#      * komanda rbind 
#


# PASTABOS ------------------------------

#
# Paraðyti apie drop = FALSE iðmetant kintamuosius ið lentelës.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# DUOMENØ LENTELËS SUDARYMAS              #
# --------------------------------------- #

# Pats bendriausias R duomenø tipas yra data.frame -- duomenø lentelë, kurios 
# stulpeliuose yra kintamieji, o eilutëse stebiniai. Esminis duomenø lentelës 
# skirtumas nuo matricos yra tas, kad duomenø lentelës stulpeliai gali bûti ir 
# skirtingø tipø. 


# Sudarysime duomenø lentelæ, kurios stulpeliuose bus trys skirtingo tipo 
# vektoriai: numeric, logical ir character.

x <- c(22, 37, 68, 47, 92, 87, 39, 19, 97, 32)
y <- c(FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE)
z <- c("P", "P",  "P",  "T",  "T",  "T",  "A",  "A",  "A",  "A")

# Kaip ir sudarant vektorius arba sàraðus, elementams galima suteikti vardus.
# Duomenø lentelës elementai yra stulpeliuose esantys kintamieji - vektoriai.
# Jei kintamøjø vardai nenurodomi, tai stulpeliai turës vektoriø pavadinimus.

d <- data.frame(X = x, Y = y, Z = z)
d

# Galima pastebëti, kad character tipo vektoriaus z reikðmës duomenø lentelëje
# vaizduojamos be kabuèiø. Taip yra todël, kad character tipo kategoriniai 
# kintamieji automatiðkai pavirsta á specialaus tipo factor kintamuosius.

# Taip sudaryta lentelë yra data.frame klasës duomenø struktûra.
class(d)

# Lentelës eiluèiø ir stulpeliø skaièiui rasti naudojamos funkcijos nrow ir ncol.
nrow(d)
ncol(d)

# Duomenø lentelës kintamøjø vardus parodo funkcija names. 
names(d)

# Funkcija names naudojama ir kintamøjø vardø pakeitimui.
names(d) <- c("X", "Testas", "Tipas")
names(d)
d

# Duomenø lentelës eiluèiø vardus parodo funkcija row.names. Pagal nutylëjimà 
# eilutës sunumeruojamos.
row.names(d)

# Lentelës eiluèiø vardus galima pakeisti, taèiau visi jie turi bûti skirtingi.
row.names(d) <- letters[1:10]
d

# Pati paprasèiausia duomenø lentelë turi keletà pagrindiniø atributø: tai yra 
# kintamøjø vardai, eiluèiø pavadinimai ir nurodyta paèios lentelës klasë.
attributes(d)

# Duomenø lentelës atributus galima pakeisti. Pvz., gràþinsime eiluèiø numerius.
attr(d, "row.names") <- 1:10
d

# Kaip ir bet kokio kito objekto, lentelës struktûrà galima pamatyti naudojant 
# funkcijà str. Èia matome, kad kintamasis d yra data.frame tipo 10*3 dydþio
# lentelë, kurios kintamieji yra numeric, logical ir factor tipo vektoriai.
# Be to, faktorius turi tris kategorijas.
str(d)


# NAUDINGA ------------------------------

# Kai kurios duomenø lentelëms ir matricoms naudojamos funkcijos yra specifinës:
# vienos ið jø tinka lentelëms, bet netaikomos matricoms ir atvirkðèiai. Gali 
# bûti, kad tam tikrais atvejais funkcijos rezultatas gali turëti kitokià prasmæ.

# Funkcija length apskaièiuoja vektoriø, matricø ir sàraðø elementø skaièiø. Jei
# funkcijos length argumentas bus duomenø lentelë, rezultatas bus jos stulpeliø
# skaièius. Tai galima paaiðkinti tuo, kad duomenø lentelës elementai yra jos
# kintamieji, t.y. stulpeliai.

length(d)

# Funkcija dim naudojama matricos eiluèiø ir stulpeliø skaièiui nustatyti. Jei 
# ðios funkcijos argumentas yra duomenø lentelë, tai rezultatas taip pat yra 
# vektorius, kurio pirmas elementas reiðkia eiluèiø, o antras -- stulpeliø skaièiø. 
# Taèiau duomenø lenteliø atveju eiluèiø skaièius gaunamas kaip eiluèiø vardø 
# vektoriaus elementø skaièius, o stulpeliø skaièius -- kaip duomenø lentelës 
# kintamøjø skaièius.

# Taip raðoma:
dim(d)

# O taip skaièiuojama :)
c(length(attributes(d)$row.names), length(d))


# Funkcijos rownames ir colnames naudojamos matricø eiluèiø ir stulpeliø vardams.
# Funkcija names nenaudojama matricos stulpeliø vardams.

#                   matrica     lentelë
# 
#   eiluèiø vardai  rownames    row.names
# stulpeliø vardai  colnames    names
#       abu vardai  dimnames    dimnames


# UÞDUOTIS ------------------------------ 

# 1. Sukurkite duomenø lentelæ h, kurioje pirmas stulpelis bûtø vardas ir pavardë, 
#    antras -- lytis (galima koduoti vyras-moteris, 0-1, V-M ir pan.), o treèias
#    stulpelis koks nors kiekybinis kintamasis, pvz., amþius, atlyginimas, ûgis.
# 2. Naudodami funkcijà names pakeiskite duomenø lentelës kintamøjø vardus.
# 3. Naudodami funkcijà row.names pakeiskite sukurtos duomenø lentelës eiluèiø 
#    numerius á raides.


# Kintamøjø iðskyrimo operatoriai [ ir [[ duomenø lentelëse naudojami dvejopai: 
# kaip matricose ir kaip sàraðuose.

# Operatoriø [ naudojant kaip matricoje, bet kuris lentelës elementas pasiekiamas 
# nurodant eilutës ir stulpelio numerá.
d[1, 1]

# Nenurodþius eilutës indekso, bus iðskiriamos visos duomenø lentelës eilutës.
# Pvz., iðskirsime visas pirmo stulpelio eilutes.
d[, 1]

# Nenurodþius stulpelio indekso, bus iðskiriami visi duomenø lentelës stulpeliai.
# Pvz., iðskirsime visus pirmos eilutës stulpelius.
d[1, ]

# Indeksà nurodþius su minuso þenklu, atitinkama eilutë arba stulpelis iðmetami.
# Pvz., èia lentelëje bus paliekami visi stulpeliai iðskyrus pirmàjá.
d[, -1]

# Kaip ir matricoms, galima nurodyti lentelës eiluèiø ir stulpeliø indeksø aibæ.
# Pvz., ið lentelës d iðskirsime pirmas dvi eilutes ir paskutinius du stulpelius.

i <- c(1, 2)
j <- c(2, 3)
d[i, j]

# Kartais tokià konstrukcijà galima paraðyti ir trumpiau.
d[1:2, 2:3]


# Daþnai duomenø lentelës kintamuosius patogiau iðskirti nurodant jø vardus.
d[, "X"] 

# Duomenø lentelës eilutes taip pat galima identifikuoti pagal jø vardus. Reikia 
# turëti omeny, kad pagal nutylëjimà eilutës yra numeruojamos, taèiau jø numeriai
# yra character tipo, todël juos reikia nurodyti kabutëse!
d["1", ]


# Operatoriø [ galima naudoti á duomenø lentelæ þiûrint kaip á vektoriø ar sàraðà.
# Tokiu atveju lentelës elementai yra jos kintamieji, t.y. stulpeliai. Nurodþius 
# vieno lentelës elemento numerá, gausime taip pat lentelæ tik su vienu stulpeliu.
d[1]

# Nurodþius neigiamà indeksà, atitinkamà numerá turintis kintamasis-stulpelis 
# nebus pasirenkamas.
d[-1]

# Nurodþius kintamøjø indeksø aibæ, galima iðskirti ir keletà kintamøjø.
d[1:2]

# Operatoriø [[ naudojant iðskirtas lentelës elementas -- kintamasis turës savo 
# pradiná tipà ir struktûrà, t.y. gausime paprastà vektoriø.
d[[1]]

# Vietoje duomenø lentelës kintamojo numerio galima naudoti jo vardà.

d["X"]       # pirmu bûdu gauname duomenø lentelæ su vienu stulpeliu 
d[["X"]]     # antru bûdu gaunamas vektorius su lentelës kintamojo reikðmëmis

# Galima patikrinti dviem skirtingais bûdais gautø duomenø lentelës elementø tipà.
a <- d["X"]
b <- d[["X"]]

class(a)   
class(b)   


# Vienà duomenø lentelës kintamàjá galima iðskirti naudojant operatoriø $. Èia
# kintamojo vardas daþniausiai raðomas be kabuèiø. Matricoms toks bûdas netinka!

d$X
d$Testas


# UÞDUOTIS ------------------------------ 

# 1. Keliais skirtingais bûdais iðskirkite ið lentelës d antràjá stulpelá. Reikia 
#    panaudoti stulpelio numerá, jo vardà, operatorius [, [[ ir $.
# 2. Ið lentelës d sukurkite naujà lentelæ, kurioje neliktø dviejø paskutiniø 
#    eiluèiø. Kaip tai padaryti naudojant ne eiluèiø numerius, o jø vardus?
# 3. Naudojant kintamøjø numerius sukeiskite vietomis pirmus du lentelës d 
#    stulpelius. Tà patá veiksmà atlikite naudojant kintamøjø vardus.
# 4. Sukurkite toká indeksà, kurá naudojant ið lentelës d bûtø iðskiriamos eilutës 
#    su nelyginiais numeriais.
# 5. Sukurkite toká indeksà, kurá naudojant ið lentelës d bûtø galima iðskirti 
#    eilutes, kuriose kintamasis Testas ágyjà reikðmæ TRUE.


# --------------------------------------- #
# DUOMENØ LENTELIØ APJUNGIMAS             #
# --------------------------------------- #

# Gana daþnai pasitaiko situacija, kai prie jau sukurtos duomenø lentelës reikia 
# prijungti naujà kintamàjá. Tam yra keletas bûdø. Naudojant operatoriø [ galima 
# nurodyti stulpelio, kuriame bus naujas kintamasis, numerá arba nurodyti jo vardà.

# Duomenø lentelëje d sukursime naujà stulpelá, jam priskirsime reikðmiø vektoriø 
# ir taip gausime naujà lentelës kintamàjá. Jo vardas parenkamas pagal nutylëjimà.

d[4] <- rep(1:2, each = 5)
d

# Daþnu atveju paprasèiau ið karto nurodyti naujo kintamojo vardà. Stulpelis su 
# naujo kintamojo reikðmëmis prie lentelës bus prijungtas ið deðinës. Pvz., 
# lentelëje sukursime naujà kintamàjá "N" ir jam priskirsime tam tikrà reikðmiø 
# vektoriø.
 
d["N"] <- 1:10
d

# Á lentelæ þiûrint kaip á matricà, naujà kintamàjá, kaip ir anksèiau, sukuriame 
# nurodydami atitinkamo stulpelio numerá arba stulpelio vardà, o eiluèiø indeksà 
# praleidþiame.

d[, "M"] <- 1
d

# Nurodant kintamøjø vardø vektoriø, galima sukurti ið karto keletà naujø lentelës 
# kintamøjø. Pvz., èia jiems visiems priskiriamas praleistø reikðmiø vektorius.

d[c("A", "B", "C")] <- NA
d

# Naudojant operatoriø $ naujas kintamasis sukuriamas nurodant jo vardà ir 
# priskiriant jam reikðmiø vektoriø.

d$Kodas <- letters[1:10]
d

# Panaikinti duomenø lentelës kintamàjá taip pat yra keletas bûdø. Galima sukurti 
# naujà lentelæ, kurioje nebûtø nereikalingo kintamojo, taèiau dauguma atvejø 
# paprasèiau kintamajam priskirti tuðèià objektà NULL. Kintamàjá nurodyti galima 
# keliais skirtingais bûdais.

d[4]     <- NULL     # naudojame operatoriø [, nurodome kintamojo numerá
d["N"]   <- NULL     # naudojame operatoriø [, nurodome kintamojo vardà
d[, "M"] <- NULL     # naudojame operatoriø [, nurodome stulpelio vardà
d$Kodas  <- NULL     # naudojame operatoriø $, nurodome kintamojo vardà

d

# Tuo atveju, kai reikia panaikinti keletà kintamøjø ið karto, jiems reikia 
# priskirti sàraða ið NULL objektø.

d[c("A", "B", "C")] <- list(NULL)
d


# UÞDUOTIS ------------------------------ 

# 1. Naudodami operatoriø [ anksèiau sudarytoje lentelëje h sukurkite naujà 
#    kintamàjá N, kurio visos reikðmës bûtø lygios nuliui.
# 2. Naudodami operatoriø $ lentelëje h sukurkite kintamàjá X, kurio visos 
#    reikðmës praleistos. Nekuriant ið naujo kintamojo X, paskutinæ jo reikðmæ 
#    pakeiskite ið NA á 100.
# 3. Lentelëje h panaikinkite tokius du kintamuosius, kurie vardø sàraðe yra 
#    paskutiniai.


# Panaðiai kaip ir matricas, naudojant funkcijà cbind, vienà lentelæ galima 
# prijungti prie kitos lentelës ðono. Tokiu atveju abiejø lenteliø eiluèiø 
# skaièius turi bûti vienodas!

a <- data.frame(A = 10:15, B = TRUE)
b <- data.frame(A = 6:1, B = FALSE)
a
b

m <- cbind(a, b)
m

# Kintamøjø vardai gali bûti nebûtinai skirtingi, taèiau tokiu atveju kintamàjá 
# pasirenkant pagal vardà, bus iðrenkamas pirmasis ið pasikartojantá vardà 
# turinèiø kintamøjø -- nepageidaujama situacija!

names(m)

m$A
m$A <- NULL
m

# Naudojant funkcijà cbind, prie lentelës kaip naujà kintamàjá galima prijungti 
# ir vektoriø. Pvz., taip sukursime naujà lentelës d kintamàjá I, kurio visos 
# reikðmës bus lygios 1. Kadangi prijungiamas vektorius yra trumpesnis, jo 
# reikðmës pakartojamos.

d <- cbind(d, I = 1)
d

# Naudojant funkcijà rbind, duomenø lentelës apjungiamos sudedant jas vienà ant 
# kitos. Ðiuo atveju bûtina, kad kintamøjø vardai abiejose lentelëse sutaptø, 
# taèiau eiluèiø skaièius gali bûti bet koks.

m <- rbind(a, b)
m


# UÞDUOTIS ------------------------------ 

# 1. Naudodami funkcijà cbind anksèiau sudarytoje lentelëje h sukurkite naujà 
#    kintamàjá N, kurio visos reikðmës bûtø lygios nuliui.
# 2. Sukurkite tokius paèius kintamuosius turinèià lentelæ k, kuri turëtø tik 
#    vienà eilutæ, ir prijunkite jà prie lentelës h apaèios.

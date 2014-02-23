
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Vektoriø sudarymas ir pagrindinës jø savybës.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2012-09-03 | 2013-05-06
#


# TURINYS -------------------------------

# 
#   1. Vektoriø sudarymas ir jø sàvybës:
#      * komanda vector
#      * standartiniai vektoriai
#      * komanda c
#      * komanda length 
#      * komanda mode 
#      * komanda names 
#      * komanda attributes 
#      * komanda attr 
#      * operatorius [
#
#   2. Aritmetinës progresijos ir pasikartojanèios sekos:
#      * operatorius :
#      * komanda seq
#      * komanda seq_len
#      * komanda seq_along
#      * komanda rep
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
# VEKTORIØ SUDARYMAS                      #
# --------------------------------------- #

# Vektorius yra bazinis ir pats svarbiausias R duomenø formatas. Vektorius gali 
# bûti sudarytas tik ið to paties tipo reikðmiø. Pagrindiniai tipai yra tokie:
#
# character -- kabutëse raðomi raidës, þodþiai, sakiniai ir kiti simboliai;
#   numeric -- realieji skaièiai;
#    double -- taip pat realieji skaièiai, nuo numeric nesiskiria;
#   integer -- sveikieji skaièiai uþraðomi priraðant L raidæ, pvz., 1L;
#   complex -- a + bi  pavidalu uþraðomi kompleksiniai skaièiai;
#   logical -- loginës reikðmës, TRUE, FALSE ir praleistom reikðmëm þymëti NA.

# Kiekvienas R objektas turi tam tikrus atributus. Pagrindiniai vektoriaus
# atributai tai yra jo elementø skaièius -- ilgis, ir vektoriø sudaranèiø
# reikðmiø tipas. Kitus galimus vektoriaus atributus aptarsime vëliau.

# Jei vektoriaus ilgis ir jo reikðmiø tipas yra þinomi, toká vektoriø galima
# sukurti naudojant funkcijà vector. Jos parametrai:
#
#   mode -- vektorius elementø tipas,
# length -- vektoriaus elementø skaièius.


# Priklausomai nuo pasirinkto tipo, vektorius uþpildomas tam tikromis vienodomis
# reikðmëmis. Þinoma, vëliau ðias reikðmes galima pakeisti.

vector(mode = "character", length = 10)
vector(mode = "numeric",   length = 10)
vector(mode = "logical",   length = 10)
vector(mode = "complex",   length = 10)

# Konkretaus tipo vektoriui sukurti naudojamos specialios komandos. Vienintelis 
# jø parametras yra vektoriaus ilgis. Pradinës tokiu bûdu sukurto vektoriaus 
# reikðmës taip pat yra vienodos ir priklauso nuo pasirinkto vektoriaus tipo.

character(10)
numeric(10)
logical(10)


# NAUDINGA ------------------------------

# R turi keletà standartiniø konstantø ir daþnai naudojamø vektoriø.

letters       # lotyniðka maþøjø raidþiø abëcëlë
LETTERS       # lotyniðka didþiøjø raidþiø abëcëlë
month.abb     # sutrumpinti mënesiø pavadinimai
month.name    # pilni mënesiø pavadinimai

pi            # skaièius Pi

NA            # naudojama þymëti praleistoms reikðmëms
NaN           # naudojama þymëti neapibrëþtumams
Inf           # begalybei þymëti naudojama numeric tipo reikðmë 
NULL          # specialus tuðèias objektas


# R kalboje skaliariniø dydþiø nëra. Atskirai paimta viena bet kokio tipo reikðmë 
# suprantama kaip vektorius, kurio ilgis lygus vienetui. Labai daþnai vektoriai 
# sudaromi apjungiant kelias reikðmes ar kelis to paties tipo vektorius. Tokiam 
# apjungimui naudojama funkcija c.

a <- c(1, 4, 5, 2, 3)
a

b <- "Visas sakinys yra viena 'character' tipo reikðmë."
b

x <- c(1, 2, 3)
y <- c(4, 5, 6)
z <- c(7, 8, 9)
u <- c(x, y, z)
u

# Vektoriaus ilgiui (jo elementø skaièiui) surasti naudojama komanda length.
length(a)
length(b)

# Vektoriaus elementø tipui nustatyti naudojama komanda mode. 
mode(a)
mode(b)

# Taip galima patikrinti ir vienos atskirai paimtos reikðmës tipà.
mode(NA)
mode(NaN)
mode(TRUE)
mode("T")
mode(T)
mode("pi")
mode(pi)
mode(0+0i)

# NULL yra specifinis -- tuðèias objektas, todël jis turi specialø tipà.
length(NULL)
mode(NULL)


# Vektoriaus elementai gali turëti vardus. Juos galima nurodyti vektoriaus
# sudarymo metu arba vardø vektoriø galima priskirti jau turimam vektoriui.

d <- c(sausis = 31, vasaris = 28, kovas = 31, balandis = 30)
d

# Vektoriaus elementø vardai taip pat sudaro vektoriø, o jø ilgiai sutampa.
names(d)
mode(names(d))

length(d)
length(names(d))

# Ta pati komanda names naudojama pakeisti arba sudaryti naujà vardø vektoriø.
# Tarkime, kad turime vektoriø, kurio elementai neturi vardø, t.y. jo vardø 
# vektorius yra tuðèias, todël komanda names gràþina reikðmæ NULL.

a
names(a)

# Vardø vektoriui suteikiame reikðmæ -- vektoriø su elementø pavadinimais.
names(a) <- c("pirmas", "antras", "treèias", "ketvirtas", "penktas")

# Vektoriaus elementø reikðmës nepasikeitë, taèiau dabar jis be ilgio ir
# reikðmiø tipo turi dar vienà atributà -- vardus.
a
names(a)


# UÞDUOTIS ------------------------------ 

# 1. Patikrinkite teiginá, kad vektoriaus d ir jo vardø vektoriaus ilgiai sutampa.
# 2. Apskaièiuokite, kokio ilgio yra vektorius LETTERS.
# 3. Apskaièiuokite vektoriaus u ilgá ir nustatykite jo tipà.


# Vektoriaus ar kito R objekto atributams parodyti naudojama komanda attributes. 

# Anksèiau sudarytas vektorius a turi vienintelá pakeièiamà atributà -- vardus.
attributes(a)

# Vektorius b tokio atributo neturi, todël funkcija gràþina tuðèià objektà NULL.
attributes(b)


# Vektoriaus ar kito objekto atributams sukurti ir pakeisti yra keletas bûdø. 
# Vieno kurio nors atributo reikðmës priskyrimui naudojama komanda attr.

# Vektoriaus vardai yra jo atributas, todël já taip pat galima pakeisti su attr.
attr(a, "names") <- c("I", "II", "III", "IV", "V")

# Vektoriaus atributas gali bûti ir bet kokia papildoma informacija apie vektoriø.
attr(a, "versija") <- "0.9"
attr(a, "data")    <- "2013-05-06"

attributes(a)
a

# Kartais reikia panaikinti tik vektoriaus elementø vardus. Pats paprasèiausias 
# bûdas tai padaryti -- vardø vektoriui priskirti NULL reikðmæ.

names(a) <- NULL
names(a)
a

# Analogiðku bûdu galima panaikinti ir visus vektoriaus atributus ir karto.
attributes(a) <- NULL
attributes(a)
a


# UÞDUOTIS ------------------------------ 

# 1. Sugalvokite bûdà, kaip vektoriaus vardus panaikinti naudojant komandà attr?


# Bet kurá vektoriaus elementà galima pasiekti lauþtiniuose skliaustuose nurodþius 
# jo eilës numerá. Pvz., iðrenkame treèià vektoriaus d elementà.
d[3]

# Galima iðskirti kelis vektoriaus elementus ið karto. Tokiu atveju reikia sudaryti 
# iðrenkamø elementø indeksø aibæ -- sukurti jø numeriø vektoriø.
i <- c(3, 4)
d[i]

# Iðrenkamø elementø tvarka nebûtinai turi sutapti su jø tvarka tame vektoriuje.
i <- c(4, 1)
d[i]


# UÞDUOTIS ------------------------------ 

# 1. Naudodami indeksø vektoriø, vektoriaus d elementus iðrikiuokite  prieðinga tvarka.
# 2. Sudarykite toká indeksø vektoriø, kurá naudojant pirmasis vektoriaus d elementas 
#    bûtø iðrenkamas tris kartus.


# Vektoriaus elementus galima iðrinkti sudarius to paties ilgio loginiø reikðmiø 
# vektoriø, kur TRUE reiðkia, jog reikðmæ reikia iðrinkti, o FALSE -- neiðrinkti.
# Pvz., ið vektoriaus d iðrinksime pirmà ir treèià narius.

i <- c(TRUE, FALSE, TRUE, FALSE)
i
d[i]

# Toks indeksø vektorius labai daþnai gaunamas tikrinant kokià nors sàlygà.
# Pvz., ið vektoriaus d iðskirsim tuos elementus, kuriø reikðmë didesnë uþ 30.

i <- d > 30
i
d[i]

# Jei vektoriaus elementai turi vardus, tai konkretø vektoriaus elementà galima
# iðrinkti nurodþius jo vardà.

i <- "vasaris"
d[i]

i <- c("kovas", "balandis")
d[i]


# UÞDUOTIS ------------------------------ 

# 1. Ið vektoriaus d iðskirkite tuos elementus, kuriø reikðmë tiksliai lygi 30.
# 2. Sudarykite toká vardø vektoriø, kad vektoriaus d elementus iðvestø jø vardø 
#    abëcëlës tvarka.


# NAUDINGA ------------------------------

# Programuojant su R, kai kurios tipinës konstrukcijos uþraðomos labai kompaktiðkai. 
# Pvz., jei vektoriaus elementø iðrinkimas yra vienkartinis ir niekur nepasikartoja, 
# tai toká indeksà, jø vektoriø ar loginæ sàlygà galima ákelti tiesiai á lauþtinius 
# skliaustus -- bus trumpiau.

d[c(4, 1)]
d[d > 30]
d["vasaris"]

# Jei veiksmø su vektoriais rezultatas yra vektorius, ið kurio reikia dar kartà 
# iðrinkti tam tikrà elementà, toká veiksmà galima padaryti dar kartà naudojant 
# iðrinkimo operatoriø [ ir nesukuriant tarpinio vektoriaus. Pvz., ið vektoriaus 
# d iðrinksime antràjá mënesá, kurio dienø skaièius didesnis uþ 30.

d[d > 30][2]

# Komandos names rezultatas yra vektoriaus elementø vardø vektorius (þinoma, jei  
# jis egzistuoja). Tokio vektoriaus elementà galima iðrinkti kaip ið bet kurio 
# kito vektoriaus. Pvz., iðrinksime pirmojo vektoriaus d elemento vardà.

names(d)[1]


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite komandà, kuri bet kokio ilgio vektoriui iðrinktø paskutiná to 
#    vektoriaus vardø vektoriaus elementà.


# --------------------------------------- #
# ARITMETINËS IR PASIKARTOJANÈIOS SEKOS   #
# --------------------------------------- #

# Tarkime, kad mums reikalingas visø natûriniø skaièiø nuo 1 iki 10 vektorius.
s <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
s

# Sveikøjø skaièiø aritmetinæ progresijà su þingsniu 1 arba -1 galima uþraðyti
# labai kompaktiðkai. Tam reikia per dvitaðká nurodyti pirmà ir paskutiná sekos 
# narius.

1:10  # sekoje deðimt sveikøjø skaièiø nuo 1 iki 10

-5:5  # skaièiai sekoje gali bûti neigiami

10:1  # skaièiø seka gali bûti ir maþëjanti


# Sudëtingesnëms aritmetinëms progresijoms sudaryti skirta procedûra seq. 
# Jos parametrai:
#
#       from -- pirmojo generuojamos sekos nario reikðmë,
#         to -- paskutinio generuojamos sekos nario reikðmë,
#         by -- generuojamos sekos þingsnis,
# length.out -- visos sekos elementø skaièius,
# along.with -- vektorius, kurio elementø skaièius bus sekos ilgis.


# Pvz., tà paèià skaièiø sekà nuo 1 iki 10 galima uþraðyti taip:
s <- seq(from = 1, to = 10, by = 1)
s

# Jei parametrai nurodomi nustatyta tvarka, jø vardø galima visai neraðyti. 
s <- seq(1, 10, 1)
s

# Pagal nutylëjimà sekos þingsnis lygus 1, todël ir parametro by galima neraðyti.
s <- seq(1, 10)
s

# Naudojant tà paèià funkcijà galima keisti sekos þingsná ar nariø skaièiø.
seq(1, 10, by = 0.5)                 # nurodome reikiamà sekos þingsná 
seq(1, 10, length.out = 19)          # nurodome bendrà sekos nariø skaièiø

# Jei reikia sukurti sekà, kurios ilgis lygus kito vektoriaus elementø skaièiui,
# tada naudojamas parametras along.with, kuriam priskiriamas tas vektorius.

d
seq(along.with = d)

# Kitø parametrø reikðmes taip pat galima keisti, pvz., nurodyti sekos pradþià 
# ar pabaigà, taip pat galima nurodyti sekos þingsná.

seq(from = 1, to = 10, along.with = d)
seq(from = 10, by = 2, along.with = d)
seq(to   = 10, by = 2, along.with = d)


# NAUDINGA ------------------------------

# Jei sekos generavimui naudojamas vien tik parametras length.out, vietoje komandos
# seq(length.out = x) galima naudoti komandà seq_len(x).

seq(length.out = 10)
seq_len(10)

# Jei sekos generavimui naudojamas vien tik parametras along.with, vietoje komandos
# seq(along.with = x) galima naudoti komandà seq_along(x).

seq(along.with = d)
seq_along(d)

# Parametro from interpretacija priklauso nuo to, kokia reikðmë jam suteikiama: jei 
# vienas skaièius x, tai funkcijos seq(x) rezultatas bus kaip funkcijos seq_len(x), 
# jei vektorius x -- kaip funkcijos seq_along(x).

x <- 10
seq(x)

x <- c(F, F, T)
seq(x)


# UÞDUOTIS ------------------------------ 

# 1. Su komandà seq sudarykite sekà ið maþesniø nei 100 nelyginiø natûriniø skaièiø.
# 2. Su komandà seq sudarykite sekà, kuri atkarpà [0, 1] padalina á 10 lygiø daliø.
# 3. Antro uþdavinio rezultatà gaukite funkcijoje seq nenaudojant parametro by.
# 4. Antro uþdavinio rezultatà gaukite ið vis nenaudodami funkcijos seq.


# Pasikartojanèiø elementø turinèios sekos generavimui naudojama funkcija rep. 
# Jos parametrai:
#
#          x -- vektorius, kurá reikia pakartoti,
#      times -- viso vektoriaus pakartojimø skaièius,
# length.out -- bendras sekos elementø skaièius,
#       each -- vektoriaus elementø pakartojimø skaièius.


# Sudarome vektoriø (1, 2, 3), kurio elementus pakartosime ávairiais bûdais.
v <- 1:3
v

# Viso vektoriaus pakartojimø skaièiø nurodo parametras times. Tokiu atveju prie 
# vektoriaus galo prijungiamas toks pat vektorius ir tai pakartojama keletà kartø.
rep(v, times = 3)

# Vektoriaus elementø pakartojimø skaièius gali bûti individualus. Tokiu atveju 
# parametro times reikðmë bus tokio pat ilgio vektorius su pakartojimø reikðmëmis.
rep(v, times = c(1, 5, 1))

# Tuo atveju, jei visi vektoriaus elementai turi bûti pakartoti vienodà skaièiø
# kartø, paprasèiau tà skaièiø nurodyti parametrui each -- komanda bus aiðkesnë.
rep(v, times = c(2, 2, 2))
rep(v, each = 2)

# Sugeneruotos sekos ilgis nebûtinai turi bûti vektoriaus x ilgio kartotinis, jos 
# ilgá galima apriboti per parametrà length.out. Pvz, vektoriø v kartojame, kol 
# visos sekos ilgis bus lygus 10.
rep(v, length.out = 10)

# Gali bûti nurodomi ið karto keli argumentai, taèiau svarbu þinoti, kad parametras 
# each turi didesná prioritetà prieð parametrà times.
rep(v, each = 2, times = 2)

# Pakartojamas vektorius gali bûti bet kokio tipo. Jis gali turëti ir vienà reikðmæ.
rep(1, times = 5)

# Jei parametrai uþraðomi ta paèia tvarka, jø pavadinimø galima neraðyti.
rep(1, 5)


# UÞDUOTIS ------------------------------ 

# 1. Komandos rep(1, 5) rezultatà gaukite panaudodami funkcijà seq.
# 2. Uþraðykite rep komandà, kuri ið vektoriaus v sudarytø sekà 1, 2, 2, 3, 3, 3.

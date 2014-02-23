
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Ciklai ir jø nutraukimo komandos.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-08-22 | 2013-08-25
#


# TURINYS -------------------------------

#
#   1. Ciklø for ir while konstrukcijos:
#      * komanda for
#      * komanda while
#
#   2. Ciklo nutraukimo komandos:  
#      * komanda repeat
#      * komanda next
#      * komanda break
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
# CIKLAS FOR                              #
# --------------------------------------- #

# Programavimo kalbose ciklai naudojami tokiuose algoritmuose, kur atliekami tam 
# tikri pasikartojantys veiksmai. Jø skaièius gali bûti ið anksto þinomas arba 
# keistis priklausomai nuo ciklo metu tikrinamø sàlygø.

# Ciklas for naudojamas tais atvejais, kai iteracijø skaièius ið anksto þinomas.
# Duomenø analizëje tai gali bûti vektoriaus elementø kiekis, matricos stulpeliø
# arba eiluèiø skaièius, sàraðo áraðø skaièius, nuskaitomø duomenø failø kiekis, 
# modeliuojamø procesø skaièius ir t.t. 

# Bendra ciklo for konstrukcija atrodo taip:
# 
#    for (var in set) {
#       iðraiðkos
#    }
# 
# Kintamasis var ágyja reikðmes ið indeksø aibës set. Ði aibë gali bûti sudaryta
# ið bet kokia tvarka suraðytø vektoriaus elementø numeriø, matricos eiluèiø ar 
# stulpeliø numeriø, taip pat vardø, kodø ar kitø kintamøjø, kuriø reikðmes turi
# ágyti ciklo kintamasis var.

# Ið eilës einanèiø indeksø aibæ paprasèiausia nurodyti naudojant : operatoriø. 
# Kai vektoriaus ar sàraðo elementø skaièius ið anksto neþinomas, jam nustatyti 
# galima naudoti funkcijà length.

# Pavyzdþiui, naudodami ciklà for, apskaièiuosime visø vektoriaus elementø sumà.

v <- c(19, 5, 2, 19, 29, 42, 32, 35, 25, 18, 6, 22, 7, 28, 11, 8, 9, 37, 45, 23)

suma <- 0

for (i in 1:length(v)) {
  suma <- suma + v[i]
}

suma

# Kadangi ciklo kintamasis turi perbëgti per visø vektoriaus elementø indeksus, 
# o ciklo viduje naudojamos vektoriaus elementø reikðmës, vietoje indeksø aibës 
# galima nurodyti patá vektoriø. Tada sumavimo algoritmas uþraðomas paprasèiau.

suma <- 0

for (i in v) {
  suma <- suma + i
}

suma

# Paprastai vektoriaus elementø sumavimui naudojama standartinë funkcija sum.
sum(v)


# Ið eilës einanèiø vektoriaus arba sàraðo elementø indeksø aibæ galima sudaryti 
# ir naudojant funkcijà seq_along.

# Pavyzdþiui, apskaièiuosime tam tikrà ribà virðijanèiø vektoriaus elementø sumà
# ir tokiø elementø skaièiø.

riba <- 30
suma <- 0
kiek <- 0

for (i in seq_along(v)) {
  if (v[i] > riba) {
    suma <- suma + v[i] 
    kiek <- kiek + 1
  }
}

suma
kiek

# Taip ði uþduotis turëtø bûti atlikta pagal R programavimo ideologijà.
sum(v[v > riba])
sum(v > riba)


# Indeksø aibë nebûtinai turi apimti visus vektoriaus elementus, be to, indeksai
# gali bûti suraðyti bet kokia tvarka, jie gali kartotis ir t.t.

# Pavyzdþiui, sudarysime nelyginiø vektoriaus elementø indeksø aibæ ir iðvesime
# juos á konsolæ.

nelyginiai <- seq(1, length(v), by = 2)

for (i in nelyginiai) {
  cat("Elemento", i, "reikðmë:\n")
  print(v[i])
}

# Taip ði uþduotis turëtø bûti atlikta pagal R programavimo ideologijà.
v[nelyginiai]


# Indeksø aibë gali bûti sudaryta ir ne ið skaièiø. Jà gali sudaryti bet kokie
# kiti objektai. Pavyzdþiui, sudarysime aibæ ið raidþiø ir patikrinsime, koks jø
# numeris lotyniðkoje abëcëlëje.

þodis <- c("L", "I", "E", "T", "U", "V", "A")

for (raidë in þodis) {
  numeris <- which(raidë == LETTERS)
  cat(raidë, numeris, "\n")
}


# Ciklus galima ádëti vienà á kità. Paprastai taip daroma atliekant veiksmus su 
# matricomis. Pavyzdþiui, sukursime 4x5 dydþio nulinæ matricà ir jos elementams 
# priskirsime tø elementø eilutës ir stulpelio numeriø sumà.

m <- matrix(0, nrow = 4, ncol = 5)

# Matricos eiluèiø ir stulpeliø skaièius nustatomas naudojant funkcijas nrow ir 
# ncol.

for (i in 1:nrow(m)) {
  for (j in 1:ncol(m)) {
    m[i, j] <- i + j
  }
}

m


# NAUDINGA ------------------------------

# Atliekant ilgai trunkanèius skaièiavimus, á konsolæ naudinga iðvesti papildomà 
# informacijà apie skaièiavimø progresà: tarpiniø kintamøjø reikðmes, iteracijos 
# numerá ar laikà.

# Pavyzdþiui, á ciklà for ádësime informacijà apie iteracijos numerá ir suminá
# algoritmo veikimo laikà. Ðis laikas gaunamas kaip skirtumas tarp dviejø laiko 
# momentø: vienas uþfiksuojamas prieð ciklà, kitas - kiekvienos iteracijos metu. 
# Tam naudojama funkcija proc.time.

# Informacija á konsolæ iðvedama kiekvienos iteracijos metu, taèiau pati konsolë
# atnaujinama tik iðëjus ið ciklo. Konsolës atnaujinimui naudojama funkcija
# flush.console.

# Vietoje ilgai trunkanèiø skaièiavimø èia cikle ádëta funkcija Sys.sleep, kuri 
# nustatytam laiko intervalui sustabdo bet kokius skaièiavimus. Ðiuo atveju tai
# vienos sekundës pauzë.

start.time <- proc.time()
n <- 10

for (i in 1:n) {

  # Iðvedame informacijà apie iteracijos numerá ir bendrà laikà.
  info.index <- formatC(i, digits = 0, width = 2, format = "f", flag = "0")
  info.time  <- proc.time()[3] - start.time[3]
  cat("Iteracija", info.index, "ið", n, " .†. ", info.time, "\n")
  flush.console()

  Sys.sleep(1)
}


# UÞDUOTIS ------------------------------ 

# 1. Tarkim, kad vektoriaus elementø reikðmës gautos vienodais laiko intervalais
#    matuojant tam tikrà kintantá dydá. Toks vektorius vadinamas laiko eilute. 
#    Statistikoje daþnai taikomas laiko eilutës glodinimas slenkanèiu vidurkiu.
#    Sudarykite vektoriø, kurio pirmojo elemento reikðmë bûtø lygi vektoriaus v
#    1, 2 ir 3 elementø vidurkiui, antro elemento reikðmë -- 2, 3, ir 4 elementø 
#    vidurkiui ir taip toliau iki galo. 
# 2. Uþraðykite algoritmà, kuris surastø didþiausia reikðmæ turintá vektoriaus v
#    elementà ir nustatytø jo eilës numerá.
# 3. Naudodami ciklà for, sudarykite vektoriø, kurio elementai lygûs matricos m
#    eiluèiø sumoms.
# 4. Naudodami ciklà for, uþraðykite algoritmà natûrinio skaièiaus n faktorialui
#    apskaièiuoti.


# --------------------------------------- #
# CIKLAS WHILE                            #
# --------------------------------------- #

# Ciklas while naudojamas tada, kai tam tikrus pasikartojanèius veiksmus reikia
# kartoti tol, kol tenkinama tam tikra sàlyga. Bendra ciklo while konstrukcija 
# atrodo taip:
# 
#    while (loginë sàlyga) {
#       iðraiðkos
#    }

# Sàlyga turi bûti tokia, kad ciklas netaptø amþinas. Tai reiðkia, kad tam tikru 
# momentu loginës sàlygos reikðmë bûtinai turi tapti FALSE.

# Pavyzdþiui, uþraðysime algoritmà skaièiaus n faktorialui apskaièiuoti.

n <- 5
faktorialas <- 1
 
while (n > 0) {
  faktorialas <- faktorialas * n
  n <- n - 1
}
 
faktorialas

# Paprastai faktorialø skaièiavimui naudojama standartinë funkcija factorial.
factorial(5)


# Ciklà while kartais galima naudoti ir tokiose situacijoje, kur tinka ir ciklas
# for. Pavyzdþiui, patikrinsime, ar simboliø seka vienodai skaitoma ið abiejø 
# pusiø. Tokia skaièiø arba simboliø seka vadinama palindromu.

s <- c("S", "Ë", "D", "Ë", "K", "U", "Þ", "U", "K", "Ë", "D", "Ë", "S")

# Loginiam kintamajam palindromas ið karto priskiriama reikðmë TRUE. Tada pirmà
# elementà lyginame su paskutiniu, antrà su prieðpaskutiniu ið taip toliau iki 
# vektoriaus vidurio. Jei nors viena pora nesutampa, tai kintamajam palindromas
# priskiriama reikðmë FALSE.

i <- 0
k <- length(s)

palindromas <- TRUE

while (i < k/2) {
  i <- i + 1
  cat("Raidþiø pora:", s[i], s[k-i+1], "\n")
  if (s[i] != s[k-i+1]) palindromas <- FALSE
}

palindromas


# UÞDUOTIS ------------------------------ 

# 1. Naudodami ciklà while, apskaièiuokite, kiek ið eilës einanèiø vektoriaus v 
#    elementø reikia susumuoti, norint gauti didþiausià sumà nevirðijanèià 100.
#    Loginæ sàlygà reikia uþraðyti taip, kad susumavus visus elementus, bet sumai 
#    nevirðijus 100, ciklas bûtø nutraukiamas.
# 2. Naudodami ciklà while, uþraðykite vektoriaus elementø iðrikiavimo prieðinga
#    tvarka algoritmà.


# --------------------------------------- #
# CIKLAS REPEAT IR JO NUTRAUKIMAS         #
# --------------------------------------- #

# Ciklas repeat labai panaðus á ciklà while, taèiau ciklo nutraukimo sàlyga 
# tikrinama ciklo viduje: 
# 
#    repeat {
#       iðraiðkos
#       if (loginë sàlyga) break
#    }

# Pavyzdþiui, uþraðysime algoritmà, kuris skaièiavimus nutraukia po tam tikro 
# laiko tarpo. Ðiuo atveju tai bus 1 sekundë. Á konsolæ bus iðvedamas iteracijos 
# numeris.

start.time <- proc.time()
i <- 0

repeat {
  i <- i + 1
  cat(i, "\n")
  flush.console()

  laikas <- proc.time()[3] - start.time[3]
  if (laikas > 1) break
}


# Kartais ciklà reikia nutraukti dël skaièiavimø metu susidariusiø sàlygø. Tai
# gali bûti praleista ar neapibrëþta reikðmë duomenyse, maþas stebiniø skaièius
# ar kitokia nekorektiðka situacija. Bet kokio tipo ciklui nutraukti naudojamos 
# dvi komandos: 
#
#     next -- nutraukia iteracijà ir pereina prie sekanèios,
#    break -- nutraukia ciklà ir iðeina ið jo.

# Pavyzdþiui, naudojant ciklà for, susumuosime tik nelygines reikðmes turinèius 
# vektoriaus v elementus. Jei elemento reikðmë lyginë, tai sumavimo veiksmas
# praleidþiamas ir pereinama prie sekanèio elemento.

suma <- 0

for (i in v) {
  if (i %% 2 == 0) next
  suma <- suma + i
  cat("Elemento reikðmë:", i, "\n")
}

suma

# Sumavimo iðraiðkà galima ádëti á if-else konstrukcijà ir uþraðyti kiek kitaip.
suma <- 0

for (i in v) {
  if (i %% 2 == 1) suma <- suma + i else next
}

suma

# Taip ði uþduotis turëtø bûti atlikta pagal R programavimo ideologijà.
sum(v[v %% 2 == 1])


# Nors ciklui for nurodomas fiksuotas iteracijø skaièius, bet esant tam tikroms
# sàlygoms ciklà galima nutraukti anksèiau. Pavyzdþiui, nutrauksime ciklà, jei
# trijø ið eilës vektoriaus v elementø reikðmës virðija 30.

# Ciklo viduje á atskirà vektoriø iðskiriame tris ið eilës einanèius elementus,
# paþymëkime jø indeksus atitinkamai j - 2, j - 1 ir j. Kadangi pilnas trejetas 
# susidaro tik nuo treèiojo elemento, tai pirmasis indeksas j - 2 iki tol ágyjà 
# reikðmæ -1 arba 0, ir vektoriaus elementø su tokiais indeksais nëra. Dël to 
# ávedamas tarpinis kintamasis i = j - 2, kurio reikðmë lygi 1, jei j - 2 < 1.

riba <- 30

for (j in seq_along(v)) {
  i <- max(1, j - 2)
  t <- v[i:j]
  cat("Numeris:", j, "\n")
  cat(t, "\n")

  if (all(t > riba)) {
    cat("Trys ið eilës reikðmës didesnës uþ ", riba, "! ", sep = "")
    cat("Skaièiavimai nutraukiami.\n", sep = "")
    break  
  }
}


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite vektoriaus elementø sumavimo ciklà for, kuris nutraukiamas, jei 
#    vektoriaus elemento reikðmë yra NA. Iðeinant ið ciklo, á konsolæ iðvedamas
#    praneðimas, kad ciklas nutraukiamas dël praleistos reikðmës duomenyse.
# 2. Naudodami ciklà for, apskaièiuokite didesniø nei 30 vektoriaus v elementø
#    sumà ir ðiø elementø skaièiø. Netenkinanèiø ðios sàlygos elementø sumavimà
#    praleiskite naudojant komandà next.


#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Sàlygos konstrukcija if-else ir funkcija ifelse.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-08-16 | 2013-08-22
#


# TURINYS -------------------------------

#
#   1. Sàlygos tikrinimas:
#      * funkcija if
#      * funkcija ifelse
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
# IF-ELSE KONSTRUKCIJA                    #
# --------------------------------------- #

# Skaièiavimai daþnai priklauso nuo kintamiesiems ar jø reikðmëms keliamø sàlygø:
# jei jos tenkinamos, tai atliekami vieni veiksmai, jei netenkinamos -- kiti. 
# Tokiais atvejais naudojama sàlygos tikrinimo konstrukcija if-else. Bendras jos
# pavidalas toks:
#
#   if (loginë sàlyga) {
#       iðraiðkos A
#   } else {
#       iðraiðkos B
#   }
#
# Loginës sàlygos rezultatas turi bûti vienà elementà turintis loginis vektorius,
# kurio reikðmë arba TRUE, arba FALSE. Sàlygos rezultatas negali bûti NA reikðmë.
# Jei sàlygos vektorius turi daugiau nei vienà elementà, tikrinama tik pirmojo 
# elemento reikðmë. Jei sàlygos reikðmë TRUE, ávykdomos iðraiðkos A, kitu atveju
# ávykdomos iðraiðkos B.

# Pastaba! Komanda else turi bûti toje paèioje eilutëje kaip ir } skliaustelis.

# Pavyzdþiui, uþraðysime komandà, kuri patikrina ar kintamojo d reikðmë virðija 
# nustatytà ribà. Jei ði nelygybë teisinga, reikðmë prisumuojama, o tokiø dydþiø
# skaièius padidinamas vienetu. Prieðingu atveju á konsolæ iðvedamas praneðimas.

riba <- 20   # tam tikra kintamojo reikðmës riba
kiek <- 0    # ribà virðijanèiø dydþiø skaièius
suma <- 0    # ribà virðijanèiø dydþiø suma

d <- 13      # kintamojo d reikðmæ galima keisti

if (d > riba) {
    kiek <- kiek + 1
    suma <- suma + d
} else {
    cat("Dydis nevirðija nustatytos ribos\n.")
}

kiek
suma

# Jei iðraiðkà riestiniuose skliaustuose galima uþraðyti kaip vienà komandà, tai 
# skliaustø {} galima ir nenaudoti. Tokiu atveju visa if-else komanda uþraðoma 
# viena eilute:
#
#   if (loginë sàlyga) iðraiðka A else iðraiðka B

# Pavyzdþiui, uþraðysime komandà, kuri, priklausomai nuo testo reikðmës, reikðmæ
# 1 priskiria arba kintamajam x, arba kintamajam y.

testas <- TRUE
x <- 0
y <- 0

if (testas) x <- 1 else y <- 1

x
y


# Daþnai naudojama supaprastinta if konstrukcija:
#
#   if (loginë sàlyga) {
#       iðraiðkos A
#   }

# Pvz., turime du skaitinius kintamuosius: a ir b. Kintamojo a reikðmë turi bûti 
# maþesnë uþ kintamojo b reikðmæ. Jei teisinga nelygybë a > b, tai ðiø kintamøjø 
# reikðmes sukeisime vietomis, jei ne -- kintamøjø reikðmës lieka tokios paèios.

a <- 6
b <- 2

if (a > b) {
  t <- a
  a <- b
  b <- t

  rm(t)  # tarpinis kintamasis t iðtrinamas
}

a
b


# Loginës sàlygos rezultatas turi bûti vienà elementà turintis loginis vektorius.
# Tai reiðkia, kad galima patikrinti sàlygà apie visà vektoriø, taèiau negalima 
# patikrinti sàlygos apie kiekvienà vektoriaus elementà atskirai.

# Pavyzdþiui, uþraðysime komandà, kuri patikrina, ar vektorius z turi bent vienà
# elementà su praleista reikðme. Jei taip, á konsolæ iðvedami tokiø elementø
# numeriai. Prieðingu atveju uþraðomas praneðimas, kad praleistø reikðmiø nëra.

z <- c(1, 2, NA, 4, 5, NA, NA, 8)

praleistas <- is.na(z)
praleistas

# Funkcijos is.na rezultatas yra tokio pat ilgio loginis vektorius, bet komanda
# if tikrina tik pirmojo elemento reikðmæ, todël neatsiþvelgus á kitus elementus,
# gaunamas nekorektiðkas atsakymas. 

# Naudojant funkcijà all, galima patikrinti, ar visø loginio vektoriaus elementø 
# reikðmë yra TRUE. Èia bus naudojama funkcija any, kurios reikðmë yra TRUE, jei 
# bent vienas loginio vektoriaus elementas turi reikðmæ TRUE.

if (any(praleistas)) {
    i <- which(praleistas)
    cat("Elementø su praleistomis reikðmëmis numeriai:\n")
    print(i)
} else {
    cat("Elementø su praleistomis reikðmëmis nëra.\n")
}


# Tuo atveju, kai vektoriaus elementui priskiriama arba viena, arba kita reikðmë,
# priklausomai nuo to, ar tam tikrà sàlygà tenkina atitinkamas kito vektoriaus
# elementas, naudojama funkcija ifelse. Jos parametrai:
#
#     test -- loginiø reikðmiø vektorius,
#      yes -- reikðmë, jei loginio testo reikðmë TRUE,
#       no -- reikðmë, jei loginio testo reikðmë FALSE.

# Ðiuo atveju loginiø reikðmiø vektorius gali bûti bet kokio ilgio ir paprastai 
# jis yra loginës sàlygos apie vektoriaus elementus rezultatas.

# Tokiu bûdu, sàlyga apie kiekvienà vektoriaus elementà patikrinama, ir viena ar
# kita reikðmë kito vektoriaus elementui priskiriama nenaudojant ciklo.

# Pavyzdþiui, uþraðysime komandà, kuri vektoriaus m elementui priskiria reikðmæ
# 1, jei vektoriaus n elementas yra lyginis, ir reikðmæ -1, jei -- nelyginis.

n <- c(2, 5, 1, 6, 8, 7, 3, 9, 4)

m <- ifelse(n %% 2 == 0, 1, -1)
m

# Pastaba! Kartais vektoriaus reikðmiø perkodavimui funkcija ifelse nereikalinga.
# Pavyzdþiui, jei lyginá vieno vektoriaus elementà atitinka 0, o nelyginá 1, tai
# toks perkodavimas atliekamas paprasèiau -- surandant dalybos ið dviejø liekanà.

m <- n %% 2
m


# NAUDINGA ------------------------------

# Konstrukcijà if-else galima naudoti kaip funkcijà, kurios reikðmë priklauso
# nuo sàlygos ir apskaièiuojama pagal vienà ið dviejø iðraiðkø:
#
#   y <- if (loginë sàlyga) {
#       iðraiðkos A
#   } else {
#       iðraiðkos B
#   }

# Pavyzdþiui, uþraðysime komandà, kuri pagal kintamojo x þenklà kitam kintamajam 
# f priskiria arba tà paèià reikðmæ x, arba jai prieðingà reikðmæ -x.

x <- 3

y <- if (x > 0) {
    f <- x
} else {
    f <- -x
}

# Riestiniuose skliaustuose uþraðyto iðraiðkø bloko reikðmë yra paskutinës bloko 
# viduje esanèios iðraiðkos rezultatas, todël kintamajam y priskiriama kintamojo
# f reikðmë.
y


# Kaip ir anksèiau, jei riestiniuose skliaustuose áraðyta tik viena iðraiðka, jø 
# galima atsisakyti ir visà komandà uþraðyti vienoje eilutëje:
#
# y <- if (loginë sàlyga) reikðmë A else reikðmë B

# Pavyzdþiui, uþraðysime funkcijà-indikatoriø, kuri ágyja reikðmæ 1, jei x > 10,
# ir reikðmæ 0 -- prieðingu atveju.

x <- 3

y <- if (x > 10) 1 else 0
y

# Jei x bûtø daugiau nei vienà elementà turintis vektorius, tokiam priskyrimui 
# geriausia naudoti anksèiau apraðytà funkcijà ifelse.


# Kaip funkcijà galima naudoti ir supaprastintà if konstrukcijà be else dalies.
# Tokiu atveju, jei loginës sàlygos reikðmë yra FALSE, gràþinama NULL reikðmë!

y <- if (x > 10) 1
y


# UÞDUOTIS ------------------------------ 

# 1. Kintamojo egzistavimui nustatyti naudojama funkcija exists. Naudodami ðià
#    funkcijà, uþraðykite komandà, kuri patikrina ar, egzistuoja kintamasis, ir, 
#    jei tokio kintamojo nëra, á konsolæ iðvedamas tekstinis praneðimas.
# 2. Naudojant funkcijà ifelse, uþraðykite komandà, kuri NA reikðmæ turintiems
#    vektoriaus z elementams priskirtø reikðmæ 0. Uþraðykite analogiðkà komandà 
#    nenaudojant funkcijos ifelse.
# 3. Skaièiaus þenklo nustatymui naudojama funkcija sign. Naudojant funkcijà if,
#    uþraðykite skaièiaus x þenklo nustatymo funkcijà, kuri ágyja reikðmæ 1, kai
#    skaièius x > 0, reikðmæ -1, kai x < 0 ir reikðmæ 0, kai x = 0.
# 4. Uþraðykite komandà, kuri patikrina, ar visø vektoriaus n elementø reikðmës 
#    nevirðija 5. Jei ði sàlyga teisinga, tai kintamajam k priskiriama reikðmë 0.
#    Jei sàlyga netenkinama, kintamajam k priskiriamas didesniø uþ 5 vektoriaus
#    elementø skaièius, o kintamajam l priskiriamas bendras elementø skaièius.
# 5. Uþraðykite komandà, kuri patikrintø, ar vektorius n yra sveikøjø skaièiø
#    vektorius. Jei ne, vektoriaus klasæ pakeiskite á sveikøjø ir á konsolæ
#    iðveskite praneðimà apie vektoriaus klasës pakeitimà.

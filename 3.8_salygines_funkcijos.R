
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Funkcijos reikðmës skaièiavimas duomenø grupëse.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-09-07 | 2013-09-10
#


# TURINYS -------------------------------

#
#   1. Funkcijos skaièiavimas pagal vektoriaus elementø grupes:
#      * funkcija tapply
#      * funkcija split
#
#   2. Funkcijos skaièiavimas duomenø lentelës grupëse:
#      * funkcija by
#      * funkcija aggregate 
#


# PASTABOS ------------------------------

#
# Palyginti tapply ir reorder panaudojimà:
#   
#   bymedian <- with(InsectSprays, reorder(spray, count, median))
#   bytapply <- with(InsectSprays, tapply(count, spray, median))
#   boxplot(count ~ bymedian, data = InsectSprays)
#   boxplot(count ~ bytapply, data = InsectSprays)
#


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# FUNKCIJA TAPPLY                         #
# --------------------------------------- #

# Atliekant duomenø analizæ, tam tikras skaitines charakteristikas kartais tenka
# skaièiuoti ne visam duomenø rinkiniui, bet atskiroms duomenø grupëms. Tai gali
# bûti atlyginimø vidurkis vyrams ir moterims arba pokalbiø telefonu laiko sumos
# kiekvienam mënesiui atskirai, kai þinomos kiekvienos dienos pokalbiø trukmës.

# Tuo atveju, kai tà paèià funkcijà reikia pritaikyti keliems vieno vektoriaus 
# pogrupiams, naudojama funkcija tapply. Jos parametrai:
# 
#        X -- duomenø vektorius,
#    INDEX -- duomenis grupuojantis vektorius,
#      FUN -- funkcijos pavadinimas arba jos iðraiðka,
# simplify -- jei TRUE, rezultatas gràþinamas kaip vektorius.

# Parametrui INDEX priskiriamas vektorius turi turëti tiek pat elementø, kiek ir
# duomenø vektorius X. Paprastai tai yra kelias diskreèias reikðmes turintis 
# kategorinis kintamasis, kuris kiekvienà duomenø vektoriaus elementà priskiria 
# tam tikrai grupei.

x <- c(962, 826, 798, 600, 834, 532, 407, 484, 856, 667, 417, 541, 103, 904, 523)
g <- c("B", "B", "A", "A", "B", "B", "B", "A", "B", "B", "B", "A", "A", "A", "B")

# Pvz., apskaièiuosime vektoriaus x vidurká grupëse pagal vektoriaus g elementø 
# reikðmes. Rezultatas yra sàlyginis x vidurkis atskirai grupëje A ir grupëje B.

tapply(x, g, mean)

# Kintamojo grupavimas gali bûti atliekamas ið karto pagal kelis poþymius. Tokiu
# atveju parametrui INDEX nurodomas grupavimo kintamøjø list tipo sàraðas.

# Tarkime, kad pirmieji 8 kintamojo x stebiniø yra ið grupës I, likæ 7 ið gr. II.
# Sukursime tokias reikðmes turintá kintamajá. 

p <- rep(c("I", "II"), c(8, 7))

# Apskaièiuosime vidurkius pagal kintamuosius p ir g. Rezultatas yra sàlyginiai
# vidurkiai grupëse I-A, I-B, II-A ir II-B.

tapply(x, list(p, g), mean)

# Ástaèius funkcijà length, galima suþinoti, kiek vektoriaus x elementø patenka
# á kiekvienà ið grupiø I-A, I-B, II-A ir II-B.

tapply(x, list(p, g), length)

# Á tapply ástatomos funkcijos gali turëti savo parametrus. Pavyzdþiui, vidurkio
# skaièiavimui naudojama funkcija mean ir daugelis kitø funkcijø turi parametrà 
# na.rm, kuriam priskyrus reikðmæ TRUE, praleistos duomenø reikðmës ignoruojamos.

# Apskaièiuosime vektoriaus y, kuris turi praleistø reikðmiø, elementø vidurká 
# grupëse pagal kintamajá g.

y <- c(962, NA, 798, 600, 834, 532, 407, 484, NA, 667, 417, 541, NA, 904, 523)

tapply(y, g, mean, na.rm = TRUE)


# Á funkcijà tapply galima áraðyti standartinës funkcijos vardà arba, jei tokios
# funkcijos nëra, uþraðyti reikalingos funkcijos iðraiðkà. Pvz., apskaièiuosime
# skirtumà tarp didþiausios ir maþiausios vektoriaus x reikðmës grupëse. Pirmàjá
# funkcijos variantà uþraðysime naudojant tradicines funkcijas min ir max.

tapply(x, g, function(v) max(v) - min(v))

# Toká pat rezultatà galima gauti sudarant maþiausios ir didþiausios vektoriaus
# reikðmës radimo ir gretimø vektoriaus elementø skirtumo funkcijø superpozicijà.
# Toks funkcijos uþraðymo bûdas atitinka funkcinio programavimo su R stiliø.

tapply(x, g, function(v) diff(range(v)))


# Naudojant funkcijà tapply, galima ne tik skaièiuoti sàlygines charakteristikas,
# bet ir atlikti gana sudëtingus veiksmus skirtingose duomenø grupëse. Pvz., tai 
# gali bûti tos paèios statistinës hipotezës tikrinimas grupëse, panaðiø grafikø 
# naudojant duomenis ið skirtingø grupiø braiþymas ir pan. Priklausomai nuo to, 
# kokie veiksmai grupëse atliekami, rezultatas kartais gali bûti gana sudëtingas
# objektas: sàraðas, daþniø lentelë, grafikai ir t.t.

# Pavyzdþiui, sudarysime kintamojo p reikðmiø daþniø lentelæ A ir B grupëse.

tapply(p, g, table)


# Nors funkcijos tapply argumentai X ir INDEX yra vektoriai, taèiau ði funkcija
# daþnai pritaikoma duomenø lentelës vieno kintamojo charakteristikø skaèiavimui
# grupëse pagal kito kintamojo reikðmes.

d <- read.table(header = TRUE, text = "
   lytis  ûgis svoris grupë
  vyras   175     76     B
  vyras   180     NA     B
moteris   170     67     A
moteris   167     64     B
  vyras   178     80     A
moteris   172     59    NA
  vyras   184     NA     A
moteris   171     68     B
moteris   177     70     A
  vyras   185     84     B
")

# Pavyzdþiui, apskaièiuosime duomenø lentelëje d uþraðyto ûgio vidurká atskirai 
# vyrams ir moterims. Funkcijai perduodame á atskirus vektorius iðskirtus lyties 
# ir ûgio kintamuosius. Tai galima atlikti keliais skirtingais bûdais.

tapply(d[, 2], d[, 1], mean)

tapply(d[, "ûgis"], d[, "lytis"], mean)

tapply(d$ûgis, d$lytis, mean)


# Jei funkcijai perduodamas lentelës kintamojo vardas labai ilgas, kartais visa
# funkcija ákeliama á with konstrukcijà, kur nurodome, ið kokios aplinkos imami
# kintamøjø vardai. Ðiuo atveju kaip aplinkà nurodome duomenø lentelës vardà, o 
# funkcijai perduodame tos lentelës kintamøjø vardus. Kai lentelës vardas labai
# ilgas, toks uþraðymo bûdas gaunasi gerokai aiðkesnis ir trumpesnis.

with(data = d, tapply(ûgis, lytis, mean))


# NAUDINGA ------------------------------

# Funkcija tapply duomenø vektoriø suskaido á kelias grupes ir kiekvienai ið jø 
# pritaiko tà paèià funkcijà. Tuo paèiu jà galima panaudoti duomenø sudalijimui 
# á atskiras dalis pagal kaþkoká grupuojantá kintamàjá.

# Nenurodþius parametro FUN, tapply rezultatas yra duomenø vektoriaus X elementø
# pogrupiø, á kuriuos jie patenka, numeriø vektorius.

tapply(x, g)

# Parametrui FUN nurodþius iðskyrimo operatoriø [, duomenø vektorius suskaidomas
# ir sudaromas tokiø atskirtø grupiø sàraðas.

tapply(x, g, "[")

# Paprastai tokiam duomenø iðskyrimui á atskiras dalis pagal kaþkoká grupuojantá
# kintamàjá naudojama speciali funkcija split.

split(x, g)

# Kadangi funkcijos split rezultatas yra sàraðas, veiksmams su sàraðo elementais
# atlikti naudojamos funkcijos sapply ir lapply. Pvz., apskaièiuosime vektoriaus
# x vidurkius grupëse pagal kintamàjá g.

sapply(split(x, g), mean)


# Toks vektoriaus suskaidymas á grupes gali bûti atliekamas ne tik skaièiuojant 
# sàlygines charakteristikas, bet ir pertvarkant duomenis. Pavyzdþiu, naudojant
# iðskyrimo operatoriø, ið kiekvienos vektoriaus x grupës iðskirsime pirmàjá jo
# elementà.

tapply(x, g, "[", 1)


# Kartais grupavimo kintamasis gali bûti gaunamas ið pradinio duomenø vektoriaus 
# uþraðant jam kokià nors loginæ sàlygà. Pvz., á dvi atskiras grupes atskirsime 
# lyginius ir nelyginius vektoriaus x elementus.

tapply(x, x %% 2 == 0, "[")

# Tokià pat sàlygà galima perkelti ir á funkcijà split.

split(x, x %% 2 == 0)


# UÞDUOTIS ------------------------------ 

# 1. Naudojant f-jà tapply, apskaièiuokite vektoriaus x elementø sumà suskaidant
#    x á pogrupius pagal vektoriaus p elementø reikðmes.
# 2. Naudojant f-jà tapply, raskite maþiausià ir didþiausià vektoriaus x reikðmæ
#    grupëse pagal kintamajá p.
# 3. Apskaièiuokite duomenø lentelës kintamojo "svoris" vidurká atskirai vyrø ir
#    moterø grupëse. Atsiþvelkite á tai, kad kintamasis turi praleistø reikðmiø.
# 4. Naudojant f-jà tapply, ið vektoriaus x elementø suskirstytus grupëmis pagal 
#    kintamàjá g, sudarykite matricas, kurios turëtø po vienà stulpelá.
# 5. Naudojant tapply, ið kiekvienos, pagal vektoriø g suskirstytø, vektoriaus x
#    elementø grupës iðskirkite po pirmuosius du elementus.
# 6. Naudojant tapply, uþraðykite funkcijà, kuri apskaièiuotø, kiek vektoriaus y
#    elementø turi praleistas reikðmes ir kiek neturi. Kaip toká patá rezultatà
#    gauti nenaudojant funkcijos tapply?


# --------------------------------------- #
# FUNKCIJA BY                             #
# --------------------------------------- #

# Funkcija tapply naudojama kitø funkcijø skaièiavimui kaip duomenis naudojant á
# grupes iðskaidytus vektoriaus elementus. Analogiðka funkcija duomenø lentelëms
# arba matricoms yra by. Jos parametrai:
# 
#          data -- duomenø lentelë arba matrica,
#       INDICES -- duomenis grupuojantis faktorius arba jø sàraðas,
#           FUN -- funkcijos pavadinimas arba iðraiðka,
#      simplify -- jei TRUE, rezultatas gràþinamas kaip vektorius.

# Duomenø lentelës eilutës pagal vieno ar keletos kategoriniø kintamøjø reikðmes
# suskirstomos á grupes. Taip gaunamos kelios maþesnës duomenø lentelës, ir tada 
# kiekviena ið jø perduodama argumento FUN funkcijai. Jei grupavimas atliekamas
# pagal kelis kintamuosius, jie parametrui INDICES perduodami apjungti á sàraðà.

# Paèiu paprasèiausiu atveju funkcija by naudojama lygiai taip pat kaip ir f-ja
# tapply, skiriasi tik rezultatø iðvedimo forma. Pvz., apskaièiuosime vektoriaus 
# x vidurká grupëse pagal vektoriaus g elementø reikðmes. 

by(x, g, mean)

# Skaièiavimus grupëse galima atlikti su vienu duomenø lentelës kintamuoju. Pvz., 
# apskaièiuosime lentelës d kintamojo ûgis vidurká atskirai vyrams ir moterims.
# Èia kintamasis ûgis vidurkio skaièiavimo funkcijai perduodamas kaip vektorius. 

by(d[, 2], d[, 1],  mean)    # nurodome stulpeliø numerius
by(d$ûgis, d$lytis, mean)    # nurodome kintamøjø vardus

# Visà iðraiðkà ádëjus á funkcijà with, lentelës kintamøjø vardus galima naudoti 
# tiesiogiai. Tokiu bûdu uþraðyta iðraiðka lengviau skaitoma ir suprantama.

with(d, by(ûgis, lytis, mean))


# Naudojant by, funkcijai galima perduoti daugiau nei vienà kintamàjá turinèià 
# duomenø lentelæ. Pvz., apskaièiuosime kintamøjø ûgis ir svoris koreliacijos 
# koeficientà atskirai vyrø ir moterø grupëse.

# Kaip ir anksèiau, visà by iðraiðkà ádësime á with konstrukcijà. Funkcijai cor
# perduodamus kintamuosius ûgis ir svoris apjungiame á duomenø lentelæ naudodami 
# komandà cbind. Kadangi ði lentelë turi praleistø reikðmiø, papildomai nurodome 
# funkcijos cor parametrà use = "complete.obs", todël stebiniai su praleistomis 
# reikðmëmis nebus naudojami.

with(d, by(cbind(ûgis, svoris), lytis, cor, use = "complete.obs"))

# Jei eilutës su praleistomis reikðmëmis bûtø panaikinamos ið anksto, funkcijai
# nereikëtø nurodyti parametro apie praleistas reikðmes. Tam galima naudoti f-jà
# na.omit, kurios rezultatas yra duomenø lentelë be NA reikðmiø turinèiø eiluèiø.

with(na.omit(d), by(cbind(ûgis, svoris), lytis, cor))

# Taèiau tokiu bûdu visai be reikalo iðmetama ir 6-ta eilutë, kurioje NA reikðmæ 
# turi koreliacijos skaièiavime nenaudojamas kintamasis grupë. Dël to, eilutes
# su NA reikðmëmis reikia iðmesti neatsiþvelgiant á ketvirtame stulpelyje esantá
# kintamàjá grupë.

with(na.omit(d[, -4]), by(cbind(ûgis, svoris), lytis, cor))

# Vietoj kintamøjø vardø nurodant stulpeliø numerius, ta pati iðraiðka uþraðoma 
# ðiek tiek trumpiau.

by(d[, 2:3], d[, 1], cor, use = "complete.obs")


# Daþnai paprasèiau funkcijai kaip duomenis perduoti visus lentelës kintamuosius.
# Uþraðysime funkcijà, kuri apskaièiuoja ne koreliacijø matricà, bet tik dviejø
# konkreèiø lentelës kintamøjø koreliacijos koeficientus grupëse pagal lytá. Èia
# reikiami kintamieji ið f-jai perduotos lentelës iðrenkami jau funkcijos viduje.

by(d, d$lytis, function(x) cor(x$ûgis, x$svoris, use = "complete.obs"))


# UÞDUOTIS ------------------------------ 

# 1. Nagrinëkime duomenø lentelæ d. Naudodami funkcijà by ir t.test, padalinkite
#    duomenis pagal kintamàjá grupë á dvi dalis bei patikrinkite hipotezes, kad 
#    ûgio vidurkis grupëje lygus 180 cm.
# 2. Duomenø lentelëje airquality yra ávairiø oro parametrø Niujorke matavimai.
#    Apskaièiuokite, kiek praleistø ozono matavimø yra kiekvienà mënesá. Tà patá
#    rezultatà gaukite naudodami funkcijas by arba tapply.
# 3. Nagrinëkime duomenø lentelæ airquality. Sudarykite ozono priklausomybës nuo
#    temperatûros paprastosios tiesinës regresijos modelá ir, naudojant funkcijà 
#    by, ávertinkite ðiø modelio parametrus kiekvienam mënesiui atskirai.


# --------------------------------------- #
# FUNKCIJA AGGREGATE                      #
# --------------------------------------- #

# Kaip ir funkcija by, funkcija aggregate duomenø lentelæ pagal vieno ar keletos
# kategoriniø kintamøjø reikðmes suskirsto á grupes. Pagrindinis skirtumas toks,
# kad skaièiavimams perduodama ne duomenø lentelë, taèiau jà sudaranèiø kitamøjø
# rinkinys. Dël to funkcija aggregate daþniausiai naudojama atskirø kintamøjø tø 
# paèiø skaitiniø charakteristikø skaièiavimui ir ðiuo poþiûriu labiau panaði á 
# funkcijà tapply. Jos parametrai:
# 
#             x -- duomenø lentelë, matrica arba vektorius,
#            by -- sàraðas su duomenis grupuojanèiø faktoriø vardais,
#           FUN -- funkcijos pavadinimas arba iðraiðka.

# Reikia atkreipti dëmesá, kad ðios funkcijos parametrui by visada nurodomas tik
# grupuojanèiø kintamøjø list tipo sàraðas (net jei toks kintamasis yra vienas).

# Pavyzdþiui, apskaièiuosime vektoriaus x vidurkius grupëse pagal kintamàjá g.

aggregate(x, list(g), mean)


# Grupavimo kintamasis gali bûti nebûtinai vienas. Pvz., apskaièiuosime ûgio ir 
# svorio ið lentelës d vidurkius pagal lytá ir stebiniø grupæ. Kadangi lentelë 
# turi praleistø reikðmiø, papildomai nurodome funkcijos mean parametrà na.rm.
# Rezultatas yra atskirai kiekvieno kintamojo vidurkiø grupëse lentelë.

aggregate(d[, 2:3], list(d[, 1], d[, 4]), mean, na.rm = TRUE)

# Tà paèià iðraiðkà ákelsime á funkcijà with ir perraðysime tiesiogiai naudodami 
# lentelës kintamøjø vardus.

with(d, aggregate(cbind(ûgis, svoris), list(lytis, grupë), mean, na.rm = TRUE))


# Funkcija aggregate leidþia duomenø suskaidymà uþraðyti formule. Ðiuo atveju
# skiriasi jos parametrai:
#
#   formula -- duomenø suskaidymo formulë,
#      data -- duomenø lentelës vardas,
#       FUN -- funkcijos vardas arba jos iðraiðka,
#    subset -- iðraiðka, kuri ið duomenø lentelës iðrenka tam tikras eilutes,
# na.action -- pagal nutylëjimà na.omit - nurodo, kad NA reikðmes paðalinti.


# Galimi tokie formulës uþraðymo variantai:
#
#           y ~ A -- y suskaidomas á grupes pagal kintamojo A reikðmes,
#       y ~ A + B -- y suskaidomas pagal kintamøjø A ir B reikðmes,
# cbind(y, x) ~ A -- y ir x suskaidomi pagal kintamojo A reikðmes,
#           . ~ A -- visi lentelës kintamieji suskaidomi pagal A reikðmes,
#           y ~ . -- y suskaidomas pagal visus likusius lentelës kintamuosius.


# Dar kartà apskaièiuosime vektoriaus x vidurkius grupëse pagal vektoriø g. Ðá
# kartà suskirstymà uþraðysime formule. Kadangi vektoriai ne ið duomenø lentelës,
# parametro data nurodyti nereikia.

aggregate(x ~ g, FUN = mean)

# Apskaièiuosime kintamojo ûgis ið duomenø lentelës d vidurká atskirai vyrams ir 
# moterims. Nurodþius duomenø lentelës vardà, formulëje galima tiesiogiai raðyti 
# kintamøjø vardus.

aggregate(ûgis ~ lytis, data = d, FUN = mean)

# Apskaièiuosime ûgio ir svorio ið lentelës d vidurká grupëse pagal kategorinius 
# kintamuosius lytá ir grupæ. Kairëje formulës pusëje esanèius kintamuosius 
# reikia apjungti á vienà lentelæ. Tam naudojama komanda cbind.

aggregate(cbind(ûgis, svoris) ~ lytis + grupë, data = d, FUN = mean)

# Kadangi abu kintamieji lytis ir grupë yra kategoriniai, o kitø kintamøjø nëra,
# juos galima pakeisti taðku. Èia reikia suprasti, kad ûgis ir svoris grupuojami
# pagal visus likusius lentelës d kintamuosius.

aggregate(cbind(ûgis, svoris) ~ ., data = d, FUN = mean)

# Tà patá galima padaryti ir su kitø dviejø kintamøjø pora. Toks uþraðymo bûdas 
# patogus, jei suskaidymà reikia atlikti daugeliui kintamøjø ið karto, nes ðiuo 
# atveju nereikia raðyti jø visø vardø.

aggregate(. ~ lytis + grupë, data = d, FUN = mean)


# Jei reikia, funkcija aggregate leidþia grupuoti tik tam tikras logines sàlygas 
# tenkinanèias eilutes. Tokiu atveju parametrui subset nurodome loginæ iðraiðkà.
# Pavyzdþiui, apskaièiuosime ûgio vidurkius maþiau nei 80 kg sveriantiems vyrams 
# ir moterims. Ðiuo atveju parametrui subset nurodome sàlygà svoris < 80.

aggregate(ûgis ~ lytis, data = d, subset = svoris < 80, FUN = mean)


# UÞDUOTIS ------------------------------ 

# 1. Lentelëje chickwts yra eksperimento, kurio metu viðèiukams buvo duodami tam
#    tikri maisto priedai ir matuojamas jø svoris, rezultatai: kintamasis weight
#    ir feed. Apskaièiuokite viðèiukø svorio vidurkius grupëse pagal tai, kokius 
#    maisto priedus jie gavo. Uþraðykite funkcijos aggregate versijà grupavimui 
#    naudojant formulæ. Kaip toká patá rezultatà gauti naudojant tapply arba by?
# 2. Duomenø lentelëje airquality yra ávairiø oro parametrø Niujorke matavimai.
#    Apskaièiuokite vidutinæ kiekvieno mënesio oro temperatûrà naudojant f-jas
#    aggregate ir tapply.

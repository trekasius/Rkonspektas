
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Pagrindiniai veiksmai su data.table tipo lentelëmis.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2015-08-12 | 2015-08-20
#


# TURINYS -------------------------------

#
#   1. data.table lentelës sudarymas:
#      * funkcija data.table
#      * parametras keep.rownames
#      * parametras key 
#      * parametras with
#      * parametras mult
#      * parametras nomatch
#      * funkcija fread
#      * funkcija copy
#      * funkcija tables
#      * funkcija set
#      * funkcija setnames
#      * funkcija setcolorder
#
#   2. eiluèiø ir stulpeliø iðrinkimas:
#      * operatorius %between% 
#      * operatorius %like% 
#
#   3. veiksmai su stulpeliais:
#      * operatorius :=
#      * operatorius .()
#
#   4. eiluèiø grupavimas:
#      * parametras .N
#      * parametras .SD
#      * parametras .EACHI
#
#   5. data.table eiluèiø indeksavimas:
#      * funkcija setkey
#      * funkcija key
#


# PASTABOS ------------------------------

#
# Sugalvoti uþdavinius.
#


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# TRUMPAI APIE DATA.TABLE                 #
# --------------------------------------- #

# Tipiniai veiksmai su duomenø lentelëmis tai -- reikiamø eiluèiø arba stulpeliø
# iðrinkimas, vieno ar daugiau stulpeliø sumos, vidurkio ar kitø charakteristikø 
# apskaièiavimas. Daþnai vienoje lentelëje yra keliø skirtingø grupiø matavimai,
# todël skaièiuojamos sàlyginës charakteristikos -- atskirai kiekvienoje grupëje.

# Standartiðkai R naudojamos data.frame tipo duomenø lentelës. Veiksmams atlikti 
# naudojamos ávairios tam skirtos funkcijos. Ðtai keletas daþniausiai naudojamø:
# 
#     subset -- eiluèiø ir stulpeliø iðrinkimui ið duomenø lentelës,
#  transform -- naujø lentelës stulpeliø sudarymui ar senø perskaièiavimui,
#      merge -- dviejø lenteliø apjungimui,
#    colSums -- matricos ar lentelës stulpeliø sumos, 
#    rowSums -- matricos ar lentelës eiluèiø sumos, 
#   colMeans -- matricos ar lentelës stulpeliø vidurkiai, 
#   rowMeans -- matricos ar lentelës eiluèiø vidurkiai, 
#        ave -- vieno kintamojo vidurkinimui grupëse,
#      scale -- naudojama vektoriaus ar lentelës centravimui ir normavimui,
#      sweep -- galima naudoti vektoriaus reikðmiø vidurkinimui,
#      apply -- veiksmai matricos eilutëse arba stulpeliuose,
#     tapply -- sàlyginiø charakteristikø skaièiavimas grupëse.


# Pavyzdþiui, keliais standartiniais bûdais apskaièiuosime duomenø lentelës iris 
# kintamojo Sepal.Length vidurká grupëse pagal kintamojo Species reikðmes.

   tapply(iris[, "Sepal.Length"],      iris[, "Species"],  mean)
       by(iris[, "Sepal.Length"],      iris[, "Species"],  mean)
aggregate(iris[, "Sepal.Length"], list(iris[, "Species"]), mean)

# Tokiu atveju tipinë veiksmø seka: suskaidyti lentelæ pagal grupavimo kintamàjá,
# apskaièiuot reikiamas charakteristikas ir (kartais) apjungti gautus rezultatus.

      sapply(split(iris, iris$Species), function(x) mean(x$Sepal.Length))
stack(lapply(split(iris, iris$Species), function(x) mean(x$Sepal.Length)))

# Kitas pavyzdys -- apskaièiuoti visø kintamøjø vidurkius atskirai grupëse pagal
# grupavimo kintamojo reikðmes.

aggregate(iris[, -5], list(Rûðis = iris[, 5]), mean)

lapply(split(iris, iris$Species), function(x) colMeans(x[, -5]))
lapply(split(iris, iris$Species), function(x)    apply(x[, -5], 2, mean))


# Laikas, per kurá atliekamos tokios operacijos, priklauso nuo eiluèiø ir grupiø
# skaièiaus lentelëje -- kuo jø daugiau, tuo ilgiau uþtrunka skaièiavimai, todël
# net paprasèiausios duomenø pertvarkymo operacijos su itin didelëmis data.frame
# tipo lentelëmis gali uþtrukti labai ilgai.

# Kita problema -- visi R objektai ir duomenys bûtinai turi tilpti á kompiuterio 
# atmintá. Dël tos prieþasties sudëtingos struktûros ir didelës apimties duomenø 
# saugojimui naudojamos specializuotos duomenø bazës.

# Labai dideliø duomenø lenteliø apdorojimui naudojamas data.table tipo lentelës
# formatas. Nuo standartinës R data.frame tipo lentelës data.table skiriasi tuo, 
# kad leidþia indeksuoti eilutes, dël ko þymiai pagreitëja eiluèiø iðrinkimas ir 
# jø grupavimas. Pagrindiniai veiksmai su data.table tipo lentelëmis:
# 
#   -- eiluèiø iðrinkimas, 
#   -- eiluèiø grupavimas,
#   -- naujø stulpeliø sudarymas,
#   -- nereikalingø stulpeliø panaikinimas,
#   -- stulpeliø reikðmiø perskaièiavimas,
#   -- stulpeliø charakteristikø apskaièiavimas,
#   -- lenteliø apjungimas.

# Pagal savo struktûrà data.table tipo lentelë, kaip ir data.frame, yra vektoriø 
# sàraðas. data.frame lentelës turi unikalius eiluèiø pavadinimus, o jeigu tokiø
# nëra -- eilutës numeruojamos. data.table eiluèiø pavadinimø neturi, vietoje jø
# visos eilutës turi unikalius raktus. Ðiuo poþiûriu data.table panaðu á duomenø
# bazes. 

# Kaip ir data.frame, data.table lenteles galima apjungti naudojant rbind, cbind
# ar merge funkcijas. Unikaliø eiluèiø iðskyrimui naudojama standartinë funkcija 
# unique. 

# Atliekant veiksmus su data.frame tipo lentele, kiekvienà kartà sukuriama nauja 
# lentelë, o pradinë lentelë iðlieka tokia pati. Pvz., naudojant funkcijà subset 
# ið lentelës iris iðmesime vienà stulpelá. 

subset(iris, select = -Species)

# Buvo sudaryta nauja lentelë, bet pradinë lentelë nepasikeitë. Ji nepasikeis ir
# tuo atveju, jei, pvz., naudojant funkcijà transform, sudarysime naujà stulpelá.

transform(iris, Sepal.Sum = Sepal.Length + Sepal.Width)

# Veiksmai su data.table lentelës stulpeliais atliekami nedarant lentelës kopijø.
# Tai ið esmës skiriasi nuo data.frame ir yra didelis privalumas dirbant didelës 
# apimties duomenimis.


# Tarkime, kad turime data.table lentelæ DT. Jos argumentus galima suskirstyti á 
# tris dalis:
#                                 DT[i, j, by]
# 
#          i -- iðrenkamø eiluèiø numeriai arba loginë sàlyga,
#          j -- iðrenkamø stulpeliø pavadinimai,
#         by -- grupavimo kintamojo pavadinimas arba loginë sàlyga.
#
# Priklausomai nuo atliekamø veiksmø ðiuos argumentus galima naudoti ir visus ið 
# karto, ir atskirai po vienà arba du. Lentelës viduje visi stulpeliai yra tarsi
# kintamieji, todël standartiðkai vietoje stulpeliø numeriø naudojami jø vardai.


# --------------------------------------- #
# DATA.TABLE LENTELËS SUDARYMAS           #
# --------------------------------------- #

# Norint naudoti data.table tipo lenteles, turi bûti suinstaliuotas ir átrauktas
# to paties pavadinimo R paketas.

library(data.table)


# data.table tipo lentelë sudaroma panaðiai, kaip ir data.frame lentelë, tik èia
# vektoriø apjungimui á lentelæ naudojama funkcija data.table.

x <- c("Re_5", "Mi_5", "Do_5", "Do_4", "So_4")
y <- c(587.33, 659.25, 523.25, 261.63, 329.00)

xy <- data.table(X = x, Y = y)
xy


# Kitas bûdas sudaryti data.table tipo lentelæ -- konvertuoti data.frame lentelæ.
# Tam naudojama ta pati funkcija data.table. Pvz., tokiu bûdu ið lentelës mtcars 
# sudarysime data.table tipo lentelæ.

mtcars

mt <- data.table(mtcars)
mt

# Paprastai data.frame lentelës eilutës turi unikalius numerius, bet joms galima 
# priskirti ir pavadinimus, kurie taip pat turi bûti unikalûs. Taèiau data.table
# tipo lentelës eilutës turi tik numerius. Norint iðlaikyti eiluèiø pavadinimus,
# naudojamas loginis argumentas keep.rownames. Tokiu atveju lentelëje sukuriamas
# papildomas kintamasis rn.

mt <- data.table(mtcars, keep.rownames = TRUE)
mt


# Jeigu duomenys áraðyti á tekstiná failà, juos galima nuskaityti naudojant f-jà
# fread. Rezultatas bus data.table tipo duomenø lentelë. Pavyzdþiui, áraðysime á
# tekstiná failà duomenø lentelæ iris ir jà nuskaitysime kaip data.table lentelæ.

write.table(iris, file = "df.txt", quote = FALSE, row.names = FALSE, sep = ";")

# Funkcijos fread parametrai beveik tokie pat kaip ir read.table parametrai, bet 
# yra ir kai kuriø skirtumø. Pagrindiai parametrai tokie:
#
#      input -- failo vardas,
#     header -- loginis kintamasis, nurodo ar lentelë turi antraðtæ,
#        sep -- stulpeliø atskyrimo simbolis,
#      nrows -- nuskaitomø eiluèiø skaièius,
#       skip -- praleidþiamø eiluèiø skaièius,
#     select -- nuskaitomø stulpeliø pavadinimø vektorius,
#       drop -- praleidþiamø stulpeliø pavadinimø vektorius.

df <- fread(input = "df.txt", header = TRUE, sep = ";")
df


# data.table tipo lentelë tuo paèiu yra ir data.frame lentelë, dël to jas galima 
# naudoti su visomis funkcijomis, kuriø argumentas yra data.frame lentelë. Pvz.,
# su data.table lentelëmis veikia tokios funkcijos kaip names, colnames, nrow su 
# ncol ir daugelis kitø.

class(df)

# Visi veiksmai su data.table tipo lentele atliekami by reference, t.y. nedarant 
# jos kopijø. Dël tos prieþasties, jei viena data.table lentelë priskiriam kitai, 
# tai naujas objektas nesukuriamas, o gauname tà paèià lentelæ su dviem vardais.
# Dar daugiau -- visi pakeitimai padaryti pradinëje lentelëje, bus matomi ir jos
# "kopijoje". Ðità faktà patikrinsime kiek vëliau.

yx <- xy
yx

# Norint gauti nepriklausomà data.table lentelës kopijà, naudojama funkcija copy.

dt <- copy(xy)
dt

# Visø data.table lenteliø bei jø charakteristikø sàraðà sudaro funkcija tables.

tables()


# Jei lentelëje reikia pakeisti kurià nors vienà reikðmæ, galim naudoti funkcijà
# set. Jos sintaksë set(x, iL, jL, value) atitinka konstrukcijà x[i, j] <- value.
# Eilutës ir stulpelio numeriai i ir j turi bûti sveikieji skaièiai. Pavyzdþiui,
# taip pakeisime pirmos eilutës ir pirmo stulpelio reikðmæ ið "Re_5" á "re".

set(xy, 1L, 1L, "re")
xy

# Jeigu eilutës numeris nenurodomas, tada laikoma, kad keièiamos visos stulpelio 
# reikðmës, ir parametrui value priskiriamas naujø stulpelio reikðmiø vektorius.

set(xy, j = 1L, value = c("re", "mi", "do", "do", "sol"))
xy

# Funkcija setnames naudojama data.table lentelës stulpeliø pavadinimams keisti.

setnames(xy, c("X", "Y"), c("Nata", "Daþnis"))
xy

# Stulpeliø tvarkos pakeitimui naudojama funkcija setcolorder. Pavyzdþiui, ðitai
# lentelei sukeisime vietomis stulpelius.

setcolorder(xy, c("Daþnis", "Nata"))
xy

# Dabar galima patikrinti ar lentelëje yx matosi visi tie pakeitimai, kurie buvo
# atlikti su lentele xy, o lentelë dt liko nepakitusi.

identical(xy, yx)

xy
yx
dt


# UÞDUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    


# --------------------------------------- #
# EILUÈIØ IR STULPELIØ IÐRINKIMAS         #
# --------------------------------------- #

dt <- data.table(iris)
dt

# Eilutës iðrenkamos argumentui i priskiriant reikiamø eiluèiø numeriø vektoriø. 
# Pavyzdþiui, ið visos lentelës iðrinksime treèià eilutæ.

dt[3]

# Eilutes galima iðrinkti pagal tam tikrà loginæ sàlygà. Pavyzdþiui, iðrinksime
# tas eilutes, kuriose kintamojo Sepal.Length reikðmë didesnë uþ 7.

dt[Sepal.Length > 7]

# Loginës sàlygos gali bûti gana sudëtingos. Pavyzdþiui., iðrinksime tas eilutes,
# kuriose kintamojo Sepal.Length reikðmës lygios 4.3, 5.4, 6.1, 7.2. Ðiuo atveju 
# panaudosime standartiná R operatoriø %in%.

dt[Sepal.Length %in% c(4.3, 5.4, 6.1, 7.2)]

# Tuo atveju, kada eilutes reikia iðrinkti ið tam tikro vieno stulpelio reikðmiø
# intervalo, galima naudoti specialø operatoriø %between%.

dt[Sepal.Length %between% c(5.3, 5.5)]

# Jeigu ieðkoma reikðmë nëra tiksliai þinoma, jos paieðkai galima naudoti %like%
# operatoriø. Pvz., rasime visas eilutes, kuriose stulpelio Sepal.Length reikðmë
# po kablelio turi skaièiø 4: 3.4, 4.4, 5.4 ir t. t.

dt[Sepal.Length %like% ".4"]


# Stulpelio reikðmës iðrenkamos argumentui j priskiriant to stulpelio pavadinimà.
# Jei eiluèiø numeriai nenurodomi, iðrenkamos visos to stulpelio reikðmës. Pvz.,
# taip á atskirà vektoriø iðrinksime stulpelio Sepal.Length reikðmes.

dt[, Sepal.Length]

# Jei ið atrinktø stulpeliø reikia gauti naujà lentelæ, tø stulpeliø pavadinimus 
# reikia apjungti á sàraðà. Tam galima naudoti specialià data.table konstrukcijà
# .() arba áprastà funkcijà list -- rezultatas bus tas pats. Pavyzdþiui, gausime
# lentelæ su dviem stulpeliais Sepal.Length ir Sepal.Width.

dt[, .(Sepal.Length, Sepal.Width)]

dt[, list(Sepal.Length, Sepal.Width)]

# SVARBI PASTABA! Kadangi data.table lentelës viduje stulpeliø vardai suprantami
# kaip paprasti R kintamieji, tai visos konstrukcijos su jais yra iðraiðkos. Dël 
# to, kintamøjø vardus apjungus su funkcija c, gausime vienà bendrà vektoriø.

dt[, c(Sepal.Length, Sepal.Width)]


# Stulpelius galima iðrinkti ir pagal jø numerá lentelëje, taèiau tam reikalinga
# pakeisti papildomo data.table parametro with reikðmæ ið TRUE á FALSE.

dt[, c(1, 2), with = FALSE]

# Toks bûdas naudojamas ir tuo atveju, kai reikia manipuliuoti kintamøjø vardais.
# Kintamøjø vardus á vektoriø galima apjungti rankiniu bûdu arba galima naudoti 
# kitus metodus, pavyzdþiui, reikiamø stulpeliø ieðkoti naudojant funkcijà grep.
# Pvz., ið lentelës iðrinksime tik tuos kintamuosius, kuriø pavadinime yra þodis 
# "Sepal".

dt[, c("Sepal.Length", "Sepal.Width"), with = FALSE]

dt[, grep("Sepal", names(dt)), with = FALSE]


# UÞDUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    


# --------------------------------------- #
# STULPELIØ SUKÛRIMAS IR PANAIKINIMAS     #
# --------------------------------------- #

# Kintamasis data.table lentelëje sukuriamas naudojant := priskyrimo operatoriø.
# Kairëje ðio operatoriaus pusëje raðomas kintamojo vardas, o deðinëje tam tikra 
# iðraiðka. Pvz., sukursime kintamàjá Sepal.Sum, kuris bus dviejø kintamøjø suma.

dt[, Sepal.Sum := Sepal.Length + Sepal.Width]
dt

# SVARBI PASTABA! Kintamasis data.table lentelëje sukuriamas ar perskaièiuojamas 
# by reference, todël èia áprasta R konstrukcija dt <- dt[...] nenaudotina! 

# Tuo atveju, kai deðinëje pusëje reikðmiø neuþtenka uþpildyti visam stulpeliui,
# jos cikliðkai pratæsiamos. Pavyzdþiui, taip paprastai galima sukurti kintamàjá 
# X su viena ir ta paèia reikðme.

dt[, X := 1]
dt

# Jeigu vienu metu sukuriami arba perskaièiuojami ið karto keli kintamieji, tada
# kairëje operatoriaus := pusëje raðomas kintamøjø vardø vektorius, deðinëje --
# sàraðas, kurio elementai yra tø kintamøjø reikðmës arba reikðmiø apskaièiavimo
# iðraiðkos.

dt[, c("V", "G") := list(mean(Sepal.Length), as.numeric(Species))]
dt

# Kintamajam priskyrus reikðmæ NULL, jis ið lentelës panaikinamas.

dt[, X := NULL]
dt

# Analogiðkai panaikinami ið karto keli stulpeliai.

dt[, c("Sepal.Sum", "V", "G") := NULL]
dt


# Vienas ið tipiniø veiksmø -- vieno ar keliø lentelës stulpeliø charakteristikø
# skaièiavimas. Tai gali bûti kintamøjø vidurkiai, elementø skaièius ir panaðios
# charakteristikos. Tokiu atveju argumentui j priskiriama funkcija nuo kintamojo. 
# Pavyzdþiui, apskaièiuosime kintamojo Sepal.Length vidurká.

dt[, mean(Sepal.Length)]

# Jeigu iðraiðka átraukiama á .() skliaustus, rezultatas yra data.table lentelë.
# Beje, Kaip ir anksèiau, vietoje skliaustø galima naudoti funkcijà list.

dt[, .(mean(Sepal.Length))]

# Þinoma, apskaièiuotai kintamojo charakteristikai galima priskirti naujà vardà.

dt[, .(Vidurkis = mean(Sepal.Length))]

# Tokiu bûdu galima uþraðyti komandà ið karto keliø stulpeliø statistikoms gauti.
# Pavyzdþiui, sudarysime lentelæ su dviejø kintamøjø Sepal.Length ir Sepal.Width 
# vidurkiais ir reikðmiø ðiuose stulpeliuose skaièiumi.

dt[, .(N = length(Sepal.Length), L = mean(Sepal.Length), W = mean(Sepal.Width))]


# NAUDINGA ------------------------------

# Ið esmës data.table lentelës viduje su kintamaisiais galima daryti kà tik nori.
# Pavyzdþiui, kintamøjø vardus galima naudoti grafikø braiþymui.

dt[, plot(Petal.Length, Petal.Width, col = Species, pch = 19)]

# Jei reikia, kelias kabliataðkiu atskirtas komandas galima apjungti riestiniais 
# skliaustais. Pavyzdþiui, nubraiþysime dviejø kintamøjø sklaidos diagramà ir jà
# papildysime paprastosios tiesinës regresijos tiese.

dt[, {plot(Petal.Length, Petal.Width); abline(lm(Petal.Width ~ Petal.Length))}]


# --------------------------------------- #
# EILUÈIØ GRUPAVIMAS                      #
# --------------------------------------- #

# Labai daþnai reikia apskaièiuoti tam tikras kintamøjø charakteristikas grupëse
# pagal kategorinio kintamojo reikðmes. Ðiuo atveju data.table lentelæ papildome
# argumentu by, kuriam nurodomas arba grupavimo kintamasis, arba loginës sàlygos.
# Pavyzdþiui, apskaièiuosime kintamojo Sepal.Length vidurká atskirai kiekvienoje 
# kintamojo Species reikðmiø grupëje -- gausime trijø sàlyginiø vidurkiø lentelæ.

dt[, mean(Sepal.Length), by = Species]

# Þinoma, vienu metu galima apskaièiuoti kelias sàlygines charakteristikas. Pvz.,
# apskaièiuosime kintamojo Sepal.Length vidurká ir sumà atskirai pagal kintamojo
# Species reikðmes.

dt[, .(Vidurkis = mean(Sepal.Length), Suma = sum(Sepal.Length)), by = Species]

# Grupavimas gali bûti atliekamas pagal loginæ sàlygà. Pvz., sudarysime 2 grupes
# pagal tai, ar kintamojo Sepal.Width reikðmë didesnë uþ 3, ar ne.

dt[, .(Vidurkis = mean(Sepal.Length)), by = Sepal.Width > 3]

# Jeigu grupavimas atliekamas pagal kelis kintamuosius arba logines sàlygas, tai
# juos apjungiame su .() skliaustais (kaip ir anksèiau, vietoje .() tinka list). 

dt[, .(Vidurkis = mean(Sepal.Length)), by = .(Species, Sepal.Width > 3)]


# NAUDINGA ------------------------------

# Grupavimo kintamiesiems ir loginëms sàlygoms galima suteikti pavadinimà. Pvz.,
# papildysime anksèiau uþraðytà komandà taip, kad loginës sàlygos sudaryta grupë 
# taip pat turëtø pavadinimà. 

# Patogumo dëlei loginio kintamojo reikðmes TRUE ir FALSE bûtø geriau pakeisti á 
# labiau suprantamus pavadinimus. Vienas ið bûdø -- naudoti funkcijà ifelse. Bet 
# tokia komanda bus labai ilga, todël jà geriau iðskaidyti á dvi dalis. Problema
# tame, kad data.table tipo lentelëje stulpeliø pavadinimai interpretuojami kaip 
# kintamieji, todël raðomi be kabuèiø ir uþ lentelës ribø jokios prasmës neturi.
# Skliaustai .() taip pat naudojami tik data.table lentelës viduje. 

# Ðiuo atveju, naudojant funkcijà quote, reikiamà komandà paverèiame á call tipo 
# iðraiðkà. Ji suvykdoma lentelës viduje, kur kintamøjø pavadinimai turi prasmæ.

grupë <- quote(.(Rûðis = Species, 
                 Lapas = ifelse(Sepal.Width > 3, "Platus", "Siauras")))
grupë

dt[, .(Vidurkis = mean(Sepal.Length)), by = grupë]


# NAUDINGA ------------------------------

# Kartu su grupavimo argumentu by naudojamos kelios specialios funkcijos, kurios 
# leidþia supaprastintai uþraðyti daþnai pasitaikanèias konstrukcijas:
#
#        .SD -- ta pati lentelë, taèiau be grupavimo kintamojo,
#        .BY -- grupavimo kintamojo reikðmiø sàraðas,
#         .N -- eiluèiø skaièius grupëje,
#         .I -- eiluèiø numeriai grupëje,
#       .GRP -- grupës numeris.


# Priklausomai nuo to, kuriam argumentui priskiriama reikðmë .N, rezultatas gali 
# bûti arba paskutini lentelë eilutë, arba bendras eiluèiø skaièius.

dt[.N]
dt[, .N]

# Kadangi .N nurodo eiluèiø skaièiø grupëje, naudojant .N galima sudaryti daþniø 
# lentelæ.

dt[, .N, by = .(Species, Lapas = ifelse(Sepal.Width > 3, "Platus", "Siauras"))]

# Naudojant .I, galima suþinoti á konkreèias grupes patenkanèiø eiluèiø numerius.

dt[, .I, by = .(Species, Lapas = ifelse(Sepal.Width > 3, "Platus", "Siauras"))]


# Atlikus eiluèiø grupavimà, tolimesniems skaièiavimams tas grupavimo kintamasis 
# daþniausiai nereikalingas ir tam, kad netrukdytø, ið lentelës yra paðalinamas.
# Kaip tik tokiais atvejais ir naudojama .SD konstrukcija. 

# .SD lentelës viduje galima taikyti áprastas funkcijas nuo kintamøjø-stulpeliø.
# Pavyzdþiui, naudojant funkcijà lapply, apskaièiuosime visø lentelës stulpeliø 
# vidurkius grupëse pagal kintamojo Species reikðmes.

dt[, lapply(.SD, mean), by = Species]

# Ið esmës toká pat rezultatà galima gauti ir naudojant kitas standartines f-jas.

dt[, .(Vidurkis = apply(.SD, 2, mean)), by = Species]
dt[, .(Vidurkis = colMeans(.SD)), by = Species]


# UÞDUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    


# --------------------------------------- #
# DATA.TABLE EILUÈIØ INDEKSAVIMAS         #
# --------------------------------------- #

# data.table lentelei galima priskirti raktus - tokias stulpeliø reikðmes, pagal 
# kurias vienareikðmiðkai nustatoma, ið kurios eilutës ta reikðmë paimta. Raktas
# gali bûti sudaromas pagal vienà ar kelis lentelës stulpelius. Dël ðios savybës
# data.table lentelës primena duomenø bazes. 

# Raktà turinèios lentelës eilutës iðrikiuojamos pagal to rakto reikðmes, dël to
# eiluèiø iðrinkimas pagal raktà yra labai greitas. 

# Raktas data.table lentelei priskiriamas naudojant funkcijà setkey. Pavyzdþiui, 
# lentelei dt priskirsime raktà pagal stulpelio Species reikðmes.

setkey(dt, Species)

# Kokius raktus turi lentelë, nustatoma naudojant funkcijà key.

key(dt)

# Raktas gali bûti nustatomas ir sudarant lentelæ. Tam naudojamas parametras key,
# kuriam priskiriamas kintamøjø vardø vektorius.

dt <- data.table(iris, key = "Species")
dt

key(dt)


# Iðrenkant eilutes pagal rakto reikðmæ, rakto reikðmë priskiriama argumentui i.
# Pavyzdþiui, iðrinksime tas lentelës eilutes, kurios priklauso "setosa" grupei.

dt["setosa"]

# Standartiðkai iðvedamos visos eilutës, kurios turi nurodytà rakto reikðmæ, bet
# ið viso galimi keli variantai: rodyti visas eilutes, rodyti pirmà ar paskutinæ
# eilutæ. Tam naudojamas parametras mult.

dt["setosa", mult = "all"]
dt["setosa", mult = "first"]
dt["setosa", mult = "last"]

# Gali bûti, kad lentelëje nëra eiluèiø, kurios turëtø nustatytas rakto reikðmes.
# Tokios nerastos eilutës paþymimos NA reikðme, bet, naudojant parametrà nomatch, 
# galima nustatyti, kad jos nebûtø rodomos. Pvz., iðrinksime tas eilutes, kurios
# priklauso "setosa" arba "mimosa" grupei.

dt[c("setosa", "mimosa")]

# Matome, kad "mimosa" grupëje nëra në vienos eilutës, todël ta grupë þymima NA.
# Kad tokia eilutë nebûtø rodoma, parametrui nomatch priskiriame reikðmæ 0.

dt[c("setosa", "mimosa"), nomatch = 0]


# Raktas gali bûti naudojamas skaièiuojant sàlygines stulpeliø charakteristikas. 
# Tai atliekama argumentui by priskiriant .EACHI reikðmæ. Pavyzdþiui, uþraðysime
# komandà, kuri apskaièiuotø kintamojo Sepal.Length vidurká grupëse pagal rakto 
# reikðmes "setosa" ir "virginica".

dt[c("setosa", "virginica"), mean(Sepal.Length), by = .EACHI]


# UÞDUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    


# --------------------------------------- #
# NEDIDELIS GREIÈIO BANDYMAS: DF vs DT    #
# --------------------------------------- #

n = 1e7

x <- sample(LETTERS, n, TRUE)
y <- sample(letters, n, TRUE)
z <- runif(n)

DF <- data.frame(x, y, z)
DT <- data.table(DF)

head(DF)
head(DT)


system.time(DF[DF$x == "R" & DF$y == "f", ])
system.time({setkey(DT, x, y); DT[J("R", "f")]})

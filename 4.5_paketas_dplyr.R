
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Veiksmai su duomenø lentelëmis naudojant paketà dplyr.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2015-08-22 | 2015-08-26
#


# TURINYS -------------------------------

#
#   1. Trumpai apie paketà dplyr:
#      * operatorius %>% 
#      * funkcija tbl_df
#      * funkcija glimpse
#
#   2. Stulpeliø iðrinkimas, pervadinimas ir perskaièiavimas:
#      * funkcija select
#      * funkcija rename
#      * funkcija mutate
#      * funkcija transmute
#
#   3. Eiluèiø iðrinkimas ir iðrikiavimas:
#      * funkcija slice
#      * funkcija top_n
#      * funkcija sample_n
#      * funkcija filter
#      * funkcija between
#      * funkcija distinct
#      * funkcija arrange 
#      * funkcija desc 
#
#   4. Sàlyginiø charakteristikø skaièiavimas:
#      * funkcija summarise
#      * funkcija summarise_each
#      * funkcija funs
#      * funkcija group_by
#      * funkcija groups 
#      * funkcija group_size 
#      * funkcija rowwise
#
#   5. Kai kurie tipiniai duomenø pertvarkymo atvejai:
#      * funkcija bind_rows 
#      * funkcija bind_cols 
#      * funkcija do 
#


# PASTABOS ------------------------------

#
# Paraðyti apie funkcijas do ir count.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# TRUMPAI APIE PAKETÀ DPLYR               #
# --------------------------------------- #

# Paketas dplyr naudojamas veiksmams su data.frame tipo duomenø lentelëmis ir jø
# pertvarkymui.

library(dplyr)

# Paprastai ið duomenø lentelës reikia iðrinkti tam tikrus stulpelius ir eilutes,
# sugrupuoti jas bei apskaièiuoti ávairias statistines charakteristikas. Paketas
# dplyr kiekvienam ið ðiø veiksmø turi specializuotà funkcijà. Pagrindinës ið jø:
#
#     select -- stulpeliø iðrinkimui,
#     mutate -- stulpeliø reikðmiø perskaièiavimui,
#     filter -- eiluèiø iðrinkimui,
#    arrange -- eiluèiø iðrikiavimui,
#  summarise -- stulpeliø charakteristikø skaièiavimui.

# Visø ðiø funkcijø sintaksë praktiðkai vienoda: pirmasis argumentas yra duomenø 
# lentelë, kiti argumentai -- nurodo eilutes ar stulpelius, su kuriais atliekami 
# atitinkami veiksmai. 

# Kadangi visø ðiø funkcijø rezultatas yra nauja duomenø lentelë, vienà po kitos 
# einanèias duomenø pertvarkymo operacijas galima apjungti, nesukuriant tarpiniø 
# lenteliø - vienos funkcijos rezultatas yra kitos funkcijos argumentas. Veiksmø 
# apjungimas gali bûti atliekamas dviem bûdais: a) nesting, b) chaiting. 

# Pirmuoju atveju atliekama áprasta keletos funkcijø superpozicija, kai funkcija 
# ádedama viena á kità, o antruoju -- argumentai nuo vienos funkcijos prie kitos
# perduodami konvejeriu. Galima pasakyti, kad konvejeris -- tai Unix ir Linux OS
# naudojama tam tikra funkcijos argumentø perdavimo forma, kada vienos funkcijos 
# reikðmë kaip argumentas perduodama kitai funkcijai. 

# R funkcijø konvejeriui uþraðyti naudojamas operatorius %>% ið paketo magrittr, 
# kuris uþkraunamas kartu su paketu dplyr. Reikia þinoti operatoriaus pritaikymo 
# taisykles. Tarkime, kad f yra tam tikra funkcija, x, y ir z yra jos argumentai. 
# Tada:
#                   x %>% f(y)       atitinka f(x, y)
#                   x %>% f(z, ., y) atitinka f(z, x, y)

# Pavyzdþiui, jeigu ið duomenø lentelës iðrenkame eilutes, o ið gautos rezultatø
# lentelës vëliau iðrenkame tam tikrus stulpelius, tai tokià veiksmø sekà galima
# uþraðyti taip:
#                      select(filter(duomenys, ...), ...)
#
# Naudojant konvejerá, ta pati veiksmø seka uþraðoma tokiu pavidalu:
# 
#                   duomenys %>% filter(...) %>% selec(...)


# Daugelio paketo dplyr funkcijø argumentas yra data.frame tipo duomenø lentelë.
# Taèiau, analizuojant labai daug eiluèiø turinèias lenteles, geriau konvertuoti
# jas á tbl_df formatà. Galima sakyti, kad tai savotiðkas data.frame apvalkalas,
# kuris apsaugo nuo didelio kiekio duomenø iðvedimo á ekranà.

airquality. <- tbl_df(airquality)
airquality.

# Á ekranà iðvedamø eiluèiø skaièiø galima koreguoti.

print(tbl_df(airquality.), n = 20)

# Jei duomenø lentelë turi labai daug stulpeliø, jiems apþvelgti galima naudoti
# funkcijà glimpse, kuri transponuoja lentelæ, stulpeliai vaizduojami eilutëse.

glimpse(airquality.)

# tbl_df tipo lentelë tuo paèiu yra ir data.frame tipo lentelë.

class(airquality.)

# Funkcija tbl_df nedaro pradinës lentelës stulpeliø kopijø. Taip pat elgiasi ir 
# funkcijos select bei mutate, todël stulpeliø iðrinkimas bei jø perskaièiavimas
# atliekamas labai greitai -- tai svarbu dirbant su didelës apimties duomenimis.


# --------------------------------------- #
# STULPELIØ IÐRINKIMAS IR PERVADINIMAS    #
# --------------------------------------- #

# Stulpeliø iðrinkimui naudojama funkcija select, o jos sintaksë labai paprasta:
# 
#                           select(duomenys, ...)
#
# Èia ... nurodo vienà arba kelis kableliu atskirtus stulpeliø pavadinimus. Tam,
# kad stulpelius bûtø galima iðrinkti pagal tam tikrà taisyklæ, naudojamos kitos
# papildomos funkcijos:
#
#       one_of -- kintamøjø ið sàraðo iðrinkimui,
#  starts_with -- iðrinkimui pagal pavadinimo pradþià,
#    ends_with -- iðrinkimui pagal pavadinimo pabaigà,
#     contains -- iðrinkimui pagal sutampantá þodá,
#      matches -- iðrinkimui pagal reguliarià iðraiðkà,
#    num_range -- iðrinkimui pagal kintamøjø numerius,
#   everything -- visø kintamøjø iðrinkimui.


# Pavyzdþiui, ið duomenø lentelës airquality iðrinksime kintamuosius su vardais 
# "Temp", "Month", "Day". Funkcijos viduje stulpeliø vardai interpetuojami kaip 
# lentelës aplinkos kintamieji, todël raðomi be kabuèiø.

select(airquality, Temp, Month, Day)

# Tuo atveju, kada iðrenkami stulpeliai eina ið eilës, jø vardus galima nurodyti
# per dvitaðká -- lyg generuojant skaièiø sekà.

select(airquality, Temp:Day)

# Toká stulpeliø vardø vektoriø kaip parametrà galima perduoti funkcijai one_of.

kintamieji <- c("Temp", "Month", "Day")
select(airquality, one_of(kintamieji))


# Tuo atveju, kai yra þinoma, kokiu simboliu arba þodþiu prasideda arba baigiasi 
# stulpeliø pavadinimai, patogu naudoti funkcijà starts_with ir ends_with. Pvz.,
# iðrinksime stulpelius su pradþia "Oz" ir pabaiga "th".

select(airquality, starts_with("Oz"))
select(airquality, ends_with("th"))

# Jei þinomas stulpelio pavadinimo fragmentas, galima naudoti funkcijà contains.
# Pavyzdþiui, iðrinksime stulpelius, kuriø pavadinime yra raidþiø junginys "on".

select(airquality, contains("on"))


# Stulpelius galima iðrinkti ir pagal abstraktesnæ taisyklæ. Kartais tai bûtina,
# kadangi stulpeliø pavadinimø gali bûti labai daug arba jie ið anksto neþinomi. 
# Tais atvejais, kai visiems vardams bûdingas tam tikras ðablonas, jø iðrinkimui 
# galima naudoti reguliarias iðraiðkas. Pavyzdþiui, taip galima iðrinkti vardus,
# kurie turi raidës ir trijø skaitmenø kodà, arba vardus ið dviejø daliø, kurios
# atskirtos brûkðneliu, arba vardus, kuriuose nëra tam tikros raidës ir panaðiai.

# Pavyzdþiui, lentelëje airquality iðrinksime tuos stulpelius, kuriø pavadinime
# yra taðkas. Èia problema tame, kad taðko simbolis "." reguliariose iðraiðkose
# nurodo bet koká simbolá, todël ðiuo atveju reikia raðyti "\\." -- bus randami
# visi vardai, kuriuose bet kurioje pavadinimo vietoje yra taðkas.

select(airquality, matches("\\."))

# Jei taðkas stulpelio pavadinime atskiria du bet kokio ilgio þodþius, reguliari 
# iðraiðka raðoma ðiek tiek kitaip. Ðiuo atveju rezultatas sutampa.

select(airquality, matches("^[a-z,A-Z]+\\.[a-z,A-Z]+$"))

# Pavyzdþiui, iðrinksime stulpelius, kuriø pavadinime yra raidþiø junginys "on"
# arba "ol". Atskirai vienam ir kitam atvejui tinka f-ja contains, taèiau abiem
# kartu uþraðyti naudojama nesudëtinga reguliari iðraiðka.

select(airquality, matches("o[n,l]"))


# Jeigu stulpeliai turi bûti paðalinti, prieð jø vardø vektoriø raðomas minusas.
# Gali bûti naudojamos tos paèios pagalbinës f-jos one_of, starts_with ir kitos.
# Pvz., èia pateikti keli lygiaverèiai trijø stulpeliø paðalinimo variantai.

select(airquality, -c(Ozone, Wind, Solar.R))
select(airquality, -Ozone, -Wind, -Solar.R)
select(airquality, -one_of(c("Ozone", "Wind", "Solar.R")))


# Jei iðrinktam stulpeliui reikia pakeisti pavadinimà, tai raðoma lygybë, kurios
# kairëje pusëje yra naujas vardas, o deðinëje -- senasis. Pavyzdþiui, pakeisime
# vieno pasirinkto kintamojo vardà.

select(airquality, Solar = Solar.R)

# Kintamøjø vardus galima pervadinti pagal ðablonà. Pavyzdþiui, iðrinksime visus
# lentelës airquality stulpelius ir jø vardus pakeisime á "x1", "x2", ..., "x6".

select(airquality, x = everything())


# Funkcija rename naudojama atskirø duomenø lentelës stulpeliø vardø pakeitimui.
# Visø kitø stulpeliø vardai iðlieka tokie patys. Pavyzdþiui, pakeisime lentelës
# airquality stulpelio "Solar.R" pavadinimà á paprastesná.

rename(airquality, Solar = Solar.R)

# Stulpeliø perskaièiavimui naudojama funkcija mutate. Pvz., lentelës airquality
# kintamojo Temp reikðmes perskaièiuosime ið Farenheito á Celcijaus skalæ. 

mutate(airquality, Temp = 5*(Temp - 32)/9)

# Naudojant ðià funkcijà, lentelëje galima sukurti naujus stulpelius. Pavyzdþiui,
# lentelëje airquality sukursime naujà stulpelá su eiluèiø numeriais.

mutate(airquality, Nr = 1:153)

# Bendras eiluèiø skaièius duomenø lentelëje yra fiksuotas, bet, iðskaidþius jas
# á tam tikras grupes, eiluèiø skaièius grupëse ið anksto daþniausiai neþinomas. 
# Paketo dplyr funkcija n() gràþina eiluèiø skaièiø duomenø lentelës grupëje. Ðá 
# kartà eilutës negrupuojamos, todël rezultatas yra bendras eiluèiø skaièius.

mutate(airquality, Nr = 1:n())

# Funkcija transmute skiriasi tuo, kad stulpeliai su perskaièiuotomis reikðmëmis
# iðskiriami á atskirà lentelæ.

transmute(airquality, Temp = 5*(Temp - 32)/9)


# UÞDUOTIS ------------------------------ 

# 1. Ið duomenø lentelës airquality iðrinkite stulpelius su eilës numeriais 1, 5
#    ir 6. Uþduoèiai atlikti naudokite paketo dplyr funkcijà select.
# 2. Uþraðykite komandà, kuri ið duomenø lentelës iris iðrenka stulpelius, kuriø
#    pavadinimas prasideda þodþiu "Petal" ir juos pervadina pagal naujà ðablonà.


# --------------------------------------- #
# EILUÈIØ IÐRINKIMAS IR IÐRIKIAVIMAS      #
# --------------------------------------- #

# Lengviausias bûdas iðrinkti duomenø lentelës eilutes - pagal jø numerius. Ðiuo 
# atveju galima naudoti paketo dplyr funkcijà slice. Jos argumentas yra lentelës
# pavadinimas ir kitas argumentas - eiluèiø numeriø vektorius. Pvz., ið lentelës 
# airquality iðskirsime pirmà eilutæ.

slice(airquality, 1)

# Galima nurodyti keliø eiluèiø numeriø vektoriø. Pavyzdþiui, iðskirsime 5, 6 ir 
# 20-à eilutes.

slice(airquality, c(5, 6, 20))

# Jeigu reikalingas bendras lentelës eiluèiø skaièius, galima panaudoti funkcijà
# n(). Pavyzdþiui, iðskirsime paskutines eilutes pradedant nuo ðimtosios.

slice(airquality, 100:n())


# Norint ið kiekvienos lentelës grupës iðskirti kelias pirmàsias eilutes, galima
# naudoti funkcijà top_n. Pavyzdþiui, ið lentelës airquality iðrinksime pirmas 3 
# eilutes.

top_n(airquality, 3)


# Paprastoji atsitiktinë imtis ið lentelës eiluèiø iðrenkama naudojant funkcijas
# sample_n bei sample_frac. Pirmuoju atveju nurodomas konkretus eiluèiø skaièius,
# antruoju -- dalis nuo lentelës eiluèiø skaièiaus. Pvz., ið lentelës airquality
# atsitiktine tvarka be pasikartojimø iðrinksime 10 eiluèiø.

sample_n(airquality, 10)

# Jeigu iðrenkamos eilutës gali kartotis, tai parametro replace reikðmæ keièiame
# á TRUE.

sample_n(airquality, 10, replace = TRUE)


# Duomenø analizës praktikoje daþnai reikia iðrinkti eilutes, kurios tenkina tam
# tikrà loginæ sàlygà. Tokiu atveju galima naudoti paketo dplyr funkcijà filter.
# Pavyzdþiui, ið lentelës airquality iðskirsime tas eilutes, kur kintamojo Temp 
# reikðmë didesnë uþ 90.

filter(airquality, Temp > 90)


# Jei reikia iðskirti duomenø lentelës eilutes, kuriose vieno stulpelio reikðmës 
# patenka á tam tikrà intervalà, galima panaudoti paketo dplyr funkcijà between. 
# Jos sintaksë:
#                         between(x, left, right)
# 
# Èia x yra skaitinis vektorius, o left ir right reikðmiø intervalo galai. Pvz.,
# iðskirsime eilutes, kuriø stulpelio Temp reikðmës patenka á intervalà [50, 60].

filter(airquality, between(Temp, 50, 60))

# Kitas pavyzdys, surasime tas eilutes, kurios stulpelyje Ozone turi NA reikðmæ.

filter(airquality, is.na(Ozone))


# Gana daþnas uþdavinys -- paðalinti ið lentelës pasikartojanèias eilutes. Tokiu
# atveju galima naudoti naudoti standartinæ R funkcijà unique ar analogiðkà f-jà 
# distinct ið paketo dplyr. Pvz., lentelëje airquality paliksime tik tas eilutes, 
# kurios turi unikalias reikðmes stulpelyje Temp.

distinct(airquality, Temp)


# Kartais duomenø lentelës eilutes reikia iðrikiuoti kintamojo reikðmiø didëjimo 
# ar maþëjimo tvarka. Tokiø kintamøjø gali bûti vienas, bet gali bûti ir daugiau.
# Eiluèiø iðrikiavimui galima naudoti paketo dplyr funkcijà arrange. Pavyzdþiui, 
# lentelës mtcars eilutes iðrikiuosime kintamojo cyl (variklio cilindrø skaièius)
# reikðmiø didëjimo tvarka.

arrange(mtcars, cyl)

# Standartiðkai kintamojo reikðmës iðrikiuojamos didëjimo tvarka. Naudojant f-jà
# desc, kintamojo reikðmës transformuojamos taip, kad funkcija arrange iðrikiuos 
# eilutes to kintamojo reikðmiø maþëjimo tvarka. Pavyzdþiui, pagal kintamàjá cyl
# jau iðrikiuotà lentelæ dar kartà iðrikiuosime kintamojo disp reikðmiø maþëjimo 
# tvarka.

arrange(mtcars, cyl, desc(disp))


# UÞDUOTIS ------------------------------ 

# 1. Ið duomenø lentelës iris iðrinkite tik tas eilutes, kurios priklauso rûðiai
#    "versicolor".
# 2. Ið duomenø lentelës airquality iðrinkite tik tas eilutes, kuriose stulpelio 
#    Temp reikðmë didesnë uþ 90, o stulpelio Wind reikðmë didesnë uþ 5. Komandas
#    uþraðykite dviem variantais: naudojant paketo dplyr ir standartines R f-jas.
# 3. Ið duomenø lentelës airquality iðrinkite eilutes, kurios atitinka maþiausià
#    temperatûrà turinèias tris birþelio mënesio dienas.
# 4. Nustatykite, kokias reikðmes ágijo lentelës airquality kintamasis "Solar.R"
#    eilutëse, kuriose kintamojo "Temp" reikðmës didesnës uþ 90.
# 5. Ið lentelës iris atsitiktine tvarka be pasikartojimø iðrinkite 25 % eiluèiø.
#    Gautà lentelæ iðrikiuokite kintamojo Sepal.Length reikðmiø maþëjimo tvarka.


# --------------------------------------- #
# SÀLYGINIØ CHARAKTERISTIKØ SKAIÈIAVIMAS  #
# --------------------------------------- #

# Vienas ið tipiniø veiksmø -- vieno ar keliø lentelës stulpeliø charakteristikø
# skaièiavimas. Tai gali bûti kintamøjø vidurkiai, elementø skaièius ir panaðios
# charakteristikos. Ðiam tikslui galima naudoti paketo dplyr funkcijà summarize.
# Jos sintaksë:
#                             summarise(x, ...)
#
# Èia x yra duomenø lentelë, o vietoj ... raðoma viena ar kelios lygybës, kurios 
# deðinëje pusëje raðoma tam tikrà stulpelio charakteristikà skaièiuojanti f-ja,
# o kairëje raðomas tos charakteristikos pavadinimas. Pavyzdþiui, apskaièiuosime
# lentelës airquality stulpelio Temp vidurká ir dispersijà.

summarise(airquality, Temperatûra = mean(Temp), Dispersija = var(Temp))


# Labai daþnai reikia apskaièiuoti tam tikras stulpeliø charakteristikas grupëse
# pagal kito kintamojo reikðmes. Lentelës eiluèiø grupavimui galima naudoti f-jà
# group_by. Jos argumentais yra duomenø lentelë ir grupavimo kintamojo vardas, o
# rezultatas yra á grupes suskaidyta lentelë, kurià jà galima perduoti funkcijai 
# summarize.

G <- group_by(airquality, Month)
G

# Funkcija groups parodo, pagal koká kintamàjá yra sugrupuotos lentelës eilutës,
# o funkcija group_size parodo, kokio dydþio yra grupës.

groups(G)
group_size(G)

# Pavyzdþiui, apskaièiuosime stulpelio Temp vidurká ir dispersijà atskirai pagal
# mënesius.

summarise(G, Temperatûra = mean(Temp), Dispersija = var(Temp))

# Grupavimo kintamasis gali bûti sudarytas dirbtinai. Pavyzdþiui, apskaièiuosime
# temperatûros vidurká ir dispersijà grupëse pagal vëjo greitá. Èia jø sudarymui
# panaudosime standartines R funkcijas cut ir pretty.

G <- group_by(airquality, Wind = cut(Wind, pretty(Wind)))
summarise(G, Temperatûra = mean(Temp), Dispersija = var(Temp))

# Eiluèiø grupavimas gali bûti atliekamas ir pagal tam tikrà loginæ sàlygà. Pvz.,
# suformuosime dvi grupes pagal tai, ar vëjo greitis didesnis uþ savo vidurká ar 
# ne. Ðiose grupëse apskaièiuosime temperatûros vidurká ir dispersijà.

G <- group_by(airquality, Wind = Wind > mean(Wind))
summarise(G, Temperatûra = mean(Temp), Dispersija = var(Temp))


# Kadangi paketo dplyr funkcija n() gràþina eiluèiø skaièiø lentelëje, naudojant 
# jà kartu su funkcijomis group_by ir summarize, galima sudaryti daþniø lentelæ. 
# Pavyzdþiui, apskaièiuosime, kiek praleistø reikðmiø turi airquality kintamasis 
# Ozone.

summarise(group_by(airquality, is.na(Ozone)), Freq = n())


# Daþnai tà paèià skaitinæ charakteristikà reikia apskaièiuoti ið karto keliems 
# stulpeliams. Tokiu atveju patogiau naudoti funkcijà summarise_each. Sintaksë:
#
#                     summarise_each(x, funs(), ...)
#
# Èia x yra duomenø lentelë, kuri gali bûti ir grupuota, funs yra speciali f-ja,
# kuri leidþia suformuoti funkcijø sàraðà, o vietoje ... raðomi stulpeliø vardai.
# Jei kintamieji nenurodomi, tai charakteristikos skaièiuojamos visiems iðskyrus
# grupavimo kintamàjá. Pavyzdþiui, apskaièiuosime kintamøjø Temp, Wind vidurkius 
# kiekvienam mënesiui atskirai.

summarise_each(group_by(airquality, Month), funs(mean), Temp, Wind)

# Funkcijø, kuriø reikðmes reikia apskaièiuoti, sàraðe gali bûti ne viena. Pvz., 
# apskaièiuosime tø paèiø stulpeliø reikðmiø vidurká ir dispersijà.

summarise_each(group_by(airquality, Month), funs(mean, var), Temp, Wind)

# Apskaièiuotoms stulpeliø charakteristikoms galima suteikti vardus. Pavyzdþiui,
# rezultatø stulpeliai su vidurkio reikðmëmis turës priesagà E, o dispersijos D.

summarise_each(group_by(airquality, Month), funs(E = mean, D = var), Temp, Wind)

# Tuo atveju, kai stulpelio charakteristikà skaièiuojanti funkcija pati dar turi
# kokiø nors parametrø, stulpelá atitinkantis parametrus joje þymimas taðku. Ðià
# situacijà galima pailiustruoti tokiu pavyzdþiu: reikia apskaièiuoti airquality
# lentelës stulpelio Ozone vidurká. Ðiame stulpelyje yra NA reikðmiø, todël tam, 
# kad bûtø galima apskaièiuoti vidurká, reikia pakeisti funkcijos mean parametro 
# na.rm reikðmæ ið FALSE á TRUE.

summarise_each(group_by(airquality, Month), funs(mean(., na.rm=T)), Ozone, Wind)


# NAUDINGA ------------------------------

# Galima pastebëti, kad visi veiksmai duomenø lentelëje atliekami su stulpeliais. 
# Funkcijø mutate ir summarise argumentas yra visos lentelës stulpelis arba, jei 
# lentelë yra grupuota, - tam tikrai eiluèiø grupei priklausanti stulpelio dalis.

# Kartais tuos paèius veiksmus reikia atlikti su visomis lentelës eilutëmis. Tai
# gali bûti, pavyzdþiui, maksimalios reikðmës suradimas eilutëje. Pvz., surasime
# maksimumà ið kintamøjø Sepal.Length, Petal.Length reikðmiø kiekvienai lentelës
# iris eilutei.

# Vienas galimas bûdas -- kiekvienà lentelës eilutæ sutapatinti su atskira grupe.
# Grupavimas atliekamas naudojant funkcijà group_by, o grupës sutampa su eiluèiø
# numeriais.

summarise(group_by(iris, Nr. = 1:n()), max = max(Sepal.Length, Petal.Length))

# Kitas bûdas -- naudoti specialiai tokiam atvejui skirtà dplyr funkcijà rowwise.

summarise(rowwise(iris), max = max(Sepal.Length, Petal.Length))

# Tà paèià komandà uþraðysime naudojant operatoriø %>%.

iris %>% rowwise() %>% summarise(max = max(Sepal.Length, Petal.Length))


# UÞDUOTIS ------------------------------ 

# 1. Apskaièiuoti lentelës airquality kintamojo Ozone praleistø reikðmiø skaièiø 
#    atskirai kiekvienam mënesiui. Naudokite paketo dplyr funkcijas.
# 2. Naudodami lentelæ airquality, nustatykite kiekvieno mënesio kintamojo Ozone 
#    vidurká, kai temperatûra svyruoja intervale [70, 80].
# 3. Lentelëje airquality ið kiekvieno mënesio iðskirkite po pirmas dvi eilutes.
#    Uþraðykite 2 komandos versijas: a) su funkcija top_n, b) su funkcija slice.
# 4. Ið lentelës airquality iðskirkite po dvi kiekvieno mënesio eilutes, kuriose
#    didþiausios to mënesio stulpelio Temp reikðmës iðrikiuotos maþëjimo tvarka.


# --------------------------------------- #
# KELI TIPINIAI DUOMENØ ANALIZËS ATVEJAI  #
# --------------------------------------- #

# Paprastai duomenø lentelës pertvarkymas susideda ið keliø þingsniø: eiluèiø ir
# stulpeliø iðrinkimo, grupiø atskyrimo, tam tikrø charakteristikø ðiose grupëse
# skaièiavimo ir rezultatø apjungimo. Labai daþnai ðiuos etapus tenka pakartoti,
# priklausomai nuo situacijos atsisakyti kai kuriø etapø, keisti jø eiliðkumà ir
# panaðiai. Uþraðysime keletà tipiniø duomenø pertvarkymo pavyzdþiø. 

# Lentelëje airquality suraðyti keliø mënesiø meteorologiniø stebëjimø duomenys.
# Apskaièiuosime kiekvieno mënesio temperatûros vidurká.

summarise(group_by(airquality, Month), vidurkis = mean(Temp))

# Naudojant operatoriø %>%, tà pati komanda uþraðoma tokiu bûdu:

airquality %>% group_by(Month) %>% summarise(vidurkis = mean(Temp))

# Ið esmës toká pat rezultatà galime gauti ir naudojant standartines R funkcijas
# tapply, by ir aggregate -- skiriasi tik rezultatø iðvedimo forma.

with(airquality, tapply(Temp, Month, mean))
with(airquality, by(Temp, Month, mean))
with(airquality, aggregate(Temp, list(rûðis = Month), mean))


# Ði split-apply-combine schema nesunkiai realizuojama naudojant standartines R
# funkcijas:
#                                      split 
#                                      |   |
#                                 sapply   lappy
#                                              |
#                                              stack

      sapply(with(airquality, split(Temp, Month)), mean) 
stack(lapply(with(airquality, split(Temp, Month)), mean))

# Tos paèios komandos uþraðytos naudojant %>% operatoriø:

airquality %>% with(split(Temp, Month)) %>% sapply(mean)
airquality %>% with(split(Temp, Month)) %>% lapply(mean) %>% stack


# --------------------------------------- #

# Pavyzdþiui, naudojant lentelës airquality duomenis, nustatysime kiekvieno mën.
# dienà su maþiausia to mënesio temperatûra.

select(filter(group_by(airquality, Month), Temp == min(Temp)), Month, Day, Temp)

# Vietoje funkcijos filter galima naudoti f-jas slice ir which.min. Tokiu atveju
# vietoje loginës sàlygos f-jai slice nurodomas konkretus eilutës numeris, todël
# gaunama trumpesnë ir aiðkesnë komanda.

select(slice(group_by(airquality, Month), which.min(Temp)), Month, Day, Temp)

# Naudojant operatoriø %>%, ðios dvi komandos uþraðomos taip:

airquality %>% 
           group_by(Month) %>% 
                           filter(Temp == min(Temp)) %>% 
                                                     select(Month, Day, Temp)
airquality %>% 
           group_by(Month) %>% 
                           slice(which.min(Temp)) %>% 
                                                  select(Month, Day, Temp)

# Naudojant standartines R funkcijas split ir lapply, duomenø lentelë ið pradþiø
# padalinama á grupes, vëliau ið kiekvienos grupës iðrenkami reikiami stulpeliai
# ir reikiamos eilutës. Kadangi galutinëje lentelëje lieka datos ir temperatûros
# kintamieji, nereikalingø stulpeliø galima atsisakyti lentelës grupavimo etape.
# Ðiuo atveju funkcijos lapply rezultatas yra data.table tipo duomenø lentelë su 
# viena eilute. Á galutinæ lentelæ jas apjungiame naudojant do.call konstrukcijà
#
#                              do.call(f, x)
#
# Èia x yra list tipo sàraðas, o f yra funkcija, kurios argumentai ir yra sàraðe.
# Atskiros eilutës á vienà data.frame lentelæ apjungiamos naudojant R f-jà rbind.

G <- with(airquality, split(airquality[, c("Month", "Day", "Temp")], Month))
do.call(rbind, lapply(G, subset, subset = Temp == min(Temp)))

# Vietoje konstrukcijos do.call(rbind, ... ) eiluèiø ið sàraðo apjungimui galima
# naudoti paketo dplyr funkcijà bind_rows.

bind_rows(lapply(G, subset, subset = Temp == min(Temp)))


# NAUDINGA ------------------------------

# Tarkim, kad reikia apskaièiuoti kiekvieno mënesio santykiná praleistø reikðmiø
# daþná lentelës airquality stulpelyje Ozone. Tokiu atveju paprasèiausia naudoti 
# standartinæ R funkcijà tapply ir skaièiuoti reikðmiø NA indikatoriaus vidurká.  

with(airquality, tapply(Ozone, Month, function(x) mean(is.na(x), na.rm = TRUE)))

# Kitas bûdas -- naudojant f-jà split, iðskaidyti kintamàjá Ozone á grupes, tada,
# turint grupiø sàraðà, naudojant f-jà sapply, apskaièiuoti jose santykiná daþná.

G <- with(airquality, split(Ozone, Month))
sapply(G, function(x) mean(is.na(x), na.rm = TRUE))

# Abiem atvejais santykinio daþnio apskaièiavimui reikia uþraðyti anoniminæ f-jà.
# Naudojant operatoriø %>% galima sutrumpinti jos uþraðymà, kadangi taðkas prieð
# operatoriø %>% sukuria tokià funkcijà. Uþraðysim naujà komandos su f-ja tapply 
# variantà:

with(airquality, tapply(Ozone, Month, . %>% is.na %>% mean(na.rm = TRUE)))


# PASTABA! Ðià komandà galima uþraðyti visai be anoniminës funkcijos. Tam reikia
# á grupes skaidyti ne pradiná kintamàjá Ozone, o ið karto funkcijà is.na(Ozone), 
# kurios reikðmës perduodamos standartinei funkcijai mean su parametru na.rm.

with(airquality, tapply(is.na(Ozone), Month, mean, na.rm = TRUE))


# UÞDUOTIS ------------------------------ 

# 1. Ið lentelës airquality iðskirkite po pirmas tris kiekvieno mënesio eilutes.
#    Uþraðykite ðià komandà naudojant paketo dplyr funkcijas bei operatoriø %>%.
#    Sugalvokite, kaip iðspræsti ðià uþduoti naudojant standartines R funkcijas.
# 2. Naudojant lentelës airquality duomenis, nustatykite, kurio mënesio pirmø 15
#    dienø temperatûros vidurkis didþiausias. Uþraðykite komandà naudojant dplyr
#    funkcijas ir perraðykite jà naudojant %>% operatoriø.
# 3. Uþraðykite funkcijà, kuri nustatytø, kokios trys daþniausiai pasitaikanèios
#    kintamojo Petal.Length reikðmës bûdingos kiekvienai lentelës iris kintamojo
#    Species reikðmei.
# 4. Naudojant duomenø lentelæ iris, nustatykite, kuriai augalø rûðiai vidutinis
#    kintamøjø Sepal.Length ir Sepal.Width santykis yra didþiausias. Sudarykite
#    ðio santykio didëjimo tvarka iðrikiuotà rezultatø lentelæ, kurioje dar bûtø
#    ir kintamasis Species.

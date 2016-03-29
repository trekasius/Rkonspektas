
#
#   Dalykas: STATISTINĖS DUOMENŲ ANALIZĖS SISTEMA IR PROGRAMAVIMO KALBA R
#            Baziniai veiksmai su simbolių sekomis.
#
#  Autorius: Tomas Rekašius
#
#   Sukurta: 2016-03-21 | 2016-03-29
#


# TURINYS -------------------------------

#
#   1. Simbolių tekste pakeitimas:
#      * funkcija nchar
#      * funkcija tolower
#      * funkcija toupper
#      * funkcija chartr
#
#   2. Simbolių sekų skaidymas į atskiras dalis:
#      * funkcija substr
#      * funkcija strsplit
#


# PASTABOS ------------------------------

#
# Pastabų nėra.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviška lokalė. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Ištrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# SIMBOLIŲ SEKOJE PAKEITIMAS              #
# --------------------------------------- #

# Teorinėje informatikoje apibrėžiamas specialus duomenų tipas --- string. Tokio 
# duomenų tipo reikšmės yra baigtinį elementų skaičių turinčios sekos, sudarytos 
# iš bet kokia tvarka išdėstytų simbolių iš tam tikros aibės, vadinamos alfabetu.
# Duomenų tipas tuo pačiu apibrėžia ir veiksmus su string tipo kintamaisiais.

# Simbolių seka rašoma tarp viengubų ar dvigubų kabučių. Simbolių sekas, kaip ir
# kitus vienodo tipo elementus, galima apjungti į vektorius. R turi keletą tokių
# tekstinių vektorių -- konstantų. Tai didžiosios ir mažosios raidės bei mėnesių
# pavadinimai.

letters
LETTERS

month.abb
month.name

# Sekų skaičius tokiame vektoriuje nustatomas naudojant standartinę f-ją length.
# Pavyzdžiui, mėnesių pavadinimų yra 12:

length(month.name)

# Simbolių skaičių sekoje vadinkime sekos ilgiu. Jam apskaičiuoti naudojama f-ją 
# nchar. Jos parametrai:
#
#          x -- simbolių seka arba keletos sekų vektorius,
#       type -- sekos dydžio matavimo vienetai: "bytes", "chars" arba "width".

# Funkcijos nchar rezultatas yra skaičių vektorius. Jo elementų skaičius sutampa
# su vektoriaus x elementų skaičiumi. Pavyzdžiui, nustatysime mėnesių pavadinimų
# ilgius.

nchar(month.name)

# Tokį ilgių vektorių galima panaudoti ilgiausios sekos nustatymui ir išrinkimui.
# Pavyzdžiui, nustatysime, kurio mėnesio pavadinimas ilgiausias.

month.name[which.max(nchar(month.name))]

# Atskiru atveju sekų vektorius gali būti ir viena seka. Pavyzdžiui, nustatysime 
# ilgiausio daniško žodžio ilgį.

žodis <- "Kindercarnavalsoptochtvoorbereidingswerkzaamhedenplan"
nchar(žodis)


# Kartais nėra jokio skirtumo, kokiomis raidėmis parašytas tekstas, didžiosiomis 
# ar mažosomis. Pavyzdžiui, bioinformatikoje pagrindinis tyrimo objektas yra DNR 
# arba amino rūgščių sekos. DNR sekos užrašomos simboliais iš aibės {A, C, G, T}.
# Tačiau ta pati seka gali būti užrašyta ir mažosiomis raidėmis -- skirtumo nėra.
# Atliekant natūralios kalbos tekstų statistinę analizę, didžiosios bei mažosios
# raidės dažniausiai taip pat neskiriamos, o kartais tiesiog reikia suvienodinti 
# raidžių registrą. Tam naudojamos funkcijos toupper ir tolower.

# Pavyzdžiui, iš didžiųjų lietuviškos abėcėlės raidžių vektoriaus gausime mažųjų 
# raidžių vektorių.

RAIDĖS <- c("A", "Ą", "B", "C", "Č", "D", "E", "Ę", 
            "Ė", "F", "G", "H", "I", "Į", "Y", "J", 
            "K", "L", "M", "N", "O", "P", "R", "S", 
            "Š", "T", "U", "Ų", "Ū", "V", "Z", "Ž")

raidės <- tolower(RAIDĖS)
raidės


# Jei vienus simbolius sekoje reikia pakeisti į kitus, naudojama funkcija chartr.
# Jos parametrai:
#
#        old -- keičiamų simbolių seka,
#        new -- pakeistų simbolių seka,
#          x -- seka, kurioje atliekamas simbolių pakeitimas.

# Pavyzdžiui, šią funkciją galima panaudoti tuo atveju, kai visame tekste reikia 
# pakeisti vieną kokį nors neteisingai naudojamą simbolį į kitą simbolį. Tarkime,
# žinome, kad Bertrand Russell sakinyje vietoje simbolio "?" turi būti raidė "i".

citata <- "Arš?aus? g?nča? kyla tada, ka? nė v?ena šal?s netur? svar?ų įrodymų."

chartr("?", "i", citata)


# Atskiru atveju galima pakeisti visas abėcėlės raides. Tada raidės tekste lieka 
# savo vietose, bet pakeičia savo tapatybę, todėl pradinis tekstas užšifruojamas. 
# Toks šifras vadinamas keitinių šifru (substitution). Vienas seniausių keitinių
# šifras --- Cezario šifras, kuriame kiekviena raidė keičiama į raidę, stovinčią
# abėcėlėje trimis pozicijomis toliau. Cezario šifro apibendrinimas --- postūmio
# šifras (shift cipher), kuriame postūmis atliekamas per k raidžių, 0 < k < n, o 
# n yra abėcėlės raidžių skaičius. Pavyzdžiui, užšifruosime tekstą taikant tokią 
# paprasčiausią raidžių keitimo taisyklę: 
#
#              a --> ą --> b --> c --> č --> ... --> z --> ž --> a              

tekstas <- "Jei jums atrodo, kad nieko nesupratote, tai tikriausiai taip ir yra."

old <- "aąbcčdeęėfghiįyjklmnoprsštuųūvzž"
new <- "ąbcčdeęėfghiįyjklmnoprsštuųūvzža"

chartr(old, new, tekstas)


# UŽDUOTIS ------------------------------ 

# 1. Užrašykite komandą, kuri lietuviškas didžiąsias ir mažąsias raides pakeistų 
#    į atitinkamas lotyniškas raides.
# 2. Užrašykite tokią komandą, kad duotas tekstas būtų užšifruotas Cezario šifru.
#    Sugalvokite, kaip iššifruoti taip užšifruotą tekstą.


# --------------------------------------- #
# SUBSEKOS IŠSKYRIMAS                     #
# --------------------------------------- #

# Pažymėkime n simbolių seką L = s_1 s_2 ... s_n. Tada seka S = s_i ... s_j, kur
# 1 <= i <= j <= n, bus vadinama sekos L subseka (substring). Jeigu sekoje L yra
# tarpų, tai subseka S taip pat gali būti sudaryta vien iš tarpų, tačiau subseka 
# negali būti tuščia seka "". Atskirais atvejais gaunamos tokios subsekos: 
# 
#  prefiksas -- kai i = 1,
#   sufiksas -- kai j = n.

# R kalboje subsekos išskyrimui arba jos keitimui naudojama funkcija substr. Jos 
# parametrai:
#
#          x -- pradinė simbolių seka arba sekų vektorius,
#      start -- išskiriamos subsekos pirmojo simbolio eilės numeris i,
#       stop -- išskiriamos subsekos paskutinio simbolio eilės numeris j.

# Parametrų start ir stop reikšmės nebūtinai turi būti vienas skaičius -- galima 
# priskirti ir skaičių vektorių. Tada iš sekos bus išskirtos kelios jos subsekos.


# Akrostichas - tai eiliuotas kūrinys, kurio eilučių pirmosios raidės, skaitomos
# iš viršaus į apačią, sudaro atskirą žodį. Antikinėje Graikijoje, Romoje ir net
# Viduramžiais buvo įprasta akrostichu įrašyti autoriaus vardą. Kartais nežinomą
# teksto autorių pavyksta identifikuoti pagal akrostichą. Pirma lietuviška knyga
# taip pat turi akrostichą -- taip Martynas Mažvydas lotyniškai įrašė savo vardą 
# MARTINUS MASVIDIUS, kuris, beje, buvo pastebėtas tik XX amžiuje!

# Išnagrinėsime Vinco Kudirkos eilėraštį "Mįslės". Eilėraščio tekstas padalintas
# į atskiras eilutes. Iš kiekvienos eilutės išskirsime pirmąją jos raidę.

eilėraštis <- c("Dievas visad ant lūpų, o širdyje velnias;",
                "Akis tuojau užmerkia išvydusi kelnes;",
                "Vaikščioja atsiplėšus – įžadai mat toki;",
                "Atmintyje tik laiko, kur atlaidai koki",
                "Tur liežuvį bjauresnį už gyvatės gylį;",
                "Kasdien tupi bažnyčioj, nes tinginį myli.",
                "Atminki, kas tai būtų, jei mįslius mint moki?")
eilėraštis

# Kadangi iš kiekvienos eilutės reikia išskirti po vieną raidę, funkcijos substr 
# parametrų start ir stop reikšmės sutampa.

substr(eilėraštis, 1, 1)


# Sufiksų medis --- tai medžio pavidalo abstrakti duomenų struktūra, sudaryta iš
# visų sekos L sufiksų. Jei seka L turi n simbolių, tada jos sufiksų medis turės 
# n numeruotų viršūnių (lapų). Visos vidinės viršūnės, išskyrus šaknį, turi bent 
# dvi briaunas (šakas). Kiekviena briauna pažymima simbolių seka, kuri yra sekos 
# L subseka, tačiau iš tos pačios viršūnės išeinančios briaunos negali prasidėti 
# tuo pačiu simboliu. Seka, kuri gaunama apjungus visas briaunas nuo šaknies iki
# vieno pasirinkto lapo, yra kažkuris pradinės sekos sufiksas. Pavyzdžiui, sekos 
# "susisuko" sufiksų medis atrodo taip:
#                                                  sufiksai
#                                                 ----------
#
#                               +---sisuko         susisuko
#                       +---u---|                  
#                       |       +---ko             suko
#               +---s---|                          
#               |       +---isuko                  sisuko
#      root: ---|                                  
#               |       +---sisuko                 usisuko
#               +---u---|                          
#               |       +---ko                     uko
#               |                                  
#               +---isuko                          isuko
#               |                                  
#               +---ko                             ko
#               |                                  
#               +---o                              o


# Yra keletas sufiksų medžio sudarymo algoritmų. Pirmą algoritmą 1973 m. pasiūlė
# Weiner, kurį 1976 m. supaprastino McCreight. Ukkonen 1995 m. pasiūlė greitesnį,
# bet ir sudėtingesnį algoritmą. Farach 1997 m. gavo optimalų visiems alfabetams 
# sufiksų medžių sudarymo algoritmą.

# Sufiksų medžiai plačiai naudojami bioinformatikoje ir kitose su teksto analize
# susijusiose srityse, kur reikia nustatyti, ar tam tikra seka S yra kitos sekos
# L subseka. Sufiksų medžio sudarymo algoritmai gana sudėtingi, todėl čia paties
# medžio nesudarinėsime, tačiau sudarysime sekos L = "susisuko" sufiksų vektorių:

L <- "susisuko"
n <- nchar(seka)

S <- substring(L, 1:n, n)
S


# Vienas iš pagrindinių bioinformatikos tyrimų objektų yra DNR ir baltymų sekos.
# DNR molekulė gali būti labai ilga. Pvz., tipinis bakterijų DNR sekos ilgis yra
# tarp 1 ir 10 mln. nukleotidų, žmogaus DNR seka ilgesnė nei 3 mlrd. nukleotidų.
# Dažniausiai nagrinėjama ne visa organizmo DNR seka, o tik tam tikra jos dalis.

# Žinoma, kad DNR sekoje nėra tarpų ar kitų natūralioms kalboms būdingų skyrybos 
# ženklų, todėl seka skaitoma ištisai. Sudaroma tokio paties ilgio subsekų seka, 
# kur pirmoji subseka prasideda pirmuoju sekos nariu, antroji - antruoju ir t.t. 
# Tokiu būdu gaunamas taip vadinamas slenkantis langas, kurio plotis k yra lygus
# slenkančios subsekos ilgiui. Kuo mažesnis langas, tuo didesnis slenkančių sekų 
# arba taip vadinamų žodžių skaičius. Kraštutiniu atveju, kai k = 1, tai gauname 
# atskirų pradinės sekos simbolių seką. 

# Pavyzdžiui, duotas DNR sekos fragmentas. Naudojant slenkantį langą, sudarysime 
# šią seką sudarančių žodžių iš k = 3 simbolių aibę ir gausime jų dažnių lentelę.

dnr <- "GCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGCT"

n <- nchar(dnr)
k <- 3

w <- substring(dnr, 1:(n-k+1), k:n)
w

# Pagal žodžių dažnių pasiskirstymą galima spręsti apie statistines sekų savybes.
# Kadangi DNR sekos alfabetą sudaro keturios raidės, tai žodžių iš trijų raidžių 
# yra 4^3 = 64. Nagrinėjama DNR seka palyginus trumpa, tad didžioji dalis žodžių 
# šioje sekoje pasirodo tik po vieną kartą, o kai kurie žodžiai visai nepasirodo. 
# Pavyzdžiui, sekoje nėra žodžių "ACA", "CCC" ir dar keletos kitų. 

table(w)


# Funkcija substr gali būti naudojama ir vienos subsekos pakeitimui į kitą tokio
# paties ilgio subseką. Pavyzdžiui, turime failų pavadinimų vektorių. Visų failų
# pavadinimai standartiniai ir vienodo ilgio. Pakeisime failo išplėtimą iš "txt"
# į "rez".

failai <- c("failas_01.txt", "failas_02.txt", "failas_03.txt", "failas_04.txt")

substr(failai, 11, 13) <- "rez"
failai

# Žinoma, tokiam tikslui naudojama funkcija substr turi labai ribotas pritaikymo
# galimybes. Pavyzdžiui, šiuo atveju, jei failų pavadinimai būtų skirtingų ilgių, 
# kiekvienam pavadinimui reikėtų nustatyti vis kitokias indeksų reikšmes. Žymiai
# didesnes galimybes turi reguliarios išraiškos (regular expressions).


# UŽDUOTIS ------------------------------ 

# 1. Užrašykite komandą, kuri sudarytų absoliučiai visų sekos L subsekų vektorių
#    ir nustatykite jų skaičių.
# 2. Užrašykite komandą, kuri pirmąją visų vieno sakinio žodžių raidę pakeistų į 
#    atitinkamą didžiąją raidę.
# 3. Užrašykite komandą, kuri DNR seką suskaidytų į nepersikertančius žodžius iš
#    k = 10 simbolių.


# --------------------------------------- #
# SEKOS IŠSKAIDYMAS Į ATSKIRAS DALIS      #
# --------------------------------------- #

# Vienas iš tipinių ir dažnai atliekamų veiksmų --- sekos suskaidymas į atskiras
# dalis. Pavyzdžiui, sakinį galima suskaidyti į atskirus žodžius ar net atskirus
# simbolius. Tekstiniu formatu užrašytą datą galima išskaidyti į metus, mėnesius
# ir dienas ir t. t. Šis suskaidymas primena subsekos išskyrimą, bet šiuo atveju
# laikoma, kad sekos dalys atskirtos tam tikru simboliu ar jų kombinacija. Pvz.,
# sakinyje žodžiai vienas nuo kito atskirti tarpo simboliu, atskiros datos dalys
# atskiriamos arba brūkšneliu, arba tašku.

# R kalboje sekos skaidymui į atskiras dalis naudojama f-ja strsplit. Parametrai:
#
#          x -- seka arba sekų vektorius,
#      split -- simbolis arba jų seka, pagal kurią skaidoma pradinė seka,
#      fixed -- loginis, FALSE nurodo, kad split yra ne reguliari išraiška.


# Pavyzdžiui, duota kableliais vienas nuo kito atskirtų olimpiadinių žodžių seka. 
# Šią seką reikia išskaidyti į atskirus žodžius.

žodžiai <- "bąla, gęsta, gvęra, kręšta, sąla, šąla, šąšta, tęžta, tręšta"
žodžiai

# Galima pastebėti, kad šioje sekoje žodžiai atskirti ne tik kableliais, bet dar
# ir tarpais, todėl parametrui split nurodome simbolių seką ", ".

strsplit(žodžiai, split = ", ")

# Funkcijos strsplit rezultatas yra list tipo sąrašas. Tai nelabai patogu, jeigu
# skaidome vieną seką, bet labai patogu, jei į atskiras dalis skaidomos iš karto
# kelios sekos. Tada gauname sąrašą, kuris turi tiek elementų, kiek yra pradinių
# sekų. Sąrašo elementai yra vektoriai, kurių elementai yra atskiros sekų dalys.
# Pavyzdžiui, duotas Vilniaus greitųjų autobusų maršrutų vektorius. Išskaidysime
# šiuos maršrutus į atskiras dalis, kurios viena nuo kitos atskirtos brūkšneliu.

maršrutai <- c("Stotis-Kalvarijų g.-Santariškės",
               "Santariškės-Laisvės pr.-Stotis",
               "Fabijoniškės-Centras-Oro uostas",
               "Pilaitė-Konstitucijos pr.-Saulėtekis",
               "Pašilaičiai-Ozo g.-Saulėtekis",
               "Parko-Olandų g.-Žaliasis tiltas")

strsplit(maršrutai, split = "-")


# Parametro split reikšmė yra reguliari išraiška - tai tokia simbolių seka, kuri
# leidžia užrašyti tam tikrą sekos šabloną. Reguliarios išraiškos naudoja dviejų
# tipų simbolius: simbolius, kurie interpretuojami tiesiogiai, ir metasimbolius,
# kurie turi specialią prasmę. Kokie simboliai yra metasimboliai - priklauso nuo
# reguliarių išraiškų standarto. R naudojamas išplėstas reg. išraiškų standartas
# ERE, kuriame metasimboliai yra
#
#                            . \ | ( ) [ { ^ $ * + ? 
#
# Jei metasimbolį reikia naudoti kaip simbolį, prieš jį rašomas valdymo simbolis. 
# Pavyzdžiui, R reguliarioje išraiškoje skliaustai () užrašomi \\( \\).

# Tuo atveju, kada parametrui split priskiriama seka turi būti interpetuojama ne 
# kaip reguliari išraiška, parametrui fixed priskiriama loginė reikšmė TRUE. Tai
# nurodo, kad visi metasimboliai bus suprantami, kaip paprasti simboliai.

# Pavyzdžiui, reikia išskaidyti tekstiniu formatu užrašytas datas. Datoje metai,
# mėnuo ir diena vienas nuo kito atskirti tašku.

#          Saulės        Durbės        Žalgirio      Oršos         Salaspilio
#         ------------  ------------  ------------  ------------  ------------ 
data <- c("1236.09.22", "1260.07.13", "1410.07.15", "1514.09.08", "1605.09.27")
data

# Reguliariose išraiškose taškas yra metasimbolis, kuris nurodo bet kokį simbolį,
# tarp jų ir patį tašką, todėl datos bus išskaidytos pagal skaičius ir taškus, o 
# rezultatas bus tuščios sekos.

strsplit(data, ".")

# Kad "." būtų interpretuojamas kaip taškas, pakeičiame parametro fixed reikšmę.

strsplit(data, ".", fixed = TRUE)

# Naudojant valdymo simbolį, tašką galima užrašyti ir kaip reguliarią išraišką.

strsplit(data, "\\.")


# NAUDINGA ------------------------------

# Naudojant reguliarias išraiškas, sudėtingą taisyklę, pagal kurią skaidoma seka,
# galima užrašyti gana kompaktiškai. Pavyzdžiui, seka gali būti skaidoma į dalis 
# ne pagal vieną konkretų simbolį, bet iš karto pagal du alternatyvius simbolius. 
# Alternatyvos reguliariose išraiškose apjungiamos simboliu |. 

# Pavyzdžiui, duotas vektorius su Vilniaus, Rygos ir Talino miestų koordinatėmis. 
# Šias koordinates reikia išskaidyti į laipsnius, minutes ir platumą arba ilgumą 
# nurodančius simbolius. Galima pastebėti, kad platuma ir ilguma atskirtos tarpu, 
# o laipsniai ir minutės turi savo simbolius, todėl šiuo atveju iš viso bus trys 
# alternatyvūs simboliai, pagal kuriuos į atskiras dalis skaidoma kiekviena seka.

koordinatės <- c(Vilnius = "54°41'N 25°17'E", 
                    Riga = "56°56'N 24°06'E", 
                 Tallinn = "59°26'N 24°44'E")

strsplit(koordinatės, "°|'| ")
strsplit(koordinatės, "[°' ]")


# Jei seka į atskiras dalis skaidoma pagal bent vieną kartą pasirodantį konkretų 
# simbolį, tai tokių sekų šabloną galima užrašyti naudojant metasimbolį +, kuris
# nurodo, jog prieš jį stovintis simbolis sekoje pasirodo vieną ar daugiau kartų.

serijos <- "1---1--1-1111---1111---11-11-1-111-111-----1-11-----1--1-1-----1-11"

strsplit(serijos, "-+")


# NAUDINGA ------------------------------

# Tekstinio formato failuose gali būti saugomi labai įvairūs duomenys. Pvz., tai
# gali būti paprastas tekstas, DNR seka, programos kodas, duomenų lentelė ir pan. 
# Kad duomenys iš failo būtų nuskaitomi korektiškai, kiekvienu atveju naudojamas 
# tam tikras tekstinių duomenų saugojimo formatas. Vienas iš universalių duomenų 
# lentelių užrašymo formatų yra CSV (Comma-Separated Values). Kintamųjų reikšmės 
# stulpeliuose atskiriamos kableliu arba kabliataškiu.

# Pavyzdžiui, duotas failas su artimiausių metų saulės užtemimų duomenimis. Data,
# laikas, užtemimo tipas, ryškumas, trukmė ir koordinatės atskirtos kabliataškiu.

failas <-  
"2015-03-20;09:46:47;Total;1.045;2:47;64.4°N;6.6°W
2016-03-09;01:58:19;Total;1.045;4:09;10.1°N;148.8°E
2016-09-01;09:08:02;Annular;0.974;3:06;10.7°S;37.8°E
2017-02-26;14:54:33;Annular;0.992;0:44;34.7°S;31.2°W
2017-08-21;18:26:40;Total;1.031;2:40;37.0°N;87.7°W
2019-07-02;19:24:08;Total;1.046;4:33;17.4°S;109.0°W
2019-12-26;05:18:53;Annular;0.970;3:40;1.0°N;102.3°E
2020-06-21;06:41:15;Annular;0.994;0:38;30.5°N;79.7°E
2020-12-14;16:14:39;Total;1.025;2:10;40.3°S;67.9°W
2021-06-10;10:43:07;Annular;0.943;3:51;80.8°N;66.8°W
2021-12-04;07:34:38;Total;1.037;1:54;76.8°S;46.2°W
2023-04-20;04:17:56;Hybrid;1.013;1:16;9.6°S;125.8°E
2023-10-14;18:00:41;Annular;0.952;5:17;11.4°N;83.1°W
2024-04-08;18:18:29;Total;1.057;4:28;25.3°N;104.1°W
2024-10-02;18:46:13;Annular;0.933;7:25;22.0°S;114.5°W
2026-02-17;12:13:06;Annular;0.963;2:20;64.7°S;86.8°E
2026-08-12;17:47:06;Total;1.039;2:18;65.2°N;25.2°W
2027-02-06;16:00:48;Annular;0.928;7:51;31.3°S;48.5°W
2027-08-02;10:07:50;Total;1.079;6:23;25.5°N;33.2°E
2028-01-26;15:08:59;Annular;0.921;10:27;3.0°N;51.5°W
2028-07-22;02:56:40;Total;1.056;5:10;15.6°S;126.7°E
2030-06-01;06:29:13;Annular;0.944;5:21;56.5°N;80.1°E
2030-11-25;06:51:37;Total;1.047;3:44;43.6°S;71.2°E"

# Prisijungimui prie virtualaus tekstinio failo naudojame f-ją textConnection, o
# eilučių nuskaitymui naudojame funkciją readLines. Taip gauname vektorių, kurio 
# elementai eilučių simbolių sekos. Tokių sekų yra tiek, kiek faile yra eilučių.

eilutės <- readLines(textConnection(failas))
eilutės

# CSV faile reikšmės eilutėse atskirtos kabliataškiu. Pagal jį seką suskaidome į 
# atskiras dalis.

eclipses <- strsplit(eilutės, ";")
print(eclipses, quote = FALSE)


# Paprastai duomenų lentelės nuskaitymui iš tekstinio failo naudojama tam skirta
# funkcija read.table. Ji turi parametrą sep, per kurį ir nurodoma reikšmė, kuri
# atskiria reikšmes lentelės stulpeliuose.

read.table(textConnection(failas), sep = ";")


# UŽDUOTIS ------------------------------ 

# 1. Užrašykite komandą, kuri sudarytų simbolių pasirodymo tekste dažnių lentelę.
#
# 2. Užrašykite komandą, kuri sakinį išskaidytų į atskirus žodžius bei nustatytų
#    kiekvieno žodžio ilgį.
# 3. Tarkime, kad visų sakinių pabaigą tam tikrame tekste žymi taškas, šauktukas 
#    arba klaustukas, o po šių ženklų visada prasideda naujas sakinys (realybėje, 
#    žinoma, taip yra nevisada). Užrašykite komandą, kuri nustatytų, kiek žodžių 
#    yra kiekviename duoto teksto sakinyje.
# 4. Sugalvokite tokią komandą, kuri nuskaitytų kabliataškiais atskirtų vektorių 
#    elementus, kurie vienas nuo kito atskirti kableliais. Pvz., tokia seka turi
#    4 vektorius: "1.2, 4.9, 3.1; 8.6, 7.4; 2.5, 1.2, 8.2, 1.8; 0.5". Rezultatas
#    turi būti sąrašas iš 4 elementų, kurių elementai yra vektorių reikšmės.

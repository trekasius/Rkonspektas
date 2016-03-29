
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Baziniai veiksmai su simboliø sekomis.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2016-03-21 | 2016-03-29
#


# TURINYS -------------------------------

#
#   1. Simboliø tekste pakeitimas:
#      * funkcija nchar
#      * funkcija tolower
#      * funkcija toupper
#      * funkcija chartr
#
#   2. Simboliø sekø skaidymas á atskiras dalis:
#      * funkcija substr
#      * funkcija strsplit
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
# SIMBOLIØ SEKOJE PAKEITIMAS              #
# --------------------------------------- #

# Teorinëje informatikoje apibrëþiamas specialus duomenø tipas --- string. Tokio 
# duomenø tipo reikðmës yra baigtiná elementø skaièiø turinèios sekos, sudarytos 
# ið bet kokia tvarka iðdëstytø simboliø ið tam tikros aibës, vadinamos alfabetu.
# Duomenø tipas tuo paèiu apibrëþia ir veiksmus su string tipo kintamaisiais.

# Simboliø seka raðoma tarp viengubø ar dvigubø kabuèiø. Simboliø sekas, kaip ir
# kitus vienodo tipo elementus, galima apjungti á vektorius. R turi keletà tokiø
# tekstiniø vektoriø -- konstantø. Tai didþiosios ir maþosios raidës bei mënesiø
# pavadinimai.

letters
LETTERS

month.abb
month.name

# Sekø skaièius tokiame vektoriuje nustatomas naudojant standartinæ f-jà length.
# Pavyzdþiui, mënesiø pavadinimø yra 12:

length(month.name)

# Simboliø skaièiø sekoje vadinkime sekos ilgiu. Jam apskaièiuoti naudojama f-jà 
# nchar. Jos parametrai:
#
#          x -- simboliø seka arba keletos sekø vektorius,
#       type -- sekos dydþio matavimo vienetai: "bytes", "chars" arba "width".

# Funkcijos nchar rezultatas yra skaièiø vektorius. Jo elementø skaièius sutampa
# su vektoriaus x elementø skaièiumi. Pavyzdþiui, nustatysime mënesiø pavadinimø
# ilgius.

nchar(month.name)

# Toká ilgiø vektoriø galima panaudoti ilgiausios sekos nustatymui ir iðrinkimui.
# Pavyzdþiui, nustatysime, kurio mënesio pavadinimas ilgiausias.

month.name[which.max(nchar(month.name))]

# Atskiru atveju sekø vektorius gali bûti ir viena seka. Pavyzdþiui, nustatysime 
# ilgiausio daniðko þodþio ilgá.

þodis <- "Kindercarnavalsoptochtvoorbereidingswerkzaamhedenplan"
nchar(þodis)


# Kartais nëra jokio skirtumo, kokiomis raidëmis paraðytas tekstas, didþiosiomis 
# ar maþosomis. Pavyzdþiui, bioinformatikoje pagrindinis tyrimo objektas yra DNR 
# arba amino rûgðèiø sekos. DNR sekos uþraðomos simboliais ið aibës {A, C, G, T}.
# Taèiau ta pati seka gali bûti uþraðyta ir maþosiomis raidëmis -- skirtumo nëra.
# Atliekant natûralios kalbos tekstø statistinæ analizæ, didþiosios bei maþosios
# raidës daþniausiai taip pat neskiriamos, o kartais tiesiog reikia suvienodinti 
# raidþiø registrà. Tam naudojamos funkcijos toupper ir tolower.

# Pavyzdþiui, ið didþiøjø lietuviðkos abëcëlës raidþiø vektoriaus gausime maþøjø 
# raidþiø vektoriø.

RAIDËS <- c("A", "À", "B", "C", "È", "D", "E", "Æ", 
            "Ë", "F", "G", "H", "I", "Á", "Y", "J", 
            "K", "L", "M", "N", "O", "P", "R", "S", 
            "Ð", "T", "U", "Ø", "Û", "V", "Z", "Þ")

raidës <- tolower(RAIDËS)
raidës


# Jei vienus simbolius sekoje reikia pakeisti á kitus, naudojama funkcija chartr.
# Jos parametrai:
#
#        old -- keièiamø simboliø seka,
#        new -- pakeistø simboliø seka,
#          x -- seka, kurioje atliekamas simboliø pakeitimas.

# Pavyzdþiui, ðià funkcijà galima panaudoti tuo atveju, kai visame tekste reikia 
# pakeisti vienà koká nors neteisingai naudojamà simbolá á kità simbolá. Tarkime,
# þinome, kad Bertrand Russell sakinyje vietoje simbolio "?" turi bûti raidë "i".

citata <- "Arð?aus? g?nèa? kyla tada, ka? në v?ena ðal?s netur? svar?ø árodymø."

chartr("?", "i", citata)


# Atskiru atveju galima pakeisti visas abëcëlës raides. Tada raidës tekste lieka 
# savo vietose, bet pakeièia savo tapatybæ, todël pradinis tekstas uþðifruojamas. 
# Toks ðifras vadinamas keitiniø ðifru (substitution). Vienas seniausiø keitiniø
# ðifras --- Cezario ðifras, kuriame kiekviena raidë keièiama á raidæ, stovinèià
# abëcëlëje trimis pozicijomis toliau. Cezario ðifro apibendrinimas --- postûmio
# ðifras (shift cipher), kuriame postûmis atliekamas per k raidþiø, 0 < k < n, o 
# n yra abëcëlës raidþiø skaièius. Pavyzdþiui, uþðifruosime tekstà taikant tokià 
# paprasèiausià raidþiø keitimo taisyklæ: 
#
#              a --> à --> b --> c --> è --> ... --> z --> þ --> a              

tekstas <- "Jei jums atrodo, kad nieko nesupratote, tai tikriausiai taip ir yra."

old <- "aàbcèdeæëfghiáyjklmnoprsðtuøûvzþ"
new <- "àbcèdeæëfghiáyjklmnoprsðtuøûvzþa"

chartr(old, new, tekstas)


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite komandà, kuri lietuviðkas didþiàsias ir maþàsias raides pakeistø 
#    á atitinkamas lotyniðkas raides.
# 2. Uþraðykite tokià komandà, kad duotas tekstas bûtø uþðifruotas Cezario ðifru.
#    Sugalvokite, kaip iððifruoti taip uþðifruotà tekstà.


# --------------------------------------- #
# SUBSEKOS IÐSKYRIMAS                     #
# --------------------------------------- #

# Paþymëkime n simboliø sekà L = s_1 s_2 ... s_n. Tada seka S = s_i ... s_j, kur
# 1 <= i <= j <= n, bus vadinama sekos L subseka (substring). Jeigu sekoje L yra
# tarpø, tai subseka S taip pat gali bûti sudaryta vien ið tarpø, taèiau subseka 
# negali bûti tuðèia seka "". Atskirais atvejais gaunamos tokios subsekos: 
# 
#  prefiksas -- kai i = 1,
#   sufiksas -- kai j = n.

# R kalboje subsekos iðskyrimui arba jos keitimui naudojama funkcija substr. Jos 
# parametrai:
#
#          x -- pradinë simboliø seka arba sekø vektorius,
#      start -- iðskiriamos subsekos pirmojo simbolio eilës numeris i,
#       stop -- iðskiriamos subsekos paskutinio simbolio eilës numeris j.

# Parametrø start ir stop reikðmës nebûtinai turi bûti vienas skaièius -- galima 
# priskirti ir skaièiø vektoriø. Tada ið sekos bus iðskirtos kelios jos subsekos.


# Akrostichas - tai eiliuotas kûrinys, kurio eiluèiø pirmosios raidës, skaitomos
# ið virðaus á apaèià, sudaro atskirà þodá. Antikinëje Graikijoje, Romoje ir net
# Viduramþiais buvo áprasta akrostichu áraðyti autoriaus vardà. Kartais neþinomà
# teksto autoriø pavyksta identifikuoti pagal akrostichà. Pirma lietuviðka knyga
# taip pat turi akrostichà -- taip Martynas Maþvydas lotyniðkai áraðë savo vardà 
# MARTINUS MASVIDIUS, kuris, beje, buvo pastebëtas tik XX amþiuje!

# Iðnagrinësime Vinco Kudirkos eilëraðtá "Máslës". Eilëraðèio tekstas padalintas
# á atskiras eilutes. Ið kiekvienos eilutës iðskirsime pirmàjà jos raidæ.

eilëraðtis <- c("Dievas visad ant lûpø, o ðirdyje velnias;",
                "Akis tuojau uþmerkia iðvydusi kelnes;",
                "Vaikðèioja atsiplëðus – áþadai mat toki;",
                "Atmintyje tik laiko, kur atlaidai koki",
                "Tur lieþuvá bjauresná uþ gyvatës gylá;",
                "Kasdien tupi baþnyèioj, nes tinginá myli.",
                "Atminki, kas tai bûtø, jei máslius mint moki?")
eilëraðtis

# Kadangi ið kiekvienos eilutës reikia iðskirti po vienà raidæ, funkcijos substr 
# parametrø start ir stop reikðmës sutampa.

substr(eilëraðtis, 1, 1)


# Sufiksø medis --- tai medþio pavidalo abstrakti duomenø struktûra, sudaryta ið
# visø sekos L sufiksø. Jei seka L turi n simboliø, tada jos sufiksø medis turës 
# n numeruotø virðûniø (lapø). Visos vidinës virðûnës, iðskyrus ðakná, turi bent 
# dvi briaunas (ðakas). Kiekviena briauna paþymima simboliø seka, kuri yra sekos 
# L subseka, taèiau ið tos paèios virðûnës iðeinanèios briaunos negali prasidëti 
# tuo paèiu simboliu. Seka, kuri gaunama apjungus visas briaunas nuo ðaknies iki
# vieno pasirinkto lapo, yra kaþkuris pradinës sekos sufiksas. Pavyzdþiui, sekos 
# "susisuko" sufiksø medis atrodo taip:
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


# Yra keletas sufiksø medþio sudarymo algoritmø. Pirmà algoritmà 1973 m. pasiûlë
# Weiner, kurá 1976 m. supaprastino McCreight. Ukkonen 1995 m. pasiûlë greitesná,
# bet ir sudëtingesná algoritmà. Farach 1997 m. gavo optimalø visiems alfabetams 
# sufiksø medþiø sudarymo algoritmà.

# Sufiksø medþiai plaèiai naudojami bioinformatikoje ir kitose su teksto analize
# susijusiose srityse, kur reikia nustatyti, ar tam tikra seka S yra kitos sekos
# L subseka. Sufiksø medþio sudarymo algoritmai gana sudëtingi, todël èia paties
# medþio nesudarinësime, taèiau sudarysime sekos L = "susisuko" sufiksø vektoriø:

L <- "susisuko"
n <- nchar(seka)

S <- substring(L, 1:n, n)
S


# Vienas ið pagrindiniø bioinformatikos tyrimø objektø yra DNR ir baltymø sekos.
# DNR molekulë gali bûti labai ilga. Pvz., tipinis bakterijø DNR sekos ilgis yra
# tarp 1 ir 10 mln. nukleotidø, þmogaus DNR seka ilgesnë nei 3 mlrd. nukleotidø.
# Daþniausiai nagrinëjama ne visa organizmo DNR seka, o tik tam tikra jos dalis.

# Þinoma, kad DNR sekoje nëra tarpø ar kitø natûralioms kalboms bûdingø skyrybos 
# þenklø, todël seka skaitoma iðtisai. Sudaroma tokio paties ilgio subsekø seka, 
# kur pirmoji subseka prasideda pirmuoju sekos nariu, antroji - antruoju ir t.t. 
# Tokiu bûdu gaunamas taip vadinamas slenkantis langas, kurio plotis k yra lygus
# slenkanèios subsekos ilgiui. Kuo maþesnis langas, tuo didesnis slenkanèiø sekø 
# arba taip vadinamø þodþiø skaièius. Kraðtutiniu atveju, kai k = 1, tai gauname 
# atskirø pradinës sekos simboliø sekà. 

# Pavyzdþiui, duotas DNR sekos fragmentas. Naudojant slenkantá langà, sudarysime 
# ðià sekà sudaranèiø þodþiø ið k = 3 simboliø aibæ ir gausime jø daþniø lentelæ.

dnr <- "GCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGCT"

n <- nchar(dnr)
k <- 3

w <- substring(dnr, 1:(n-k+1), k:n)
w

# Pagal þodþiø daþniø pasiskirstymà galima spræsti apie statistines sekø savybes.
# Kadangi DNR sekos alfabetà sudaro keturios raidës, tai þodþiø ið trijø raidþiø 
# yra 4^3 = 64. Nagrinëjama DNR seka palyginus trumpa, tad didþioji dalis þodþiø 
# ðioje sekoje pasirodo tik po vienà kartà, o kai kurie þodþiai visai nepasirodo. 
# Pavyzdþiui, sekoje nëra þodþiø "ACA", "CCC" ir dar keletos kitø. 

table(w)


# Funkcija substr gali bûti naudojama ir vienos subsekos pakeitimui á kità tokio
# paties ilgio subsekà. Pavyzdþiui, turime failø pavadinimø vektoriø. Visø failø
# pavadinimai standartiniai ir vienodo ilgio. Pakeisime failo iðplëtimà ið "txt"
# á "rez".

failai <- c("failas_01.txt", "failas_02.txt", "failas_03.txt", "failas_04.txt")

substr(failai, 11, 13) <- "rez"
failai

# Þinoma, tokiam tikslui naudojama funkcija substr turi labai ribotas pritaikymo
# galimybes. Pavyzdþiui, ðiuo atveju, jei failø pavadinimai bûtø skirtingø ilgiø, 
# kiekvienam pavadinimui reikëtø nustatyti vis kitokias indeksø reikðmes. Þymiai
# didesnes galimybes turi reguliarios iðraiðkos (regular expressions).


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite komandà, kuri sudarytø absoliuèiai visø sekos L subsekø vektoriø
#    ir nustatykite jø skaièiø.
# 2. Uþraðykite komandà, kuri pirmàjà visø vieno sakinio þodþiø raidæ pakeistø á 
#    atitinkamà didþiàjà raidæ.
# 3. Uþraðykite komandà, kuri DNR sekà suskaidytø á nepersikertanèius þodþius ið
#    k = 10 simboliø.


# --------------------------------------- #
# SEKOS IÐSKAIDYMAS Á ATSKIRAS DALIS      #
# --------------------------------------- #

# Vienas ið tipiniø ir daþnai atliekamø veiksmø --- sekos suskaidymas á atskiras
# dalis. Pavyzdþiui, sakiná galima suskaidyti á atskirus þodþius ar net atskirus
# simbolius. Tekstiniu formatu uþraðytà datà galima iðskaidyti á metus, mënesius
# ir dienas ir t. t. Ðis suskaidymas primena subsekos iðskyrimà, bet ðiuo atveju
# laikoma, kad sekos dalys atskirtos tam tikru simboliu ar jø kombinacija. Pvz.,
# sakinyje þodþiai vienas nuo kito atskirti tarpo simboliu, atskiros datos dalys
# atskiriamos arba brûkðneliu, arba taðku.

# R kalboje sekos skaidymui á atskiras dalis naudojama f-ja strsplit. Parametrai:
#
#          x -- seka arba sekø vektorius,
#      split -- simbolis arba jø seka, pagal kurià skaidoma pradinë seka,
#      fixed -- loginis, FALSE nurodo, kad split yra ne reguliari iðraiðka.


# Pavyzdþiui, duota kableliais vienas nuo kito atskirtø olimpiadiniø þodþiø seka. 
# Ðià sekà reikia iðskaidyti á atskirus þodþius.

þodþiai <- "bàla, gæsta, gværa, kræðta, sàla, ðàla, ðàðta, tæþta, træðta"
þodþiai

# Galima pastebëti, kad ðioje sekoje þodþiai atskirti ne tik kableliais, bet dar
# ir tarpais, todël parametrui split nurodome simboliø sekà ", ".

strsplit(þodþiai, split = ", ")

# Funkcijos strsplit rezultatas yra list tipo sàraðas. Tai nelabai patogu, jeigu
# skaidome vienà sekà, bet labai patogu, jei á atskiras dalis skaidomos ið karto
# kelios sekos. Tada gauname sàraðà, kuris turi tiek elementø, kiek yra pradiniø
# sekø. Sàraðo elementai yra vektoriai, kuriø elementai yra atskiros sekø dalys.
# Pavyzdþiui, duotas Vilniaus greitøjø autobusø marðrutø vektorius. Iðskaidysime
# ðiuos marðrutus á atskiras dalis, kurios viena nuo kitos atskirtos brûkðneliu.

marðrutai <- c("Stotis-Kalvarijø g.-Santariðkës",
               "Santariðkës-Laisvës pr.-Stotis",
               "Fabijoniðkës-Centras-Oro uostas",
               "Pilaitë-Konstitucijos pr.-Saulëtekis",
               "Paðilaièiai-Ozo g.-Saulëtekis",
               "Parko-Olandø g.-Þaliasis tiltas")

strsplit(marðrutai, split = "-")


# Parametro split reikðmë yra reguliari iðraiðka - tai tokia simboliø seka, kuri
# leidþia uþraðyti tam tikrà sekos ðablonà. Reguliarios iðraiðkos naudoja dviejø
# tipø simbolius: simbolius, kurie interpretuojami tiesiogiai, ir metasimbolius,
# kurie turi specialià prasmæ. Kokie simboliai yra metasimboliai - priklauso nuo
# reguliariø iðraiðkø standarto. R naudojamas iðplëstas reg. iðraiðkø standartas
# ERE, kuriame metasimboliai yra
#
#                            . \ | ( ) [ { ^ $ * + ? 
#
# Jei metasimbolá reikia naudoti kaip simbolá, prieð já raðomas valdymo simbolis. 
# Pavyzdþiui, R reguliarioje iðraiðkoje skliaustai () uþraðomi \\( \\).

# Tuo atveju, kada parametrui split priskiriama seka turi bûti interpetuojama ne 
# kaip reguliari iðraiðka, parametrui fixed priskiriama loginë reikðmë TRUE. Tai
# nurodo, kad visi metasimboliai bus suprantami, kaip paprasti simboliai.

# Pavyzdþiui, reikia iðskaidyti tekstiniu formatu uþraðytas datas. Datoje metai,
# mënuo ir diena vienas nuo kito atskirti taðku.

#          Saulës        Durbës        Þalgirio      Orðos         Salaspilio
#         ------------  ------------  ------------  ------------  ------------ 
data <- c("1236.09.22", "1260.07.13", "1410.07.15", "1514.09.08", "1605.09.27")
data

# Reguliariose iðraiðkose taðkas yra metasimbolis, kuris nurodo bet koká simbolá,
# tarp jø ir patá taðkà, todël datos bus iðskaidytos pagal skaièius ir taðkus, o 
# rezultatas bus tuðèios sekos.

strsplit(data, ".")

# Kad "." bûtø interpretuojamas kaip taðkas, pakeièiame parametro fixed reikðmæ.

strsplit(data, ".", fixed = TRUE)

# Naudojant valdymo simbolá, taðkà galima uþraðyti ir kaip reguliarià iðraiðkà.

strsplit(data, "\\.")


# NAUDINGA ------------------------------

# Naudojant reguliarias iðraiðkas, sudëtingà taisyklæ, pagal kurià skaidoma seka,
# galima uþraðyti gana kompaktiðkai. Pavyzdþiui, seka gali bûti skaidoma á dalis 
# ne pagal vienà konkretø simbolá, bet ið karto pagal du alternatyvius simbolius. 
# Alternatyvos reguliariose iðraiðkose apjungiamos simboliu |. 

# Pavyzdþiui, duotas vektorius su Vilniaus, Rygos ir Talino miestø koordinatëmis. 
# Ðias koordinates reikia iðskaidyti á laipsnius, minutes ir platumà arba ilgumà 
# nurodanèius simbolius. Galima pastebëti, kad platuma ir ilguma atskirtos tarpu, 
# o laipsniai ir minutës turi savo simbolius, todël ðiuo atveju ið viso bus trys 
# alternatyvûs simboliai, pagal kuriuos á atskiras dalis skaidoma kiekviena seka.

koordinatës <- c(Vilnius = "54°41'N 25°17'E", 
                    Riga = "56°56'N 24°06'E", 
                 Tallinn = "59°26'N 24°44'E")

strsplit(koordinatës, "°|'| ")
strsplit(koordinatës, "[°' ]")


# Jei seka á atskiras dalis skaidoma pagal bent vienà kartà pasirodantá konkretø 
# simbolá, tai tokiø sekø ðablonà galima uþraðyti naudojant metasimbolá +, kuris
# nurodo, jog prieð já stovintis simbolis sekoje pasirodo vienà ar daugiau kartø.

serijos <- "1---1--1-1111---1111---11-11-1-111-111-----1-11-----1--1-1-----1-11"

strsplit(serijos, "-+")


# NAUDINGA ------------------------------

# Tekstinio formato failuose gali bûti saugomi labai ávairûs duomenys. Pvz., tai
# gali bûti paprastas tekstas, DNR seka, programos kodas, duomenø lentelë ir pan. 
# Kad duomenys ið failo bûtø nuskaitomi korektiðkai, kiekvienu atveju naudojamas 
# tam tikras tekstiniø duomenø saugojimo formatas. Vienas ið universaliø duomenø 
# lenteliø uþraðymo formatø yra CSV (Comma-Separated Values). Kintamøjø reikðmës 
# stulpeliuose atskiriamos kableliu arba kabliataðkiu.

# Pavyzdþiui, duotas failas su artimiausiø metø saulës uþtemimø duomenimis. Data,
# laikas, uþtemimo tipas, ryðkumas, trukmë ir koordinatës atskirtos kabliataðkiu.

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

# Prisijungimui prie virtualaus tekstinio failo naudojame f-jà textConnection, o
# eiluèiø nuskaitymui naudojame funkcijà readLines. Taip gauname vektoriø, kurio 
# elementai eiluèiø simboliø sekos. Tokiø sekø yra tiek, kiek faile yra eiluèiø.

eilutës <- readLines(textConnection(failas))
eilutës

# CSV faile reikðmës eilutëse atskirtos kabliataðkiu. Pagal já sekà suskaidome á 
# atskiras dalis.

eclipses <- strsplit(eilutës, ";")
print(eclipses, quote = FALSE)


# Paprastai duomenø lentelës nuskaitymui ið tekstinio failo naudojama tam skirta
# funkcija read.table. Ji turi parametrà sep, per kurá ir nurodoma reikðmë, kuri
# atskiria reikðmes lentelës stulpeliuose.

read.table(textConnection(failas), sep = ";")


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite komandà, kuri sudarytø simboliø pasirodymo tekste daþniø lentelæ.
#
# 2. Uþraðykite komandà, kuri sakiná iðskaidytø á atskirus þodþius bei nustatytø
#    kiekvieno þodþio ilgá.
# 3. Tarkime, kad visø sakiniø pabaigà tam tikrame tekste þymi taðkas, ðauktukas 
#    arba klaustukas, o po ðiø þenklø visada prasideda naujas sakinys (realybëje, 
#    þinoma, taip yra nevisada). Uþraðykite komandà, kuri nustatytø, kiek þodþiø 
#    yra kiekviename duoto teksto sakinyje.
# 4. Sugalvokite tokià komandà, kuri nuskaitytø kabliataðkiais atskirtø vektoriø 
#    elementus, kurie vienas nuo kito atskirti kableliais. Pvz., tokia seka turi
#    4 vektorius: "1.2, 4.9, 3.1; 8.6, 7.4; 2.5, 1.2, 8.2, 1.8; 0.5". Rezultatas
#    turi bûti sàraðas ið 4 elementø, kuriø elementai yra vektoriø reikðmës.

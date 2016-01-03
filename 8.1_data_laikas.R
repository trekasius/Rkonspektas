
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Datos ir laiko formatas POSIX.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2015-11-05 | 2015-12-12
#


# TURINYS -------------------------------

#
#   1. Sisteminio laiko ir datos funkcijos:
#      * funkcija date()
#      * funkcija Sys.Date()
#      * funkcija Sys.time()
#      * funkcija Sys.timezone()
#      * funkcija OlsonNames()
#      * funkcija format
#
#   2. POSIX datos ir laiko formatas:
#      * funkcija as.POSIXlt
#      * funkcija as.POSIXct
#
#   3. Datos ir laiko sudarymas ið teksto:
#      * funkcija strptime
#      * funkcija strftime
#
#   4. Datos ir laiko sudarymas ið skaièiø:
#      * funkcija ISOdatetime
#      * funkcija ISOdate
#
#   5. Datos kintamojo sudarymas:
#      * funkcija as.Date
#


# PASTABOS ------------------------------

#
# Galima sugalvoti daugiau uþduoèiø.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# STANDARTINËS DATOS IR LAIKO FUNKCIJOS   #
# --------------------------------------- #

# R turi keletà standartiniø datos ir laiko nustatymo funkcijø: kai kurios ið jø
# parodo tik datà, kitos parodo ir datà, ir laikà. Kadangi data arba laikas gali 
# bûti uþraðomi kaip paprastas tekstas arba uþraðomi naudojant tam skirtus datos
# ir laiko formatus, ðiø funkcijø reikðmë yra vis kitokio tipo.

date()
Sys.Date()
Sys.time()
Sys.timezone()


# Datos ir laiko uþraðymui naudojami tam tikri standartiniai paþymëjimai. Keletà
# ið jø galima paminëti:
#
#         %Y -- metai,
#         %y -- metai (be pirmøjø dviejø skaièiø),
#         %m -- mënesio numeris,
#         %d -- dienos numeris,
#         %e -- dienos numeris (be nulio priekyje),
#
#         %H -- valandos (00–23),
#         %M -- minutës (00–59),
#         %S -- sekundës (00–61),
#
#         %A -- savaitës dienos pavadinimas,
#         %a -- sutrumpintas savaitës dienos pavadinimas,
#         %B -- mënesio pavadinimas,
#         %b -- sutrumpintas mënesio pavadinimas,
#         %C -- amþius, ðimtmetis,
#         %W -- metø savaitës numeris,
#         %w -- savaitës dienos numeris (sekmadienis 0),
#         %Z -- laiko zona,
#         %z -- laiko pokytis nuo GMT.

# Kai kurios ðalys turi savo datos ir laiko uþraðymo formatà. Laikantis ISO 8601
# standarto, metai, mënuo ir dienos atskiriami brûkðneliu, taèiau Lietuvoje gali
# bûti atskiriami ir taðku. Dël tos prieþasties data bei laikas gali bûti rodomi
# prisitaikant prie lokalës:
#
#         %X -- laikas pagal vietinio laiko uþraðymo taisykles,
#         %x -- data pagal vietinio laiko uþraðymo taisykles.

# Daþniausiai pasitaikanèios laiko elementø kombinacijos turi savus paþymëjimus:
#
#         %T == %H:%M:%S
#         %R == %H:%M
#         %F == %Y-%m-%d
#         %D == %m/%d/%y
#         %c == %a %b %e %H:%M:%S %Y


# Kiekviena sisteminio laiko ir datos funkcija datà rodo tam tikru savo formatu, 
# taèiau tà paèià datà galima uþraðyti keliais skirtingais bûdais. Tam naudojama 
# funkcija format. Jos parametrai:
#
#          x -- data,
#     format -- datos formatas,
#         tz -- laiko zona,
#      usetz -- loginis, ar rodyti laiko zonà.

# Pavyzdþiui, ðios dienos datà galima uþraðyti taip: mënuo-diena, savaitës diena.
# Toks datos uþraðymo pavidalas atitinka "%m-%d, %A" formatà.

format(Sys.Date(), format = "%m-%d, %A")

# Pavyzdþiui, laiko momentà galima nurodyti tûkstantøjø sekundþiø tikslumu. Toks
# laiko uþraðymas atitinka "%H:%M:%OS3" formatà.

format(Sys.time(), format = "%H:%M:%OS3")

# Turint laiko momentà, galima parodyti, koks vietinio laiko skirtumas nuo laiko 
# pagal Grinvièà. Papildomai nurodome, kad bûtø parodomas ir laiko zonos kodas.

format(Sys.time(), format = "%z", usetz = TRUE)

# Naudojant funkcijà format, tà patá laikà galima "pervesti" á kità laiko juostà.
# R kalboje naudojama taip vadinama Olson laiko zonø duomenø bazë (TZ database). 

OlsonNames()

# Pavyzdþiui, uþfiksuosime laiko momentà ir atvaizduosime já Vilniaus, Tokijo ir 
# Londono laiku.

t <- Sys.time()
t

format(t, "%T", usetz = TRUE, tz = "Europe/Vilnius")
format(t, "%T", usetz = TRUE, tz = "Asia/Tokyo")
format(t, "%T", usetz = TRUE, tz = "Europe/London")


# UÞDUOTIS ------------------------------ 

# 1. Ðios dienos datà uþraðykite tokiais formatais: a) tik metai, b) tik mënesio 
#    pavadinimas, c) tik diena, d) savaitës diena, mënesio pavadinimas ir dienos 
#    numeris, d) metai, mënuo ir diena atskirti taðku.
# 2. Sisteminá laikà uþraðykite tokiu formatu: a) tik data, b) tik laikas c) tik
#    metai, d) valandos ir minutës, e) savaitës numeris, dienos numeris metuose,
#    f) valandos, minutës ir sekundës atskirtos simboliu |.
# 3. Didþioji dalis Lietuvos teritorijos yra UTC+2 laiko juostoje. Olson duomenø
#    bazëje tokios laiko zonos pavadinimo nëra, taèiau vietoje UTC yra naudojama 
#    Etc/GMT laiko zonø sistema, kur teigiamas laiko postûmis atitinka toká patá 
#    postûmá á prieðingà pusæ UTC sistemoje. Sisteminá laikà uþraðykite Etc/GMT
#    sistemoje.
# 4. JAV ir kai kuriø kitø valstybiø kariuomenës savo tikslams naudoja specifinæ 
#    laiko sistemà, kur laiko zonø pavadinimai susieti su NATO fonetine abëcële. 
#    Pvz., raidë A þymi "Alpha" laiko zonà, kuri atitinka UTC+1, raidë B "Bravo",
#    kuri atitinka UTC+2 ir t. t. Sisteminá laikà uþraðykite "Zulu" laiko zonoje.
#    Nustatykite, koká UTC laikà ji atitinka.


# --------------------------------------- #
# POSIX DATOS IR LAIKO FORMATAS           #
# --------------------------------------- #

# UNIX ir kai kuriose kitose operacinëse sistemose naudojama POSIX laiko sistema. 
# Ðioje sistemoje laiko momentas nurodomas sekundþiø skaièiumi nuo 1970 sausio 1 
# dienos 00:00:00 val. Tokiu bûdu POSIX laikas yra sveikasis skaièius, kuris kas 
# sekundæ padidëja vienu vienetu. Ðia prasme POSIX suderinta su pasaulinio laiko 
# sistema UTC, kurioje laiko vienetas yra sekundë. Paprastai viena para sudaryta
# ið 86400 sekundþiø. Dël Þemës sukimosi lëtëjimo pasaulinis laikas nesutampa su 
# astronominiu laiku, todël, atliekant sinchronizacijà, prie UTC laiko pridedama 
# papildoma sekundë. Tokios papildomos sekundës POSIX sistemoje neskaièiuojamos, 
# todël POSIX laikas nëra nei tikrasis astronominis, nei tikrasis pasaulinis UTC 
# laikas. Galima suþinoti, kada buvo pridëtos papildomos sekundës:

.leap.seconds

# R kalboje naudojami du datos ir laiko formatai: POSIXct ir POSIXlt. Abi klasës
# atitinka POSIX laiko apibrëþimà - tai teigiamas arba neigiamas skaièius, kuris 
# lygus sekundþiø skaièiui nuo 1970-01-01 00:00:00. Viena nuo kitos jos skiriasi 
# tuo, kad POSIXct objektas ið tikro yra skaièius, o POSIXlt objektas - tai toks 
# sàraðas, kurio elementai nurodo atskiras datos ir laiko komponentes:
# 
#        sec -- 0–61: sekundës;
#        min -- 0–59: minutës;
#       hour -- 0–23: valandos;
#       mday -- 1–31: mënesio diena;
#        mon -- 0–11: mënesio numeris metuose;
#       year -- metø nuo 1900 skaièius;
#       wday -- 0–6: savaitës dienos numeris pradedant sekmadieniu;
#       yday -- 0–365: metø dienos numeris;
#      isdst -- vasaros laiko indikatorius;
#       zone -- laiko zonos identifikatorius (nebûtinas);
#     gmtoff -- laiko postûmis sekundëmis nuo GTM (nebûtinas).
#
# Kadangi POSIXct formatu uþraðytas laikas yra vienas skaièius, jis uþima maþiau 
# vietos ir todël labiau tinka ávairiems veiksmams su datomis arba jø saugojimui
# duomenø lentelëse. POSIXlt formatas naudojamas tada, kai ið datos reikia gauti
# kokià nors vienà atskirà dalá, pvz., savaitës dienà arba dienos numerá metuose.


# POSIX objekto klasë keièiama naudojant funkcijas as.POSIXct ir as.POSIXlt. Tos
# funkcijos naudojamos ir POSIX objekto sudarymui ið tekstiniu formatu uþraðytos
# datos. Pagrindiniai argumentai:
#
#          x -- datos objektas, POSIXct arba POSIXlt tipo objektas,
#         tz -- laiko zona.
#
# Funkcija as.POSIXlt, priklausomai nuo to, koks yra datos objektas, gali turëti
# dar du parametrus:
#
#     format -- datos formatas, kai x yra "character" tipo,
#     origin -- datos atskaitos taðkas, kai x yra "numeric" tipo.


# Pvz., sudarysime POSIXct klasës vektoriø ið %Y-%m-%d %H:%M:%S formatu uþraðyto
# laiko momento. Tarkime, kad laiko zona bus Lietuvos.

laikas <- "2015-11-08 14:31:17"
laikas

t <- as.POSIXct(laikas, tz = "Europe/Vilnius")
t

# Matome, kad POSIXct klasës objektas yra double tipo skaièius, kuris ir reiðkia 
# sekundþiø skaièiø nuo 1970-01-01 00:00:00. Galima pastebëti, kad toks objektas
# turi atributà tzone, kuriam priskirtas laiko zonos pavadinimas.

class(t)
mode(t)
typeof(t)
attributes(t)


# Sudarysime to paties laiko momento POSIXlt klasës objektà.

t <- as.POSIXlt(laikas, tz = "Europe/Vilnius")
t

# Nesunkiai galima patikrinti, kad POSIXlt klasës objektas yra laiko komponenèiø
# sàraðas. 

class(t)
mode(t)
typeof(t)
attributes(t)

# Ið tokio sàraðo galima gauti atskiras datos arba laiko komponentes. Pavyzdþiui,
# valandas, minutes ir sekundes, savaitës dienos ar metø dienos numerá.

t[["sec"]]      # sekundþiø skaièius
t[["year"]]     # metø skaièius nuo 1900 metø
t[["yday"]]     # dienos metuose numeris (skaièiuojant nuo 0)
t[["zone"]]     # laiko zonos kodas

# Panaikinant objekto klasæ, galima pamatyti ið karto visus ðio sàraðo elementus.

unlist(t)
unclass(t)


# Jei laikas uþraðytas nestandartiniu pavidalu, sukuriant POSIXlt klasës objektà,
# reikia nurodyti jo uþraðymo formatà.

laikas <- "14:31:17 08/11/2015"
laikas

t <- as.POSIXlt(laikas, format = "%H:%M:%S %d/%m/%Y")
t

# Laiko momentà galima nurodyti sekundþiu skaièiumi nuo tam tikro momento. Pvz.,
# 12 valandø yra 43200 sekundþiø. Tegul atskaitos taðkas yra 2015-01-01 00:00:00 
# pagal UTC. Sukursime atitinkamà laiko momentà.

laikas <- 43200
laikas

t <- as.POSIXlt(laikas, origin = "2015-01-01 00:00:00", tz = "GMT")
t


# NAUDINGA ------------------------------

# Laiko momentas paprastai susietas su laiko zona, bet kartais laiko zonà reikia 
# pakeisti. Keièiant laiko zonà galimi du laiko momento perskaièiavimo variantai:
#
#  a) palikti tà patá laikà,
#  b) perskaièiuoti laikà.

# Pavyzdþiui, turime POSIXlt objektà su laiko momentu pagal pasauliná UTC laikà.
# Galima pastebëti, kad laiko zonà nurodantis kodas yra laiko objekto atributas.

t <- as.POSIXlt("2015-11-07 00:00:25", format = "%F %T", tz = "UTC")
t

attributes(t)

# Tam, kad laikà bûtø galima perskaièiuoti, jis turi bûti saugomas kaip skaièius
# ir todël turi bûti uþraðytas POSIXct formatu. Jei, konvertuojant POSIX objektà 
# nurodoma nauja laiko zona, tai keièiasi tik laiko zona, bet ne laiko momentas. 
# Pavyzdþiui, konvertuojant datà á POSIXct klasæ, nurodysime kità laiko zonà --
# "Europe/Vilnius".

a <- as.POSIXct(t, tz = "Europe/Vilnius")
a

attributes(a)

# Galima pastebëti, kad laiko zona pasikeitë, taèiau laiko momentas nepasikeitë.
# Tuo atveju, kai keièiant laiko zonà laiko momentas turi bûti perskaièiuojamas, 
# laikas ið pradþiø konvertuojamas á POSIXct klasæ, o tada pakeièiamas atributas.

b <- as.POSIXct(t)
b

attributes(b)
attr(b, "tzone") <- "Europe/Vilnius"
attributes(b)

b

# Jeigu laikas yra POSIXct klasës objektas, pakeisti laiko zonà ir perskaièiuoti
# laikà galima naudojant funkcijà format -- taip gauname tekstinæ laiko iðraiðkà.
# Pavyzdþiui, uþraðysime tà patá laikà Tokijo laiku.

format(b, "%T", usetz = TRUE, tz = "Asia/Tokyo")


# UÞDUOTIS ------------------------------ 

# 1. Tarkime, kad laiko momentas pagal UTC uþraðytas taip: "2015.12.12 07|54|25".
#    Sudarykite POSIXct ir POSIXlt formato laiko objektus.
# 2. Sudarykite POSIXct laiko objektà, kuris reiðkia laiko momentà praëjus 1 mln. 
#    sekundþiø nuo dabar. Kokia tai bus mënesio ir savaitës diena?
# 3. Perskaièiuokite ir nustatykite, koká laiko momentà pagal UTC atitinka laiko
#    momentas "2015-12-12 10:07:26" EET laiko zonoje, kurioje yra ir Lietuva.


# --------------------------------------- #
# POSIXlt OBJEKTO SUDARYMAS IÐ TEKSTO     #
# --------------------------------------- #

# Ávairiuose duomenø failuose data ir laikas paprastai uþraðyti kaip tekstas. Jo
# konvertavimui á POSIXlt formatà naudojama funkcija strptime. F-jos parametrai:
#
#          x -- character tipo laiko reikðmiø vektorius,
#     format -- formatas, kuriuo uþraðytas laikas,
#         tz -- laiko zonos kodas.


# Laikantis ISO 8601 standarto, metai, mënuo ir diena vienas nuo kito atskiriami 
# brûkðneliu, todël data nurodoma YYYY-MM-DD formatu, kuris uþraðomas "%Y-%m-%d"
# arba sutrumpintai "%F". Pavyzdþiui, nuskaitysime tokiu formatu uþraðytas datas.

x <- c("1961-04-12", "1965-03-18", "1969-07-24")
x

t <- strptime(x, format = "%Y-%m-%d")
t

# Tos paèios datos gali bûti uþraðytos kitokiu formatu. Pavyzdþiui, labai daþnai
# metai, mënuo ir diena atskiriami pasviru brûkðneliu.

x <- c("1961/04/12", "1965/03/18", "1969/07/24")
x

t <- strptime(x, format = "%Y/%m/%d")
t

# Kai kurie laiko momentai nëra susieti su jokia konkreèia vietove ar laiko zona. 
# Pvz., toks universalus laikas reikalingas orø prognozei, lëktuvø, traukiniø ir
# kitø transporto priemoniø tvarkaraðèiams sudaryti, jis naudojamas internete ir
# astronomijoje, tarptautinëje kosminëje stotyje. Iki 1972 metø pasaulyje laikas 
# buvo matuojamas pagal astronominá Grinvièo laikà. Nuo 1972 naudojama pasaulinë 
# UTC laiko sistema ir laikas sinchronizuojamas pagal atominá laikrodá.
#
#        UTC -- Coordinated Universal Time,
#        GMT -- Greenwich Mean Time.

# Pavyzdþiui, sudarysime tris laiko momentus pagal UTC laikà. Formatà nurodysime
# naudodami pilnà ir sutrumpintà datos ir laiko kodà.

#       Skrydis á kosmosà      Iðëjimas á kosmosà     Nusileidimas Mënulyje
#      ---------------------  ---------------------  ---------------------
x <- c("1961-04-12 06:07:00", "1965-03-18 08:34:51", "1969-07-24 16:50:35")
x

t <- strptime(x, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")
t <- strptime(x, format = "%F %T", tz = "UTC")
t

# Jeigu laiko momentas susietas su konkreèia vietove, reikia nurodyti laiko zonà.
# Laiko zonos turi vardus, kurie paprastai susideda ið dviejø daliø. Pavyzdþiui,
# "Europe/Vilnius", "Europe/London", "America/Toronto", "Asia/Hong_Kong" ir pan.
# Pavyzdþiui, uþraðant Japonijos miestø Hiroshima ir Nagasaki bombardavimo laikà, 
# reikia nurodyti Japonijos laiko zonà.

#       Hiroshima              Nagasaki
#      ---------------------  ---------------------
x <- c("1945-08-06 08:15:00", "1945-08-09 11:02:00")
x

t <- strptime(x, format = "%Y-%m-%d %H:%M:%S", tz = "Asia/Tokyo")
t <- strptime(x, format = "%Y-%m-%d %H:%M:%S", tz = "Japan")
t

# Á tà paèià laiko juostà patenkanèios ðalys gali bûti apjungiamos á vienà laiko 
# zonà. Pvz., Suomija, Estija, Latvija, Lietuva, Ukraina ir dar kelios UTC +2:00
# juostoje esanèios ðalys sudaro Rytø Europos laiko zonà. Beveik viso ðios laiko
# zonos ðalys pereina á vasaros laikà, kuris turi atskirà pavadinimà:
#
#        EET -- Eastern European Time (EET),
#        EST -- Eastern European Summer Time (EEST).

# Vietinis laikas pagal ISO 8601 standartà nustatomas per skirtumà nuo UTC laiko. 
# Pavyzdþiui, EET laiko zona atitinka UTC +2:00 laikà, "Europe/Vilnius" taip pat 
# atitinka UTC +2:00 laikà. 

# Etc yra speciali sritis, kuri naudojama nekonkreèioms laiko zonoms. Pavyzdþiui, 
# Etc/UTC atitinka universalø pasauliná laikà. Pridedant laiko skirtumà, gauname
# tà skirtumà atitinkanèios laiko juostos laikà. POSIX sistemoje vietoje Etc/UTC 
# naudojamos Etc/GMT laiko juostos, taèiau -- su prieðingu laiko skirtumo þenklu!
# O tai reiðkia, kad, pvz., EET laiko zona atitinka Etc/GMT -2:00, bet ne +2:00, 
# kaip áprasta.


# Jei laiko reikðmes reikia áraðyti á tekstiná failà, tai POSIX formatu uþraðytà 
# laikà pirmiausia reikia konvertuoti á tekstà. Tam galima naudoti f-jà strftime. 
# Ðios funkcijos parametrai tokie:
#
#          x -- data, kuri gali bûti uþraðoma POSIXlt formatu,
#     format -- datos iðvedimo formatas,
#         tz -- laiko zona,
#      usetz -- loginis, nustato ar rodyti laiko zonà.


# Pavyzdþiui, tekstiniu formatu uþraðysime Japonijos miestø bombardavimo datas.

datos <- strftime(t, format = "%F %T", usetz = TRUE)
datos

# Áraðysime gautà datø vektoriø á tekstiná failà. Tam panaudosime dvi skirtingas
# funkcijas: writeLines ir write. Norint ásitikinti, kad datos áraðytos á failà,
# já galima atidaryti. Kadangi gautas failas ðiaip nereikalingas, já iðtrinsime.

writeLines(datos, con = "datos.txt")
file.show("datos.txt")

write(datos, file = "datos.txt")
file.show("datos.txt")

file.remove("datos.txt")


# Laiko ir datos uþraðymui tekstiniu formatu galima panaudoti ir funkcijà format. 

format(t, format = "%F %T", usetz = TRUE)


# UÞDUOTIS ------------------------------ 

# 1. Tarkime, kad laiko momentas uþraðytas tokiu pavidalu: "2015 12 12 10 40 15".
#    Matome, kad metai, mënuo, diena ir t. t. vienas nuo kito atskirti tik tarpo
#    simboliu. Funkcijai strptime nurodykite datos ir laiko uþraðymà atitinkantá 
#    formatà ir sudarykite POSIX laiko objektà.
# 2. Duotas toks datø vektorius: c("1918 2 mën. 16 d.", "1990 3 mën. 11 d."). Ðá
#    datø vektoriø paverskite á POSIX laiko objektà.
# 3. Prieð tai gautà POSIX datø vektoriø áraðykite á tekstiná failà: a) be laiko
#    zonos, b) tik metus, c) savaitës dienà, mënuo ir diena.


# --------------------------------------- #
# POSIXlt OBJEKTO SUDARYMAS IÐ SKAIÈIØ    #
# --------------------------------------- #

# Jeigu data arba laikas uþraðyti kaip tekstas, naudojant pilnus ar sutrumpintus 
# mënesiø pavadinimus, tada konvertavimui á POSIXlt laiko formatà naudojama f-ja 
# strptime. Jei visos laiko komponentës -- metai, mënuo diena, valandos, minutës 
# ir sekundës -- uþraðomos skaièiais, tada POSIXlt klasës laiko momentà sudaryti 
# patogu naudojant funkcijà ISOdatetime arba analogiðkà jai funkcijà ISOdate. Jø
# parametrai visi vienodi:
#
#       year -- metai,
#      month -- mënuo,
#        day -- diena,
#       hour -- valanda,
#        min -- minutës,
#        sec -- sekundës,
#         tz -- laiko zona.

# Ið esmës ðios funkcijos yra vienodos ir skiriasi tik pradinëmis savo parametrø 
# reikðmëmis:
#
#   ISOdatetime(year, month, day, hour, min, sec, tz = "")
#   ISOdate    (year, month, day, hour = 12, min = 0, sec = 0, tz = "GMT")
#
# Matosi, kad pagal nutylëjimà f-jos ISOdatetime parametrui tz priskirta reikðmë 
# "", o f-jos ISOdate -- "GMT". Pirmuoju atveju laiko momentui nustatoma vietinë 
# laiko zona, o antruoju gaunamas laiko momentas pagal pasauliná UTC laikà.

# Kurià funkcijà naudoti, priklauso nuo situacijos. Jei reikia uþraðyti tikslaus 
# laiko momentà, tada labiau tinka ISOdatetime. 

ISOdatetime(year = 2015, month = 11, day = 15, hour = 17, min = 48, sec = 18)

# Kaip visada - jeigu reikðmës parametrams priskiriamos eilës tvarka, pavadinimø 
# galima ir neraðyti.

ISOdatetime(2015, 11, 15, 17, 48, 18)

# Jeigu nurodome ne tik datà, bet ir laikà, tada galima naudoti ir f-jà ISOdate.
# Papildomai nurodysime laiko zonà, nes ðiai funkcijai pagal nutylëjimà yra UTC.

ISOdate(2015, 11, 15, 17, 48, 18, tz = "Europe/Vilnius")

# Jei reikalinga tik data be tikslaus laiko, tada labiau tinka funkcija ISOdate.
# Pavyzdþiui, nurodþius tik metus, mënesá ir dienà, sudaromas tos dienos 12 val.
# atitinkantis laiko momentas pagal UTC laikà.

ISOdate(2015, 11, 15)

# Jeigu kuriam nors parametrui priskiriame skaièiø sekà, galime sugeneruoti datø
# sekà. Pavyzdþiui, sudarysime 2015 metø visø 12-os mënesiø pirmøjø dienø sekà.

ISOdate(2015, 1:12, 1)


# UÞDUOTIS ------------------------------ 

# 1. Naudodami f-jà ISOdatetime, sudarykite 24 laiko momentø vektoriø, iðdëstytø
#    tolygiai kas valandà ir pradedant nuo 00:00.


# --------------------------------------- #
# DATOS FORMATAS                          #
# --------------------------------------- #

# Vien datà nurodanèio objekto sudarymui naudojama f-ja as.Date. Gaunamas "Date"
# klasës vektorius, kurio elementas yra data. Prie tokiu formatu uþraðytos datos
# galima pridëti ar atimti tam tikrà dienø skaièiø, galima apskaièiuoti skirtumà 
# tarp dviejø datø. Jei data uþraðyta kaip tekstas, tada f-jos parametrai tokie:
#
#          x -- data kaip "character",
#     format -- datos formatas.
#
# Data, kaip ir POSIX laikas, gali bûti uþraðyta kaip skaièius, kuris èia nurodo
# dienø skaièiø nuo tam tikros datos. Tokiu atveju funkcijos parametrai tokie:
#
#          x -- data kaip "numeric",
#     origin -- atskaitos taðkas.
#
# Tà paèià funkcijà galima naudoti "POSIXct" formato laiko konvertavimui á datà.
# Tada parametrai tokie:
#
#          x -- "POSIXct" formato laikas,
#         tz -- laiko zonos kodas.

# Pvz., tekstiná datø vektoriø konvertuosime á "Date" klasës vektoriø. Èia visos
# datos uþraðytos standartiniu "%Y-%m-%d" formatu, kuris ir nurodomas funkcijai.

#          Saulës        Durbës        Þalgirio      Orðos         Salaspilio
#         ------------  ------------  ------------  ------------  ------------ 
data <- c("1236-09-22", "1260-07-13", "1410-07-15", "1514-09-08", "1605-09-27")
data

d <- as.Date(data, format = "%Y-%m-%d")
d

class(d)


# Naudojant funkcijà format, tà paèià datà galima pavaizduoti daugeliu skirtingø 
# bûdø, pavyzdþiui:

format(d, format = "%Y")
format(d, format = "%m")
format(d, format = "%d")
format(d, format = "%B")
format(d, format = "%b")

format(d, format = "%Y-%m")
format(d, format = "%m-%d")
format(d, format = "%Y %B")


# UÞDUOTIS ------------------------------ 

# 1. Tarkime, kad 1965 metø geguþës 14 diena uþraðyta sutrumpintai -- "65-05-14". 
#    Komanda as.Date("65-05-14", "%y-%m-%d") ðià datà supranta kaip "2065-05-14". 
#    Sugalvokite, kaip korektiðkai konvertuoti taip sutrumpintai uþraðytas datas.


#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Loginiø sàlygø uþraðymas ir specialios loginës funkcijos.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2013-07-27 | 2013-08-20
#


# TURINYS -------------------------------

#
#   1. Loginiø sàlygø uþraðymas:
#      * palyginimo operatoriai
#      * funkcija all
#      * funkcija any
#
#   2. Specialios loginës funkcijos:
#      * funkcija exists
#      * funkcija is.vector
#      * funkcija is.numeric
#      * funkcija is.infinite
#      * funkcija is.na
#      * funkcija is.null
#


# PASTABOS ------------------------------

#
# Konspektas papildytas funkcija exists.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# LOGINIØ SÀLYGØ UÞRAÐYMAS                #
# --------------------------------------- #

# Skaièiø arba simboliø vektoriaus elementams tikrinant koká nors loginá testà, 
# gaunamas to paties ilgio loginiø reikðmiø vektorius. Jo elementas lygus TRUE, 
# jei sàlyga buvo tenkinama, ir lygus FALSE, jei sàlyga netenkinama.

# Palyginimo operatoriai:
#
#    == -- lygu
#    != -- nelygu
#     > -- daugiau
#     < -- maþiau
#    >= -- daugiau arba lygu
#    <= -- maþiau arba lygu


x <- c(4, 8, 6, 2, 3, 7, 0, 4, 2, 8)
y <- c(3, 9, 0, 1, 4, 5, 2, 7, 6, 8)

# Pavyzdþiui, patikrinsime, ar vektoriaus x reikðmës yra teigiamos. Tam sudarome
# loginá testà. Gauname tokio pat ilgio loginiø reikðmiø vektoriø.
x > 0

# Patikrinsime, ar vektoriaus x elementas didesnis uþ atitinkamà  vektoriaus y 
# elementà.
x > y

# Turint toká loginá vektoriø, galima iðrinkti tam tikrus vektoriaus elementus,
# nustatyti reikiamø elementø eilës numerius, patikrinti kitas logines sàlygas.

# Pagrindiniai loginiai operatoriai yra ðie:
#
#     | -- loginis ARBA
#     & -- loginis IR
#     ! -- loginis NE


# Veiksmus galima atlikti ir su atskiromis loginëmis konstantomis TRUE ir FALSE.
TRUE | FALSE

!TRUE

# Konstantas TRUE ir FALSE galima raðyti sutrumpinta forma, atitinkamai T ir F.
a <- c(T, T, F, F)
b <- c(T, F, T, F)

# Kai operandai yra loginiø reikðmiø vektoriai, tai loginës operacijos atliekamos 
# su atitinkamais tø vektoriø elementais.

a | b   # loginis ARBA
a & b   # loginis IR
!a      # loginis NE

# Operatoriai ARBA ir IR turi ilgàjà formà, || ir &&. Nuo trumposios ji skiriasi
# tuo, kad loginë operacija atliekama tik su pirmàjà loginio vektoriaus reikðme.
# Ðiuos operatorius galima naudoti tokiose situacijose, kur reikia, kad loginës 
# operacijos rezultatas bûtø viena reikðmë: arba TRUE, arba FALSE.

a || b
a && b


# Naudojant loginius operatorius atskiros loginës sàlygos gali bûti apjungiamos
# ir taip uþraðomos sudëtingesnës sàlygos. Pavyzdþiui, patikrinsime ar vektoriaus 
# x elementø reikðmës patenka á intervalà [2, 7].

x >= 2 & x <= 7 


# Norint patikrinti, ar bent viena loginio vektoriaus elemento reikðmë yra TRUE, 
# naudojama funkcija any.

any(a)

# Norint patikrinti, ar visi loginio vektoriaus elementai lygûs TRUE, naudojama
# funkcija all.

all(a)


# NAUDINGA ------------------------------

# Atliekant statistinæ duomenø analizæ, kartais reikia patikrinti, ar vektoriaus 
# elementai tenkina tam tikras sàlygas. Naudojant palyginimo operatorius >=, <=,
# >, < ir == sudaromas loginis testas ir gaunamas loginiø reikðmiø vektorius. Jo
# reikðmiø patikrinimui galima panaudoti funkcijas any ir all.

# Pavyzdþiui, patikrinsime, ar visos vektoriaus x reikðmës yra teigiamos. 
# Kadangi loginë sàlyga nesudëtinga, jà galima ákelti tiesiai á funkcijà all.
all(x > 0)

# Pavyzdþiui, patikrinsime, ar bent vienas vektoriaus x elementas lygus 0.
any(x == 0)

# Patikrinsime, ar bent vienas vektoriaus x elementas didesnis uþ atitinkamà 
# vektoriaus y elementà.
any(x > y)

# Konstantos FALSE ir TRUE atitinka skaièius 0 ir 1, ir todël loginius vektorius 
# galima sumuoti. Tokiu bûdu surandame TRUE reikðmæ turinèiø elementø skaièiø.
# Pavyzdþiui, apskaièiuosime, kiek vektoriaus x elementø didesni uþ atitinkamus
# vektoriaus y elementus.

sum(x > y)


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite komandà, kuri patikrintø, ar visø loginio vektoriaus a elementø 
#    reikðmës yra FALSE.
# 2. Uþraðykite komandà, kuri patikrintø, ar bent vienas vektoriaus x elementas
#    nelygus nuliui.
# 3. Patikrinkite, ar visi vektoriaus x elementai yra ið vektoriaus y elementø
#    aibës. Komandà galima uþraðyti dviem bûdais: su f-ja is.element ir su %in%.


# --------------------------------------- #
# SPECIALIOS LOGINËS FUNKCIJOS            #
# --------------------------------------- #

# R turi keletà specialiø funkcijø, kurios skirtos tam tikroms ávairiø objektø 
# sàvybëms patikrinti. Tokio tipo funkcijø rezultatas yra reikðmë TRUE ar FALSE.

# Kartais reikia patikrinti, ar egzistuoja konkretus kintamasis arba funkcija.
# Tam naudojama funkcija exists. Jos parametrai:
#
#              x -- ieðkomo objekto vardas,
#           mode -- kintamojo tipas: "numeric", "function" ir pan.

# Ieðkomo objekto vardas raðomas kabutëse. Pagal nutylëjimà parametro mode 
# reikðmë yra "any", todël ieðkomi bet kokie toká vardà turintys objektai.

exists("x")
exists("x", mode = "function")


# Viena grupë funkcijø patikrina, kokio tipo yra pats objektas:
#
#      is.vector -- ar vektorius,
#      is.matrix -- ar matrica,
#        is.list -- ar sàraðas,
#  is.data.frame -- ar duomenø lentelë.

is.vector(x)
is.matrix(x)


# Vektoriaus arba matricos elementai paprastai yra sveikieji, realieji skaièiai, 
# simboliai ar loginës reikðmës. Konkreèiam vektoriaus elementø tipui nustatyti 
# naudojamos ðios funkcijos:
#
#     is.numeric -- ar elementai yra skaièiai,
#      is.double -- ar realieji skaièiai,
#     is.integer -- ar sveikieji skaièiai,
#   is.character -- ar simboliai,
#     is.logical -- ar loginës reikðmës.

# Vektoriaus x elementai yra skaièiai, o vektoriaus a - loginës reikðmës, todël 
# atitinkamos funkcijos gràþina reikðmæ TRUE.

is.numeric(x)
is.logical(a)

is.character(T)
is.character("T")

is.integer(1)
is.integer(1L)


# Atliekant skaièiavimus, rezultatas ne visada yra apibrëþtas. Tipinë situacija 
# - skaièiaus dalyba ið nulio. Tokiems atvejams paþymëti naudojamos specialios 
# konstantos: Inf - begalybë (Infinity) ir NaN - ne skaièius (Not a Number).

1/0           # neapibrëþtumas, skaièiaus dalyba ið nulio
Inf - Inf     # neapibrëþtumas, begalybë minus begalybë

# Neapibrëþtumams nustatyti naudojamos ðios funkcijos:
#
#      is.finite -- ar reikðmë baigtinë,
#    is.infinite -- ar reikðmë begalybë,
#         is.nan -- ar reikðmë yra NaN.

# Jei funkcijos argumentas yra vektorius arba matrica, tai patikrinami visi tà 
# objektà sudarantys elementai. Kadangi vektoriaus x elementai yra baigtiniai, 
# funkcijos is.finite rezultatas vektorius, kurio visos reikðmës yra TRUE.

is.finite(x)

# Sudarysime naujà vektoriø d, kurio elementai gaunami skaièiø 1 padalinus ið 
# vektoriaus x elementø reikðmiø.

d <- 1/x

# Patikrinsime, ar gauto vektoriaus d elementai turi apibrëþtas reikðmes.

is.infinite(d)
is.nan(d)

# Naudojant anksèiau paminëtà loginæ funkcijà all, galima nesunkiai patikrinti, 
# ar visi vektoriaus elementai yra apibrëþti.

all(is.finite(d))


# Dël ávairiø prieþasèiø realiuose duomenyse kartais bûna praleistø reikðmiø. 
# Joms þymëti naudojama speciali konstanta NA. 

z <- c(19, 16, NA, 14, 16, 11, 17, NA, 13, 15)
z

# Atitinkamai yra funkcija, kuri patikrina, kurie vektoriaus arba kito objekto 
# elementai yra praleistos reikðmës:
# 
#          is.na -- ar praleista reikðmë.

# Funkcijos reikðmë lygi TRUE, kai vektoriaus ar kito objekto elemento reikðmë 
# lygi NA. Praleista reikðme laikoma ir konstanta NaN, taèiau begalybë - ne.

is.na(NA)
is.na(NaN)
is.na(Inf)

# Jei funkcijos is.na argumentas yra vektorius, matrica ar duomenø lentelë, tai
# patikrinamas kiekvienas elementas. Rezultatas yra tokio pat dydþio objektas,
# kurio elementø reikðmës yra TRUE, jei tikrinamo elemento reikðmë NA arba NaN, 
# ir FALSE - kitais atvejais.

# Kadangi vektorius x praleistø reikðmiø neturi, funkcijos is.na rezultatas yra 
# tokio pat ilgio vektorius, kurio visos reikðmës yra FALSE.
is.na(x)

# Vektorius z turi dvi praleistas reikðmes, tà rodo gautos f-jos reikðmës TRUE.
is.na(z)

# Kadangi konstantos FALSE ir TRUE atitinka skaièius 0 ir 1, loginius vektorius 
# galima sumuoti. Tokiu bûdu surandame TRUE reikðmæ turinèiø elementø skaièiø.
# Pavyzdþiui, apskaièiuosime, kiek praleistø reikðmiø turi vektorius z.
sum(is.na(z))

# Naudojant anksèiau paminëtas logines funkcijas any arba all, galima nesunkiai 
# patikrinti, ar vektorius turi bent vienà praleistà reikðmæ. Pvz., vektorius x 
# praleistø reikðmiø neturi, todël funkcijos any reikðmë yra FALSE.

any(is.na(x))
any(is.na(z))


# Jei funkcijos is.na argumentas yra sàraðas, tai reikðmë TRUE gràþinama tiems
# sàraðo elementams, kuriø reikðmë yra NA. Jei sàraðo elementas yra vien ið NA
# reikðmiø sudarytas vektorius, funkcija is.na gràþins reikðmæ TRUE.

l <- list(a = c(1, 2), b = c(1, NA), c = c(NA, NA), d = NA)
l

is.na(l)


# R turi tuðèià objektà þyminèià konstantà NULL. Jà kaip reikðmæ priskyrus bet
# kokiam vektoriui, matricai ar kitam objektui, tas objektas tampa NULL objektu.

# Pavyzdþiui, vektoriaus elementai gali turëti praleistà reikðmæ NA, bet negali 
# ágyti NULL reikðmës.

c(1, 2, NULL, 4)

# Pavyzdþiui, priskirdami reikðmæ NULL, panaikinsime paskutiná sàraðo l elementà.
l[4] <- NULL
l

# NULL objektui nustatyti naudojama speciali loginë funkcija:
#
#        is.null -- ar objektas yra NULL.


# Në vieno elemento neturintis vektorius nëra NULL objektas! Pvz., toká vektoriø 
# pagal nutylëjimà sukuria funkcija vector arba f-jos numeric, character ir t.t.
v <- vector()
v

# Galima ásitikinti, kad gauto vektoriaus ilgis lygus nuliui.
length(v)

# Toks vektorius neturi jokiø atributø (pavyzdþiui, elementø vardø, eiluèiø ar 
# stulpeliø pavadinimø, dimensijos ir t.t.), todël funkcija attributes gràþina 
# tuðèià objektà NULL.
attributes(v)

# Taèiau pats vektorius nëra NULL objektas.
is.null(v)


# NAUDINGA ------------------------------

# Loginiø operacijø su praleistomis reikðmëmis rezultatas taip pat yra praleista
# reikðmë. Pavyzdþiui, palyginsime ar vektoriaus z elementø reikðmës didesnës uþ 
# atitinkamø vektoriaus x elementø reikðmes.

z > x

# Matome, kad visi z elementai didesni uþ x elementus, bet dël keletos praleistø 
# reikðmiø funkcijos all rezultatas taip pat yra praleista reikðmë.

all(z > x)

# Dël praleistø reikðmiø neveikia ir kitos daþnai naudojamos funkcijos! Pvz., 
# negalima rasti vektoriaus elementø sumos, maþiausios ar didþiausios reikðmës.

sum(z)
min(z)
max(z)

# Tokios funkcijos turi papildomus parametrus, kurie nustato, kaip interpretuoti 
# praleistas reikðmes ir kà su jomis daryti atliekant veiksmus. Pavyzdþiui, f-ja 
# sum turi parametrà na.rm, kuriam priskyrus reikðmæ TRUE, sumuojant praleistos 
# reikðmës bus ignoruojamos.

sum(z, na.rm = TRUE)


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite loginæ sàlygà, kuri patikrintø, kurie vektoriaus x elementai
#    nepatenka á intervalà [2, 7].
# 2. Uþraðykite komandà, kuri ið vektoriaus z iðrinktø tik tuos elementus, kurie
#    nëra praleistos reikðmës.
# 3. Uþraðykite komandà, kuri vektoriaus z elementams su praleistomis reikðmëmis
#    priskirtø reikðmæ 0.
# 4. Uþraðykite komandà, kuri patikrintø, ar vektorius d turi bent vienà begaliná
#    elementà.
# 5. Sugalvokite bûdà kaip vektoriui v priskirti elementø vardus, kad jo atributø
#    vektorius jau nebûtø NULL objektas.

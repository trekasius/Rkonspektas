
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Simboliø sekø apjungimas ir jø atvaizdavimas.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2016-03-29 | 2016-04-09 | 2016-04-12
#


# TURINYS -------------------------------

#
#   1. Simboliø sekø apjungimas:
#      * funkcija paste
#
#   2. Objektø atvaizdavimas ekrane:
#      * funkcija print
#
#   3. Pagalbinës simboliø sekø atvaizdavimo funkcijos:
#      * funkcija noquote
#      * funkcija strtrim
#      * funkcija abbreviate
#      * funkcija toString
#      * funkcija encodeString
#


# PASTABOS ------------------------------

#
# Sugalvoti daugiau uþdaviniø.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# SEKØ APJUNGIMAS                         #
# --------------------------------------- #

# Atliekant ávairius skaièiavimus arba pateikiant tø skaièiavimø rezultatus, yra 
# kelios tipinës situacijos, kada simboliø sekà reikia sujungti su kita simboliø
# seka. Simboliai èia gali bûti tiek skaièiai, tiek raidës arba skyrybos þenklai. 
# R kalboje simboliø sekø apjungimui naudojama funkcija paste. Jos parametrai:
#
#        ... -- apjungiami vektoriai,
#        sep -- simboliø seka, kuri atskiria atskirø vektoriø elementus.
#   collapse -- NULL arba simboliø seka, kuri atskiria vektorius.

# Parametras ... nurodo, kad apjungiamø sekø ar vektoriø skaièius nëra ið anksto
# nustatytas, todël vektoriø gali bûti du, trys ir daugiau. Apjungimas gali bûti 
# atliekamas keliais bûdais. Paprasèiausiu atveju vieno vektoriaus elementai bus
# apjungiami su atitinkamais kito vektoriaus elementais. 

# Pavyzdþiui, apjungsime didþiàsias ir maþàsias lotyniðkos abëcëlës raides. Ðiuo
# atveju gaunamos tarpu atskirtos atitinkamø raidþiø poros. Tarpu, nes tokia yra
# parametro sep numatyta reikðmë.

paste(LETTERS, letters)

# Norint, kad vektoriø elementai bûtø sujungti be tarpo, parametrui sep nurodome
# tuðèià sekà "".

paste(LETTERS, letters, sep = "")

# Apjungiant raides, kiekvienas vektorius turëjo daug elementø -- tiek, kiek yra
# raidþiø. Lygiai taip pat galima apjungti dvi sekas ir gauti vienà bendrà sekà.
# Pavyzdþiui, suformuluosime tekstà, kuris pasako ðios dienos datà.

paste("Ðios dienos data:", Sys.Date())


# Funkcija paste apjungiamus skaitinius arba kitokio tipo vektorius automatiðkai 
# paverèia á character tipo reikðmiø vektorius. Pavyzdþiui, taip galima sudaryti
# datas ið atskirø metø, mënesiø ir dienø vektoriø.

metai <- c(1236, 1260, 1410, 1514, 1605)
mënuo <- c(9, 7, 7, 9, 9)
diena <- c(22, 13, 15, 8, 27)

datos <- paste(metai, mënuo, diena, sep = "-")
datos


# Jeigu apjungiami nevienodà elementø skaièiø turintys vektoriai, tai trumpesnis
# vektorius cikliðkai pratæsiamas. Pavyzdþiui, taip paprastai galima sugeneruoti
# ávairias numeruotas sekas:

paste("A", 0:9, sep = "")

paste(1, 1:10, sep = "/")

paste(seq(5, 25, 5), "%")


# Jeigu vektoriø elementus reikia apjungti á vienà bendrà tekstà, tai parametrui
# collapse priskiriama simboliø seka, kuri tekste atskiria vektoriaus elementus.
# Standartinë parametro reikðmë NULL nurodo, kad elementai á vienà bendrà tekstà
# nebus apjungiami. Jeigu parametrui priskiriame tuðèià sekà "", tada apjungimas 
# bus be tarpø. Pavyzdþiui, taip galima apjungti abëcëlës raides ar skaièiø sekà.

paste(letters, collapse = "")

paste(0:9, collapse = "")

paste(1, 1:10, sep = "/", collapse = " + ")


# NAUDINGA ------------------------------

# Gana daþnai skaièiavimø rezultatus reikia áraðyti á atskirus failus. Paprastai
# tokie failai sudaromi automatiðkai, o jø vardai daþniausiai skiriasi tik eilës 
# numeriu. Pavyzdþiui, sudarysime penkiø tekstiniø failø pavadinimø vektoriø.

base <- "failas_"  # bendra visiems failams pavadinimo dalis
type <- ".txt"     # failo iðplëtimas
numb <- 1:5        # failo numeris

failai <- paste(base, numb, type, sep = "")
failai


# NAUDINGA ------------------------------

# Funkcijà paste galima panaudoti kodø generavimui. Pavyzdþiui, uþraðysime f-jà,
# kuri sudaro kodà ið atsitiktinai su vienodomis tikimybëmis pasirinktø didþiøjø 
# lotyniðkos abëcëlës raidþiø. Tarkime, kad kodas bus ið k raidþiø. Jø iðrinkimà
# atliksime naudojant funkcijà sample, o apjungimà á kodà --- su funkcija paste.

kodas <- function(k = 5) paste(sample(LETTERS, k, TRUE), collapse = "")

# Tokios f-jos rezultatas bus vienas kodas. Tarkime, mums reikalingas triþenklis 
# kodas.

kodas(3)

# Ástaèius kodo generavimo funkcijà á funkcijà replicate, galime sugeneruoti bet
# koká kieká nustatyto ilgio kodø. Pavyzdþiui, sugeneruosime 10 triþenkliø kodø.

kodai <- replicate(10, kodas(3))
kodai

# Paprastai reikalaujama, kad visi kodai (pvz., duomenø lentelës eiluèiø vardai)
# bûtø unikalûs. Tai nesunku patikrinti.

anyDuplicated(kodai)


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite tokià komandà, kuri bet kokios duomenø lentelës kintamøjø vardus 
#    automatiðkai pakeistø á "X_1", "X_2" ir t. t.
# 2. Uþraðykite komandà, kuri þodá arba bet kokià kità simboliø sekà uþraðytø ið 
#    kito galo.
# 3. Sudarykite programà, kuri generuotø atsitiktiná skaièiø þodþiø, sudarytø ið
#    atsitiktinio skaièiaus maþøjø lotyniðkos abëcëlës raidþiø.


# --------------------------------------- #
# OBJEKTØ ATVAIZDAVIMAS EKRANE            #
# --------------------------------------- #

# Tai, kaip ekrane bus vaizduojamas vektorius, matrica, duomenø lentelë ar kitas 
# R objektas, priklauso nuo to objekto tipo (klasës). Pavyzdþiui, character tipo
# reikðmës vaizduojamos kabutëse, o factor tipo reikðmës - be kabuèiø. Paprastai
# objektai vaizduojami taip, kaip numatyta, be papildomo apipavidalinimo, taèiau 
# standartines R objektø atvaizdavimo taisykles galima pakeisti.

# Ávairiø R objektø iðvedimui á ekranà naudojama funkcija print. Jos parametrai:
#
#          x -- vektorius ar kitokio tipo R objektas,
#     digits -- maþiausias realiojo skaièiaus reikðmingø skaitmenø skaièius,
#      quote -- TRUE nurodo, kad character tipo reikðmës rodomos su kabutëmis,
#   na.print -- simboliø seka, kuri vaizduojama vietoje NA reikðmës,
#  print.gap -- tarpo plotis tarp vektoriaus elementø arba matricos stulpeliø,
#      right -- FALSE nurodo, kad simboliø sekos lygiuojamos pagal deðinæ pusæ,
#        max -- á ekranà iðvedamø vektoriaus ar matricos elementø skaièius.


# Kiek realiojo skaièiaus skaitmenø rodoma ekrane, nustato sisteminis parametras
# digits. Standartinë jo reikðmë yra 7.

options("digits")

# Jeigu realiøjø skaièiø atvaizdavimui ekrane naudojama funkcija print, keièiant
# jos parametro digits reikðmæ, galima nustatyti ekrane rodomø skaitmenø skaièiø. 
# Pademonstruosime, kaip, keièiant ðio parametro reikðmæ, kompiuterio ekrane bus 
# atvaizduojamas realiøjø skaièiø vektorius.

x <- rnorm(20)
x

print(x)

print(x, digits = 1)
print(x, digits = 5)
print(x, digits = 20)


# Parametras print.gap nurodo tarpo tarp gretimø vektoriaus reikðmiø ar matricos
# stulpeliø plotá. Pavyzdþiui, padidinsime tarpà tarp vektoriaus elementø iki 5.

print(x)
print(x, print.gap = 5)
print(x, print.gap = 5, digits = 3)

# Taip pat galima padidinti tarpus tarp matricos arba duomenø lentelës stulpeliø.

m <- matrix(x, 5, byrow = TRUE)
m

print(m, print.gap = 4)
print(m, print.gap = 4, digits = 3)


# Praleistos reikðmës standartiðkai þymimos NA, lygiai taip pat jos vaizduojamos
# ir ekrane. Taèiau, naudojant parametrà na.print, vietoje NA galima pavaizduoti 
# kitokià simboliø sekà arba net ir vienà simbolá. Pavyzdþiui, iðvesime á ekranà
# skaitiná vektoriø su praleistomis reikðmëmis, kurias þymi taðko simbolis. 

y <- airquality$Ozone
y

print(y)
print(y, na.print = ".")


# Standartiðkai character tipo reikðmë ekrane rodoma su kabutëmis. Jeigu tekstas
# turi bûti rodomas be kabuèiø, parametro quote reikðmæ reikia pakeisti á FALSE.

w <- c("lorem", "ipsum", "dolor", "sit", "amet", "aliquip", "docendi", "decore",
       "mnesarchum", "nullam", "perfecto", "an", "vix", "cu", "et", "molestiae",
       "consetetur", "assum", "libris", "pro", "in", "et", "mel", "nisl", "nam",
       "fugit", "est", "recusabo", "dissentias", "enim", "salutatus", "fabulas")

print(w)
print(w, quote = FALSE)

# Jeigu þodþiai ar kitos character tipo reikðmës yra nevienodo ilgio, jas galima
# iðlygiuoti pagal ilgiausio þodþio kairæ arba deðinæ pusæ. Tam naudojamas f-jos
# print parametras rigth.

print(w)
print(w, right = TRUE)
print(w, right = TRUE, quote = FALSE)
print(w, right = TRUE, quote = FALSE, print.gap = 7)


# NAUDINGA ------------------------------

# Tai, kaip R objektas vaizduojamas ekrane, priklauso nuo jo tipo (klasës). F-ja
# print turi keletà metodø, kurie pritaikomi ávairaus tipo objektø atvaizdavimui.

methods(print)

# Vienas ið daþnai pasitaikanèiø objektø -- daþniø lentelës. Joms funkcija print
# taip pat turi metodà bei keletà specifiniø parametrø, nuo kuriø priklauso, tai 
# kaip atrodo ekrane atspausdinta daþniø lentelë.

# Pavyzdþiui, sudarysime gretimø raidþiø lietuviðkuose þodþiuose daþniø lentelæ.
# Ið pradþiø uþraðome daþnai pasitaikanèiø þodþiø vektoriø.

z <- c("prie", "taèiau", "didelis", "sistema", "gamyba", "ámonë", "koks", "nes",
      "vieta", "þemë", "pirmas", "norëti", "naujas", "dabar", "narys", "þinoti",
      "pagal", "ástatymas", "vaikas", "todël", "net", "iki", "gyvenimas", "jei",
      "daþnai", "pirmininkas", "svarbus", "ant", "grupë", "kiekvienas", "dalis",
      "atlikti", "seimas", "diena", "tai", "sakyti", "du", "valstybë", "duomuo",
      "gerai", "prieð", "kur", "negalëti", "jeigu", "pasaulis", "niekas", "dël",
      "ðalis", "klausimas", "geras", "nei", "nustatyti", "be", "metas", "savæs",
      "viskas", "pradëti", "procesas", "pateikti", "kartas", "priimti", "gauti",
      "veikla", "ûkis", "vanduo", "ávairus", "dirbti", "ligonis", "pagrindinis",
      "kiek", "pavyzdys", "imti", "skirti", "informacija", "lietuvis", "padëti",
      "tarp", "ranka", "tapti", "bendras", "vyriausybë", "kalbëti", "projektas",
      "miestas", "þodis", "projektas", "respublika", "kalba", "daryti", "sàlyga")

# Þodþius iðskaidome á atskiras raides, sudarome vienas po kito einanèiø raidþiø
# poras, atskirø þodþiø raidþiø poras apjungiame á bendrà lentelæ ir tada ið jos 
# sudarome raidþiø porø daþniø lentelæ.

s <- strsplit(z, "")
p <- sapply(s, embed, 2)
g <- do.call(rbind, p)

pirma <- g[, 2]
antra <- g[, 1]

L <- table(pirma, antra)
L

# Matome, kad daþniø lentelëje yra gana daug nuliniø daþniø. Taip yra todël, kad 
# nagrinëjamø þodþiø palyginus nedaug ir retos raidþiø poros tarp jø nepasitaiko.
# Didelis nuliniø daþniø kiekis lentelëje trukdo áþvelgti kitus skaièius. Taèiau,
# naudojant funkcijos print parametrà zero.print, galima nustatyti, koká simbolá 
# rodyti vietoje nulio. Pavyzdþiui, nustatysime, kad bûtø rodomas taðkas.

print(L)
print(L, zero.print = ".")


# Daþniø lentelë ið esmës yra skaièiø matrica, taèiau jos klasë ne "matrix", bet 
# "table", ir pagal ðá poþymá daþniø lentelës atskiriamos nuo visø kitø matricø. 
# Taèiau R objekto klasæ galima nesunkiai pakeisti. Pavyzdþiui, skaièiø matricai 
# priskirsime "table" klasæ ir taip apgausime funkcijà print.

m <- matrix(sample(0:1, 100, TRUE), 10)
m

# Paprasta matrica nëra daþniø lentelë ir parametras zero.print nieko nepakeièia.

class(m)
print(m, zero.print = ".")

# Pakeitus objekto klasæ, ta pati matrica atpaþástama kaip daþniø lentelë, todël
# jau galima nustatyti, kaip ji turi bûti atvaizduojama ekrane.

class(m)
class(m) <- "table"

print(m, zero.print = ".")


# UÞDUOTIS ------------------------------ 

# 1. Sugalvokite tokià koreliacijø matricos atvaizdavimo funkcijà, kad reikðmës, 
#    absoliutiniu dydþiu maþesnës uþ tam tikrà pasirenkamà ribà, bûtø nerodomos.
# 2. 
#    


# --------------------------------------- #
# SIMBOLIØ SEKØ ATVAIZDAVIMO FUNKCIJOS    #
# --------------------------------------- #

# Dël ávairiø prieþasèiø skaièiø vektoriø, duomenø lentelæ, simboliø sekà ar bet
# koká kità R objektà nevisada galima pavaizduoti toká, koks jis yra. Pavyzdþiui,
# gali bûti taip, kad teksto ilgá riboja simboliø skaièius eilutëje. Tada tekstà
# reikia nukirpti, kad jis tilptø á eilutæ. Panaðiø situacijø yra ir daugiau.

# R turi keletà pagalbiniø funkcijø, kurios padeda suformuoti tekstà: paversti á
# simboliø sekà skaièiø vektorius, nukirpti simboliø sekà iki tam tikro simboliø 
# skaièiaus, sulygiuoti atskiras simboliø sekas ir pan.

# Pati paprasèiausia ið tokiø funkcijø -- noquote. Ði funkcija pakeièia simboliø
# sekos klasæ á "noquote", ir tokia simboliø seka ekrane vaizduojama be kabuèiø.
# Kabutës parodo simboliø sekos ribas ir tuo paèiu parodo, kad simboliø seka yra
# simboliø seka, o ne kintamojo pavadinimas, taèiau kartais tai nebûtina þinoti. 
# Pavyzdþiui, pakeisime lietuviðkø þodþiø vektoriaus klasæ ir juos atvaizduosime
# ekrane be kabuèiø.

z <- noquote(z)
z

# Þinoma, naudojant funkcijà unclass, galima sugràþinti pradinæ vektoriaus klasæ.

z <- unclass(z)
z


# Funkcija strtrim nukerpa ilgos simboliø sekos galà ir tokiu bûdu sutrumpina jà
# iki nustatyto simboliø skaièiaus. Ði funkcija turi tik du parametrus:
#
#          x -- simboliø seka,
#      width -- simboliø sekos ilgis.

# Pavyzdþiui, visø savaitës dienø pavadinimus sutrumpinsime iki trijø raidþiø.

dienos <- c("Pirmadienis", "Antradienis", "Treèiadienis", "Ketvirtadienis", 
            "Penktadienis", "Ðeðtadienis", "Sekmadienis") 

strtrim(dienos, 3)


# Jeigu sutrumpinta seka turi bûti unikali, naudojama funkcija abbreviate. Sekos 
# sutrumpinimo algoritmas toks: ið pradþiø ið sekos paðalinami visi tarpai, tada 
# panaikinamos maþàjà raide uþraðytos balsës, kurios eina po priebalsiø, ir, jei
# tokia seka turi daugiau simboliø, negu nurodyta, paðalinamos didþiosios raidës.
# Funkcijos parametrai:
# 
#    names.arg -- simboliø sekø vektorius,
#    minlength -- minimalus sutrumpintos sekos ilgis,
#          dot -- loginis, nurodo ar trumpinio gale turi bûti dedamas taðkas,
#       strict -- loginis, nurodo ar bûtinai iðlaikyti minimalø trumpinio ilgá,
#       method -- c("left.kept", "both.sides")

# Pavyzdþiui, iki trijø raidþiø sutrumpinsime lietuviðkus mënesiø pavadinimus.

mënesiai <- c("Sausis", "Vasaris", "Kovas", "Balandis", 
              "Geguþë", "Birþelis", "Liepa", "Rugpjûtis", 
              "Rugsëjis", "Spalis", "Lapkritis", "Gruodis")

abbreviate(mënesiai, minlength = 3)

# Naudojant funkcijà strtrim, mënesiø pavadinimai gaunami labiau áprasti, taèiau 
# dël to, kad sutampa pirmosios trys raidës, rugpjûtis ir rugsëjis neatskiriami.
# Kartais, pavyzdþiui, sudarant daþniø lentelæ, tai gali sukelti problemø.

strtrim(mënesiai, 3)

# Jei simboliø seka susideda ið keliø þodþiø, sutrumpinimas sudaromas ið pirmøjø
# tø þodþiø raidþiø. Pavyzdþiui, sudarysime trumpinius ið vardø ir pavardþiø.

vardai <- c("Pierre de Fermat", "Carl Friedrich Gauss", "Alan Mathison Turing")

abbreviate(vardai, minlength = 3)


# F-ja toString apjungia vektoriaus elementus á vienà simboliø sekà. Jeigu sekos
# simboliø skaièius virðija nustatytà ribà, sekos galas nukerpamas, o vietoje jo
# áraðomas daugtaðkis. Taip parodoma, kad sekà turi tæsiná. Funkcijos parametrai:
#
#          x -- vektorius,
#      width -- apjungtos sekos ilgis,

# Ðis vektoriaus elementø apjungimo bûdas natûraliai gerai tinka tuo atveju, kai
# vektoriaus elementai patys sudaro lengvai atspëjamà sekà. Pavyzdþiui, tai gali
# bûti skaièiø arba þodþiø seka, datos, kaþkokie þinomi posakiai ir pan.

toString(getwd(), 20)
toString(letters, 20)
toString(dienos, 30)
toString(1:100, 20)


# Funkcija encodeString vektoriaus elementus paverèia á tam tikro ilgio simboliø 
# sekas. Jei seka trumpesnë, prie jos kairës arba deðinës pusës pridedami tarpai.
# Ið kurios pusës bus pridedami tarpai, priklauso nuo to, pagal kurià pusæ sekos
# lygiuojamos. Funkcijos parametrai:
#
#          x -- vektorius,
#      width -- sekos ilgis, NA arba NULL nurodo ilgiausios sekos ilgá,
#      quote -- kabuèiø simbolis,
#  na.encode -- jeigu FALSE, tai seka nebus sudaroma,
#    justify -- lygiavimo taisyklë: "left", "right", "centre" arba "none".

# Pavyzdþiui, duotas skirtingø ilgiø þodþiø vektorius. Ið jo elementø sudarysime
# vienodo ilgio simboliø sekas.

þodþiai <- c("á", "að", "ðuo", "imti", "þodis", "sodyba", "pradëti", "susisuko")
þodþiai

# Jei parametro width reikðmë NA ar NULL, tai gaunamos sekos, kuriø ilgiai lygûs
# daugiausia simboliø turinèio vektoriaus elemento ilgiui. Ðiuo atveju visos jos
# suvienodinamos pagal ilgiausià þodá.

encodeString(þodþiai, width = NA)

# Nustaèius didesná simboliø sekø ilgá, papildomais tarpais bus prapleèiamos jau
# visos sekos.

encodeString(þodþiai, width = 50)

# Standartiðkai visos sekos lygiuojamos pagal kairájá kraðtà. Lygiavimo taisyklæ 
# nusako parametro justify reikðmë. Pavyzdþiui, priskyrus reikðmæ "right", sekas 
# iðlygiuosime pagal deðinájá kraðtà, priskyrus reikðmæ "centre" -- centruosime.

encodeString(þodþiai, width = 50, justify = "right")
encodeString(þodþiai, width = 50, justify = "centre")


# UÞDUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    
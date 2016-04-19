
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Skaièiø ir teksto formatavimo funkcijos.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2016-03-29 | 2016-04-19
#


# TURINYS -------------------------------

#
#   1. Skaièiø ir teksto formatavimas:
#      * funkcija formatC
#      * funkcija prettyNum
#      * funkcija sprintf
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
# TRUMPAI APIE TEKSTO FORMATAVIMÀ         #
# --------------------------------------- #

# Labai daþnai skaièiavimø rezultatus reikia áterpti á tekstà, kuris iðvedamas á
# ekranà ar tekstiná failà. Ávairaus tipo reikðmiø, suformatuotø pagal tam tikrà
# ið anksto nustatytà ðablonà, iðvedimas á ekranà ar kitus árenginius, vadinamas 
# formatuotu spausdinimu. Daugelis programavimo kalbø ðiam tikslui turi funkcijà
# printf (print formatted), kurios standartas susiformavo C kalboje, o R kalboje
# ðiam tikslui naudojama funkcijos printf atmaina sprintf. Ði f-ja skaièiø ádeda 
# á teksto ðablonà ir toká formatuotà tekstà gràþina kaip simboliø sekà.

# Skaièiø atvaizdavimui R dar turi funkcijas formatC, prettyNum, kurios taip pat
# naudoja ðià ið C kalbos atëjusià formatavimo tradicijà.


# --------------------------------------- #
# SKAIÈIØ FORMATAVIMAS                    #
# --------------------------------------- #

# Atskirai skaièiø formatavimui, naudojant C kalboje priimtà sintaksæ, naudojama 
# funkcija formatC. Jos parametrai:
#
#                x -- realiø skaièiø vektorius,
#           digits -- reikðmingø skaitmenø skaièius,
#            width -- skaièiui uþraðyti skirtø simboliø skaièius,
#           format -- skaièiaus uþraðymo formatas,
#             flag -- papildomos skaièiaus formatavimo priemonës, 
#         big.mark -- sveikosios dalies skaitmenø grupavimo simbolis,
#       small.mark -- trupmeninës dalies skaitmenø grupavimo simbolis, 
#     big.interval -- skaitmenø grupës sveikojoje dalyje dydis,
#   small.interval -- skaitmenø grupës trupmeninëje dalyje dydis,
#     decimal.mark -- sveikosios ir trupmeninës dalies atskyrimo simbolis,
#   preserve.width -- skaièiø su grupuotais skaitmenimis formatavimo taisyklë,
#       zero.print -- loginis, nurodo, ar rodyti nulines vektoriaus reikðmes, 
#    drop0trailing -- loginis, nurodo, ar rodyti nulius uþ reikðminiø skaitmenø.


c <- 299792458L       # ðviesos greitis
e <- 2.718281828      # Oilerio konstanta
m <- 9.109383561e-31  # elektrono masë
L <- 6.022140857e+23  # Avogadro skaièius

# Bet kurá skaièiø galima uþraðyti keliais skirtingais formatais. Pvz., sveikàjá
# skaièiø 1000 galima uþraðyti kaip realøjá skaièiø 1000.0 ar eksponentine forma
# (scientific format) kaip 1.0000e+03. Skaièiaus uþraðymo formatà nustato format
# parametras. Pagrindinës jo reikðmës tokios:
#
#          "d" -- sveikiesiems skaièiams,
#          "f" -- realiesiems skaièiams, xx.xxxx,
#          "e" -- scientific format, x.xxxe+nn,
#          "E" -- scientific format, x.xxxE+nn,
#          "s" -- simboliø sekai.

# Be ðiø reikðmiø, dar yra "g" ir "G", kurios nurodo, kad skaièius bus uþraðomas
# atitinkamai "e" arba "E" formatu, jei ðiuo formatu jis uþraðomas trumpiau. Dar
# yra reikðmë "fg", kuri nurodo, kad skaièius bus uþraðytas "f" formatu --- kaip
# realus skaièius, taèiau reikðmingø skaitmenø skaièius bus toks, koks nurodytas
# parametru digits, todël sveikieji skaièiai, kuriems parametras digits = 0, bus
# raðomi be trupmeninës dalies. Pagal nutylëjimà sveikiesiems skaièiams formatas
# yra "d", o realiesiems skaièiams -- "g".

# Parametras digits nurodo arba norimà skaitmenø skaièiø po kablelio, kai format
# parametro reikðmë yra "f", arba reikðmingø skaitmenø skaièiø, kai formatas yra 
# "e", "g" arba "fg". Pagal nutylëjimà realiesiems skaièiams digits = 4.

# Parametras width nustato skaièiui uþraðyti skirtos simboliø sekos ilgá. Jei jo
# reikðmë nenurodoma, tada automatiðkai width = digits + 1. Jeigu width = 0, tai 
# simboliø skaièius lygus parametro digits reikðmei.


# Panagrinësime, kaip galima atvaizduoti didelá sveikàjá skaièiø. Tegul tai bûna
# c raide þymimas ðviesos greitis vakuume. PASTABA! Sveikieji skaièiai R kalboje 
# raðomi su simboliu L gale. Prieðingu atveju laikoma, kad skaièius yra realusis.

class(299792458L)
class(299792458)

# Nuo skaièiaus klasës priklauso tai, kokiu formatu tas skaièius atvaizduojamas. 
# Pvz., jei nenurodome formato, vienu atveju tas pats skaièius vaizduojamas kaip
# sveikasis, kitu atveju --- standartine skaièiaus iðraiðka (scientific format).

#       123456789
#       ||||||||| 
formatC(299792458L)
formatC(299792458)

# Jeigu parametrui priskiriame reikðmæ "f", tai sveikasis skaièius bus uþraðytas
# kaip realusis. Jei parametro reikðmë "e", skaièius uþraðomas standartine forma
# su 4 reikðminiais skaitmenimis. Parametro format reikðmë "fg" nurodo, kad toks
# sveikasis skaièius turëtø bûti uþraðomas kaip realusis, bet kadangi reikðminiø 
# skaitmenø skaièius digits sveikiesiems lygus nuliui, trupmeninë dalis nerodoma.

formatC(299792458L, format = "f")
formatC(299792458L, format = "e")
formatC(299792458L, format = "fg")

# Ðiam skaièiui uþraðyti reikia 9 skaitmenø. Jei parametro width reikðmë maþesnë 
# uþ 9, skaièius vis tiek bus uþraðomas naudojant 9 simbolius. Taèiau jam galima
# skirti ir daugiau simboliø. Tada skaièius bus lygiuojamas pagal deðiniàjà pusæ.

formatC(299792458L, width = 2)
formatC(299792458L, width = 12)

# Jeigu sveikasis skaièius uþraðomas kaip realusis, bet parametro digits reikðmë
# nenurodoma, tada jis uþraðomas su 4 reikðminiais skaitmenimis po kablelio. Tai
# galima pakeisti priskiriant parametrui digits kità reikðmæ.

formatC(299792458L, format = "f")
formatC(299792458L, format = "f", digits = 1)
formatC(299792458L, format = "e", digits = 1)

# Kombinuojant ðiø trijø pagrindiniø parametrø reikðmes, skaièiø galima uþraðyti
# labai ávairiai. Pavyzdþiui, skaièiui uþraðyti skirsime 20 simboliø. Uþraðysime 
# já vienu atveju, kaip sveikàjá skaièiø, o kitu - kaip realøjá skaièiø su dviem 
# reikðminiais skaièiais po kablelio.

formatC(299792458L, format = "d", width = 20)
formatC(299792458L, format = "f", width = 20, digits = 2)


# Panagrinësime, kaip galima atvaizduoti labai maþà realøjá skaièiø. Pavyzdþiui,
# tegul tai bûna elektrono masë m. Kadangi m realusis skaièius, pagal nutylëjimà
# parametro format reikðmë yra "g", vadinas, jis vaizduojamas standartine forma.
# Jeigu toks realusis skaièius uþraðomas kaip sveikasis, jis bus rodomas kaip 0.
# Jei parametro format reikðmë "f", tada pagal nutylëjimà rodomi pirmieji keturi 
# reikðminiai skaitmenys, kurie ðiuo atveju visi lygûs nuliui. Nurodþius formatà
# "fg", skaièius uþraðomas taip, kad bûtø matomi keturi reikðminiai skaitmenys.

formatC(m)
formatC(m, format = "g")
formatC(m, format = "e")
formatC(m, format = "d")
formatC(m, format = "f")
formatC(m, format = "fg")

# Norint pamatyti visà skaièiø, papildomai reikëtø nurodyti reikðminiø skaitmenø
# skaièiø. Ðiuo atveju jø yra 10.

formatC(m, format = "fg", digits = 10)

# PASTABA! Jeigu reikðminiø skaitmenø skaièius nurodomas didesnis, nei jø yra ið
# tikro, skaièiuje atsiranda papildomi skaitmenys, kuriø neturëtø bûti. Taip yra
# dël slankiojo kablelio skaièiø aritmetikos paklaidø, nes kompiuterio atmintyje 
# skaièiui uþraðyti skiriamas tam tikras fiksuotas bitø kiekis (32 ar 64), kurio 
# neuþtenka skaièiui iðreikðti. Tai galioja ir labai dideliems, ir labai maþiems
# skaièiams. Pavyzdþiui, skaièiui m nurodysime 20 reikðminiø skaièiø, kurie visi 
# bus rodomi, nors ið tikro reikðminiø skaièiø ðiuo atveju yra tik 10.

formatC(m, format = "fg", digits = 20)

# Jeigu skaièius nëra labai didelis arba labai maþas, o parametro digits reikðmë
# virðija tikràjá reikðminiø skaitmenø skaièiø, tai skaièiaus gale yra priraðomi 
# nuliai (trailing zeros). Pavyzdþiui, konstanta e èia uþraðyta su 10 reikðminiø 
# skaièiø. Atvaizduokime já su 15 reikðminiø skaièiø.

formatC(e, format = "f", digits = 15)

# Loginis parametras drop0trailing nustato, kad galima nerodyti nuliø, kurie yra
# raðomi uþ reikðminiø skaièiø. Taigi, nors parametras digits virðija reikðminiø
# skaitmenø skaièiø, nuliai gale jau nebus raðomi.

formatC(e, format = "f", digits = 15, drop0trailing = TRUE)


# Kadangi, naudojant funkcijà formatC, skaièius atvaizduojamas kaip tekstas, yra
# galimybë pritaikyti papildomas teksto formatavimo priemones: skaièiø raðyti su 
# þenklu, pakeisti lygiavimà ir k.t. Tam skirtas parametras flag, kurio reikðmës
# gali bûti tokios:
#
#          "0" -- skaièiaus pradþioje bus raðomi nuliai,
#          "+" -- skaièius raðomas su þenklu,
#          "-" -- iðlygiavimas pagal kairæ,
#          " " -- jei pirmas simbolis ne þenklas, tada dedamas tarpas,
#          "#" -- alternatyvus spausdinimas, priklauso nuo formato.

# Sudarant kodus ar eilës numerius, patogumo dëlei skaièiaus pradþioje gali bûti 
# raðomi nuliai. Pavyzdþiui, ið sveikøjø skaièiø sekos 1, 2, ..., 100 sudarysime 
# 3-jø simboliø ilgio kodus.

formatC(1:100, flag = "0", width = 3)

# Jei parametro width reikðmë didesnë uþ skaièiaus skaitmenø skaièiø, tada pagal
# nutylëjimà skaièius bus lygiuojamas pagal deðinájá kraðtà. Tai galima pakeisti
# parametrui flag priskyrus reikðmæ "-".

formatC(1:100, flag = "-", width = 3)

# Kai kada svarbu nurodyti skaièiaus þenklà. Pvz., tai gali bûti temperatûros ar
# ekonominiø rodikliø pokyèiai laike. Tokiu atveju parametrui flag nurodome "+".
# Pavyzdþiui, duotas Vilniaus miesto kiekvieno mënesio þemiausiø oro temperatûrø
# sàraðas (E. Rimkus, 2013). Pavaizduosime ðias temperatûras su þenklu.

#        Sau.   Vas.  Kov.  Bal.  Geg.  Bir.  Lie.  Rug.  Rgs.  Spa.  Lap.   Grd.
#       -----  ----- ----- ----- ----- ----- ----- ----- ----- ----- -----  -----
t <- c(-20.5, -16.3, -9.4, -0.1,  5.9, 10.4, 12.9, 13.2,  8.1,  0.4, -7.7, -19.0)

formatC(t, flag = "+")
formatC(t, flag = "+", format = "f", digits = 1)

# Papildomai galima nurodyti, kad skaièiams pavaizduoti bûtø naudojamas vienodas
# simboliø skaièius. Skaièiø, kurie turi maþiau skaitmenø, pradþioje bus dedamas 
# tarpas.

formatC(t, flag = "+", format = "f", digits = 1, width = 5)

# Jeigu sekoje yra ir teigiamø, ir neigiamø skaièiø, taèiau teigiamiems nurodyti
# þenklà nebûtina, vietoje jo galima palikti tarpà. Tai nurodoma parametrui flag 
# priskiriant reikðmæ " ".

formatC(t, flag = " ")
formatC(t, flag = " ", format = "f", digits = 1)
formatC(t, flag = " ", format = "f", digits = 1, width = 5)


# Pagal lietuviø kalbos taisykles, sveikoji deðimtainës trupmenos dalis skiriama
# kableliu, taèiau kitose kalbose, o taip pat ir programavimo kalbose, paprastai 
# tam naudojamas taðkas. Tai, koks simbolis naudojamas uþraðant skaièiø, nustato 
# parametras decimal.mark. Uþraðysime temperatûrø reikðmes pagal lietuviø kalbos 
# taisykles.

formatC(t, decimal.mark = ",")
formatC(t, decimal.mark = ",", format = "f", digits = 1)


# Labai didelius arba labai maþus skaièius, jei jie neuþraðyti standartine forma, 
# vizualiai nelengva suvokti. Patogumo dëlei, tokiø skaièiø skaitmenys gali bûti 
# grupuojami, taip atskiriant ðimtø, tûkstanèiø, milijonø ir t.t. eilæ. Funkcija
# formatC ðiam tikslui turi tokias dvi parametrø poras:
#
#                  sveikosios dalies           trupmeninës dalies
#                  ----------------            ----------------
#                  big.mark                    small.mark 
#                  big.interval                small.interval

# Pirmoji pora nustato sveikosios skaièiaus dalies skaitmenø grupavimo taisyklæ, 
# antroji - trupmeninës dalies skaitmenø grupavimo taisyklæ. Parametrai big.mark
# ir small.mark nurodo simbolá, kuriuo atskiriamos skaitmenø grupës, o parametro
# big.interval arba small.interval reikðmë yra sveikasis skaièius, kuris nurodo, 
# kas kiek skaitmenø skaièiuje dedamas skyriklis. Pvz., sugrupuosime skaièiaus c
# skaitmenis grupëmis po 3.

formatC(c, format = "fg", big.mark = "'")

# Pavyzdþiui, Avogadro skaièius labai didelis, todël jo skaitmenis suskirstysime 
# á grupes po 10 skaitmenø. Taip ið karto matosi, kad skaièiaus eilë n > 20.

formatC(L, format = "fg", big.mark = "'", big.interval = 10)

# Analogiðkai sugrupuojami labai maþo realiojo skaièiaus skaitmenys po kablelio.
# Pavyzdþiui, tokiu bûdu uþraðysime elektrono masæ m. Ið karto matome, kad yra 6 
# tokios grupës, vadinasi masës m eilë ne maþiau kaip -30.

formatC(m, format = "fg", small.mark = " ")

# Grupuojant skaitmenis padidëja skaièiui uþraðyti reikalingø simboliø skaièius.
# Jeigu reikia, kad tokiems skaièiams uþraðyti reikalingø simboliø skaièius bûtø 
# vienodas, parametro preserve.width reikðmë keièiama ið "individual" á "common".
# Pavyzdþiui, duotas tam tikrø Fibonacci sekos nariø vektorius. Sugrupuosime ðiø
# skaièiø skaitmenis po 3 iðlaikant tà patá bendrà simboliø skaièiø.

#      10    20      30         40           50             60               70
#      --  ----  ------  ---------  -----------  -------------  ---------------
F <- c(55, 6765, 832040, 102334155, 12586269025, 1548008755920, 190392490709135) 

F.format <- formatC(F, format = "fg", big.mark = "'", preserve.width = "common")
F.format

# Ðitoks skaièiø iðlygiavimas pasimato, kai juos atspausdiname po vienà eilutëje.
# Tam galima panaudoti funkcijà cat.

cat(F.format, sep = "\n")


# Jeigu nulinëms reikðmëms formatas neturi bûti nustatomas, parametro zero.print 
# reikðmë pakeièiama á FALSE. Tada vietoje nulio bus rodoma tarpø seka. Tai gali
# bûti naudinga tuo atveju, kai sekoje yra daug nuliø, kuriuos galima ignoruoti.

z <- c(0, 1.1, -1.0, 0, -1.7, 1.2, 0, -1.3, 0, 1.5, 0, 1.2, 0, 0, 0, 0, 0, -1.2)

formatC(z, format = "f", zero.print = FALSE)
formatC(z, format = "f", zero.print = FALSE, digits = 1)


# NAUDINGA ------------------------------

# Skaièiø formatavimui gali bûti naudojama ir funkcija prettyNum. Ji turi maþiau 
# galimybiø, bet labai panaði á funkcijà formatC. Jos parametrai:
#
#                x -- skaièiø vektorius,
#         big.mark -- sveikosios dalies skaitmenø grupavimo simbolis,
#       small.mark -- trupmeninës dalies skaitmenø grupavimo simbolis, 
#     big.interval -- skaitmenø grupës sveikojoje dalyje dydis,
#   small.interval -- skaitmenø grupës trupmeninëje dalyje dydis,
#     decimal.mark -- sveikosios ir trupmeninës dalies atskyrimo simbolis,
#   preserve.width -- skaièiø su grupuotais skaitmenimis formatavimo taisyklë,
#       zero.print -- loginis, nurodo, ar rodyti nulines vektoriaus reikðmes, 
#    drop0trailing -- loginis, nurodo, ar rodyti nulius uþ reikðminiø skaitmenø,
#         is.cmplx -- loginis, nurodo, ar skaièius x yra kompleksinis.

prettyNum(c, big.mark = "'")      # grupuojame skaitmenis
prettyNum(t, decimal.mark = ",")  # taðkà pakeièiame á kablelá
prettyNum(z, zero.print = FALSE)  # nerodomi nuliai


# UÞDUOTIS ------------------------------ 

# 1. Ðviesos greitá c = 299792458 m/s uþraðykite standartine skaièiaus iðraiðka.
#    Skaièius turi bûtø vaizduojamas su trimis skaitmenimis po kablelio.
# 2. Uþraðykite komandà, kuri sukurtø sunumeruotø failø sekà pagal toká ðablonà: 
#    failas_001.txt, failas_002.txt, ..., failas_100.txt.
# 3. Merseno pirminiai skaièiai iðreiðkiami formule M = 2^p - 1, kur p taip pat
#    pirminis. Didþiausias ðiuo metu þinomas pirminis skaièius tuo paèiu yra ir
#    Merseno pirminis skaièius su parametru p = 74207281. Jis turi net 22338618 
#    skaitmenø ir sutrumpintai þymimas M74207281. Maþesni Merseno skaièiai taip
#    pat yra dideli, pavyzdþiui, M127 = 170141183460469231731687303715884105727, 
#    jo parametras p = 127. Naudojant funkcijà formatC, skaièiø M127 uþraðykite 
#    suskirstydami skaitmenis á grupes, kad ið to bûtø galima lengvai vizualiai
#    nustatyti jø skaièiø.


# --------------------------------------- #
# TEKSTO FORMATAVIMAS SU FUNKCIJA SPRINTF #
# --------------------------------------- #

# Kalbant grieþtai, funkcija sprintf tam tikrà duomenø srautà pertvarko pagal ið
# anksto uþduotà formatà ir gràþina simboliø sekà. Jos parametrai:
#
#          fmt -- formatuoto teksto ðablonas,
#          ... -- á ðablonà ástatomos reikðmës.

# Parametras fmt --- tai pagal specialias taisykles uþraðytas teksto ðablonas, á
# kurá ástatomos nustatyta tvarka iðvardytø kintamøjø reikðmës. Ið esmës fmt yra
# simboliø seka, kurioje yra dviejø rûðiø objektai: tai áprasti simboliai, kurie
# á iðvedamà simboliø sekà nukopijuojami taip, kaip uþraðyti, ir formatai, kurie
# nurodo, kaip turi bûti pertvarkytos iðvardintø kintamøjø reikðmës.

# Kad bûtø lengviau ásivaizduoti, ið pradþiø uþraðysime ðablonà be jokiø formatø:
#
#                       "Atstumas nuo {} iki {} yra {} km."
#
# Ðiuo atveju riestiniai skliaustai nurodo vietà tekste, kur galima ástatyti tam
# tikrà reikðmæ. Pavyzdþiui, jei kalbama apie atstumus tarp miestø, tai pirmieji
# skliaustai nurodo vieno miesto pavadinimà, antrieji --- kito miesto pavadinimà, 
# o vietoje treèiøjø skliaustø raðomas tam tikras skaièius, kuris nurodo atstumà 
# tarp ðiø miestø kilometrais.

# Visi formatai prasideda simboliu "%", o uþsibaigia viena raide, kuri ir nurodo 
# konkretø kintamojo atvaizdavimo reikðmës formatà:
#
#         i, d -- sveikasis skaièius arba loginë reikðmë,
#            o -- aðtuntainis skaièius,
#         x, X -- ðeðioliktainis skaièius,
#            f -- realus skaièius, "[-]mmm.ddd",
#         e, E -- standartinë skaièiaus forma, "[-]m.ddde[+-]xx",
#         g, G -- atitinka %e ir %E, jei eksponentë < -4, kitu atveju %f,
#            s -- simboliø seka,
#            % -- iðvedamas simbolis "%".


# Pavyzdþiui, suformuosime ðablonà atstumui tarp dviejø miestø uþraðyti. Tarkime, 
# kad miestus þymi raidës A ir B, o atstumas tarp jø lygus d. Tada ðablonas toks:
#
#                       "Atstumas nuo A iki B yra d km."
#
# Ðiuo atveju A ir B yra miestø pavadinimai, vadinasi jø formatas %s, o atstumas
# h sveikas skaièius, todël ðios reikðmës formatas %i. Gauname ðtai toká ðablonà:
#
#                      "Atstumas nuo %s iki %s yra %i km."                      
#
# Tarkime, kad vienas miestas yra Skuodas, o kitas - Druskininkai. Atstumas tarp
# jø 349 kilometrø. Á f-jà sprintf áraðome ðablonà, tada reikðmes suraðome tokia 
# tvarka, kokia jos turi bûti ástatytos á ðablonà.

#                     ðablonas                          reikðmës         
#       |---------------------------------|  |---------------------------|
#                     1      2      3            1           2         3
sprintf("Atstumas nuo %s iki %s yra %i km.", "Skuodo", "Druskininkø", 349)


# Jeigu á ðablonà ástatomos reikðmës gali keistis, tai á funkcijà sprintf geriau
# suraðyti kintamuosius, kuriems tos reikðmës bus priskiriamos.

ðablonas <- "Atstumas nuo %s iki %s yra %i km."

A <- "Skuodo"
B <- "Druskininkø"
d <- 349

sprintf(ðablonas, A, B, d)

# Tà patá ðablonà galima naudoti ir kitiems atstumams, pavyzdþiui, tarp Þemës ir
# Mënulio, uþraðyti. Ðiuo atveju funkcijos sprintf iðraiðka nesikeièia, keièiasi
# tik kintamøjø reikðmës.

A <- "Þemës"
B <- "Mënulio"
d <- 384400

sprintf(ðablonas, A, B, d)


# Uþraðant reikðmës formatà, standartinæ formatavimo taisyklæ galima pakoreguoti 
# tarp "%" ir formatà nurodanèios raidës áraðant papildomà simbolá. Galimi tokie
# variantai:
#
#          m.n -- m nurodo bendrà simboliø skaièiø, o n nurodo tikslumà
#            0 -- skaièiaus pradþioje bus raðomi nuliai,
#            + -- skaièius raðomas su þenklu,
#            - -- iðlygiavimas pagal kairæ,
#          " " -- jei pirmas simbolis ne þenklas, tada dedamas tarpas,
#            # -- alternatyvus spausdinimas, priklauso nuo formato.

# Naudojant kombinacijà m.n galima nurodyti ið karto kelis dalykus: tai reikðmës 
# atvaizdavimui skirtø simboliø skaièiø bei skaitmenø po kablelio skaièiø, jeigu
# ta reikðmë yra realusis skaièius. Èia m ir n gali ágyti reikðmes 0, 1, 2, ...
# Pavyzdþiui, tarkime, kad realøjá skaièiø e reikia uþraðyti dviejø skaitmenø po 
# kablelio tikslumu, vadinasi, tam reikia 4 simboliø, todël formatas bus "%4.2f".

sprintf("%4.2f", e)

# Jei parametras m maþesnis, nei reikðmei uþraðyti reikalingø simboliø skaièius,
# tada jis bus ignoruojamas. Pavyzdþiui, ðiuo atveju m = 3, m = 2 ar m = 0 nieko
# nekeièia.

sprintf("%3.2f", e)
sprintf("%2.2f", e)
sprintf("%1.2f", e)
sprintf("%0.2f", e)

# Jei parametras m didesnis, nei skaièiui uþraðyti reikalingø simboliø skaièius,
# tada rezultatas bus m simboliø ilgio seka su tarpais. Pavyzdþiui, ðiuo atveju,
# nustaèius m = 5, prie skaièiaus bus pridedamas vienas tarpas, nustaèius m = 6,
# bus pridedami du papildomi tarpai ir pan.

sprintf("%5.2f", e)
sprintf("%6.2f", e)

# Jei reikia nustatyti tik skaitmenø po kablelio skaièiø, tai parametrà m galima
# ir visai praleisti. Dviejø skaitmenø po kablelio formatas uþraðomas "%.2f".

sprintf("%.2f", e)

# Jei reikia nustatyti tik bendrà reikðmei uþraðyti reikalingø simboliø skaièiø,
# tada galima praleisti parametrà n. Pavyzdþiui, galime nurodyti, kad skaièiui e 
# uþraðyti bûtø skirta 15 simboliø.

sprintf("%15f", e)

# Analogiðkai gali bûti nustatomas simboliø skaièius sveikajam skaièiui uþraðyti.
# Jeigu sveikajam skaièiui uþraðyti reikia skirti m simboliø, tai formatas "%md".

sprintf("%3d", 2)

# Jeigu vietoje tarpø turi bûti raðomi nuliai, tai á formatà áterpiamas simbolis 
# "0". Pavyzdþiui, skaièiø 2 uþraðysime kaip kodà 002.

sprintf("%03d", 2)

# Jei skaièius ar kita reikðmë uþima maþiau vietos, nei jam skirta, tada jis bus
# lygiuojamas pagal deðinájá kraðtà. Norint pakeisti lygiavimà á formatà áraðome
# simbolá "-".

sprintf("%-3d", 2)


# Jei skaièius turi bûti raðomas su þenklu, uþraðant formatà tarp "%" ir formato 
# raidës dedamas "+" simbolis. Pavyzdþiui, sudarysime ðablonà tempratûros kitimo
# intervalui nurodyti. Tarkime, kad temperatûros reiðmës --- sveikieji skaièiai,
# tada formatas bus "%+d".

t.min <- -3
t.max <-  2

sprintf("Oro temperatûra kinta nuo %+d iki %+d.", t.min, t.max)

# Jei temperatûros reikðmës realieji skaièiai, galima nurodyti skaitmenø skaièiø
# po kablelio. Pvz., skaièiaus su þenklu ir vienu skaitmeniu po kablelio formatà 
# uþraðome taip: "%+.1f".

t.min <- -3.5
t.max <-  2.5

sprintf("Oro temperatûra kinta nuo %+.1f iki %+.1f.", t.min, t.max)


# UÞDUOTIS ------------------------------ 

# 1. Tarkime, kad duoti trys sveikieji skaièiai, kurie nurodo: valandas, minutes
#    ir sekundes. Uþraðykite komandà, kuri ið ðiø skaièiø uþraðytø laikà áprastu
#    HH:MM:SS formatu.
# 2. Panaudojant funkcijà Sys.time(), uþraðykite komandà, kuri á konsolæ iðvestø 
#    praneðimà apie laikà, pavyzdþiui: "Ðiuo metu yra XX valandø ir YY minuèiø".
# 3. Ið statistikos kurso þinoma, kad statistinë hipotezë priimama arba atmetama
#    pagal p-reikðmæ: jeigu p-reikðmë maþesnë uþ pasirinktà reikðmingumo lygmená
#    alpha, tada hipotezë atmetama, o prieðingu atveju -- priimama. Tarkime, kad
#    p-reikðmë þinoma, o alpha = 0.05. Uþraðykite komandà, kuri á ekranà iðvestø 
#    p-reikðmæ, alpha ir iðvadà apie tai, ar hipotezë priimama, ar atmetama.


# --------------------------------------- #
# PAPILDOMOS FUNKCIJOS SPRINTF GALIMYBËS  #
# --------------------------------------- #

# Apraðant funkcijà sprintf buvo pasakyta, kad kintamøjø reikðmës joje suraðomos 
# tokia tvarka, kokia jos áraðomos á teksto ðablonà. Tai tiesa, taèiau formatams
# galima suteikti eilës numerius, kurie nurodo, kokia tvarka á ðablonà turi bûti 
# ástatomos toliau iðvardintos reikðmës, vadinasi --- nebûtinai ta paèia tvarka, 
# kokia jos suraðytos funkcijoje.

# Norint nurodyti, kelinta ið iðvardintø reikðmiø turi bûti ástatyta konkreèioje
# ðablono vietoje, formate po % þenklo raðomas reikðmës numeris. Reikðmës numerá
# sudaro skaièius, po kurio raðomas "$" simbolis. Pavyzdþiui, uþraðysime ðablonà
# binarinei operacijai: tam reikia nurodyti operatoriø ir du operandus.

sprintf("%2$d %1$s %3$d", operatorius = "+", kairë = 15, deðinë = 79)


# Reikðmiø numeravimas leidþia tà paèià reikðmæ á ðablonà ástatyti kelis kartus.
# Pavyzdþiui, viename sakinyje áraðysime skaièiø ir tà patá skaièiø suapvalintà.

x <- 1/3
sprintf("Skaièius %1$f suapvalintas iki dviejø skaièiø po kablelio: %1$.2f.", x)


# Jeigu toje paèioje ðablono vietoje vienà kartà reikia áraðyti vienà reikðmæ, o
# kità kartà --- kità, tai funkcijoje sprintf vietoje vienos konkreèios reikðmës
# galima áraðyti reikðmiø vektoriø. Tokiu bûdu gauname analogiðkø tekstø rinkiná 
# su skirtingomis reikðmëmis toje paèioje teksto vietoje. Pavyzdþiui, iðraðysime
# Lietuvos kunigaikðèiø valdymo metus.

K <- c("Mindaugas", "Treniota", "Vaiðelga", "Ðvarnas", "Traidenis", "Daumantas")

nuo <- c(1239, 1263, 1264, 1267, 1269, 1282)
iki <- c(1263, 1264, 1267, 1268, 1281, 1285)

sprintf("Lietuvos didysis kunigaikðtis %s.", K)
sprintf("Lietuvos didysis kunigaikðtis %s valdë nuo %d iki %d.", K, nuo, iki)


# Jei á ðablonà ástatomø reikðmiø vektoriai turi skirtingà elementø skaièiø, tai
# trumpesnis vektorius cikliðkai pratæsiamas. Pvz., sudarysime ðablonà tekstiniø
# failø pavadinimams sudaryti. Pirma pavadinimo dalis visiems failams vienoda, o 
# kita dalis yra eilës numeris.

prefix <- "failas"
number <- 1:10

sprintf("%s_%02d.txt", prefix, number)


# Uþraðant á ðablonà ádedamos reikðmës formatà galima nurodyti reikðmei uþraðyti
# skiriamø simboliø skaièiø arba realaus skaièiaus skaitmenø po kablelio skaièiø.
# Pavyzdþiui, iki dviejø skaitmenø suapvalinto realaus skaièiaus formatas "%.2f".
# Ðiuo atveju konstrukcijoje m.n parametras m praleistas ir raðoma tik parametro
# n reikðmë. Naudojant ðá formatà atvaizduosime skaièiø e.

sprintf("Skaièius e apytiksliai lygus %.2f", e)

# Ádedamos reikðmës formatas yra ðablono dalis, todël, norint pakeisti skaièiaus 
# atvaizdavimo formatà, reikia pakeisti patá ðablonà. Tarkim, kad vietoje "%.2f"
# turi bûti formatas "%.3f", vadinasi, uþtenka pakeisti tik parametro n reikðmæ.
# Uþraðant formatà konstrukcijoje m.n vietoje parametro n galima áraðyti simbolá 
# "*", o paties parametro reikðmæ iðkelti prie kitø á ðablonà ástatomø reikðmiø.
# Taigi, formate "%.*f" parametras m praleistas, simbolis "*" nurodo parametrà n, 
# o raidë "f" nurodo, kad ádedamas realusis skaièius.

# Tokiu pavidalu uþraðyto formato parametro n reikðmë taip pat ádedama á ðablonà.
# Kadangi reikðmiø eiliðkumas nenurodytas, jos á ðablonà bus ástatomos ta tvarka, 
# kuria jos suraðytos. Vadinasi, ðiuo atveju pirma turi bûti parametro n reikðmë.

#                                       n    n
#                                       |    |
sprintf("Skaièius e apytiksliai lygus %.*f", 2, e)
sprintf("Skaièius e apytiksliai lygus %.*f", 3, e)

# Kadangi á ðablonà ástatomos reikðmës turi savo eilës numerius, galima nurodyti,
# kuri ið iðvardintø reikðmiø yra formato parametras. Pavyzdþiui, jeigu skaièius
# e áraðytas pirmas, o formato parametras n -- antras, tada formatas "%1$.*2$f".

sprintf("Skaièius e apytiksliai lygus %1$.*2$f", e, 3)

# Tokiu pavidalu uþraðytas formatas jau gana sunkiai skaitomas, bet, iðnaudojant 
# reikðmiø numeravimà, galima parametrizuoti ir kompaktiðkai uþraðyti sudëtingus 
# ðablonus. Pavyzdþiui, uþraðysime toká ðablonà, kuriame galima keisti sveikajam 
# skaièiui atvaizduoti skiriamø simboliø skaièiø, t. y. m.n formato parametrà m,
# o skaièiaus priekyje bûtø raðomi nuliai.

y <- 7

sprintf("Agentas %0*2$d", skaièius = y, m = 3)
sprintf("Agentas %1$0*2$d", skaièius = y, m = 2:4)

# Pavyzdþiui, sudarysime toká ðablonà, kad realø skaièiø bûtø galima atvaizduoti 
# su vis didëjanèiu skaitmenø po kablelio skaièiumi.

phi <- 1.6180339887498948

sprintf("Skaièius %1$2d skaitmenø po kablelio tikslumu: %2$.*1$f", 1:15, phi)


# NAUDINGA ------------------------------

# F-ja sprintf paprastai naudojama ávairiø informaciniø praneðimø, kuriø turinys
# skaièiavimø metu keièiasi, formavimui. Pavyzdþiui, atliekant ilgai trunkanèius
# skaièiavimus, pravartu þinoti, kiek ciklo iteracijø atlikta.

N <- 10

for (i in 1:N) {

  # Ásivaizduojamas skaièiavimø blokas.
  Sys.sleep(runif(1))

  # Iðvedame informacijà apie iteracijos numerá.
  info <- sprintf("%02d iteracija ið %d.", i, N)
  cat(info, "\n")
  flush.console()
}


# Uþraðysime funkcijà, kuri sekundëmis iðmatuotà laiko intervalà uþraðytø labiau
# áprastu HH:MM:SS formatu. Apskaièiuosime valandø, minuèiø ir sekundþiø skaièiø
# ir, naudojant funkcijà sprintf, ástatysime gautas reikðmes á ðablonà.

sec2time <- function(x) {

    x <- as.numeric(x)
  val <- x %/% 3600
    x <- x %% 3600
  min <- x %/% 60
  sek <- x %% 60

  sprintf("%02.f:%02.f:%02.f", val, min, sek)
}

sec2time(21.6)
sec2time(4017)


# Tokià funkcijà galima ástatyti á ciklà ir iðvesti informacijà apie skaièiavimø
# trukmæ. Ið pradþiø, naudojant funkcijà difftime, apskaièiuojame laiko skirtumà 
# sekundëmis. Tada, naudojant f-jà sec2time, tà skirtumà perraðome kitu pavidalu
# ir ástatome á ðablonà.

N <- 10
start <- Sys.time()

for (i in 1:N) {

  # Ásivaizduojamas skaièiavimø blokas.
  Sys.sleep(runif(1, 0, i))

  # Iðvedame informacijà apie skaièiavimø laikà.
  stop <- Sys.time()
  secs <- difftime(stop, start, units = "secs")
  time <- sec2time(secs)
  info <- sprintf("%04d | t = %s", i, time)
  cat(info, "\n")
  flush.console()
}


# UÞDUOTIS ------------------------------ 

# 1. Duota realiøjø skaièiø seka x. Uþraðysime programà, kuri nubraiþo pirmøjø n 
#    sekos nariø kitimà laike, kur n ágyja reikðmes 1, 2, ..., 1000. Papildykite
#    programà taip, kad animuoto grafiko antraðtëje bûtø áraðoma besikeièianti n
#    reikðmë, kuriai pavaizduoti skirti keturi simboliai, priekyje raðomi nuliai.
#    
#    n <- 1000
#    x <- cumsum(rnorm(n))
#    for (i in 1:n) plot(x[1:i], type = "l", ylim = range(x), xlim = c(1, n))
#
# 2. Sudarykite tokià f-jà, kurios argumentas yra 1 x 2 dydþio daþniø lentelë, o
#    rezultatas yra tekstinis praneðimas, koks yra vienos ið reikðmiø procentas.
#    Tarkime, duota daþniø lentelë: dd <- as.table(c(`FALSE` = 26, `TRUE` = 9)).
#    Tada praneðimas galëtø bûti toks: "TRUE reikðmiø yra 25.7 %".

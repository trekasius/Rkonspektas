
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Reguliarios iðraiðkos.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2016-04-19 | 2016-04-21
#


# TURINYS -------------------------------

#
#   1. Teorinis reguliariø iðraiðkø pagrindimas:
#      * ávadas á baigtiniø automatø teorijà
#      * Kleene teorema apie baigtinius automatus
#      * reguliariø iðraiðkø ryðys su automatais
#      * formalios kalbos ir formalios gramatikos
#
#   2. Reguliarios iðraiðkos:
#      * 
#


# PASTABOS ------------------------------

#
# Paraðyti reguliariø iðraiðkø skyriø ir sugalvoti uþduotis.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# BAIGTINIAI AUTOMATAI, FORMALIOS KALBOS  #
# --------------------------------------- #

# Automatø teorija -- diskreèiosios matematikos ðaka, nagrinëjanti matematiniais
# modeliais uþraðomas abstrakèias skaièiavimo maðinas (jos vadinamos automatais)
# ir uþdavinius, kuriuos jos gali spræsti. Automatas diskreèiais laiko momentais
# konvertuoja diskreèià informacijà ir þingsnis po þingsnio vykdydamas ið anksto
# uþduotà algoritmà formuoja rezultatà. Ðiuo atþvilgiu automatø teorija susijusi
# su algoritmø teorija. Atskirai galima paminëti baigtinius automatus. Tai tokie
# automatai, kuriø vidiniø bûsenø aibë yra baigtinë. Baigtinis automatas ásimena
# savo bûsenà ir, priklausomai nuo veiksmo ir dabartinës bûsenos, pereina á kità
# bûsenà. 

# Norint detaliau apraðyti baigtinio automato veikimo principà, paaiðkinsime kai
# kuriuos toliau tekste naudojamus terminus. Simboliu vadiname bet koká nedalomà
# duomenø blokà. Daþniausiai simboliais laikomi natûralios kalbos raðto þenklai:
# raidës, skaièiai, skyrybos þenklai. Taèiau simboliai gali bûti ir abstraktesni
# objektai, pavyzdþiui, grafiniai diagramos elementai. Alfabetas -- tai baigtinë
# skirtingø simboliø aibë. Þodis --- simboliø seka, gaunama apjungiant simbolius
# ið vieno alfabeto. Kalba --- tam tikro alfabeto pagrindu sudarytø þodþiø aibë.
# Jei kalbà sudaro riboto ilgio þodþiai, tai jø aibë bus baigtinë, bet prieðingu
# atveju gaunama begalinë aibë. Kalbà sudaro nebûtinai visi þodþiai, kuriuos tik
# ámanoma sudaryti ið tam tikro alfabeto simboliø, todël bendru atveju kalba yra
# poaibis visø ámanomø vieno alfabeto þodþiø aibës.

# Laikoma, kad baigtinis automatas pradeda darbà tam tikroje pradinëje bûsenoje.
# Toliau nuosekliai skaitoma simboliø seka s_1 s_2 ... s_n, kuri vadinama áëjimo
# þodþiu. Kiekvienas nuskaitytas simbolis perveda automatà á naujà bûsenà. Kokia
# bus nauja bûsena, priklauso nuo dabartinës bûsenos ir nuskaityto simbolio. Ðià
# perëjimo ið bûsenos á bûsenà taisyklæ apraðo perëjimo funkcija. Taip automatas
# skaitydamas sekà bei keisdamas bûsenas nuskaito paskutiná simbolá ir patenka á
# tam tikrà bûsenà. Jeigu ði bûsena yra ið leistinø baigtiniø bûsenos aibës, tai
# sakoma, kad nuskaityta simboliø seka (þodis) yra priimtina. 

# Apibendrintai baigtinis automatas uþraðomas rinkiniu M = {A, Q, q, F, d}, kur:
#
#          A -- áëjimo simboliø aibë (alfabetas),
#          Q -- baigtinë vidiniø bûsenø aibë,
#          q -- pradinë bûsena, q priklauso aibei Q,
#          F -- galutiniø bûsenø aibë, F yra aibës Q poaibis,
#          d -- perëjimo funkcija, kuri apraðo perëjimo á kità bûsenà taisyklæ.

# Baigtiná automatà galima atvaizduoti orientuotu grafu. Grafo virðûnës atitinka
# automato bûsenas, o briauna, su jai priskirtu simboliu, atitinka parëjimà tarp
# dviejø bûsenø. 

# Baigtiniai automatai skirstomi á deterministinius ir nedeterministinius. Jeigu
# automatui leidþiama pereiti á kità bûsenà nenuskaièius simbolio arba ið vienos
# bûsenos (nuskaièius tà patá simbolá) galima patekti á daugiau nei vienà bûsenà,
# tada toks automatas vadinamas nedeterministiniu. 

# Automatø teorija --- ðiuolaikinës skaièiavimo technikos ir programinës árangos
# pagrindas. Baigtiniai deterministiniai automatai naudojami sprendþiant plataus
# spektro uþdavinius, pavyzdþiui:
#
#   -- automatizuotame elektronikos projektavime,
#   -- neurologiniø sistemø ir jø veiklos apraðymui,
#   -- informacijos perdavimo protokolø sudarymui,
#   -- natûralios kalbos tekstø analizëje,
#   -- natûralios kalbos signalø atpaþinime,
#   -- atliekant programinës árangos testavimà,
#   -- nustatant algoritmø korektiðkumà kriptografijoje,
#   -- projektuojant programavimo kalbas ir jø kompiliatorius.
#
# Kai kurie visiðkai paprasti, o kartais ir gana sudëtingi mechaniniai árengimai
# bei elektronikos prietaisai suprojektuoti taip, kad jie veiktø kaip baigtiniai
# automatai. Pavyzdþiui, ðviesoforas, kavos aparatas ar pardavimø automatas.

# Buvo pasakyta, kad nuskaitytas þodis yra leistinas, jeigu jis automatà perveda
# á leistinà baigtinæ bûsenà. Ið èia iðplaukia dar bendresnë iðvada: sakoma, kad
# kalba L priimama automato M, jeigu ji susideda ið alfabeto A pagrindu sudarytø
# þodþiø, kurie automatà perveda á bûsenas ið baigtiniø bûsenø aibës F. Teisinga
# ir tokia iðvada, kad baigtiná automatà galima suprasti, kaip kalbos atpaþinimo
# prietaisà.

# Automatø teorija glaudþiai susijusi su formaliø kalbø teorija. Paaiðkinsime ðá
# ryðá. Ið pradþiø suformuluosime tekste naudojamos formalios kalbos apibrëþimà.
# Formali kalba --- tai baigtinio ilgio simboliø ið baigtinio alfabeto sekø aibë.
# Taisyklës, pagal kurias sudaromos tokios simboliø sekos, vadinamos formaliomis
# taisyklëmis arba formalia gramatika. Formalias kalbas nagrinëja formaliø kalbø 
# teorija. Jos naudojamos automatø teorijoje, algoritmø ir skaièiavimo teorijoje.

# Formaliø kalbø teorijoje reguliari kalba yra tokia, kuri iðreiðkiama naudojant
# reguliaras iðraiðkas. Ðis teiginys susieja reguliarias kalbas su reguliariomis
# iðraiðkomis, bet neatsako á klausimà, kas tai yra reguliari iðraiðka. Galutiná
# atsakymà duoda Kleene teorema, kuri susieja reguliarias iðraiðkas, reguliarias
# kalbas ir baigtinius automatus.

# Teorema. Tegul A yra baigtinis alfabetas. Ðio alfabeto pagrindu sudaryta kalba 
# L yra reguliari tada ir tik tada, jei ji priimama tam tikro baigtinio automato.
# Árodymas remiasi tuo, kad kiekvienai reguliariai iðraiðkai gali bûti sudarytas 
# baigtinis automatas, kartai nedeterminuotas, atpaþástantis reguliaria iðraiðka 
# R uþduotà kalbà. Vadinas, kiekvienà reguliarià kalbà galima sutapatinti su tam 
# tikru baigtiniu automatu. Ið èia seka galutinë iðvada, kad reguliariø kalbø ir 
# kalbø, kurias atpaþásta baigtiniai automatai, klasës sutampa. 

# Galima paminëti, kad automatai paprastai klasifikuojami pagal formalios kalbos,
# kurià jie gali atpaþinti, klasæ. Visa automatø ávairovë gali bûti apraðyta per
# taip vadinamà Chomskio hierarchijà, kuri apraðo ryðius tarp formaliø gramatikø.

# Formaliø kalbø teorijoje formali gramatika yra formalios kalbos apraðymo bûdas.
# Jei tiksliau, gramatika nusako bûdà, kaip ið visø alfabeto A pagrindu sudarytø 
# þodþiø aibës iðskirti tam tikrà poaibá, kurio elementai (þodþiai) ir sudaro jà 
# atitinkanèià formalià kalbà L. Iðskiriamos dviejø rûðiø gramatikos: 
#
#   -- generuojanèios,
#   -- atpaþástanèios.

# Generuojanti gramatika yra toks taisykliø rinkinys, pagal kurá galima sudaryti 
# bet koká kalbos þodá. Atpaþástanti arba analitinë gramatika leidþia nustatyti, 
# ar þodis priklauso tam tikrai kalbai, ar nepriklauso.


# --------------------------------------- #
# TRUMPAI APIE REGULIARIAS IÐRAIÐKAS      #
# --------------------------------------- #

# Reguliari iðraiðka --- pagal specialias taisykles sudaryta simboliø seka, kuri
# apraðo paieðkos kitoje simboliø sekoje ðablonà. Reguliariø iðraiðkø koncepcija
# atsirado apie 1950 m., kai matematikas Stephen'as Kleene formalizavo teorinëje
# informatikoje nagrinëjamø reguliariø kalbø apibrëþimà.


# Paþymëkime n simboliø sekà L = s_1 s_2 ... s_n. Tada seka S = s_i ... s_j, kur
# 1 <= i <= j <= n, bus vadinama sekos L subseka (substring).


# NAUDINGA ------------------------------

# 
# 


# UÞDUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    

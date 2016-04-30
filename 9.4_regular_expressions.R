
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Reguliarios iðraiðkos.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2016-04-19 | 2016-04-23 | 2016-04-30
#


# TURINYS -------------------------------

#
#   1. Teorinis reguliariø iðraiðkø pagrindimas:
#      * ávadas á baigtiniø automatø teorijà
#      * Kleene teorema apie baigtinius automatus
#      * reguliariø iðraiðkø ryðys su automatais
#      * formalios kalbos ir formalios gramatikos
#
#   2. Reguliariø iðraiðkø sudarymo taisyklës:
#      * trumpai apie reguliarias iðraiðkø istorijà
#      * reguliariø iðraiðkø ir reguliariø kalbø ryðys
#      * reguliariø iðraiðkø sudarymo taisyklës
#      * operacijos su reguliariomis iðraiðkomis
#      * operatoriø prioritetai ir savybës
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
# informatikoje nagrinëjamø reguliariø kalbø apibrëþimà. Vienas ið UNIX sistemos
# kûrëjø Kenneth Thompson realizavo reguliarias iðraiðkas pirmame standartiniame
# UNIX tekstiniame redaktoriuje ed. Nuo to laiko reguliarios iðraiðkos tapo UNIX
# operacinës sistemos dalimi, kartu su tokiomis programomis kaip grep ar filter.
# Reg. iðraiðkos naudojamos specializuotose programavimo kalbose, kurios skirtos
# teksto skanavimui ir apdorojimui, pavyzdþiui, sed, awk ir perl. Jos palaikomos
# ir daugelyje bendro pobûdþio programavimo kalbø. Reguliarios iðraiðkos plaèiai
# naudojamos teksto redaktoriuose tokiuose, kaip Emacs, vim. Kita svarbi taikymø
# sritis -- leksiniai analizatoriai programavimo kalbø kompiliatoriuose. 


# Formaliø kalbø teorijoje reguliarios iðraiðkos apraðo reguliarias kalbas. Reg.
# iðraiðkos susideda ið konstantø ir operatoriø. Ið konstantø sudaromos simboliø
# sekø aibës, o operatoriai apraðo operacijas, kurias galima atlikti su tø aibiø
# elementais -- sekomis. Ásivesime kai kuriuos reguliarioms iðraiðkoms apibrëþti
# reikalingus terminus. 

# Tarkime, kad L ir K yra dvi kalbos. Jø sàjunga vadinsime aibæ þodþiø, kuri yra
# tas kalbas atitinkanèiø þodþiø aibiø sàjunga. Pavyzdþiui, kalba L = {001, 10},
# o K = {1, 001}. Tada ðiø kalbø sàjunga bus aibë {1, 001, 10}.

# Kalbø L ir K konkatenacija vadinsime aibæ þodþiø, kurie yra gauti prie aibës L
# þodþiø prijungus aibës K þodþius. Pavyzdþiui, jei L = {001, 10}, K = {1, 001},
# tada jø konkatenacija yra aibë {0011, 101, 001001, 10001}.

# Kalbos L uþdariniu L* vadinsime aibæ tokiø þodþiø, kurie gauti visais galimais 
# bûdais sujungus kalbos L þodþius. Þodþiai konkatenacijose gali kartotis norima 
# kieká kartø, t.y. galima visø L laipsniø konkatenacija. Pvz., jeigu L = {0, 1}, 
# tai L* bus visø galimø ið nuliø ir vienetø sudarytø þodþiø aibë. Uþdariniui L* 
# priklauso ir tuðèias þodis "", kurá þymime e. Tuðèios aibës uþdarinys yra aibë,
# turinti tik vienà elementà -- tuðèià þodá e.

# Dabar galime apibrëþti konstantas ir operatorius, kurie naudojami reguliariøjø
# iðraiðkø sudarymui. Tarkime, kad A yra baigtinis alfabetas. Tada reg. iðraiðkø 
# konstantos yra tokie objektai:
#
#          0 -- tuðèia aibë,
#          e -- tuðèias þodis,
#          a -- simboliai ið alfabeto A.
#
# Tegul R ir S yra reguliarios iðraiðkos. Tada joms apibrëþtos ðitos operacijos:
#
#         RS -- sekø ið R ir S sujungimas (concatenation);
#        R|S -- sekø ið R ir S sàjunga (alternation);
#         R* -- sekø ið R uþdarinys (Kleene star).


# Galima priminti, kad reguliari iðraiðka apraðo kalbà, o kalba yra þodþiø aibë.
# Tarkime, kad L(R) nurodo kalbà, kurià apraðo reguliari iðraiðka R. Pagrindinës
# taisyklës nurodanèios, kokias kalbas apraðo reguliarios iðraiðkos, yra tokios: 
#
#   -- L(a) = {a}, kiekvienam simboliui a ið alfabeto A;
#   -- L(e) = e;
#   -- L(0) = 0;
#   -- L(R|S) = L(R) U L(S);
#   -- L(RS) = L(R)L(S) = {ab | a ið R, b ið S};
#   -- L(R*) = {e} U {s_1 ... s_k | s_1, ..., s_k ið R}.

# Taigi, konkatenacija RS nurodo aibæ tokiø þodþiø (sekø), kurie gaunami þodþius 
# ið kalbos, kurià apraðo reguliari iðraiðka R, prijungus prie þodþiø ið kalbos, 
# kurià apraðo reguliari iðraiðka S. 

# Pvz., tarkime, kad iðraiðka R apraðo kalbà, kurios þodþiø aibë yra {"ab", "c"}, 
# o reguliari iðraiðka S atitinka kalbà, kurios þodþiø aibë {"d", "ef"}. Vadinas,
# konkatenacija RS = {"ab", "c"}{"d", "ef"} = {"abd", "abef", "cd", "cef"}.

# Taip R|S apraðo aibæ, kuri yra reguliarias iðraiðkas R ir S atitinkanèiø kalbø
# sàjunga. Pavyzdþiui, jeigu R = {"ab", "c"}, o S = {"c", "bd"}, tai sàjunga R|S
# apraðo kalbà {"ab", "c", "bd"}.

# Liko dar viena operacija -- Klini þvaigþdë. Iðraiðka R* apraðo aibæ visø tokiø
# þodþiø, kuriuos galima gauti apjungiant bet koká baigtiná skaièiø kalbos, kuri
# apraðoma iðraiðka R, þodþiø. Arba kitaip - R* apraðo kalbà, kurios þodþiø aibë
# yra kalbos, kuria apraðo R, uþdarinys. Pvz., jeigu R apraðo kalbà {"ab", "c"},
# tai R* apraðo kalbà {e, "ab", "c", "abab", "abc", "cab", "cc", "ababab", ...}.
# Galima dar kartà atkreipti dëmesá, kad tokiu bûdu gautoje þodþiø aibëje yra ir
# tuðèias þodis e.

# Ið ðiø operacijø didþiausià prioritetà turi Klini þvaigþdë, tada konkatenacija,
# o þemiausià prioritetà turi sàjunga. Kaip áprasta matematikoje, skliausteliais
# gali pakeisti veiksmø tvarkà. Pvz., vietoje (ab)c galima raðyti abc, o vietoje  
# a|(b(c*)) galima raðyti a|bc*. Norint iðraiðkoje iðvengti skliausteliø, galima 
# iðnaudoti operatoriø savybes. Konkatenacija ir sàjunga yra asociatyvios, todël
# (ab)c = a(bc) = abc. Be to, sàjunga yra komutatyvi: a|b = b|a. O konkatenacija
# nekomutatyvi, kadangi þodþio prijungimas ið kairës ir ið deðinës bendru atveju 
# duoda skirtingus rezultatus, todël ab != ba. Klini þvaigþdë --- idempotentinis 
# operatorius, todël R** = R*. Konkatenacijai ir sàjungai galioja distributyvumo
# dësnis: (a|b)c = ac|bc.


# Dar kartà kitais þodþiais uþraðysime taisykles, kurios nusako, kas tai yra reg. 
# iðraiðkos. Bet kuris atskirai paimtas alfabeto A elementas a yra reg. iðraiðka 
# a, apibrëþianti kalbà {a} --- aibæ, kuri turi vienintelá elementà a. Konstanta 
# e (tuðèias þodis "") yra reguliarioji iðraiðka, apibrëþianti kalbà {e}. Tuðèià 
# aibæ {} apibrëðime reguliaria iðraiðka 0. Jei R ir S yra reguliarios iðraiðkos, 
# tada RS taip pat yra reguliari iðraiðka, þyminti R ir S apibrëþiamø kalbø L(R) 
# ir L(S) sàjungà: L(R|S) = L(E) U L(F). Jeigu R ir S yra reguliarios iðraiðkos, 
# tada RS taip pat yra reguliari iðraiðka, þyminti R ir S apibrëþiamø kalbø L(E) 
# ir L(F) konkatenacijà: L(EF) = L(E)L(F). Jei R yra reguliarioji iðraiðka, tada 
# R* taip pat yra reg. iðraiðka, kuri þymi kalbos L(R) uþdariná: L(R*) = (L(E))*. 
# Jeigu R yra reguliarioji iðraiðka, tada (R) taip pat yra reguliarioji iðraiðka, 
# þyminti tà paèià kalbà, kurià apibrëþia ir E: L((E)) = L(E).


# Pavyzdþiui, iðnagrinësime, kokià þodþiø aibæ apraðo reguliari iðraiðka (a|b)c.
# Pagal apibrëþimà ði reguliari iðraiðka apraðo simboliø sekà rs, kur r yra arba 
# raidë "a", arba raidë "b", o simbolis s yra raidë "c". Ðià aibæ uþraðome taip:
#
#                    {rs | r ið ({"a"} U {"b"}), s ið {"c"}}
#
# Taigi, reguliari iðraiðka (a|b)c apraðo kalbà, kurios þodþiø aibë {"ac", "bc"}.
# Uþraðysime keletà paprasèiausiø reguliariø iðraiðkø bei jas atitinkanèiø kalbø 
# þodþiø aibes:
#
#          a -- {"a"}
#         ab -- {"ab"}
#      ac|bc -- {"ac", "bc"}
#      a|b|c -- {"a", "b", "c"}

# Uþraðysime keletà reguliariø iðraiðkø su Klini þvaigþde bei atitinkanèiø kalbø 
# þodþiø aibes:
#
#       a|b* -- {e, "a", "b", "bb", "bbb", ... }
#       ab*c -- {"ac", "abc", "abbc", "abbbc", ... }
#      (ab)* -- {e, "ab", "abab", "ababab", ...}
#     (a|b)* -- {e, "a", "aa", "aaa", ..., "b", "bb", "bbb", ... }
#       a*b* -- {e, "a", "b", "aa", "ab", "ba", "bb", "aaa", "aab", "abb", ...}
#     a*|ab* -- {e, "a", "aa", "aaa", ..., "ab", "abb", "abbb", ...}
#   (a|b)*aa -- {"aa", "aaa", "baa","abaa", ...}
#     (a*b)* -- {e, "b", "bb", ..., "ab", "abab", ..., "aab", "aabaab", ...}


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite tokià reguliarià iðraiðkà, kuri apraðo sekas, sudarytas ið nuliø 
#    ir vienetø, kuriose ið pradþiø yra bet kokio ilgio nuliø serija, o uþbaigia
#    tokià sekà vienas vienetas. Pvz., 1, 01, 0000001 ir t.t.
# 2. Uþraðykite reguliarià iðraiðkà, kuri apraðo bet kokio ilgio sekas sudarytas
#    vien tik ið nuliø arba vien tik ið vienetø.
# 3. Nustatykite, kokiø þodþiø aibæ apraðo reguliari iðraiðka a) ab*c, b) a*|b*,
#    c) ab*|ac*, d) (a|b|c)*.
# 4. Pasakykite, kuo reguliaria iðraiðka ab*c apraðomi þodþiai skiriasi nuo reg.
#    iðraiðka abb*cd apraðomø þodþiø?
# 5. Nustatykite, ar galima kitu bûdu uþraðyti reg. iðraiðkà ab*|ac*. Jei galima,
#    tada kaip?
# 6. Sudarykite reguliarià iðraiðkà, kuri apraðo kalbà, kurioje þodþiai baigiasi
#    galûne "as".
# 7. Sudarykite tokià reguliarià iðraiðkà, kuri apraðo kalbà su tokiais þodþiais, 
#    kurie prasideda raide "n", o baigiasi galûne "as".

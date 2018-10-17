
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Reguliarios iðraiðkos, regexp ir jø sudarymas.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2016-05-01 | 2016-05-10
#


# TURINYS -------------------------------

#
#   1. Reguliarios iðraiðkos ir regexp:
#      * regexp ir jø panaudojimo galimybës
#      * reguliariø iðraiðkø standartai
#
#   2. BRE standarto reguliarios iðraiðkos:
#      * bazinio regexp standarto metasimboliai
#
#   3. ERE standarto reguliarios iðraiðkos:
#      * iðplëstinio regexp standarto metasimboliai
#      * þodþio ribos nustatymas
#
#   4. POSIX simboliø klasës:
#      * valdymo simboliai
#      * sutrumpinti simboliø klasiø paþymëjimai
#      * POSIX klasës ir jø hierarchija
#


# PASTABOS ------------------------------

#
# Paminëti apie lazy matching.
# Paraðyti apie ekranavimà su \Q ir \E.
# Reikia skyrelio apie PERL reg. iðraiðkas.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# REGULIARIOS IÐRAIÐKOS IR REGEXP         #
# --------------------------------------- #

# Vienoje ið teorinës informatikos srièiø, formaliø kalbø teorijoje, sakoma, kad 
# kalba yra reguliari, jeigu ji apraðoma reguliariomis iðraiðkomis. Tokiu atveju 
# kalba suprantama, kaip tam tikrø þodþiø aibë. Ið kitos pusës, norint nustatyti, 
# ar þodis priklauso tam tikrai kalbai, gali bûti naudojami baigtiniai automatai. 
# Tokiu bûdu susiejamos reguliarios iðraiðkos, reguliarios kalbos bei baigtiniai 
# automatai.

# Praktikoje reguliarios iðraiðkos apibrëþiamos þymiai paprasèiau. Galima sakyti,
# kad reguliari iðraiðka - tai pagal tam tikras taisykles uþraðyta simboliø seka, 
# kuri apraðo tam tikros simboliø sekø aibës ðablonà (pattern).

# Bet kurios kalbos tekstas yra simboliø seka. Kokie simboliai naudojami tekste,
# priklauso nuo kalbos. Natûralios kalbos tekstas sudarytas ið raidþiø, skyrybos
# þenklø ir skaitmenø. Programavimo kalbø tekstai uþraðomi naudojant tuos paèius
# simbolius. Kai kuriø kalbø raðto simboliai mums labai neáprasti, pvz., graikø,
# armënø, gruzinø, arabø, japonø, korëjieèiø. Apie kai kurias dabar jau mirusias 
# kalbas þinome tik todël, kad iðliko tomis kalbomis uþraðyti tekstai. Tuo paèiu
# tokios senovës civilizacijø kalbos, kaip ðumerø ar egiptieèiø, iðsaugojo savo, 
# daþnai egzotiðkà, raðto sistemà. Pavyzdþiui, gerai þinomas dantiraðtis, runos,
# egiptietiðki hieroglifai. Raðto sistema reikalinga ne tik þodinei informacijai
# uþraðyti ir perduoti. Pvz., natos -- tai muzikiniam tekstui uþraðyti naudojama 
# þenklø sistema. Taigi, bet kurios kalbos tekstas yra simboliø seka.

# Áprasta sakyti, kad natûralios kalbos tekstà sudaro tarpais ir kitais skyrybos 
# þenklais atskirti þodþiai, bet, kaip teksto dalis, þodis taip pat yra simboliø 
# seka. Atsiþvelgiant á tai, galima suformuluoti paprastesná reguliariø iðraiðkø 
# apibrëþimà. Taigi, reguliari iðraiðka --- tai tekstinis ðablonas, kuris apraðo 
# tam tikrø þodþiø aibæ. Toká ðablonà galima panaudoti þodþiø paieðkai ar teksto
# redagavimui. Pavyzdþiui, tekste reikia surasti þodþius, kurie:
#
#   -- prasideda raide "a";
#   -- prasideda raide "a" arba "A";
#   -- prasideda raide "A", o baigiasi galûne "as";
#   -- prasideda ið didþiosios raidës (bet kurios);
#   -- sudaryti vien ið didþiøjø raidþiø;
#   -- sudaryti ið penkiø raidþiø;
#   -- turi dvibalsá "uo";
#   -- turi bet koká dvibalsá.

# Tokius þodþiø ðablonus galima panaudoti klaidø þodþiuose paieðkai ir taisymui,
# o taip pat ir kitokiems teksto redagavimams. Pavyzdþiui, reikia atlikti tokius
# veiksmus:
#
#   -- visame tekste þodá "irba" pakeisti á þodá "arba";
#   -- surasti tekste dvigubus tarpus "  " ir pakeisti juos á viengubus " ";
#   -- visame tekste simbolá "\" pakeisti á "/";
#   -- surasti tekste visas simboliø sekas, kurios yra el. paðto adresas;
#   -- patikrinti, ar ávesta simboliø seka yra data.

# Tokias teksto paieðkos ir pakeitimo galimybes turi visos specializuotos teksto 
# redagavimo programos, pavyzdþiui, vim, emacs, gedit, Light Table, Sublime Text,
# Lime Text, Atom, Notepad++ ir daugelis kitø. Reguliarios iðraiðkos reikalingos
# ir darbui su failais. Pavyzdþiui, reikia:
#
#   -- surasti failus, kuriø pavadinime yra data;
#   -- surasti failus, kuriø iðplëtimas "txt";
#   -- surasti failus su iðplëtimu "txt" ir pakeisti á iðplëtimà "dat";
#   -- surasti failus su iðplëtimu "R", kuriø viduje yra þodis "plot";
#   -- iðtrinti visus failus, kuriø pavadinimas prasideda raide "a".


# PASTABA. Ðiuo metu priimta reguliariomis iðraiðkomis vadinti panaðø, taèiau ið
# esmës visiðkai skirtingà dalykà -- regex. Kaip ir reguliarios iðraiðkos, regex
# naudojamos simboliø sekø apraðymui, taèiau, skirtingai nuo reguliariø iðraiðkø, 
# jau neapraðo reguliariø kalbø. Dabar egzistuoja trys reg. iðraiðkø standartai:
# 
#        BRE -- Basic Regular Syntax,
#        ERE -- Extended Regular Expression,
#        SRE -- Simple Regular Expressions (nebenaudojamas),
#       PCRE -- Perl Compatible Regular Expressions.

# Toliau tekste laikysimës neteisingos tradicijos ir regex arba regexp iðraiðkas 
# taip pat vadinsime reguliariomis iðraiðkomis.


# --------------------------------------- #
# BRE STANDARTO REGULIARIOS IÐRAIÐKOS     #
# --------------------------------------- #

# Reguliariai iðraiðkai uþraðyti naudojami simboliai skirstomi á dvi grupes: tai
# simboliai bei metasimboliai. Simboliai reguliarioje iðraiðkoje iðreiðkia patys 
# save, o skirtingø metasimboliø paskirtis skiriasi: vieni jø naudojami simboliø 
# grupavimui, kiti gali reikðti simboliø grupæ ir t. t. Standartinæ metasimboliø
# aibæ sudaro ðie simboliai:
#
#                        [ ] ( ) { } \ / ^ $ . * | ?  +
#
# Metasimboliø aibës skirtinguose reguliariø iðraiðkø standartuose skiriasi, bet 
# didþioji dalis jø yra tie patys.

# Jei metasimbolis iðraiðkoje turi bûti panaudojamas kaip paprastas simbolis, já 
# bûtina ekranuoti (uþmaskuoti). Ðiam tikslui naudojamas simbolis "\", kuris yra
# raðomas prieð maskuojamà metasimbolá. 

# PASTABA. Tabuliacijos þenklas "\t", ávairûs valdymo simboliai, simboliø klasës
# uþraðomos naudojant simbolá "\". Kadangi jis pats yra metasimbolis, iðraiðkose
# já patá reikia ekranuoti, todël raðome ne "\", bet "\\".

# PASTABA. Bazinis reguliariø iðraiðkø standartas BRE reikalauja, kad skliaustai
# () ir {}, kurie uþraðant reg. iðraiðkà naudojami kaip metasimboliai, turi bûti 
# raðomi atitinkamai \(, \), \[ ir \], prieðingu atveju jie interpretuojami kaip
# áprasti skliaustø simboliai. Iðplëstiniame standarte ERE yra prieðingai -- èia
# skliaustai () ir [] yra metasimboliai, o jø ekranuotos versijos \(, \), \[, \] 
# interpretuojamos kaip áprasti skliaustø simboliai. Ðiame tekste reg. iðraiðkas 
# raðysime laikydamiesi ERE standarto.


# [ ]
#
# Lauþtiniai skliaustai nurodo bet kurá vienà tuose skliaustuose áraðytà simbolá. 
# Pavyzdþiui, iðraiðka "[abc]" nurodo raidæ "a", "b" arba "c". Ið eilës einanèiø
# raidþiø sekà galima uþraðyti kompaktiðkai -- áraðome brûkðneliu atskirtà pirmà 
# ir paskutinæ sekos raidæ. Tokiu atveju brûkðnelis tik nurodo ið eilës einanèiø
# simboliø intervalà ir kaip simbolis "-" netraktuojamas. Pvz., iðraiðka "[a-z]" 
# nurodo bet kurià maþàjà lotyniðkos abëcëlës raidæ. Galima nurodyti keletà sekø 
# ið karto. Pvz., "[a-zA-Z]" nurodo bet kurià maþàjà ar didþiàjà abëcëlës raidæ. 
# Jeigu tarp nurodytø simboliø turi bûti "-", tada jis lauþtiniuose skliaustuose 
# raðomas arba pirmas, arba paskutinis, pvz., "[-abc]" arba "[abc-]". Jeigu tarp
# iðvardintø simboliø turi bûti "]" ar "[", tai jis skliaustuose raðomas pirmas. 
# Pavyzdþiui, "[[abc]" nurodo raidæ "a", "b", "c" ir simbolá "[". Pateiksime dar 
# keletà pavyzdþiø:
#
#        [a-cx-z]" -- nurodo vienà ið raidþiø "a", "b", "c", "x", "y", "z";
#     "[blr]ankas" -- atitinka þodþius "bankas", "lankas" ir "rankas";
#          "[0-9]" -- nurodo bet kurá vienà skaitmená;
#            "[[]" -- nurodo tik simbolá "[";
#           "[][]" -- nurodo simbolá "]" arba "[";
#           "[[]]" -- jei reikia gauti "]" arba "[", tada uþraðyta neteisingai.


# [^ ]
#
# Lauþtiniai skliaustai, kuriuose prieð simbolius áraðytas simbolis "^", reiðkia
# bet koká simbolá, iðskyrus tuos, kurie iðvardinti skliaustuose. Pvz., "[^abc]"
# reiðkia bet koká simbolá, iðskyrus "a", "b", "c". Jeigu simbolis "^" turi bûti 
# interpretuojamas kaip simbolis, jis skliaustuose raðomas ne pirmas. Pateiksime
# ðiuos pavyzdþius:
#
#           "[^x]" -- nurodo bet koká simbolá, iðskyrus raidæ "x";
#         "[^a-z]" -- nurodo bet koká simbolá, iðskyrus maþàjà raidæ;
#         "[^0-9]" -- nurodo bet koká simbolá, iðskyrus skaitmenis;
#        "[^-0-9]" -- bet koks simbolis, iðskyrus skaitmená ir brûkðnelá;
#         "[0-9^]" -- nurodo bet kurá skaitmená arba simbolá "^".


# ( )
#
# Skliaustai reguliariose iðraiðkose naudojami simboliø grupavimui ir operatoriø 
# veiksmø tvarkai pakeisti. Simboliø seka, kuri atitinka apskliaustà reguliarios
# iðraiðkos dalá -- blokà, gali bûti pakartotinai áraðoma naudojant konstrukcijà
# \n. Tokiu bûdu uþraðomos simboliø sekos su pasikartojimais.


# \n
#
# Konstrukcija \n nurodo n-àjá blokà. Èia n nurodo sveikàjá skaièiø nuo 1 iki 9.
# Kiekvienas blokas reguliarioje iðraiðkoje gali bûti panaudojamas keletà kartø.
# PASTABA. Ðioje konstrukcijoje simbolá "\" reikia ekranuoti. Pavyzdþiui:
#
#      "(abc)-\\1" -- nurodo sekà "abc-abc";
#    "(a)[0-9]\\1" -- nurodo sekas "a0a", "a1a", "a2a" ir t.t.;
#    "([a-z])-\\1" -- nurodo sekas "a-a", "b-b" ir t.t.


# {m,n}
#
# Ði konstrukcija naudojama simboliø pasikartojimø skaièiui nurodyti. Egzistuoja
# keli jos uþraðymo variantai:
#
#              {n} -- simbolis pakartojamas n kartø;
#             {m,} -- simbolis pakartojamas ne maþiau, kaip m kartø;
#            {m,n} -- simbolis pakartojamas nuo m iki n kartø.
#
# Pateiksime keletà paprasèiausiø pavyzdþiø:
#
#           "a{3}" -- nurodo sekà "aaa";
#         "a{1,3}" -- nurodo sekas "a", "aa" ir "aaa";
#         "0{1,}1" -- nurodo sekas "01", "001", "0001" ir t.t.
#
# Pakartojimø skaièiø galima nurodyti ne tik atskiram simboliui, bet ir simboliø 
# grupei (blokui) arba visai simboliø klasei. Keletas sudëtingesniø pavyzdþiø:
#
#       "(xy){1,}" -- sekos, kuriose pora "xy" pasirodo bent vienà kartà;
#      "[xy]{4,5}" -- sekos, kuriose "x" ar "y" pasirodo 4 ar 5 kartus ið eilës;
#  "([abc]{2})\\1" -- sekos, kuriose 2 kartus pasikartoja bet kuri raidþiø pora.


# .
#
# Taðkas reguliariose iðraiðkose þymi bet koká vienà simbolá -- bet kurià raidæ,
# bet kurá skaitmená, skyrybos þenklà ir t.t. Lauþtiniuose skliaustuose áraðytas 
# taðkas interpretuojamas kaip "." simbolis. Pavyzdþiui:
#
#         ".ankas" -- atitinka þodþius "bankas", "tankas", "lankas" ir t.t.;
#          "[a.c]" -- atitinka raides "a", "c" ir taðkà ".";
#       ".*[.]txt" -- atitinka failø su iðplëtimu ".txt" pavadinimus.


# *
#
# Simbolis "*" reguliariose iðraiðkose --- tai operatorius Klini þvaigþdë. Prieð 
# já stovinèio simbolio sekoje gali nebûti visai arba jis gali pasikartoti vienà, 
# du ar daugiau kartø. Klini þvaigþdæ galima pritaikyti ir simboliø blokui. Pvz.:
#
#             "a*" -- nurodo tuðèià sekà "" arba "a", "aa", "aaa", ...
#           "ab*c" -- nurodo sekas "ab", "abc", "abbc", ...
#          "(ab)*" -- nurodo tuðèià sekà "", "ab", "abab", "ababab", ...
#          "[ab]*" -- nurodo bet kokio ilgio sekas sudarytas ið "a" ir "b";
#             ".*" -- nurodo bet kokio ilgio sekas ið visø ámanomø simboliø.


# ^
#
# Simbolis "^" reguliarioje iðraiðkoje nurodo tai, kad seka yra simboliø eilutës
# pradþioje. Pavyzdþiui:
#
#           "^abc" -- atitinka sekà "abc ...", bet neatitinka sekos "... abc";
#       "^[A-Z].*" -- bet kokio ilgio sekos ið didþiosios raidës sekos pradþioje;
#   "^[A-Z][a-z]*" -- ið didþiosios raidës prasidedantys þodþiai sekos pradþioje.


# $
#
# Simbolis "$" reguliarioje iðraiðkoje nurodo tai, kad seka yra simboliø eilutës
# gale. Pavyzdþiui:
#
#          ".*as$" -- bet kokio ilgio simboliø sekos su galûne "as" sekos gale;
#         ".*[.]$" -- bet kokio ilgio simboliø sekos su taðku sekos gale;
#     "^[0-9]{6}$" -- bet kokie ðeðiaþenkliai kodai.


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite reguliarià iðraiðkà, kuri atitinka simbolá "\". Pakeiskite gautà
#    iðraiðkà taip, kad ji atitiktø du greta stovinèius simbolius "\".
# 2. Uþraðykite reguliarià iðraiðkà, kuri simboliø sekoje surastø simbolá "/" ar 
#    "\". Pakeiskite iðraiðkà taip, kad ji atitiktø bet kokià ðiø simboliø porà.
# 3. Uþraðykite reguliarià iðraiðkà, atitinkanèià bet kokio ilgio þodþius, kuriø 
#    pirmoji ir paskutinë raidës sutampa. Pavyzdþiui, "àþuolà", "sausas" ir t.t. 
#    Atkreipkite dëmesá, kad simboliø sekoje yra tik tas þodis ir nieko daugiau.
# 4. Daugtaðkis -- skyrybos þenklas (ellipsis), kuris nurodo nutylëtà mintá arba 
#    praleista tekstà. Gali bûti þymimas trimis ið eilës einanèiais taðkais arba 
#    specialiu simboliu, kurio kodas Alt + 0133. Uþraðykite reg. iðraiðkà, kurià
#    atitinka daugtaðkis "..." bet kurioje teksto vietoje.
# 5. Palindromas -- tai tokia simboliø seka, kuri skaitoma vienodai ið kairës ir
#    ið deðinës, pavyzdþiui, "savas". Uþraðykite tokià reguliarià iðraiðkà, kuri 
#    bet kur tekste atpaþintø palindromus sudarytus ið 4 maþøjø raidþiø.
# 6. Uþraðykite reguliarià iðraiðkà palindromui ið 5 skaitmenø atpaþinti. Be to,
#    pirmas skaitmuo (vadinasi -- ir paskutinis) negali bûti nulis.
# 7. Paprastai failo vardas susideda ið 2 daliø, kurios atskirtos taðku. Antroji 
#    dalis vadinama failo iðplëtimu. Windows OS failo pavadinime negali bûti ðiø 
#    simboliø: \ / : * ? " < > ir |. Uþraðykite tokià reguliarià iðraiðkà, kurià 
#    atitinka korektiðki failø vardai su iðplëtimu ið dviejø arba trijø raidþiø.
#    Pastaba. Simboliø sekoje be failo vardo daugiau neturi bûti jokiø papildomø
#    simboliø.


# --------------------------------------- #
# ERE STANDARTO REGULIARIOS IÐRAIÐKOS     #
# --------------------------------------- #

# BRE standartas numato tik ðiuos metasimbolius. ERE reg. iðraiðkø standarte yra
# naudojami dar trys metasimboliai. Taèiau ERE standarte nëra konstrukcijos "\n",
# kuri teoriðkai nereguliari, bet dël standartø suderinamumo jà vis dëlto galima 
# naudoti.


# |
#
# Simbolis "|" yra aibiø sàjungos operatorius (alternation). Jis nurodo simbolá, 
# kuris stovi prieð já arba uþ jo. Aiðku, ðá operatoriø galima pritaikyti ne tik 
# atskiriems simboliams, bet ir simboliø grupei (blokui) arba net visai simboliø 
# klasei. Pavyzdþiui:
#
#            "a|e" -- atitinka raidæ "a" arba "e";
#      "gray|grey" -- atitinka þodá "gray" arba "grey";
#      "R(i|o)mas" -- atitinka vardà "Rimas" arba "Romas";
#    "(xx|yy)-\\1" -- atitinka sekà "xx-xx" arba "yy-yy", bet ne "xx-yy".
#
# PASTABA. Jei alternatyva yra tik tarp dviejø simboliø, tada geriau yra naudoti 
# konstrukcijà su lauþtiniais skliaustais. Perraðysime ankstesnius pavyzdþius:
#
#           "[ae]" -- atitinka raidæ "a" arba "e";
#        "gr[ae]y" -- atitinka þodá "gray" arba "grey";
#       "R[io]mas" -- atitinka vardà "Rimas" arba "Romas".


# ?
#
# Metasimbolis "?" nurodo, kad prieð já stovintis simbolis pasikartoja nulá arba
# vienà kartà, t. y. simbolis arba yra, arba jo nëra. Operatoriø taip pat galima
# pritaikyti simboliø grupei (blokui) arba simboliø klasei. Pavyzdþiui:
#
#           "ab?c" -- atitinka sekas "ac" ir "abc";
#       "p?laukai" -- atitinka þodþius "laukai" ir "plaukai";
# "(nu|á|ið)?eiti" -- atitinka þodþius "eiti", "nueiti", "áeiti", "iðeiti".
#
# PASTABA. Formaliø kalbø teorijos poþiûriu ðis operatorius yra perteklinis, nes 
# já galima iðreikðti standartinëmis priemonëmis: "a?" = "(a|e)", kur simbolis e 
# þymi tuðèià sekà "".


# +
#
# Reguliariose iðraiðkose metasimbolis "+" nurodo, kad prieð já esantis simbolis 
# arba simboliø grupë sekoje pasirodo bent vienà kartà. Pavyzdþiui:
#
#             "-+" -- nurodo sekas "-", "--", "---", ... 
#            "0+1" -- nurodo sekas "01", "001", "0001", ...
#          "x\\+y" -- metasimbolis "+" ekranuotas, todël gauname sekà "x+y";
#         "(cha)+" -- nurodo sekas "cha", "chacha", "chachacha", ...
#       "k_[0-9]+" -- nurodo sekas "k_0", "k_5", "k_42", "k_1579" ir pan;
#   "[0-9]+[a-z]+" -- sekos, kuriose pirma pusë ið skaitmenø, o kita ið raidþiø;
# "([a-z]{2})\\1+" -- nurodo sekas su bet kokios raidþiø poros pasikartojimu.
#
# PASTABA. Ðá operatoriø galima iðreikðti per Klini operatoriø. Pavyzdþiui, "a+"
# apraðo tokias paèia sekas kaip ir reguliari iðraiðka "aa*".


# NAUDINGA ------------------------------

# Metasimbolius "^" ir "$" áraðome tais atvejais, kai reguliarià iðraiðkà reikia 
# patikslinti, kad ið visø jà atitinkanèiø simboliø sekø bûtø atrenkamos tik tos, 
# kurios yra eilutës pradþioje arba jos gale.

# ERE standartas numato dar vienà reg. iðraiðkos lokalizacijos metodà --- þodþio 
# riba. Þodþio riba tai tokia simboliø sekos vieta, kurià ið kairës arba deðinës 
# pusës riboja tarpo simbolis. Analogiðkai galima nurodyti simboliø sekos vietà,
# kuri nëra þodþio riba. Tam naudojamos \b ir \B konstrukcijos. Panaðiai taikoma
# konstrukcija \< arba \>, kuri nurodo tuðèià sekà þodþio pradþioje arba jo gale.


# \b ir \B
#
# ERE standarto reg. iðraiðkose konstrukcija \b nurodo þodþio ribà. Priklausomai
# nuo to, kurioje iðraiðkos pusëje ji bus raðoma, galima nurodyti þodþio pradþià 
# arba jo pabaigà. Pavyzdþiui:
#
#          "as\\b" -- atitinka þodþio galûnæ "as";
#          "\\bas" -- atitinka þodþio pradþià "as";
#       "\\bir\\b" -- atitinka þodá "ir", bet neatitinka "asiras" ar "Airija".
#
# Konstrukcija \B prieðingai -- nurodo, kad reguliarià iðraiðkà atitinkanti seka
# yra ne þodþio riboje. Galima nurodyti, kad ieðkoma simboliø seka bûtø grieþtai 
# þodþio viduje. Pateiksime ðiuos pavyzdþius:
#
#          "\\Buo" -- "uo" kairëje turi bûti ne þodþio riba: "vanduo", "duona";
#          "uo\\B" -- "uo" deðinëje turi bûti ne þodþio riba: "uoga", "duona";
#       "\\Buo\\B" -- raidþiø junginys "uo" þodþio viduje, pvz., "duona".


# NAUDINGA ------------------------------

# Istoriðkai tekstiniuose failuose buvo áraðomi ávairûs valdymo simboliai, kurie
# neturi grafinës iðraiðkos ir naudojami ávedimo ir iðvedimo árenginiø valdymui. 
# Pavyzdþiui, komanda CR gràþina kursoriø á eilutës pradþià, komanda LF kursoriø
# perkelia á kità eilutæ, komanda BS gràþina kursoriø per vienà simbolá atgal, o
# komanda BEL reiðkia garso signalà. Ðiuo metu tokiems tikslams naudojamos kitos
# priemonës, todël didþioji dalis valdymo simboliø nenaudojami. POSIX standartas
# numato aðtuonis privalomus valdymo simbolius: \0, \a, \b, \t, \n, \v, \f ir \r.

# Reguliariose iðraiðkose kartu su simboliais, metasimboliais galima nurodyti ir
# valdymo simbolius. Jø sàraðas toks:
#
#           \t -- HT, horizontal tabulation;
#           \v -- VT, vertical tabulation (R nepalaiko);
#           \r -- CR, carriage return;
#           \n -- LF, line feed;
#           \f -- FF, form feed;
#           \a -- BEL, bell character;
#           \e -- ESC, escape character;
#           \b -- BS, backspace (R nepalaiko).


# Praktikoje daþnai naudojamas tabuliacijos þenklas "\t". Pavyzdþiui, tokiu bûdu
# tekstiniame faile galima atskirti duomenø stulpelius. Nuskaitant duomenø failà
# bûtina nurodyti, kad stulpeliai atskirti tabuliacija. Funkcija read.table turi
# specialø parametrà sep, kuriam tokiu atveju priskiriamas valdymo simbolis "\t".
# Pavyzdþiui, sukursime virtualø tekstiná failà, kur reikðmës eilutëse atskirtos 
# tabuliacijos þenklu. Prie tokio failo jungiamës naudojant f-jà textConnection.

f <- "X1\tX2\tX3
      11\t12\t13
      21\t22\t23
      31\t32\t33
      41\t42\t43"

d <- read.table(file = textConnection(f), header = TRUE, sep = "\t")
d

# Perkëlimo á kità eilutæ simbolis "\n" reikalingas iðvedant praneðimus á ekranà
# ar tekstiná failà. Pavyzdþiui, jei praneðimas iðvedamas á konsolæ, bet jo gale
# nëra perkëlimo á kità eilutæ simbolio, tai kursorius lieka eilutës gale. Tokiu
# atveju sekantis praneðimas bus iðvedamas toje paèioje eilutëje. Palyginsime du
# atvejus. Pirmuoju atveju kursorius neperkeliamas, kitu atveju --- perkeliamas.

for (i in 0:9) cat(i)
for (i in 0:9) cat(i, "\n")


# UÞDUOTIS ------------------------------ 

# 1. Uþraðykite tokià reguliarià iðraiðkà, kurià atitinka teigiami arba neigiami 
#    sveikieji skaièiai. Pirmas skaitmuo negali bûti nulis, iðskyrus atvejá, kai
#    pats skaièius yra nulis.
# 2. Sudarykite tokià reguliarià iðraiðkà, kuri atpaþintø 2 brûkðneliu atskirtas 
#    skaitmenø grupes, kuriose yra nuo 1 iki 3 skaitmenø, taèiau pirmas skaitmuo
#    negali bûti nulis. Be to, antrosios grupës gale gali bûti arba nebûti viena 
#    maþoji raidë. Pavyzdþiui, "15-2", "11-424a".
# 3. Interneto puslapio adresas prasideda "http://" arba "https://". Atkreipkite 
#    dëmesá, kad simboliø seka skiriasi tik raide "s", kuri arba yra, arba nëra.
#    Uþraðykite ðias sekas atitinkanèià reguliarià iðraiðkà.
# 4. Tarkime, kad sakinio pabaigà tekste nurodo taðkas, daugtaðkis, ðauktukas ir 
#    klaustukas. Jei sakinys ne paskutinis, tada uþ skyrybos þenklo dedamas bent 
#    vienas tarpo simbolis " ", po kurio seka þodis ið didþiosios raidës. Reikia
#    uþraðyti reguliarià iðraiðkà sekos ið skyrybos þenklø sakinio gale radimui.
# 5. Pakeiskite ankstesnëje uþduotyje sudarytà reg. iðraiðkà atsiþvelgdami á tai,
#    kad sakinys gali ir pasibaigti, ir prasidëti ne tik raide, bet ir skaièiumi.
# 6. Uþraðykite reguliarià iðraiðkà, kuri atitinka pagal ðias taisykles sudarytà
#    simboliø sekà --- kodas ið 3 maþøjø raidþiø sekos pradþioje, tada dvitaðkiu 
#    atskirti vienas ar daugiau kableliu atskirtø (sveikøjø) skaièiø. Pavyzdþiui,
#    "fvt:4", "drm:1,5", "uvr:3,8,10,11,12" ir panaðiai.
# 7. Uþraðykite reguliarià iðraiðkà, kurià atitinka kodas ið trijø raidþiø sekos 
#    pradþioje, uþ kurio yra dar vienas ar keli kableliu atskirti trijø raidþiø 
#    kodai. Pavyzdþiui, "rts-neu", "kit-oft,ort" ir panaðiai.


# --------------------------------------- #
# POSIX IR KITOS SIMBOLIØ KLASËS          #
# --------------------------------------- #

# Iki ðiol reguliarios iðraiðkos buvo uþraðomos naudojant atskirus simbolius bei
# metasimbolius. Simbolius galima apjungti á grupæ ir taip kompaktiðkai uþraðyti
# tam tikrà simboliø aibæ. Pavyzdþiui, iðraiðka "[a-z]" reiðkia bet kurià maþàjà 
# abëcëlës raidæ, "[A-Z]" -- bet kurià didþiàjà raidæ ir t.t. Daþnai naudojamoms 
# simboliø klasëms egzistuoja sutrumpinti paþymëjimai:
#
#           \d -- skaitmenys, [0-9];
#           \D -- bet koks simbolis, iðskyrus skaitmenis, [^\d];
#           \w -- raidës, skaitmenys ir simbolis "_", [A-Za-z0-9_];
#           \W -- bet koks simbolis, iðskyrus raides, skaitmenis ir "_";
#           \s -- tarpas, tabuliacija, kiti atskyrimo simboliai, [ \t\v\r\n\f];
#           \S -- bet koks ne tarpo, tabuliacijos ar atskyrimo simbolis, [^\s].


# Neretai simboliø intervalas priklauso nuo lokalizacijos. Pavyzdþiui, lotyniðka
# abëcëlë turi 26 raides, o lietuviðkoje abëcëlëje yra 32 raidës. Taigi, raidþiø
# aibë nusakoma nevienareikðmiðkai, nes priklauso nuo naudojamos abëcëlës. POSIX 
# standartas suvienodino kai kuriø simboliø klasiø paþymëjimus:
#
#    [:lower:] -- maþosios abëcëlës raidës;
#    [:upper:] -- didþiosios abëcëlës raidës;
#    [:alpha:] -- didþiosios ir maþosios raidës: [:lower:] ir [:upper:];
#    [:digit:] -- skaitmenys: 0 1 2 3 4 5 6 7 8 9;
#    [:alnum:] -- visos abëcëlës raidës ir skaitmenys: [:alpha:] ir [:digit:];
#    [:punct:] -- ávairûs skyrybos þenklai;
#    [:graph:] -- visi raðto þenklai: [:alnum:] ir [:punct:];
#    [:blank:] -- tarpo ir tabuliacijos simboliai: [ \t];
#    [:space:] -- tarpas, tabuliacija, kiti atskyrimo simboliai, (whitespace);
#    [:print:] -- spausdinami simboliai: [:alnum:], [:punct:] ir [:space:];
#    [:cntrl:] -- valdymo simboliai, tarp jø yra ir ðie: [\v\r\n\f];
#   [:xdigit:] -- ðeðioliktainiai skaitmenys.


# Skyrybos þenklø klasë [:punct:] turi visus simbolius, kurie nëra skaitmenys ar
# didþiosios ir maþosios raidës. Á jà patenka ir metasimboliai. Visa aibë atrodo
# taip:
#        ! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [ ] \ ^ _ ` { } | ~         
#
# Atskirai galima paminëti klasæ [:space:]. Jà sudaro simboliai, kurie naudojami
# kitø simboliø atskyrimui. Áprastas tarpo simbolis " " naudojamas þodþiø tekste 
# atskyrimui. Èia þodis suprantamas apibendrintai, juo gali bûti ir viena raidë, 
# skaièius ir bet kokia kita simboliø seka. Kitas tarpo simbolis -- tabuliacija.
# Tabuliacijos þenklas simboliø sekoje nurodo, kad kursorius turi bûti perkeltas
# á deðinæ pusæ iki artimiausios tabuliacijos pozicijos, kurios iðdëstytos kas 8, 
# 4 ar 2 simbolius. Tokiu bûdu tabuliacijos þenklas panaudojamas teksto eilutëje 
# iðlyginimui. Tarpo ir tabuliacijos simboliai apjungti á vienà klasæ [:blank:]. 
# Taèiau simboliams atskirti naudojami ir kiti simboliai: vertikali tabuliacija,
# kursoriaus gràþinimo á eilutës pradþià, perkëlimo á naujà eilutæ bei perkëlimo
# á naujà puslapá simboliai. Visi jie yra valdymo simboliai ir þymimi \v, \r, \n 
# ir \f. Ðie simboliai kartu su tarpu bei horizontalia tabuliacija sudaro bendrà
# atskyrimo simboliø (whitespace) klasæ [:space:]. Ðie simboliai tekste nematomi,
# taèiau uþima tam tikrà vietà.


# Galima pastebëti, kad vienos simboliø klasës gaunamos apjungiant kitas klases.
# Tokiu bûdu gauname tam tikrà klasiø hierarchijà, kurià galima atvaizduoti ðtai
# tokia dendrograma:
#
#    [:lower:] --+
#                +-- [:alpha:] --+
#    [:upper:] --+               |
#                                +-- [:alnum:] --+
#    [:digit:] ------------------+               |
#                                                +-- [:graph:] --+
#    [:punct:] ----------------------------------+               |
#                                                                +-- [:print:]
#    [:blank:] --+                                               |
#                +-- [:space:] ----------------------------------+
#   [\v\r\n\f] --+


# Lauþtiniai skliaustai yra POSIX simboliø klasës pavadinimo dalis. Jeigu reikia
# apjungti kelias klases arba vienà POSIX klasæ papildyti kitais simboliais, tam
# naudojame lauþtinius skliaustus [ ], kuriuose áraðome pilnà klasës pavadinimà.
# Pavyzdþiui, klasæ [:alpha:] gauname kaip [[:lower:][:upper:]], klasë [:space:] 
# gali bûti uþraðoma kaip [[:blank:]\v\r\n\f].


# Uþraðysime keletà reguliariø iðraiðkø naudojant sutrumpintus arba POSIX klasiø 
# pavadinimus. Pavyzdþiui:
#
#             "\\s+" -- atitinka bet kokio ilgio tarpo simboliø sekà;
#           "k_\\d+" -- nurodo sekas "k_0", "k_5", "k_42", "k_1579" ir pan;
#     "[:alpha:]{4}" -- atitinka þodþius ið bet kokiø keturiø raidþiø;
#         "-?0,\\d+" -- atitinka realiuosius skaièius nuo -0,999... iki 0,999...


# UÞDUOTIS ------------------------------ 

# 1. Reguliarià iðraiðkà "^[0-9]+$" perraðykite panaudojant POSIX simboliø klasæ
#    ir sutrumpintà skaitmenø aibës pavadinimà.    
# 2. Uþraðykite tokià reguliarià iðraiðkà, kuri surastø vienà arba daugiau tarpo 
#    ar tabuliacijos simbolá simboliø sekos pradþioje ar pabaigoje. Tà paèià reg.
#    iðraiðkà uþraðykite panaudojant tinkamà POSIX simboliø klasæ.
# 3. Uþraðykite reguliarià iðraiðkà, kurià atitinka gif, jpg, jpeg, png grafiniø
#    failø pavadinimai. Tarkime, kad vardà sudaro tik raidës, skaitmenys ir "_".
#    Pavyzdþiui, "DSC_46290.jpg", "DHUfv0w.png" ir panaðiai. Atkreipkite dëmesá, 
#    kad simboliø sekoje yra tik failo vardas ir nieko daugiau nei priekyje, nei
#    gale. Iðraiðkai uþraðyti panaudokite POSIX ar sutrumpintà tinkamos simboliø 
#    aibës pavadinimà.


#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Grafiniai árenginiai ir jø valdymas.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2015-03-07 | 2015-03-23
#


# TURINYS -------------------------------

#
#   1. Trumpai apie grafinius árenginius:
#      * Devices
#
#   2. Grafiko braiþymas kompiuterio ekrane:
#      * windows
#      * x11
#      * X11
#      * win.graph
#      * win.metafile
#      * win.print
#
#   3. Grafiko iðsaugojimas á vektorinës grafikos failà:
#      * pdf
#      * postscript
#
#   4. Grafiko iðsaugojimas á rastrinës grafikos failà:
#      * png
#      * bmp
#      * jpeg
#      * tiff
#
#   5. Grafiniø árenginiø valdymas:
#      * dev.new
#      * dev.list
#      * dev.cur 
#      * dev.set
#      * dev.size
#      * dev.off 
#      * graphics.off
#
#   6. Grafikø ekrane iðsaugojimas ir atkartojimas:
#      * savePlot
#      * recordPlot
#      * replayPlot
#


# PASTABOS ------------------------------

#
# Sugalvoti uþdaviniø.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviðka lokalë. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Iðtrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# TRUMPAI APIE GRAFINIUS ÁRENGINIUS       #
# --------------------------------------- #

# Grafiko atvaizdavimui naudojamas grafinis árenginys. Tai gali bûti kompiuterio 
# ekranas, spausdintuvas arba kokio nors tipo grafinis failas, pvz., pdf, png ir 
# dar keletas kitø. Visø R kalboje naudojamø grafiniø árenginiø sàraðas:

?Devices

# Jei nenurodyta kitaip, aukðto lygio grafinës f-jos grafikà atvaizduoja ekrane,
# o já atitinkanèio árenginio pavadinimas priklauso nuo operacinës sistemos:
# 
#    windows -- MS Windows
#        X11 -- Unix arba Linux
#     quartz -- OS X


# Naudojant kitokius grafinius árenginius, grafikà galima iðsaugoti á failà. Tai 
# gali bûti rastrinës arba vektorinës grafikos tipo failai:
#           ---------      ----------
#           bmp            pdf   
#           gif            postscript
#           jpeg           svg
#           tiff
#           png


# --------------------------------------- #
# GRAFIKO BRAIÞYMAS KOMPIUTERIO EKRANE    #
# --------------------------------------- #

# MS Windows operacinëje sistemoje grafiná langà kompiuterio ekrane atidaro f-ja
# windows. Pagrindiniai jos parametrai yra tokie:
#
#      width -- grafinio lango plotis coliais,
#     height -- grafinio lango aukðtis coliais,
#    rescale -- taisyklë, pagal kurià nustatomas grafiko mastelis,
#  pointsize -- taðko dydis, 
#         bg -- grafiko fono spalva,
#     canvas -- grafinio lango pagrindo spalva,
#       xpos -- pradinës lango pozicijos ekrane koordinatë x,
#       ypos -- pradinës lango pozicijos ekrane koordinatë y,
#      title -- grafinio lango pavadinimas,
#     family -- ðrifto ðeima,
#  antialias -- ðrifto glodinimo metodas.


# Jeigu nenurodomas joks parametras, funkcija windows atidaro 7 x 7 coliø dydþio
# standartiná grafiná langà. Tuo galima ásitikinti patikrinus grafinio parametro
# din reikðmæ.

windows()
par("din")

# Grafinio lango dydis nustatomas per parametrus width ir height. Pvz, sukursime
# 8 x 4 coliø dydþio grafiná langà ir jame nubraiþysime f-jos y = sin(x) grafikà
# intervale [-3pi, 3pi].

windows(8, 4)
plot(sin, -3*pi, 3*pi)


# Parametras rescale nurodo, kaip turi bûti atnaujinamas grafikas, kai keièiamas
# lango, kuriame jis nubraiþytas, dydis. Galimos parametro reikðmës:
#
#        "R" -- nurodo, kad grafiko dydis sutampa su lango dydþiu,
#      "fit" -- grafikas perbraiþomas iðlaikant kraðtiniø santyká,
#     fixed" -- nurodo, kad grafiko dydis yra fiksuotas.

# Standartinë parametro reikðmë - "R", todël, keièiant grafinio lango dydá (pvz., 
# su pele), jame nubraiþyto grafiko dydis taip pat keièiasi, grafikas uþima visà
# langà. Jei parametrui priskiriama reikðmë "fit", tada grafikas iðlaiko pradiná 
# kraðtiniø santyká, taèiau, priklausomai nuo grafinio lango dydþio, keièiasi jo
# ðrifto dydis.

windows(rescale = "fit")
plot(sin, -pi, pi, main = "Grafinis langas su fiksuotu grafiko kraðtiniø santykiu")


# Parametras pointsize nustato taðko dydá. Nuo jo priklauso teksto ðrifto dydis.
# Standartinë parametro reikðmë 12. Pavyzdþiui, nubraiþysime grafikà su 8 dydþio 
# ðriftu.

windows(pointsize = 8)
plot(sin, -pi, pi, main = "Parametro pointsize reikðmë lygi 8")


# Ðrifto, kuriuo raðomos grafiko ir aðiø antraðtës bei padalø pavadinimai, ðeimà 
# nusako parametras family. Standartinë parametro reikðmë yra "", kiti variantai 
# tokie:
# 
#    "serif" -- lotyniðkas ðriftas, pvz., Times,
#     "sans" -- groteskinis ðriftas, pvz., Aria, Helvetica,
#     "mono" -- pastovaus ploèio ðriftas, pvz., Courier.

# Pvz., nustatysime, kad naujai atidarytame grafiniame lange pagrindinis grafiko
# ðriftas bûtø ið "mono" ðeimos.

windows(family = "mono")
plot(sin, -pi, pi)

# Galima priminti, kad grafike naudojamo ðrifto ðeima gali bûti nustatoma ir per 
# grafiná parametrà family.

par(family = "mono")
plot(sin, -pi, pi)


# Parametras antialias nustato ðriftø glodinimo metodà, nuo kurio priklauso kaip 
# jie atrodys ekrane. Pavyzdþiui, nubraiþysime grafikà, kuriame suraðyti mënesiø
# pavadinimai. Vienu atveju glodinimas nenaudojamas, kitu -- naudojamas.

windows(antialias = "none")
plot(0, 0, type = "n", main = "Ðriftas nesuglodintas")
text(0, 0, paste(month.name, collapse = "\n"), cex = 2)

windows(antialias = "cleartype")
plot(0, 0, type = "n", main = "Ðriftas suglodintas")
text(0, 0, paste(month.name, collapse = "\n"), cex = 2)


# Naujai atidarytam grafinim langui automatiðkai priskiriamas eilës numeris, bet, 
# naudojant parametrà title, jam galima suteikti bet koká pavadinimà. 

windows(title = "Trigonometrinës funkcijos grafikas")
plot(sin, -pi, pi)

# Parametrai xpos, ypos nustato naujo grafinio lango vietà ekrane. Taðkas (0, 0) 
# atitinka virðutiná kairës pusës kampà. Standartinë lango pozicija - virðutinis 
# deðinës pusës kampas, kurá atitinka taðkas (-25, 0). Neigiamos reikðmës nurodo, 
# kad langas atitraukiamas nuo deðinio ir apatinio ekrano kraðto. 

windows(xpos = -10, ypos = -25)


# Parametrai bg ir canvas nustato grafiko fono ir grafinio lango pagrindo spalvà.
# Pagrindas matomas tik tada, jei fono spalva yra permatoma. Kadangi standartinë 
# parametro bg reikðmë yra "transparent", grafikuose matome baltà grafinio lango
# pagrindo spalvà. 

# Pavyzdþiui, nubraiþysime grafikus su skirtingomis fono bei pagrindo spalvomis.

windows(bg = "skyblue")
plot(sin, -pi, pi)

windows(canvas = "red")
plot(sin, -pi, pi)

# Jeigu pagrindo ir fono spalvas nurodome kartu, grafike bus matoma fono spalva.
# Èia fono spalvà "skyblue" nurodome RGB kodu.

windows(canvas = "red", bg = rgb(0.53, 0.81, 0.92))
plot(sin, -pi, pi)

# Jeigu fono spalva permatoma (tai reguliuojama parametru alpha), grafike matosi 
# ir grafinio lango pagrindo spalva.

windows(canvas = "red", bg = rgb(0.53, 0.81, 0.92, alpha = 0.5))
plot(sin, -pi, pi)


# Funkcijos windows, win.graph, x11 ir X11 yra tos paèios funkcijos realizacijos.
# Jos reikalingos dël suderinamumo su kitomis operacinëmis sistemomis, nes Linux
# bei Unix sistemoje tas pats árenginys vadinasi X11. Funkcijos x11 bei X11 turi 
# maþiau parametrø, taèiau jie, galima sakyti, yra esminiai:
#
#      width -- grafinio lango plotis coliais,
#     height -- grafinio lango aukðtis coliais,
#  pointsize -- taðko dydis, 
#         bg -- grafiko fono spalva,
#       xpos -- pradinës lango pozicijos ekrane koordinatë x,
#       ypos -- pradinës lango pozicijos ekrane koordinatë y,
#      title -- grafinio lango pavadinimas.

x11(8, 6, pointsize = 11, bg = "skyblue", title = "x11 langas")


# MS Windows operacinëje sistemoje uþ grafiniø objektø atvaizdavimà skirtinguose 
# grafiniuose árenginiuose, tokiuose kaip monitorius ar spausdintuvas, atsakinga 
# GDI (Graphics Device Interface). Tai leidþia gauti praktiðkai toká patá vaizdà 
# monitoriuje, faile arba spausdintuve. Tam R gali bûti naudojamos ðios f-jos:
#
#        win.graph
#        win.metafile 
#        win.print

# Pavyzdþiui, naudodami ðias funkcijas, tà patá grafikà atvaizduosime ekrane, já
# iðsaugosime á Windows Metafile (wmf) tipo failà ir nukreipsime á spausdintuvà.

win.graph()
plot(sin, -pi, pi, main = "Grafikas ekrane")
dev.off()

win.metafile(file = "grafikas.wmf")
plot(sin, -pi, pi, main = "Grafikas faile")
dev.off()

win.print(printer = "")
plot(sin, -pi, pi, main = "Grafikas spausdinimui")
dev.off()


# NAUDINGA ------------------------------

# Taðkø tanká colyje (pixels per inch, PPI) nustato parametrai xpinch ir ypinch. 
# Standartinës ðiø parametrø reikðmës priklauso nuo ekrano skiriamosios gebos ir 
# apskaièiuojamos automatiðkai. Pavyzdþiui, jei PPI = 96, tai 7 x 7 dydþio lange
# nubraiþytas grafikas yra 672 x 672 taðkø dydþio. Spaudoje naudojamas PPI = 300.

# Jeigu parametrø xpinch ir ypinch reikðmës skiriasi, grafinis langas ekrane yra
# iðtempiamas. Pavyzdþiui, tegu parametro xpinch reikðmë bus dvigubai didesnë uþ
# ypinch reikðmæ. Ekrane toks grafikas iðtemptas horizontaliai, taèiau formaliai
# jis iðliko kvadratinis. Jeigu spausdinant bûtø atsiþvelgiama á skirtingà taðkø 
# tanká, grafikas ant popieriaus taip pat bûtø kvadratinis. Tai rodo ir grafinio 
# parametro din reikðmë. 

windows(7, 7, xpinch = 160, ypinch = 80)
plot(sin, -pi, pi, main = "Kvadratinis grafikas")
par("din")

# Pavyzdþiui, jei grafikas turi bûti 900 x 600 dydþio, tai, þinant, kad PPI = 96,
# grafinio lango dydis turi bûti 900/96 = 9.375 ploèio ir 6.25 aukðèio (coliais).

windows(width = 9.38, height = 6.25, xpinch = 96, ypinch = 96)
plot(sin, -pi, pi, main = "900 x 600 taðkø dydþio grafikas")

# Jei standartiniame 7 x 7 coliø grafiniame lange nubraiþytas grafikas turi bûti
# 700 x 700 taðkø dydþio, tai PPI turi bûti 100.

windows(7, 7, xpinch = 100, ypinch = 100)
plot(sin, -pi, pi, main = "700 x 700 taðkø dydþio grafikas")


# UÞDUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    


# --------------------------------------- #
# VEKTORINË GRAFIKA                       #
# --------------------------------------- #

#        pdf -- 
# postscript -- 


# UÞDUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    


# --------------------------------------- #
# RASTRINË GRAFIKA                        #
# --------------------------------------- #

#        png -- 
#        gif -- 


# UÞDUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    


# --------------------------------------- #
# GRAFINIØ ÁRENGINIØ VALDYMAS             #
# --------------------------------------- #

# Vienu metu galima naudoti keletà grafiniø árenginiø. Aukðto lygio grafinë f-ja
# grafikà atvaizduoja aktyviame árenginyje. Jei tuo metu aktyvaus árenginio nëra,
# tada grafiko braiþymui atidaromas standartinis árenginys. Kuris ið visø galimø
# árenginiø yra standartinis, priklauso nuo operacinës sistemos. 


# UÞDUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    


# --------------------------------------- #
# GRAFIKØ EKRANE IÐSAUGOJIMAS             #
# --------------------------------------- #



# UÞDUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    

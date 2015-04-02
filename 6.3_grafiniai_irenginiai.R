
#
#   Dalykas: STATISTINËS DUOMENØ ANALIZËS SISTEMA IR PROGRAMAVIMO KALBA R
#            Grafiniai árenginiai ir jø valdymas.
#
#  Autorius: Tomas Rekaðius
#
#   Sukurta: 2015-03-07 | 2015-03-30
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
#      * pdfFonts
#      * pdf.options
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
plot(sin, -pi, pi)


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

# Ðiuo metu labiausiai paplitæ du nuo operacinës sistemos ir programinës árangos
# nepriklausantys elektroniniø dokumentø formatai:
#
#         ps -- PostScript,
#        pdf -- Portable Document Format.
#
# PostScript ir PDF tipo dokumentai plaèiai naudojami elektroninëje leidyboje ir
# spaudoje, kur reikalinga aukðta poligrafinë teksto ir grafikos kokybë.

# PostScript yra aukðto lygio programavimo kalba, kuri skirta teksto ir grafikos
# tuðèiame puslapyje apraðymui. Galima sakyti, kad PostScript dokumentas tai yra 
# tokia programa, kuri spausdintuvui nurodo, kaip atvaizduoti dokumente apraðytà
# puslapá. Paprastai dokumentà su PostScript programa generuoja kitos programos. 
# Norint paþiûrëti, kaip atrodys PostScript dokumentas, reikia turëti PostScript
# kalbos interpretatoriø. Pvz., tam galima naudoti programà Ghostscript.

# PDF yra PostScript kalbos pagrindu sukurtas elektroninio dokumento formatas. Á
# toká failà galima átraukti tekstà kartu su jam reikalingais ðriftais, rastrinæ
# ir vektorinæ grafikà. Dokumentà PDF formatu gali iðsaugoti grafiniai ar teksto
# redaktoriai. PDF dokumentui perþiûrëti reikia specialios programos, pavyzdþiui, 
# SumatraPDF.


# Grafikø iðsaugojimui PostScript ar PDF formatu naudojamos f-jos postscript bei 
# pdf. Èia plaèiau aptarsime tik funkcijà pdf, kurios pagrindiniai parametrai ir
# jø standartinës reikðmës yra tokie patys kaip ir funkcijos windows, taèiau kai 
# kurie ið jø yra specifiniai PDF dokumentams:
#
#       file -- pdf failo pavadinimas,
#      width -- grafinio lango plotis coliais,
#     height -- grafinio lango aukðtis coliais,
#  pointsize -- taðko dydis,
#         bg -- grafiko fono spalva,
#         fg -- grafiko taðkø ir linijø spalva,
#      title -- á pdf failà áraðomas grafiko pavadinimas,
#     family -- grafike naudojamo ðrifto ðeima,
#   encoding -- ðrifto koduotë,
#    onefile -- nurodo, ar faile galima braiþyti kelis grafikus,
#      paper -- popieriaus lapo dydis,
# pagecentre -- nurodo, ar grafikà atvaizduoti puslapio centre.


# Paprasèiausiu atveju uþtenka nurodyti pdf dokumento, á kurá bus atvaizduojamas 
# grafikas, vardà. Jeigu prieð tai, naudojant funkcijà setwd, nurodomas darbinis 
# katalogas, failo vardas gali bûti trumpas, prieðingu atveju -- reikia nurodyti 
# pilnà kelià iki failo. Nubraiþius grafikà, raðymas á pdf failà nutraukiamas, o
# grafinis árenginys uþdaromas. Tam naudojama speciali funkcija dev.off().

# Pavyzdþiui, nubraiþysime paprastà funkcijos y = sin(x) grafikà ir áraðysime já 
# á failà "grafikas.pdf", kuris bus sukurtas darbiniame kataloge. Pasitikslinti,
# kuris katalogas yra darbinis, galima naudojant funkcijà getwd().

pdf(file = "grafikas.pdf")
  plot(sin, -pi, pi, main = "Funkcijos y = sin(x) grafikas")
dev.off()


# Labai daþnai grafikui nubraiþyti reikia keletos grafiniø funkcijø ir papildomø
# skaièiavimø. Tokiu atveju visos grafinës f-jos raðomos tarp pdf() ir dev.off().

pdf(file = "grafikas.pdf")

  # nubraiþome funkcijos grafikà be Ox aðies ir rëmelio
  plot(sin, -pi, pi, las = 1, xaxt = "n", frame = FALSE)

  # apskaièiuojame Ox aðies padalas ir sudarome jø pavadinimus
  Ox <- seq(-pi, pi, by = pi/2)
  Lx <- expression(-pi, -pi/2, 0, pi/2, pi)

  # ant grafiko uþdedame Ox aðá
  axis(1, at = Ox, labels = Lx)

  # uþdedame prie Ox aðies padalø priderintà tinklelá
  abline(v = Ox, h = -2:2/2, lty = "dotted", col = "gray80")

  # uþraðome pagrindinæ grafiko antraðtæ
  title(main = "Funkcijos y = sin(x) grafikas")

dev.off()


# Grafiko dydá nustato parametrai width ir height. Jeigu nenurodyta kitaip, tada
# standartinio grafiko dydis yra 7 x 7 colio. Parametras pointsize nustato taðko 
# dydá, nuo kurio priklauso teksto ðrifto dydis. Pvz., nubraiþysime 6 x 4 dydþio
# grafikà su 8 dydþio ðriftu.

pdf(file = "grafikas.pdf", width = 6, height = 4, pointsize = 8)
  plot(Nile)
dev.off()


# Puslapio, kuriame atvaizduojamas grafikas, dydis priklauso nuo parametro paper. 
# Standartinë jo reikðmë "special" nurodo, kad puslapio dydis sutampa su grafiko
# dydþiu, taèiau puslapis gali turëti savo formatà. Kitos parametro reikðmës yra 
# tokios:
# 
#       "a4" -- 8.27 x 11.7 in (210.0 x 297.0 mm),
#   "letter" -- 8.50 x 11.0 in (215.9 x 279.4 mm),
#    "legal" -- 8.50 x 14.0 in (215.9 x 355.6 mm),
#
#      "a4r" -- pasuktas A4 formatas,
#      "USr" -- pasuktas Legal formatas.

# Standartiðkai grafikas vaizduojamas puslapio centre. Tai priklauso nuo loginio 
# parametro pagecentre. Jam priskyrus reikðmæ FALSE, grafikas bus atvaizduojamas
# viename puslapio kampe.

# Pavyzdþiui, ant pasukto A4 formato puslapio nubraiþysime ið karto du grafikus.
# Kadangi standartinë parametro pagecenter reikðmë lygi TRUE, grafikas braiþomas 
# puslapio centre.

pdf(file = "grafikas.pdf", width = 11, height = 6, paper = "a4r")
  par(mfrow = c(1, 2))
  plot(Nile, frame = FALSE)
  hist(Nile, main = "")
dev.off()


# PDF dokumente naudojamo ðrifto ðeimà nustato parametras family. Problema tame,
# kad standartinës reikðmës "serif", "sans" arba "mono" PDF dokumentuose reiðkia
# tam tikrà konkretø ðriftà, pavyzdþiui:
#
#    "serif" -- "Times"
#     "sans" -- "Helvetica"
#     "mono" -- "Courier"

# Ryðá tarp standartinëje R grafikoje naudojamos ðriftø ðeimos ir konkretaus PDF 
# dokumento ðrifto nusako funkcija pdfFonts.

pdfFonts("serif")
pdfFonts("sans")
pdfFonts("mono")

# Be to, PDF dokumente galima naudoti ir kitus ðriftus. Pavyzdþiui, gausime visà 
# jø sàraðà.

names(pdfFonts())


# Tai, kokiu þenklu bus atvaizduota raidë (tiksliau - raidæ atitinkantis kodas), 
# priklauso nuo koduotës. Lotyniðkos abëcëlës pagrindu sudaryta ASCII koduotë ið
# viso koduoja 256 simbolius. Kodai nuo 0 iki 127 koduoja skaitmenis, didþiàsias 
# ir maþàsias lotyniðkos abëcëlës raides, skyrybos þenklus ir specialius valdymo 
# simbolius. Likæ 128 kodai naudojami papildomiems simboliams, tarp jø gali bûti 
# ir nacionaliniø abëcëliø simboliai. Priklausomai nuo to, kokiais simboliais ði
# lentelë papildoma, gaunama viena ar kita koduotë.

# Vakarø Europos kalboms, kurios naudoja lotyniðkà abëcëlæ, naudojama ISO 8859-1 
# koduotë, kuri dar vadinama Latin-1. MS Windows operacinëje sistemoje jà beveik 
# visiðkai atitinka Windows-1252 (CP-1252) koduotë. Savo koduotes turi Centrinës
# ir Rytø Europos kalbos, baltø kalbos, taip pat graikø kalba bei kalbos, kurios 
# savo raðtui naudoja kirilicà.

# PDF dokumento koduotë priklauso nuo parametro encoding reikðmës. Paprastai yra
# naudojamos tokios koduotës:
#
#  "WinAnsi" -- Western European,
#   "CP1250" -- Central European,
#   "CP1251" -- Cyrillic,
#   "CP1253" -- Greek,
#   "CP1257" -- Baltic.

# Standartinë parametro reikðmë "default" gali reikðti bet kurià ið ðiø koduoèiø.
# Tai priklauso nuo to, kokia koduotë naudojama R aplinkoje, bet daþniausiai tai
# yra "WinAnsi" (kuri ið tikro turi bûti vadinama Windows-1252).

# Pavyzdþiui, tà patá grafikà atvaizduosime á PDF failà naudodami dvi skirtingas 
# koduotes. Galima pastebëti, kad á Windows-1252 koduotæ ið 9 lietuviðkø raidþiø
# patenka tik ð ir þ, o likusios atvaizduojamos nekorektiðkai.

pdf(file = "grafikas.pdf", encoding = "WinAnsi")
  plot(0, 0, type = "n", frame = FALSE, main = "WinAnsi, Western European")
  text(0, 0, "Lietuviðkos raidës\n àæëáøûèðþ\n arba matosi, arba ne.", cex = 3)
dev.off()

pdf(file = "grafikas.pdf", encoding = "CP1257")
  plot(0, 0, type = "n", frame = FALSE, main = "CP-1257, Baltic")
  text(0, 0, "Lietuviðkos raidës\n àæëáøûèðþ\n arba matosi, arba ne.", cex = 3)
dev.off()


# NAUDINGA ------------------------------

# Perþiûrëti PDF dokumento parametrø reikðmes galima naudojant f-jà pdf.options.

pdf.options()

# Ðià funkcijà galima panaudoti tuo atveju, kai reikia nubraiþyti ið karto kelis 
# grafikus su vienodomis PDF parametrø reikðmëmis. Nustaèius visiems dokumentams
# bendrø parametrø reikðmes, funkcijai pdf uþtenka nurodyti tik failo vardà.

pdf.options(width = 6, height = 4, pointsize = 8, encoding = "CP1257")

pdf(file = "grafikas-1.pdf")
  plot(Nile)
dev.off()

pdf(file = "grafikas-2.pdf")
  hist(Nile)
dev.off()

pdf(file = "grafikas-3.pdf")
  boxplot(Nile)
dev.off()


# Naudojant ðià funkcijà, galima atstatyti standartines visø parametrø reikðmes.

pdf.options(reset = TRUE)


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

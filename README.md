# R paskaitų konspektas #

Šis konspektas yra statistinių skaičiavimų sistemos R pradžiamokslis. Nors R tuo pačiu yra ir programavimo kalba, šiame konspekte programavimas daugiausia suprantamas kaip standartinių R komandų panaudojimas duomenų importavimui ar eksportavimui, jų pertvarkymui ir paruošimui standartinėms statistinėms ar grafinėms procedūroms. Kitaip tariant, čia išdėstytas tas programavimo su R minimumas, kurio reikia sklandžiam darbui su duomenimis ir nesudėtingai statistinei analizei atlikti. 

## Kaip naudoti? ##

Konspektas parašytas taip, kad jį būtų galima ne tik skaityti kaip paprastą tekstą, bet kiekvienos temos failas tuo pačiu yra ir veikianti R programa (skriptas). Geriausias būdas mokytis iš šio konspekto -- atsisiųsti norimos temos failą, atsidaryti jį iš R (`File -> Open script...`) ir nuosekliai vykdyti komandas. Svarbi pastaba! Kadangi programos kodas parašytas su lietuviškomis raidėmis, vykdant ją, turi būti įjungta LT klaviatūra.

Viename R faile išdėstyta viena platesnė tema, kuri dar suskirstyta į smulkesnius skyrelius. Visos naujos komandos ar jų panaudojimo metodai yra su išsamiais komentarais, o įgūdžiams įtvirtinti kiekvieno skyrelio gale yra užduočių savarankiškam darbui.

Temų išdėstymas nėra griežtas, tačiau konspektas pirmiausia orientuotas į pradedančiuosius, todėl temas apie duomenų struktūras ir veiksmus su duomenimis reikėtų perskaityti nuosekliai, priešingu atveju bus sunku suprasti kitas temas. Konspektą galima naudoti ir kaip tipinių duomenų analizės situacijų žinyną, todėl jis gali būti naudingas ir jau turintiems šiek tiek programavimo su R patirties.


## Pagrindinės temos ##

Konspektą sudaro kelios dalys, kurios pirmiausia apima pagrindines darbo su bazinėmis R duomenų struktūromis temas. Taip pat darbui su realiais duomenimis svarbi duomenų importavimo ir eksportavimo tema. Konspektas nuolat atnaujinamas, ateityje planuojamos dar tokios temos: 

  - veiksmai su duomenų struktūromis,
  - pagrindinės grafikų braižymo procedūros,
  - atsitiktinių dydžių generavimas ir jų funkcijos,
  - tekstinių duomenų analizė.

### Bazinės duomenų struktūros ###

  - vektoriai,
  - matricos,
  - sąrašai,
  - duomenų lentelės,
  - faktoriai.

### Duomenų importavimas ir eksportavimas ###

  - duomenų importavimas iš tekstinio ar binarinio failo,
  - vektorių ir lentelių nuskaitymas iš teksto,
  - duomenų eksportavimas į tekstinį ar binarinį failą,
  - kintamųjų išvedimas į ekraną ir jų struktūros užrašymas.

### Programavimas su R ###
 
  - loginių sąlygų užrašymas ir loginės funkcijos,
  - sąlygos konstrukcija if-else ir funkcija ifelse,
  - ciklai for, while ir repeat, ciklo nutraukimo komandos,
  - keletas klasikinių algoritmų su for ir while ciklais,
  - vartotojo funkcijų užrašymas,
  - matricų ir sąrašų ciklo funkcijos apply, lapply ir sapply,
  - funkcijų perskaičiavimas keičiant jų parametrus ir nekeičiant,
  - veiksmai ir charakteristikų grupuotuose duomenyse skaičiavimas.

### Veiksmai su duomenimis ###

  - tam tikrų elementų paieška, praleistos reikšmės ir duomenų filtravimas,
  - vektoriaus elementų išrikiavimas ir duomenų lentelių pertvarkymai,
  - vektorių, matricų ir duomenų lentelių apjungimas.

### Grafikų braižymas ###

  - bazinė grafikų ir diagramų braižymo funkcija plot ir jos parametrai,
  - pagrindiniai funkcijos plot metodai,
  - aukšto lygio grafinės funkcijos: kreivės, stulpelinės diagramos, histogramos,
  - žemo lygio grafinės funkcijos: papildomi taškai ir tiesės,
  - ašių, grafiko antraštės ir kitas papildomas tekstas,
  - grafiko ašių, rėmelio ir tinklelio formavimas,
  - grafiniai parametrai ir jų reikšmės nustatymas.
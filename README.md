# Analiza podatkov s programom R, 2016/17

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2016/17

## Analiza ločitev v Evropi
Za projekt sem si izbrala temo, ki je v današnjih časih zelo aktualna. Ločitev je postala nekaj običanjega, zato me zanima, kako se to pozna na številkah. Primerjala bom podatke zadnjih desetih let iz različnih držav Evrope. Zanimalo me bo, ali  dolžina zakona vpliva na število ločitev, zato sem si izbrala različne dolžine. Poleg dolžine zakonske zveze, bom pogledala povprečno starost žensk in moških ob prvem zakonu in poskušala ugotoviti pomembnost zakonske zveze v različnih državah ter to napeljati na moje podatke o ločitvah.

Svoje podatke bom uvozila iz eurostata. Prva tabela v obliki CSV-ja vsebuje podatke o dolžini zakonske zveze, druga tabela v obliki HTML pa vsebuje podatke o povprečni starosti.

Povezave:
-> http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=demo_ndivdur&lang=en

-> http://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=demo_nind&lang=en

**1. TABELA: DOLŽINA ZAKONSKE ZVEZE**

-1.stolpec : leto (od leta 2006 do leta 2015)

-2.stolpec: država (države Evrope)

-3.stolpec: dolžina zakonske zveze (manj kot leto, manj kot 5 let, 10 let, od 15 do 19 let, od 20 do 24 let, več kot 25 let)

-4.stolpec: število ločitev 

**2. TABELA: POVPREČNA STAROST MOŠKIH IN ŽENSK OB PRVI POROKI**

-1.stolpec: leto (od leta 2006 do leta 2015)

-2.stolpec: država (države Evrope)

-3.stolpec: spol (moški, ženska)

-4.stolpec: povprečna starost

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)

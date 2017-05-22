
#uvoz podatkov iz html, povprecna starost moških ob prvi poroki

library(gsubfn)
library(readr)
library(dplyr)
library(XML)
library(reshape2)
library(reshape)

Mstarost <- readHTMLTable("podatki/M_povprecna_starost.html",
                          which = 1)
colnames(Mstarost) <- c("drzava", 2006:2015)

for (col in colnames(Mstarost)) {
  Mstarost[Mstarost[[col]] == ":", col] <- NA}

Mstarost<- melt(Mstarost, id.vars = "drzava", measure.vars = names(Mstarost)[-1],
                       variable.name = "leto", value.name = "povprecna starost",
                       na.rm = TRUE)

colnames(Mstarost)<- c("drzava", "leto", "povprecna starost")

Mstarost <- Mstarost[c(2,1,3)]

#uvoz podatkov iz html, povprecna starost žensk ob prvi poroki

Fstarost <- readHTMLTable("podatki/F_povprecna_starost.html",
                          which = 1)
colnames(Fstarost) <- c("drzava", 2006:2015)

for (col in colnames(Fstarost)) {
  Fstarost[Fstarost[[col]] == ":", col] <- NA}

Fstarost<- melt(Fstarost, id.vars = "drzava", measure.vars = names(Fstarost)[-1],
                variable.name = "leto", value.name = "povprecna starost",
                na.rm = TRUE)

colnames(Fstarost)<- c("drzava", "leto", "povprecna starost")

Fstarost <- Fstarost[c(2,1,3)]



# zdruzitev tabel po letih in drzavah
starost <- inner_join(Mstarost,Fstarost,by = c("leto","drzava"))

starost <- melt(starost, id.vars = c("leto","drzava"))

colnames(starost) <- c("leto","drzava","popravi","povprecna starost")

#SPREMEMBA STOLPCA SPOL

imena <- c("povprecna starost.x","povprecna starost.y")
spoli <- c("M","F")

pomozna <- data.frame(popravi=spoli, stara=imena)
pomozna$stara <- as.character(pomozna$stara)

starost <- starost %>% inner_join(pomozna, c("popravi"="stara"))

starost$popravi <- NULL

starost <- starost[c(1,2,4,3)]

names(starost)[3] <- "spol"
names(starost)[4] <- "povprecna"
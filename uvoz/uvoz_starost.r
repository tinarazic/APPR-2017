
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
                variable.name = "leto", value.name = "povprecna.starost",
                na.rm = TRUE)

colnames(Mstarost)<- c("drzava", "leto", "povprecna.starost")

Mstarost$leto <- parse_number(Mstarost$leto)

Mstarost <- Mstarost[c(2,1,3)]

#uvoz podatkov iz html, povprecna starost žensk ob prvi poroki

Fstarost <- readHTMLTable("podatki/F_povprecna_starost.html",
                          which = 1)
colnames(Fstarost) <- c("drzava", 2006:2015)

for (col in colnames(Fstarost)) {
  Fstarost[Fstarost[[col]] == ":", col] <- NA}

Fstarost<- melt(Fstarost, id.vars = "drzava", measure.vars = names(Fstarost)[-1],
                variable.name = "leto", value.name = "povprecna.starost",
                na.rm = TRUE)

colnames(Fstarost)<- c("drzava", "leto", "povprecna.starost")

Fstarost$leto <- parse_number(Fstarost$leto)

Fstarost <- Fstarost[c(2,1,3)]



# zdruzitev tabel po letih in drzavah
starost <- rbind(Mstarost %>% mutate(spol = "M"),
                 Fstarost %>% mutate(spol = "F")) %>%
  transmute(leto = parse_number(leto), drzava, spol = factor(spol), povprecna.starost = parse_number(povprecna.starost, na = ":(b)"))

starost$drzava<- gsub("^Germany.*$","Germany",starost$drzava)
starost$drzava <- gsub("^Former.*$","Macedonia",starost$drzava)
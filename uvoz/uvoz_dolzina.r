# uvoz podatkov iz csv datoteke, dolzina zakonske zveze:
  
library(readr)
library(dplyr)
library(reshape)

dolzina <- read_csv("podatki/dolzina_zakonske_zveze.csv",
                    locale=locale(encoding="windows-1250"),
                    skip = 1,
                    col_names = c("leto", "drzava", "trajanje", "izbrisi1", "stevilo", "izbrisi2"),
                    na=c("", " ", ":"))

dolzina$izbrisi1 <- NULL
dolzina$izbrisi2 <- NULL

dolzina <- dolzina[!(is.na(dolzina$stevilo)),]

dolzina$leto <- parse_integer(dolzina$leto)
dolzina$drzava<- gsub("^Germany.*$","Germany",dolzina$drzava)
dolzina$drzava <- gsub("^Former.*$","Macedonia",dolzina$drzava)

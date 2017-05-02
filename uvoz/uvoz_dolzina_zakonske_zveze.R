# uvoz podatkov iz csv datoteke, dolzina zakonske zveze:
library(readr)
library(dplyr)
library(reshape2)

dolzina <- read_csv("dolzina_ zakonske _zveze.csv",
                    locale=locale(encoding="windows-1250"),
                    skip = 1,
                    col_names = c("leto", "država", "trajanje", "izbrisi1", "stevilo", "izbrisi2"),
                    na=c("", " ", ":"))

dolzina$izbrisi1 <- NULL
dolzina$izbrisi2 <- NULL

dolzina <- dolzina[!(is.na(dolzina$stevilo)),]

dolzina$leto <- parse_integer(dolzina$leto)



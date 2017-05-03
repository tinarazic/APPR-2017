# uvoz podatkov iz csv datoteke, stevilo zakonskih zvez:
  
library(readr)
library(dplyr)
library(reshape2)

poroke <- read_csv("podatki/stevilo_zakonov.csv",
                    locale=locale(encoding="windows-1250"),
                    skip = 1,
                    col_names = c("leto", "drzava","izbrisi1", "stevilo_porok", "izbrisi2"),
                    na=c("", " ", ":"))

poroke$izbrisi1 <- NULL
poroke$izbrisi2 <- NULL

poroke <- poroke[!(is.na(poroke$stevilo_porok)),]

poroke$leto <- parse_integer(poroke$leto)

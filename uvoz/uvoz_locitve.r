# uvoz podatkov iz csv datoteke, stevilo locitev:

library(readr)
library(dplyr)
library(reshape2)

locitve <- read_csv("podatki/stevilo_locitev.csv",
                   locale=locale(encoding="windows-1250"),
                   skip = 1,
                   col_names = c("leto", "drzava","izbrisi1", "st_locitev", "izbrisi2"),
                   na=c("", " ", ":"))

locitve$izbrisi1 <- NULL
locitve$izbrisi2 <- NULL

locitve <- locitve[!(is.na(locitve$st_locitev)),]

locitve$leto <- parse_number(locitve$leto)

locitve$drzava <- gsub("^Germany.*$","Germany",locitve$drzava)
locitve$drzava <- gsub("^Former.*$","Macedonia",locitve$drzava)
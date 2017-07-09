# uvoz podatkov iz csv datoteke, dolzina zakonske zveze:
  
library(readr)
library(dplyr)
library(reshape2)
library(tidyr)

dolzina <- read_csv("podatki/dolzina_zakonske_zveze.csv",
                    locale = locale(encoding = "windows-1250"),
                    skip = 1,
                    col_names = c("leto", "drzava", "trajanje", "izbrisi1", "stevilo", "izbrisi2"),
                    col_types = cols(trajanje = col_factor(c("Less than 1 year",
                                                             "Less than 5 years",
                                                             "10 years",
                                                             "From 15 to 19 years",
                                                             "From 20 to 24 years",
                                                             "25 years or over"),
                                                           ordered = TRUE)),
                    na=c("", " ", ":")) %>% select(-izbrisi1, -izbrisi2) %>% drop_na()

dolzina$drzava<- gsub("^Germany.*$","Germany",dolzina$drzava)
dolzina$drzava <- gsub("^Former.*$","Macedonia",dolzina$drzava)
dolzina$drzava <- gsub("^Kosovo.*$","Kosovo",dolzina$drzava)

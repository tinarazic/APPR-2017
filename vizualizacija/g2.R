library(ggplot2)
library(dplyr)
library(nlme)

g2 <- ggplot(dolzina) + aes(x = leto, y = stevilo, color = drzava, shape = trajanje) + geom_point()

print(g2)
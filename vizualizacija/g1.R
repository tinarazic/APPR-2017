library(ggplot2)
library(dplyr)
library(nlme)

g1 <- ggplot(starost) + aes(x = leto, y = povprecna, color = drzava, size = spol) + geom_path()
print(g1)
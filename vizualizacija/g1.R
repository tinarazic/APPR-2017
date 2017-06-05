library(ggplot2)
library(dplyr)
library(nlme)

g1 <- ggplot(starost %>% filter(leto>= 2010)) + aes(x = leto, y = povprecna, color = drzava, size = spol) + geom_path()
print(g1)
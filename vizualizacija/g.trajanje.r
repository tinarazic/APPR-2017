library(ggplot2)
library(dplyr)
library(nlme)

g.trajanje <- ggplot(dolzina %>% 
                       filter(leto > 2014) %>% 
                       filter(trajanje != "Od 20 do 24 let" & trajanje != "Manj kot eno leto"))+
  aes(x = drzava, y = stevilo, color = trajanje) + geom_point() +
  theme(axis.text.x = element_text(angle = 65, hjust = 1)) + 
  xlab("DRŽAVA") + ylab("ŠTEVILO LOČITEV") +
  guides(color = guide_legend(title = "Trajanje"))



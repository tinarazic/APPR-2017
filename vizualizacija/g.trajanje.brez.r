library(ggplot2)
library(dplyr)
library(nlme)

g.trajanje <- ggplot(dolzina %>% 
                       filter(leto > 2012) %>% 
                       filter(trajanje != "From 15 to 19 years" & trajanje != "From 20 to 24 years" & trajanje != "Less than 1 year")%>%
                       filter(drzava != "United Kingdom" & drzava != "Turkey")) +
  
  aes(x = drzava, y = stevilo, color = leto, shape = trajanje) + geom_point() +
  theme(axis.text.x = element_text(angle = 65, hjust = 1)) + 
  xlab("DRŽAVA") + ylab("ŠTEVILO LOČITEV") 
print(g.trajanje)
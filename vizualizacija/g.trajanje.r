library(ggplot2)
library(dplyr)
library(nlme)

g.trajanje <- ggplot(dolzina %>% 
                       filter(leto > 2014) %>% 
                       filter(trajanje != "From 20 to 24 years" & trajanje != "Less than 1 year"))+
  aes(x = drzava, y = stevilo, color = trajanje) + geom_point() +
  theme(axis.text.x = element_text(angle = 65, hjust = 1)) + 
  xlab("DRŽAVA") + ylab("ŠTEVILO LOČITEV") 


#spremeni barvo 
# povečaj oblike
# y os enote?
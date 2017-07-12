library(ggplot2)
library(dplyr)
library(nlme)

g.starost <- ggplot(starost %>% 
               filter(leto != 2014 & leto != 2013 & leto != 2012 & leto != 2011 & leto != 2010 & leto != 2009 & leto != 2008 & leto != 2007) %>% 
                 filter(drzava != "Austria" & drzava!= "Belgium")) + 
  aes(x = drzava, y = povprecna.starost,color = spol,linetype = factor(leto),group = paste(leto, spol)) + 
  geom_line() +
  theme(axis.text.x = element_text(angle = 65, hjust = 1)) + 
  xlab("DRŽAVA") + ylab("POVPREČNA STAROST") 


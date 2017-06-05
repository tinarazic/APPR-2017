library(ggplot2)
library(dplyr)
library(nlme)

g.starost <- ggplot(starost %>% 
               filter(leto > 2012)) + 
  aes(x = drzava, y = povprecna.starost,color = spol) + geom_point() +
  theme(axis.text.x = element_text(angle = 65, hjust = 1)) + 
  xlab("DRŽAVA") + ylab("ŠTEVILO POROK") 
print(g.starost)

# kako nardim, da mi poveže skupaj točke od istega leta in bi potem imela v bistvu šest črt na grafu(leto 2013,2014,2015 x2(moški in ženski spol))? 
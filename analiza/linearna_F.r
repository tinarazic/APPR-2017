library(ggplot2)
library(GGally)

Flin <- inner_join(locitve,Fstarost) 

Fg <- ggplot(Flin, aes(x=povprecna.starost, y=st_locitev)) + 
  geom_point() 

z <- lowess(Flin$povprecna.starost, Flin$st_locitev)
Flinearna <- Fg + geom_line(data=as.data.frame(z), aes(x=x, y=y), color="red") +
  xlab("Povprečna starost žensk") + ylab("Število ločitev")
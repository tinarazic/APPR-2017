library(ggplot2)
library(GGally)

Flin <- inner_join(locitve,Fstarost) 

Flinearna <- ggplot(Flin, aes(x=povprecna.starost, y=st_locitev,color = drzava)) + 
  geom_point() + geom_smooth(method = "lm",color = "red") + 
  xlab("Povprečna starost žensk") + ylab("Število ločitev")
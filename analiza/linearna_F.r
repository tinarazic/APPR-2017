library(ggplot2)

Flin <- inner_join(locitve,Fstarost) 

Flinearna <- ggplot(Flin, aes(x=povprecna.starost, y=st_locitev/1000,color = drzava)) + 
  geom_point() + geom_smooth(method = "lm",color = "red") + 
  xlab("Povprečna starost žensk") + ylab("Število ločitev (*1000)") +
  guides(color = guide_legend(title = "Država"))
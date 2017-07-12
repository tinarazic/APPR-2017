library(ggplot2)
library(GGally)

Mlin <- inner_join(locitve,Mstarost)

Mlinearna <- ggplot(Mlin, aes(x=povprecna.starost, y=st_locitev/1000,color = drzava)) + 
  geom_point() + geom_smooth(method = "lm",color = "blue") +
  xlab("Povprečna starost moških") + ylab("Število ločitev(*1000)") +
  guides(color = guide_legend(title = "Država"))

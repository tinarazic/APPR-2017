library(ggplot2)
library(GGally)

Mlin <- inner_join(locitve,Mstarost)

Mlinearna <- ggplot(Mlin, aes(x=povprecna.starost, y=st_locitev,color = drzava)) + 
  geom_point() + geom_smooth(method = "lm",color = "blue") +
  xlab("Povprečna starost moških") + ylab("Število ločitev")

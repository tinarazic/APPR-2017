library(ggplot2)
library(GGally)

Mlin <- inner_join(locitve,Mstarost) 

Mg <- ggplot(Mlin, aes(x=povprecna.starost, y=st_locitev)) + 
  geom_point()

z <- lowess(Mlin$povprecna.starost, Mlin$st_locitev)
Mlinearna <- Mg + geom_line(data=as.data.frame(z), aes(x=x, y=y), color="blue") +
  xlab("Povprečna starost moških") + ylab("Število ločitev")

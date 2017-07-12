library(ggplot2)
library(dplyr)
library(readr)

grupe1 <- locitve %>% filter(leto == 2015) %>% select(-leto)

grupe2 <- poroke %>% filter(leto == 2015) %>% select(-leto) 

grupe <- inner_join(grupe1,grupe2,by = "drzava")

drzava <- grupe$drzava

grupe <- grupe %>% select(-drzava) %>% scale()
rownames(grupe) <- drzava

k <- kmeans(grupe, 5, nstart = 1000)


zemlj_skupine <- ggplot() + 
  geom_polygon(data = evropa %>% 
  left_join(skupine, by = c("admin" = "drzava")),
  aes(x = long, y = lat, group = group, fill = skupina)) + 
  coord_map(xlim = c(-25, 40), ylim = c(32, 72))

# dodaj podatke
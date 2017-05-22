
evropa <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/ne_50m_admin_0_countries.zip",
                          "ne_50m_admin_0_countries", encoding = "UTF-8") %>%
  pretvori.zemljevid() %>% filter(continent == "Europe" | sovereignt %in% c("Turkey", "Cyprus"),
                                  long > -30)

g3 <- ggplot() + 
  geom_polygon(data = left_join(evropa,
                                poroke %>%
                                  filter(leto > 2014),
                                by = c("name_long" = "drzava")),
               aes(x = long, y = lat, group = group, 
                   fill = stevilo_porok)) + 
  coord_map(xlim = c(-25, 40), ylim = c(32, 72))
                

print(g3)
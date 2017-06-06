g.starost <- ggplot(starost %>% filter(leto > 2012) %>%
                      mutate(povprecna.starost = (povprecna.starost - 20) * ifelse(spol == "M",
                                                                                   1, -1))) +
  aes(x = drzava, y = povprecna.starost, fill = factor(leto)) +
  geom_col(position = "dodge") + geom_hline(yintercept = 0, color = "grey") + coord_flip() +
  xlab("DRŽAVA") + ylab("POVPREČNA STAROST") + guides(fill = guide_legend(title = "Leto")) +
  scale_y_continuous(labels = . %>% abs() %>% { . + 20 })

print(g.starost)


#izberi samo tiste izstopajoče države in poglej kko se je spreminajlo v zadnjih treh letih
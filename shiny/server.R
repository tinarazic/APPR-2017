library(shiny)

shinyServer(function(input, output) {
  output$graf <- renderPlot({
  title <- "Število ločitev glede na dolžino trajanja zakonske zveze"
  tabela <- filter(dolzina,
                   drzava == input$drzava,
                   trajanje == input$trajanje)
  slika <- ggplot(tabela,aes(x = leto, y = stevilo)) + geom_point()
  slika + xlim(2006,2025) +
    geom_smooth(method = 'lm', fullrange = TRUE, se = FALSE) +
    xlab("Leto") + ylab("Število ločitev")
})
})
    
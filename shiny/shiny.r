#SHINY
library(shiny)

ui <- fluidPage(
  selectInput(inputId = "drzava", 
              label = "Izberi državo", 
              c = c(dolzina$drzava),multiple = TRUE),
  selectInput(inputId = "leto", 
              label = "Izberi leto", 
              c = c(dolzina$leto),multiple = TRUE),
  radioButtons(inputId = "trajanje",label = "",choices = c("Less than 1 year",
                                                             "Less than 5 years",
                                                             "10 years",
                                                             "From 15 to 19 years",
                                                             "From 20 to 24 years",
                                                             "25 years or over")),
  plotOutput(outputId = "graf")
)

server <- function(input,output){
  output$graf <- renderPlot({
    title <- "Število ločitev glede na dolžino trajanja zakonske zveze"
    tabela <- filter(dolzina,
                     drzava == input$drzava,
                     leto == input$leto
                     trajanje == input$trajanje)
    slika <- ggplot(tabela,aes(x = "leto", y = "stevilo")) + geom_point()
    slika + xlim(2006, 2025) +
      geom_smooth(method = 'lm', fullrange = TRUE, se = FALSE) +
      xlab("Leto") + ylab("Število ločitev")
  })
}

shinyApp(ui = ui, server = server)
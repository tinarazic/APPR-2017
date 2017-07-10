library(shiny)

ui <- fluidPage(
  selectInput(inputId = "drzava", 
              label = "Izberi državo", 
              choices = dolzina$drzava,
              multiple = FALSE),
  selectInput(inputId = "leto", 
              label = "Izberi leto", 
              choices = dolzina$leto,
              multiple = FALSE),
  radioButtons(inputId = "trajanje",
               label = "",
               choiceValues = list("Less than 1 year",
                                   "Less than 5 years",
                                   "10 years",
                                   "From 15 to 19 years",
                                   "From 20 to 24 years",
                                   "25 years or over"),
               choiceNames = list("Manj kot 1 leto",
                                  "Manj kot 5 let",
                                  "10 let",
                                  "Od 15 do 19 let",
                                  "Od 20 do 24 let",
                                  "25 let ali več")),
  plotOutput(outputId = "graf"))

server <- function(input,output){
  output$graf <- renderPlot({
    title <- "Število ločitev glede na dolžino trajanja zakonske zveze"
    tabela <- filter(dolzina,
                     drzava == input$drzava,
                     leto == input$leto,
                     trajanje == input$trajanje)
    slika <- ggplot(tabela,aes(x = "leto", y = "stevilo")) + geom_point()
    slika + xlim(2006,2025) +
      geom_smooth(method = 'lm', fullrange = TRUE, se = FALSE) +
      xlab("Leto") + ylab("Število ločitev")
  })
}

shinyApp(ui = ui, server = server)
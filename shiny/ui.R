library(shiny)

library(shiny)

vektor <- dolzina %>% arrange(drzava) %>% .$drzava %>% unique()

shinyUI(fluidPage(selectInput(inputId = "drzava", 
                  label = "Izberi državo", 
                  choices = vektor,
                  multiple = FALSE),
                  
                  radioButtons(inputId = "trajanje",
                               label = "",
                               choices = list("Manj kot 1 leto",
                                                  "Manj kot 5 let",
                                                  "10 let",
                                                  "Od 15 do 19 let",
                                                  "Od 20 do 24 let",
                                                  "25 let ali več")),
                  plotOutput(outputId = "graf")))
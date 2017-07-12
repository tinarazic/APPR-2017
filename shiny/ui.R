library(shiny)

library(shiny)

shinyUI(fluidPage(selectInput(inputId = "drzava", 
                  label = "Izberi državo", 
                  choices = dolzina$drzava,
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
                  plotOutput(outputId = "graf")))
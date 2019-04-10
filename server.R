#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic 
shinyServer(function(input, output) {
  output$player2 = renderUI({
    selectInput(inputId="player2", label="Player 2", choices=as.character(Players[Players != input$player1]), selected = NULL, multiple = FALSE)
  })
})

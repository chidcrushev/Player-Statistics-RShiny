#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
source("s4-BasketballData.R")
# Define UI for application
#Need to remove the initial selected value
shinyUI(fluidPage(
  
  # Application title
  titlePanel("BasketBall Statistics"),
  selectInput(inputId="player1", label="Player 1", choices=as.character(Players), selected = NULL, multiple = FALSE),
  
  selectInput(inputId="player2", label="Player 2", choices=as.character(Players), selected = NULL, multiple = FALSE)
  
))

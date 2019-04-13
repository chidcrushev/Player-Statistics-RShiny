#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# Define UI for application
source("global.R")
shinyUI(fluidPage(
 
  dashboardPage(
    skin='blue',
    dashboardHeader(title = "Players"),
    sidebar =  dashboardSidebar(
      width = 230,
      sidebarMenu(
        sidebarMenu(
          selectInput(inputId="player1", label="Player 1", choices=as.character(Players), selected = NULL, multiple = FALSE),
          uiOutput('player2')         
        )
      )),
    body = dashboardBody(
      tabsetPanel(
        tabPanel(strong("Minutes Played"),plotOutput("minutes",height="500px", width="800px")),
        tabPanel(strong("Salary"),plotOutput("salary",height = "500px", width = "800px")),
        tabPanel(strong("Points"),plotOutput("points",height = "500px",width = "800px")),
        tabPanel(strong("FieldGoals"),plotOutput("fieldgoals",height = "500px",width = "800px"))
        
      )
    
  )
)))
  
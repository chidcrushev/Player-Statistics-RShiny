#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
source("global.R")
inputData <- function(data,player1,player2){
    a<- Seasons
    switch(data,
    MinutesPlayed={
    b <-  MinutesPlayed[rownames(MinutesPlayed) %in% c(player1)]/Games[rownames(Games) %in% c(player1)]
    d <-  MinutesPlayed[rownames(MinutesPlayed) %in% c(player2)]/Games[rownames(Games) %in% c(player2)]
    },
    Salary={
    b <-  Salary[rownames(Salary) %in% c(player1)]
    d <-  Salary[rownames(Salary) %in% c(player2)]
    },
    Points={
      b <-  Points[rownames(Points) %in% c(player1)]/Games[rownames(Games) %in% c(player1)]
    d <-  Points[rownames(Points) %in% c(player2)]/Games[rownames(Games) %in% c(player2)]
    },
    FreeThrows= {
      b <-  FieldGoals[rownames(FieldGoals) %in% c(player1)]/FieldGoalAttempts[rownames(FieldGoalAttempts) %in% c(player1)]
    d <-  FieldGoals[rownames(FieldGoals) %in% c(player2)]/FieldGoalAttempts[rownames(FieldGoalAttempts) %in% c(player2)]
    }
    )
    plotdata<-data.frame(a,b,d)
    names(plotdata) <- c("Year",player1,player2)
    molten.plotdata <-melt(plotdata, id="Year")
    value<-ggplot(data= molten.plotdata, aes(x=Year,y=value ))+
      geom_point(aes(colour = variable, size= 2))
    return (value)
} 

themeplot  <- function(){
  a<-theme(
    axis.title.x = element_text(colour = "Black"),
    axis.title.y = element_text(colour = "Black"),
    plot.title = element_text(
      colour = "Black",
      face = "bold",
      hjust = 0.5,
      size = 20
    )
  )
  return (a)
}
# Define server logic 
shinyServer(function(input, output) {
  
  output$player2 = renderUI({
    selectInput(inputId="player2", label="Player 2", choices=as.character(Players[Players != input$player1]), selected = input$player2, multiple = FALSE)
  })
  output$minutes <- renderPlot({
     inputData("MinutesPlayed",input$player1,input$player2)+
      xlab("Years") + ylab("Minutes Played Per Game") +
      ggtitle(paste(input$player1,"Vs",input$player2)) +
      themeplot()
  })
  
  output$salary <- renderPlot({
     inputData("Salary",input$player1,input$player2)+
      xlab("Years") + ylab("Salary") +
      ggtitle(paste(input$player1,"Vs",input$player2)) +
      themeplot()
  })
  
  
  output$points <- renderPlot({
   inputData("Points",input$player1,input$player2)+
      xlab("Years") + ylab("Points Per Game") +
      ggtitle(paste(input$player1,"Vs",input$player2)) +
      themeplot()
  })
  
  output$fieldgoals <- renderPlot({
     inputData("FreeThrows",input$player1,input$player2)+
      xlab("Years") + ylab("Fieldgoals Efficiency") +
      ggtitle(paste(input$player1,"Vs",input$player2)) +
      themeplot()
  })
  
})

sideBar = dashboardSidebar(
  width = 230,
  sidebarMenu(
    sidebarMenu(
      selectInput(inputId="player1", label="Player 1", choices=as.character(Players), selected = NULL, multiple = FALSE),

            uiOutput('player2')
  )
)
)


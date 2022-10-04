#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(auth0)
ui <-  fluidPage(
    plotOutput("grafico"),
    logoutButton()
)

server <- function(input,output, session){
    output$grafico <- renderPlot({
        plot(cars)
    })
}

# Run the application 
shinyAppAuth0(ui, server)

library(shiny)

ui <- fluidPage(
    textInput("nome","Qual o seu nome?"),
    textOutput("boasVindas"),
    
    numericInput("idade", "Qual a sua idade?", value= NA),
    textOutput("idade")
)

server <- function(input, output,session){
    
    output$boasVindas <- renderText({
        paste0("Olá ", input$nome)
    })
    
    output$idade <- renderText({
        paste0("Sua idade é ", input$idade)
    })
}

shinyApp(ui, server)

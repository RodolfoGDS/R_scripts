library(shiny)

ui <- fluidPage(
    selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
    verbatimTextOutput("summary"),
    tableOutput("table")
)

#fluidPage() -> é uma função de layout que configura a estrutura visual básica da página. 
# selectInput() -> é um controle de entrada que permite que o usuário interaja com o aplicativo 
# fornecendo um valor
# verbatimTextOutput() -> informa ao shiny onde colocar a saída renderizada e exibe o código.
# tableOutput() -> informa ao shiny onde colocar a saída e exibe tabelas.

server <- function(input, output, session) {
    
    dataset <- reactive({
        get(input$dataset, "package:datasets")
    })  
    
    output$summary <- renderPrint({
       summary(dataset())
    })
    
    output$table <- renderTable({
        dataset()
    })
}


shinyApp(ui, server)
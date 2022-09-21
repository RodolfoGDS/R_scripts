

#Bibliografia: https://shiny.rstudio.com/articles/persistent-data-storage.html
## https://github.com/tidyverse/googlesheets4

# Criando funções para resolver o problema de armazenamento dos dados

saveData <- function(data) {
    data <- as.data.frame(t(data))
    if (exists("responses")) {
        responses <- rbind(responses, data)
    } else {
        responses <- data
    }
}

loadData <- function() {
    if (exists("responses")) {
        responses
    }
}
# Pacotes para carregar 

library(shiny)


# Definindo os campos a serem salvos 

fields <- c("salario", "data","rendaExtra","valorInvestido","classeInvestimento")


ui <-  fluidPage( theme = bslib::bs_theme(bootswatch = "solar"),
         DT::dataTableOutput("responses", width = 300),tags$hr(),
             navbarPage(title= "Controle de gastos  --   Faça o acompanhamento diário de seus gastos" ),
                  tabsetPanel(
                      tabPanel("Receita e Investimentos",
                                fluidRow(
                                    column(4,
                                       numericInput("salario", label = "Digite o seu salário", min = 0, value=0),
                                       dateInput("data", label = "Digite a data de recebimento", language = "pt", format = "dd-mm-yyyy" )),
                                    
                                    column(4,   
                                    numericInput("rendaExtra", label = "Valor de Renda Extra", value = 0 , min =0),
                                    numericInput("valorInvestido", label = "Valor Investido no mês", value = 0 )),
                                    
                                    column(4,
                                       selectInput("classeInvestimento", label ="Tipo de Investimento",
                                                  choices = c("CDBs", "Ações","FIIs", "Renda Fixa", "LCI", "LCA"), multiple = T ),
                                       actionButton("salvar", label = "Salvar os Dados", class = "btn btn sucess"))),
                               
                                   
                                   
                                   ) ))
                  
                 


server <-  function(input, output, session){
    formData <- reactive({
        data <- sapply(fields, function(x) input[[x]])
        data
    })
    
    observeEvent(input$salvar,{
        saveData(formData())
    })
    
    output$responses <- DT::renderDataTable({
        input$salvar
        loadData()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

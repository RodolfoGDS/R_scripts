

#Bibliografia: https://shiny.rstudio.com/articles/persistent-data-storage.html
## https://github.com/tidyverse/googlesheets4

# Criando função  para resolver o problema de armazenamento dos dados

library(googlesheets4)


saveData <- function(data, SHEET_ID){
  data <- data %>% as.list() %>% data.frame()
  sheet_append(SHEET_ID, data)
}


# Passando o acesso a ao googlsheet e o endereço para as tabelas

gs4_auth()

entrada_investimento <- "https://docs.google.com/spreadsheets/d/1Qe6SBb3eSG3-LcdMQHU36XpPofNfxhNPYPN-0PBBrmQ/edit#gid=0"
gastos_debito <- "https://docs.google.com/spreadsheets/d/12wxypt8tsiAZBVkFvTfB2YTCuvywMXpbQjlLvD62J8U/edit#gid=0"
gastos_credito <- "https://docs.google.com/spreadsheets/d/1S4kO_MVcgHTTL3XVvrfhGfMFBNK65pjRjc1686FizYE/edit#gid=0"


# Pacotes para carregar o web app

library(shiny)

##########################################################

## Interface do Usuário

ui <-  fluidPage( theme = bslib::bs_theme(bootswatch = "solar"),
       
             navbarPage(title= "Controle de gastos  --   Faça o acompanhamento diário de seus gastos" ),
                  tabsetPanel(
                  
              # Abertura de fluidPage e tabSetPanel
      #############################################################################
              #Inicio
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
                                                  choices = c("CDBs", "Ações","FIIs", "Renda Fixa", "LCI", "LCA")),
                                       actionButton("salvar", label = "Salvar os Dados", class = "btn btn sucess"))),
                                fluidRow(
                                    column(6,
                                           plotOutput("Receita")),
                                    column(6,
                                           tableOutput("investimento"))
                                )
                                   
                                   ),
                      
                      #Fim
                  ####################################################### 
                     #Inicio 
                       tabPanel("Gastos no Débito",
                              fluidRow(
                                  column(3,
                                         numericInput("gastoDebito", "Valor do Gasto", min = 0 , value = 0)),
                                  column(3,
                                         dateInput("data_gasto_debito", "Data", language = "pt", format = "dd-mm-yyyy")),
                                  column(3, 
                                        selectInput("categoria_gastos_debito", "Categoria dos Gastos",
                                                    choices = c("Transporte", "Alimentação", "Residencia","Cartão de Crédito",
                                                                "Filhos", "Educação", "Lazer") )),
                                  column(3,
                                         textInput("descricao_gasto_debito", "Descrição do Gasto"),
                                         actionButton("salvar1", "Salvar Dados", class = "btn btn sucess"))
                              ),
                              
                              
                              fluidRow(
                                  column(6,
                                         plotOutput("GastosDebito")),
                                  column(6,
                                         plotOutput("GastosDebitoCategoria"))
                              )
                              
                                ),
                      #Fim
                  #################################################################    
                    
                      tabPanel("Gastos no Crédito",
                               fluidRow(
                                 column(3, 
                                        numericInput("gastoCredito", label = "Valor do Gasto", value = 0)),
                                 column(3,
                                        dateInput("data_gasto_credito", "Data do Gasto", language = "pt", format ="dd-mm-yyyy")),
                                 column(3,
                                        selectInput("categoria_gasto_credito", "Categoria dos Gastos", 
                                                    choices = c("Transporte", "Alimentação", "Residencia","Cartão de Crédito",
                                                                "Filhos", "Educação", "Lazer") )),
                                 column(3,
                                        textInput("descricao_gasto_credito", "Descrição do Gasto"),
                                        actionButton("salvar2", "Salvar Dados", class = "btn btn sucess"))
                                 ),
                               
                               fluidRow(
                                 column(6,
                                        plotOutput("GastosCredito")),
                                 column(6, 
                                        plotOutput("GastosCreditoCategoria"))
                               )
                                 )
                  
      #############################################################################
                  #Fechamento de fluidPage e tabSetPanel
                    
                      ))
                  
   #Fim da User Interface              
################################################################

server <-  function(input, output, session){

  #Back-end Receita e Investimentos
  
    data <- reactive({
      data.frame(input$salario,input$data, input$rendaExtra,input$valorInvestido,input$classeInvestimento )
    })
    
    observeEvent(input$salvar,{
      saveData(data(), entrada_investimento)
      
    })
    
    
   #Back-end Gastos no Débito
    
    data1 <- reactive({
      data.frame(input$gastoDebito, input$data_gasto_debito,input$categoria_gastos_debito, input$descricao_gasto_debito)
    })
    
    observeEvent(input$salvar1,{
     saveData(data1(), gastos_debito)
    })
    
    #Back-end Gastos no Crédito
    
    data2 <- reactive({
      data.frame(input$gastoCredito, input$data_gasto_credito, input$categoria_gasto_credito, input$descricao_gasto_credito)
    })
    
    observeEvent(input$salvar2,{
      saveData(data2(),gastos_credito)
    })
    
}

## Final do Server
##############################################################

# Run the application 
shinyApp(ui = ui, server = server)

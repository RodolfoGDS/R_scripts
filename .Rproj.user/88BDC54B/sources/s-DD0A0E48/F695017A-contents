
#bibliografia
# https://gargle.r-lib.org/articles/non-interactive-auth.html
# https://gargle.r-lib.org/articles/gargle-auth-in-client-package.html

##########################################################


# Carregando pacotes

library(googlesheets4)
library(googledrive)
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(lubridate)

##########################################################

# Criando funcao  para resolver o problema de armazenamento dos dados

saveData <- function(data, SHEET_ID){
  data <- data %>% as.list() %>% data.frame()
  sheet_append(SHEET_ID, data)
}



##########################################################

# Passando o acesso ao googlsheet e o endereço para as tabelas
gs4_auth(cache = ".secrets", email = TRUE, use_oob = TRUE)

entrada <- "https://docs.google.com/spreadsheets/d/1Qe6SBb3eSG3-LcdMQHU36XpPofNfxhNPYPN-0PBBrmQ/edit#gid=0"
investimento <-" https://docs.google.com/spreadsheets/d/1Csrc-S0wCqdo34g9n2SmfjhZFMaWpOPHb8bthSjpCFs/edit#gid=0"
gastos_debito <- "https://docs.google.com/spreadsheets/d/12wxypt8tsiAZBVkFvTfB2YTCuvywMXpbQjlLvD62J8U/edit#gid=0"
gastos_credito <- "https://docs.google.com/spreadsheets/d/1S4kO_MVcgHTTL3XVvrfhGfMFBNK65pjRjc1686FizYE/edit#gid=0"




##########################################################
## Interface do Usuário

ui <-  fluidPage( theme = bslib::bs_theme(bootswatch = "solar"),
           
             navbarPage(title= "Controle de gastos  --   Faça o acompanhamento diário de seus gastos" ),
                  tabsetPanel(
                  
              # Abertura de fluidPage e tabSetPanel
      #############################################################################
              #Inicio
                    
                      tabPanel("Entrada e Investimentos",
                                fluidRow(
                                    column(6,
                                      
                                       numericInput("salario", label = "Digite valor de Entrada", min = 0, value=0),
                                       dateInput("data", label = "Digite a data de recebimento", language = "pt", format = "dd-mm-yyyy" ),
                                       actionButton("salvar_entrada", label = "Salavar dados de entrada", class = "btn btn sucess"),
                                   
                                       selectInput("classeInvestimento", label ="Tipo de Investimento",
                                                   choices = c("Nenhum","CDBs", "Acoes","FIIs", "Renda Fixa", "LCI", "LCA")),
                                       numericInput("valorInvestido", label = "Valor Investido no mes", value = 0 ),
                                       dateInput("data_investimento", label = "Digite a data do investimento", language = "pt", format = "dd-mm-yyyy"),
                                       actionButton("salvarinvestimento", label = "Salvar os dados de investimento", class = "btn btn sucess"),
                                       plotlyOutput("RelacaoEntradaInvestimento")),
                                    
                                    column(6,
                                           plotlyOutput("Receita"),
                                           plotlyOutput("investimento"))
                                
                                      ) 
                                   ),
                      
                      #Fim
                  ####################################################### 
                     #Inicio 
                       tabPanel("Gastos no Debito",
                              fluidRow(
                                  column(3,
                                         numericInput("gastoDebito", "Valor do Gasto", min = 0 , value = 0)),
                                  column(3,
                                         dateInput("data_gasto_debito", "Data", language = "pt", format = "dd-mm-yyyy")),
                                  column(3, 
                                        selectInput("categoria_gastos_debito", "Categoria dos Gastos",
                                                    choices = c("Transporte", "Alimentacao", "Residencia","Cartao de Credito",
                                                                "Filhos", "Educacao", "Lazer") )),
                                  column(3,
                                         textInput("descricao_gasto_debito", "Descrição do Gasto"),
                                         actionButton("salvar1", "Salvar Dados", class = "btn btn sucess"))
                              ),
                              
                              
                              fluidRow(
                                  column(6,
                                         plotlyOutput("GastosDebito")),
                                  column(6,
                                         plotlyOutput("GastosDebitoCategoria"))
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
                                                    choices = c("Transporte", "Alimentacão", "Residencia","Cartao de Credito",
                                                                "Filhos", "Educacao", "Lazer") )),
                                 column(3,
                                        textInput("descricao_gasto_credito", "Descrição do Gasto"),
                                        actionButton("salvar2", "Salvar Dados", class = "btn btn sucess"))
                                 ),
                               
                               fluidRow(
                                 column(6,
                                        plotlyOutput("GastosCredito")),
                                 column(6, 
                                        plotlyOutput("GastosCreditoCategoria"))
                               )
                                 )
      
      ####1#########################################################################
                  #Fechamento de fluidPage e tabSetPanel
                 
                      ))
                  
   #Fim da User Interface              
################################################################

server <-  function(input, output, session){

  thematic::thematic_shiny()  
  
########## Back-end Entrada e Investimentos ###########
  ################# %%%%%%%%%%%% ########################
 
   # Funcao reativa para receber os dados inseridos no UI na parte de entrada
  
    data <- reactive({
      data.frame(input$salario,input$data, lubridate::month(input$data))
    })
    
    # Chamando a funcao para salvar os dados na tabela Google sheet Entrada
    
    observeEvent(input$salvar_entrada,{
      saveData(data(),entrada)
    })
    
  # Funcao reativa para receber os dados inseridos no UI na parte de investimento
    
    data1 <- reactive({
      data.frame(input$valorInvestido, input$classeInvestimento,input$data_investimento, lubridate::month(input$data_investimento))
    })
    
    # Chamando a funcao para salvar os dados na tabela Google sheet Investimento
    
    observeEvent(input$salvarinvestimento,{
      saveData(data1(), investimento)
      
    })
    
    # Criando um dataframe para somar os dados de entrada por mes 
    
    df <- data.frame(read_sheet(entrada))
    acumulado_entrada <-  df %>% 
      group_by(MES) %>% 
      summarise_at(vars(ENTRADA),
                   list(name = sum))
    names(acumulado_entrada) <- c("Mes", "Entrada_acumulado")
  
    # Grafico de barras para apresentar as entradas por mes 
    
    output$Receita <-renderPlotly({
      ggplot( acumulado_entrada,aes(x=Mes, y = Entrada_acumulado))+
        geom_bar(stat = "identity", fill = "green")+
        labs(x="Meses do ano", y="", title = "Entrada por mes")
    }) 
 
    # Criando um dataframe para somar os dados de investimento por mes e classe 
    
    df2 <- data.frame(read_sheet(investimento))
    acumulado_valor_investido <-  df2 %>% 
      group_by(MES, CLASSE_DE_INVESTIMENTO) %>% 
      summarise_at(vars(VALOR_INVESTIDO),
                   list(name = sum))
    names(acumulado_valor_investido) <- c("Mes","CLASSE_DE_INVESTIMENTO", "VALOR_INVESTIDO")
    
    
    
    df2_2 <- data.frame(read_sheet(investimento))
    acumulado_valor_investido_mes <-  df2_2 %>% 
      group_by(MES) %>% 
      summarise_at(vars(VALOR_INVESTIDO),
                   list(name = sum))
    names(acumulado_valor_investido_mes) <- c("Mes", "VALOR_INVESTIDO")
    
    
    # Grafico de barras para apresentar os investimentos por classe e mes
    
    output$investimento <- renderPlotly({
      ggplot(acumulado_valor_investido, 
             aes(fill = CLASSE_DE_INVESTIMENTO, x=Mes, y = VALOR_INVESTIDO))+
               geom_bar(position = "stack",stat = "identity")+
               theme(legend.position = "none")+
               labs(x = "Meses do ano", y="", title = "Distribuicao dos investimentos por mes")
    })
      
    # Grafico de linhas para comparar os valores de entrada por investimento a cada mes
    
    output$RelacaoEntradaInvestimento <- renderPlotly({
      ggplot()+
      geom_line(acumulado_valor_investido_mes,mapping =  aes(x=Mes, y = VALOR_INVESTIDO), color ="green")+
        geom_point(acumulado_valor_investido_mes,mapping =  aes(x=Mes, y = VALOR_INVESTIDO))+
        geom_line(data = acumulado_entrada, mapping = aes(x=Mes, y = Entrada_acumulado), color = "blue")+
        geom_point(data = acumulado_entrada, mapping = aes(x=Mes, y = Entrada_acumulado))+
        theme(legend.position = "none")+
        labs(x = "Meses do ano", y = "", title = "Relacao entre a Entrada e o Investido")
    })
    
################################################################    
############# #Back-end Gastos no Débito #############
####################### %%%%%%%%%%% ###########################
    
    # Funcao reativa para receber os dados inseridos no UI na parte de gastos debito
    
    data3 <- reactive({
      data.frame(input$gastoDebito,input$data_gasto_debito, input$categoria_gastos_debito, input$descricao_gasto_debito, lubridate::month(input$data_gasto_debito))
    })
    
    # Chamando a funcao para salvar os dados na tabela Google sheet gastos debito
    
    observeEvent(input$salvar1,{
      saveData(data3(),gastos_debito)
    })
    
    
    
    df3 <- data.frame(read_sheet(gastos_debito))
    acumulado_gasto_debito <- df3 %>% 
      group_by(MES) %>% 
    summarise_at(vars(GASTO),
                 list(name = sum))
    names(acumulado_gasto_debito) <- c("Mes", "acumulado_gasto")
    
    # Criando grafico de barras para representar os gastos debitos
    
    output$GastosDebito <-renderPlotly({
      ggplot(acumulado_gasto_debito,aes(x =Mes, y = acumulado_gasto))+
        geom_bar(stat = "identity", fill="green", FUN = sum)+
        labs(x="", y="", title="Gasto por mes")
    })
    
    df4 <- data.frame(read_sheet(gastos_debito))
    acumulado_valor_gasto_debito <-  df4 %>% 
      group_by(MES, CATEGORIA_GASTO) %>% 
      summarise_at(vars(GASTO),
                   list(name = sum))
    names(acumulado_valor_gasto_debito) <- c("Mes","CATEGORIA_GASTO", "GASTO_TOTAL")
    
    output$GastosDebitoCategoria <- renderPlotly({
      ggplot(acumulado_valor_gasto_debito, 
             aes(fill = CATEGORIA_GASTO, x=Mes, y = GASTO_TOTAL))+
        geom_bar(position = "stack",stat = "identity")+
        theme(legend.position = "none")+
        labs(x = "Meses do ano", y="", title = "Distribuicao dos gastos de debito por mes")
    })
    
    
###########################################################################    
################## Back-end Gastos no Credito #############################
#########################%%%%%%%%%%%%%%%%%%%###############################
    
    
    data2 <- reactive({
      data.frame(input$gastoCredito, input$data_gasto_credito, input$categoria_gasto_credito, input$descricao_gasto_credito, lubridate::month(input$data_gasto_credito))
    })
    
    observeEvent(input$salvar2,{
      saveData(data2(),gastos_credito)
    })
    
    
    
    
    df5 <- data.frame(read_sheet(gastos_credito))
    acumulado_gasto_credito <- df5 %>% 
      group_by(MES) %>% 
      summarise_at(vars(GASTO),
                   list(name = sum))
    names(acumulado_gasto_credito) <- c("Mes", "acumulado_gasto_credito")
    
    # Criando grafico de barras para representar os gastos debitos
    
    output$GastosCredito <-renderPlotly({
      ggplot(acumulado_gasto_credito,aes(x =Mes, y = acumulado_gasto_credito))+
        geom_bar(stat = "identity", fill="green", FUN = sum)+
        labs(x="", y="", title="Gasto por mês")
    })
    
    df6 <- data.frame(read_sheet(gastos_credito))
    acumulado_valor_gasto_credito <-  df6 %>% 
      group_by(MES, CATEGORIA_GASTO) %>% 
      summarise_at(vars(GASTO),
                   list(name = sum))
    names(acumulado_valor_gasto_credito) <- c("Mes","CATEGORIA_GASTO", "GASTO_TOTAL")
    
    output$GastosCreditoCategoria <- renderPlotly({
      ggplot(acumulado_valor_gasto_credito, 
             aes(fill = CATEGORIA_GASTO, x=Mes, y = GASTO_TOTAL))+
        geom_bar(position = "stack",stat = "identity")+
        theme(legend.position = "none")+
        labs(x = "Meses do ano", y="", title = "Distribuicao dos gastos de crédito por mes")
    })
    
}

## Final do Server
##############################################################

# Run the application 
shinyApp(ui = ui, server = server)

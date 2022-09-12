


library(shiny)
library(geobr)

estados <- read_state()
municipios <- read_municipality()
ui <- fluidPage(
    
         tabsetPanel(

            tabPanel("Identificação",
                     column(4,
                     textInput("cod_ident_furo",label = NULL, value = "Código de identificação do furo"),
                     textInput("cod_projeto",label = NULL, value = "Código do Projeto"),
                     textInput("operador_poço",label = NULL, value = "Operador do Poço"),
                     textInput("sondador_poço",label = NULL, value = "Sondador do Poço" )),
                     column(4,
                     textInput("custodiante_poço",label = NULL, value = "Custodiante do Poço"),
                     dateInput("data_inicio", label = "Data de início da Perfuração"),
                     dateInput("data_final", label = "Data final da Perfuração")),
                     column(4,
                     selectInput("estado", label = NULL,selected = estados$name_state[2],estados$name_state),
                     selectInput("municipio", label = NULL,municipios$name_muni),
                     textInput("referencia", label = NULL, value = "Documento de Referencia"),
                     textInput("descritor", label = NULL, value = "Descritor"))
                     ),

            tabPanel("Collar/Posição",
                     textInput("collar_cod_furo", label = NULL, value ="Código de identificação do furo"),
                     numericInput("latitude", label = "Latitude", value = 0),
                     numericInput("longitude", label = "Longitude", value = 0),
                     numericInput("elevacao", label = "Elevação", value = 0)
                     
                     )
         )

  )








server <- function(input, output, session){}
#     codigo <- input$"cod_ident_furo"





  
# Run the application 
shinyApp(ui = ui, server = server)

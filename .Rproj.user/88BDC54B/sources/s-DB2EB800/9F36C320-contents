


library(shiny)
library(geobr)
library(sf)
library(leaflet)
library(dplyr)

estados <- read_state()
municipios <- read_municipality()
ui <- fluidPage(
  navbarPage(
    title=div(img(src=""), "Modulo Sondagem")),
    
         tabsetPanel(

            tabPanel("Identificação",
                     
                     column(4,
                     textInput("cod_ident_furo",label = "Código de identificação do furo"),
                     textInput("cod_projeto",label =  "Código do Projeto"),
                     textInput("operador_poço",label =  "Operador do Poço"),
                     textInput("sondador_poço",label =  "Sondador do Poço" )),
                     
                     column(4,
                     textInput("custodiante_poço",label = "Custodiante do Poço"),
                     dateInput("data_inicio", label = "Data de início da Perfuração", language = "pt", format = "dd-mm-yyyy"),
                     dateInput("data_final", label = "Data final da Perfuração", language = "pt",  format = "dd-mm-yyyy"),
                     selectInput("estado", label = "Estado",selected = estados$name_state[2],estados$name_state)),
                     
                     column(4,
                     
                     selectizeInput("municipio", label = "Municipio",  choices = NULL),
                     textInput("referencia", label =  "Documento de Referencia"),
                     textInput("descritor", label =  "Descritor"),
                     actionButton("Salvar",label = "Salvar",class = "btn-lg btn-sucess"))
                     
                     ),
            
            
       #  Fim  da identificação do furo de sondagem      
################################################################################


            tabPanel("Collar/Posição",
                     column(3,
                     fileInput("file", "GPS", buttonLabel = "Upload..."),
                     numericInput("latitude", label = "Latitude", value = 0),
                     numericInput("longitude", label = "Longitude", value = 0),
                     numericInput("elevacao", label = "Elevação", value = 0),
                     textInput("metodo_posicionamento", label=  "Método de Posiconamento"),
                     numericInput("precisao_posicional", label = "Precisão Posicional", value = 0),
                     actionButton("Salvar",label = "Salvar",class = "btn-lg btn-sucess")),
                     
                     column(9,
                     leafletOutput("mapa"))
                     
                     ),


        # Fim da Parte de Collar / Posição 
###############################################################################
            tabPanel("Descrição/Detalhes do Furo",
                     column(4,
                     
                     radioButtons("tipo_finalidade", label = "Finalidade da sondagem", choices = c("Perfuração para água", "Perfuração Estratigrafica"), inline = T),
                     selectInput("metodo_perfuração", "Método de Perfuração", 
                                 choices = c("Trado","Percursão SPT","Rotativa", "Mista", "Geofisica"), multiple = T),
                     numericInput("diametro_poco", "Diametro do Poço",min = 0,max = 100, value = 0),
                     actionButton("Salvar",label = "Salvar",class = "btn-lg btn-sucess")),
                     
                     column(4,
                     numericInput("ponto de partida", label = "Cota inicial da perfuração", value = 0),
                     numericInput("intervalo_inicio", label = "Intervalo de Inicio", value = 0 ),
                     numericInput("intervalo_fim", label = "Intervalo final", value = 0)),
                     
                     column(4,
                     selectInput("tipo_inclinacao", label= "Tipo de Inclinação", choices = c("reto", "direcional")),
                     textInput("custodiante_material_extraido", label = "Custodiante do Material Extraido"),
                     textInput("custodiante_do_dado", label = "Custodiante do Dado"),
                     numericInput("comprimento_poco", label = "Comprimento do Poço", value = 0 ))
                     
            ),


# Fim da Parte Descrição / Detalhe 
###############################################################################                          
          tabPanel("Intervalo/Geologia",
                   fluidRow(
                     column(12, div(style ="height:50px; background-color: gray", "Intervalo/Survey")),
                             column(4, 
                                    numericInput("profundiade_em", label = "Profundidade em: ", value = 0),
                                    fileInput("file", "Dataset", buttonLabel = "Upload...")  ),
                             column(4,
                                    numericInput("azimuth", label = "Azimuth", value = 0 , min = 0 , max = 359)),
                             column(4,
                                    numericInput("inclinacao", label = "Inclinação", value = 0 , min = 0 , max = 90)
                            
                           )),
                   
                   fluidRow(
                     column(12, div(style ="height:50px;background-color: gray","Geologia/Geology")),
                             column(4, 
                                    numericInput("profundidade_de", value = 0, label = "profundidade_topo"),
                                    fileInput("file", "Dataset", buttonLabel = "Upload...")),
                             column(4,
                                    numericInput("profundidade_para",value = 0, label = "profundidade_base")),
                             column(4,
                                    textInput("nome_material_density",  label = "Density/Rocha") ),
                                   
                           ))



# Fim da Parte Intervalo/Geologia 
###############################################################################   

      )

  )




             
        
        

                        #  fim da User Interface ##
################################################################################
################################################################################
################################################################################
                      #  Inicio do Server side ##


server <- function(input, output, session){
  output$mapa <- renderLeaflet({
    leaflet() %>% addTiles() %>% 
      addMarkers(lng = input$longitude, lat = input$latitude, popup = input$cod_ident_furo)
    
  })
  
  
  
  updateSelectizeInput(session,"municipio", choices = municipios$name_muni, server = TRUE )
  
}


# -43.154818, -22.949278

                            #  fim do server Side ##
#######################################################################################################
#######################################################################################################
#######################################################################################################





# Run the application 
shinyApp(ui = ui, server = server)

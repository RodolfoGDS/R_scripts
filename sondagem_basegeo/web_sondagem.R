

# Pacotes utilizados para o web app 

library(shiny)
library(geobr)
library(sf)
library(leaflet)
library(dplyr)

# Objetos criados para o web app

estados <- read_state()
municipios <- read_municipality()


## Interface do usuário

#### lista de temas bootstrap  “cerulean”, “cosmo”, “cyborg”, “darkly”, “flatly”,
# “journal”, “litera”, “lumen”, “lux”, “materia”, “minty”, “pulse”, “sandstone”,
#“simplex”, “sketchy”, “slate”, “solar”, “spacelab”, “superhero”, “united”, “yeti”


ui <- fluidPage( theme = bslib::bs_theme(bg = "white",fg = "black",   version = 3),
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
                     fileInput("file", "GPS", buttonLabel = "Upload"),
                     numericInput("latitude", label = "Latitude", value = 0),
                     numericInput("longitude", label = "Longitude", value = 0),
                     numericInput("elevacao", label = "Elevação", value = 0),
                     textInput("metodo_posicionamento", label=  "Método de Posiconamento"),
                     numericInput("precisao_posicional", label = "Precisão Posicional", value = 0),
                     actionButton("Salvar",label = "Salvar",class = "btn-lg btn-sucess")),
                     
                     column(9,
                     leafletOutput("mapa"))
                     
                     ),


# exemplo de longitude e latitude  :   -43.154818, -22.949278

        # Fim da Parte de Collar / Posição 
###############################################################################
           

           tabPanel("Descrição/Detalhes do Furo",
                    fluidRow(
                      column(12,div(style ="height:50px; background-color: gray", "Detalhes do Furo")),
                             column(4,
                             numericInput("ponto de partida", label = "Cota inicial da perfuração", value = 0),
                             selectInput("tipo_inclinacao", label= "Tipo de Inclinação", choices = c("reto", "direcional"))),
                      
                             column(4,
                             textInput("custodiante_material_extraido", label = "Custodiante do Material Extraido"),
                             textInput("custodiante_do_dado", label = "Custodiante do Dado")),
                            
                            column(4,
                             numericInput("comprimento_poco", label = "Comprimento do Poço", value = 0 ),
                             actionButton("Salvar",label = "Salvar",class = "btn-lg btn-sucess"))),
                    
                    fluidRow(
                      column(12,div(style ="height:50px; background-color: gray", "Descrição do Furo")),
                            column(4,
                            radioButtons("tipo_finalidade", label = "Finalidade da sondagem", 
                                         choices = c("Perfuração para água", "Perfuração Estratigrafica"), inline = T),
                            selectInput("id_metodo_perfuração", "Método de Perfuração", 
                                       choices = c("Trado","Percursão SPT","Rotativa", "Mista", "Geofisica"), multiple = T)),
                      
                            column(4,
                            selectInput("id_equipamento_perfuração", "Equipamento de Perfuração", 
                                       choices = c("Equipamento A", "Equipamento B", "Equipamento C", "Equipamento n..."), multiple = T),
                            numericInput("diametro_poco", "Diametro do Poço",min = 0,max = 100, value = 0)),
                     
                            column(4,
                            numericInput("intervalo_inicio", label = "Intervalo de Inicio", value = 0 ),
                            numericInput("intervalo_fim", label = "Intervalo final", value = 0),
                            actionButton("Salvar",label = "Salvar",class = "btn-lg btn-sucess")))
                    ),


# Fim da Parte Descrição / Detalhe 
###############################################################################                          
         

           tabPanel("Intervalo/Geologia",
                   fluidRow(
                     column(12, div(style ="height:50px; background-color: gray", "Intervalo/Survey")),
                             column(4, 
                                    numericInput("profundiade_em", label = "Profundidade em: ", value = 0),
                                    fileInput("file", "Dataset", buttonLabel = "Upload")  ),
                             column(4,
                                    numericInput("azimuth", label = "Azimuth", value = 0 , min = 0 , max = 359),
                                    actionButton("salvar", label = "Salvar", class = "btn-lg btn-sucess")),
                             column(4,
                                    numericInput("inclinacao", label = "Inclinação", value = 0 , min = 0 , max = 90)
                            
                           )),
                   
                   fluidRow(
                     column(12, div(style ="height:50px;background-color: gray","Geologia/Geology")),
                             column(4, 
                                    numericInput("profundidade_de", value = 0, label = "profundidade_topo"),
                                    fileInput("file", "Dataset", buttonLabel = "Upload")),
                             column(4,
                                    numericInput("profundidade_para",value = 0, label = "profundidade_base"),
                                    actionButton("salvar", label = "Salvar", class = "btn-lg btn-sucess")),
                             column(4,
                                   selectInput("nome_material_density",  label = "Density/Rocha",
                                               choice=c("Rocha A","Rocha B", "Rocha C", "Rocha D","Rocha N...."))))
                   ),



# Fim da Parte Intervalo/Geologia 
###############################################################################   
            
    
        tabPanel("Hidro/Amostra água",
                     fluidRow(
                       column(12, div(style = "height: 50px; background-color: gray", "Base Hidro")),
                        column(3,
                               textInput("cod_ident_ana",label = "Código de Identificação na ANA")),
                       column(3,
                              selectInput("id_material_espaco_anular", label = "Material Espaço Anular",
                                          choices = c("Material A", "Material B", "Material C", "Material N...."))),
                       column(3,
                              selectInput("id_material_revestimento", label ="Material de Resvestimento",
                                          choices = c("Material A", "Material B", "Material C", "Material N....") )),
                       column(3,
                              numericInput("entrada_de_agua", label = "Profundidade de entrada de agua", value = 0))
                     ),
                     
                     fluidRow(
                       column(12, div(style = "height:50px;background-color:gray", "Amostra de Água")),
                        
                       column(4,
                              textInput("identificacao_amostra",label = "Código da amostra"),
                              dateInput("data_coleta", label = "Data da Coleta in situ", language = "pt",
                                        format = "dd-mm-yyyy" ),
                              textInput("coletor", label = "Coletor")),
                       
                       column(4,
                               numericInput("volume", label = "Volume da amostra", value = 0, min = 1),
                               numericInput("profundidade_de", label = "Profunidade da coleta", value = 0)),
                       
                       column(4,
                              textInput("referencia_processo_dnpm", label = "Referencia Proocesso ANM"),
                              actionButton("salvar", label = "Salvar", class = "btn-lg btn-sucess")))
                     
                     ),





# Fim da Parte Base Hidro/ Amostra água
###############################################################################   
       

         tabPanel("Assay_Amostra/Dado Geofisico",
                 fluidRow(
                   column(12, div(style = "height: 50px; background-color: gray","Assay_Amostra")),
                   column(3, 
                          fileInput("dataset", label = "Carregar dados", buttonLabel = "upload"),
                          selectInput("classe", label = "Classe", choices = c("Rocha","Solo","Testemunho","Água"))),
                         
                   column(3, 
                          textInput("cod_amostra", label = "Código da Amostra"),
                          numericInput("profundidade_topo", label = "Profundidade do topo", value = 0)),
                          
                   column(3,
                          numericInput("profundidade_base", label = "Profundidade da base", value = 0 ),
                          textInput("observacao", label = "Observação")),
                         
                   column(3,
                          selectInput("nome_da_rocha", label = "Nome da Rocha",
                                      choices = c("Dicionário de nomes de Rochas", "Rocha A", "Rocha B", "Rocha C", "Rocha N....")),
                          actionButton("salvar", label = "Salvar", class = "btn-lg btn-sucess"),
                          actionButton("modulo_amostra", label = "Modulo Amostra", class = "btn-lg btn-sucess"))
                         
                 ),
                 
                 fluidRow(
                   column(12, div(style = "height:50px; background-color:gray", "Dado Geofísico")),
                   column(4,
                          selectInput("id_metodo_geofisico", label = "Método Geofísico",
                                      choices= c("Sismica de reflexão", "Sismica  de refração","GPR",
                                                 "Gravimetria", "Magnetometria","Eletromagnético",
                                                 "Polarização Induzida","Magnetotelúrico","Resistividade",
                                                 "Potencial espontaneo","Radiométrico"
                                                 ), multiple = T)),
                   column(4,
                          selectInput("id_equipamento_geofisico", label = "Equipamento Geofísico",
                                      choices = c("Equipamento A", "Equipamento B", "Equipamento C", "Equipamento D"),
                                      multiple = T)),
                   
                   column(4,
                          textInput("referencia_resultado", label = "Resultado"),
                          actionButton("salvar", label = "Salvar", class = "btn-lg btn-sucess"))
                 )
            )



# Fim da Parte Assay Amostra / dado Geofisico
###############################################################################   

# Fechamento dos parenteses de tabsetPanel e FluidPage

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




                            #  fim do server Side ##
#######################################################################################################
#######################################################################################################
#######################################################################################################





# Run the application 
shinyApp(ui = ui, server = server)

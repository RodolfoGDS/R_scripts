

# Pacotes utilizados para o web app 

library(shiny)
library(geobr)
library(sf)
library(leaflet)
library(dplyr)

# Objetos criados para o web app

estados <- read_state()
municipios <- read_municipality()
# View(head(municipios))
# View(head(estados))

# https://mastering-shiny.org/action-tidy.html
## Interface do usuário

#### lista de temas bootstrap  “cerulean”, “cosmo”, “cyborg”, “darkly”, “flatly”,
# “journal”, “litera”, “lumen”, “lux”, “materia”, “minty”, “pulse”, “sandstone”,
#“simplex”, “sketchy”, “slate”, “solar”, “spacelab”, “superhero”, “united”, “yeti”


ui <- fluidPage( theme = bslib::bs_theme(bg = "white",fg = "black",   version = 3),
  navbarPage(
    title=div(img(src=""), "Modulo Sondagem")),
    
         tabsetPanel(
           
           
           
           tabPanel("Posicionamento",
                    column(3,
                           fileInput("file", "GPS", buttonLabel = "Upload"),
                           dateInput("data_determinacao", label = "Data de Determinação", language = "pt",  format = "dd-mm-yyyy"),
                           numericInput("latitude", label = "Latitude", value = 0),
                           numericInput("longitude", label = "Longitude", value = 0),
                           numericInput("elevacao", label = "Elevação", value = 0),
                           textInput("datum", label = "Datum"),
                           textInput("metodo_posicionamento", label=  "Método de Posiconamento"),
                           numericInput("precisao_posicional", label = "Precisão Posicional", value = 0),
                           selectInput("estado", label = "Estado",choices = unique(estados$abbrev_state)),
                           selectizeInput("municipio", label = "Municipio",  choices = NULL),
                           actionButton("Salvar",label = "Salvar",class = "btn-lg btn-sucess")),
                    
                    column(9,
                           leafletOutput("mapa"))
                    
           ),

           # exemplo de longitude e latitude  :   -43.154818, -22.949278
            
       #  Fim  da parte de Posicionamento  
################################################################################
tabPanel("Caracterização da Perfuração",
         
         column(4,
                textInput("cod_ident_furo",label = "Código de identificação do furo"),
                textInput("cod_projeto",label =  "Código do Projeto de Sondagem"),
                textInput("operador_furo",label =  "Operador do Furo"),
                textInput("sondador_furo",label =  "Sondador do Furo" )),
         
         column(4,
                selectInput("origem_dado", "Fonte de origem dos dados", choices = c("DHT-SIAGAS","DHT-RIMAS","DHT-DEGET", "DGM","ANP","Outros")),
                textInput("custodiante_furo",label = "Custodiante do Furo"),
                dateInput("data_inicio", label = "Data de início da Perfuração", language = "pt", format = "dd-mm-yyyy"),
                dateInput("data_final", label = "Data final da Perfuração", language = "pt",  format = "dd-mm-yyyy")),
         
         
         column(4,
                
                textInput("identificador_herdado", "Código Herdado"),
                textInput("referencia", label =  "Documento de Referencia"),
                textInput("observacao", label =  "Observação"),
                actionButton("Salvar",label = "Salvar",class = "btn-lg btn-sucess"))
         
),


        # Caracterização da Perfuração
###############################################################################
           

           tabPanel("Descrição e Detalhes do Furo",
                    fluidRow(
                      column(12,div(style ="height:50px; background-color: gray", "Detalhes do Furo")),
                             column(4,
                             numericInput("ponto de partida", label = "Cota inicial da perfuração", value = 0),
                             selectInput("tipo_inclinacao", label= "Tipo de Inclinação", choices = c("reto", "direcional"))),
                      
                             column(4,
                             textInput("custodiante_material_extraido", label = "Custodiante do Material Extraido"),
                             textInput("custodiante_do_dado", label = "Custodiante do Dado")),
                            
                            column(4,
                             numericInput("comprimento_poco", label = "Comprimento máximo", value = 0 ),
                             actionButton("Salvar",label = "Salvar",class = "btn-lg btn-sucess"))),
                    
                    fluidRow(
                      column(12,div(style ="height:50px; background-color: gray", "Descrição do Furo")),
                            column(4,
                            radioButtons("tipo_finalidade", label = "Finalidade da sondagem", 
                                         choices = c("Perfuração para água", "Perfuração Estratigrafica",
                                                     "Perfuração para minério", "Perfuração para óleo e gás",
                                                     "Perfuração geotecnica", "Outros"), inline =F),
                            selectInput("alvo", "Alvo - Target", choices = c("Campo de petroleo", "Corpo Mineralizado",
                                                                             "Aquifero", "Unidade estratigrafica",
                                                                             "Bacia Sedimentar"," Bacia Hodrográfica", "Outros"))),
                           
                      
                            column(4,
                            selectInput("id_equipamento_perfuração", "Equipamento de Perfuração", 
                                       choices = c("Equipamento A", "Equipamento B", "Equipamento C", "Equipamento n..."), multiple = T),
                            selectInput("id_metodo_perfuração", "Método de Perfuração", 
                                        choices = c("Trado manual","Trado Mecanico","Percursão SPT","Rotativa", "Mista",
                                                    "Geofisica", "outros"), multiple = T),
                            numericInput("diametro_poco", "Diametro do Poço",min = 0,max = 100, value = 0)),
                     
                            column(4,
                            numericInput("intervalo_inicio", label = "Intervalo de Inicio", value = 0 ),
                            numericInput("intervalo_fim", label = "Intervalo final", value = 0),
                            actionButton("Salvar",label = "Salvar",class = "btn-lg btn-sucess"))
                    )

           ),
# Fim da Parte Descrição / Detalhe 
###############################################################################                          
         

           tabPanel("Intervalo/Geologia",
                   fluidRow(
                     column(12, div(style ="height:50px; background-color: gray", "Intervalo")),
                             column(4, 
                                    numericInput("profundiade_em", label = "Profundidade em: ", value = 0),
                                    fileInput("file", "Dataset", buttonLabel = "Upload")  ),
                             column(4,
                                    numericInput("azimuth", label = "Azimuth", value = 0 , min = 0 , max = 359),
                                   
                                    numericInput("avanco", "Avanço", min = 0, value = 0),  
                                    numericInput("recuperacao", "Recuperação", min = 0 , value = 1)),
                                   
                             column(4,
                                    numericInput("inclinacao", label = "Inclinação", value = 0 , min = 0 , max = 90),
                                    actionButton("salvar", label = "Salvar", class = "btn-lg btn-sucess"))),
                          
                   
                   fluidRow(
                     column(12, div(style ="height:50px;background-color: gray","Geologia do Perfil")),
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

         tabPanel("Modulo_amostra/Dado Geofisico",
                 fluidRow(
                   column(12, div(style = "height: 50px; background-color: gray","Assay_Amostra")),
                   column(3, 
                          fileInput("dataset", label = "Carregar dados", buttonLabel = "upload"),
                          selectInput("classe", label = "Classe", choices = c("Rocha","Solo","Água"))),
                         
                   column(3,
                          selectInput("tipo-amostra", "Tipo de Amostra", choices = c("Testemunho", "Calha", "etc" )),
                          textInput("cod_amostra", label = "Código da Amostra")),
                          
                   column(3,
                          numericInput("profundidade_base", label = "Profundidade da base", value = 0 ),
                          numericInput("profundidade_topo", label = "Profundidade do topo", value = 0)),
                         
                   column(3,
                          
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
                                                 ), multiple = T),
                          selectInput("id_equipamento_geofisico", label = "Equipamento Geofísico",
                                      choices = c("Equipamento A", "Equipamento B", "Equipamento C", "Equipamento D"),
                                      multiple = T),
                          textInput("referencia_resultado", label = "Relatorios e Midias")),
                   
                   column(4,
                          textInput("escala_sensibilidade", "Escala de Sensibilidade"),
                          textInput("Constante_tempo", "Constante de Tempo"),
                          textInput("velocidade_registro","Velocidade de Registro")),
                         
                   
                   column(4,
                          numericInput("profundidade_inicial", "Profundidade Inicial", value = 0),
                          numericInput("profundidade_final", "Profundidade Final", value = 0),
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
  
  
  estado <- reactive({
    filter(municipios, abbrev_state == input$estado)
  })
  
  observeEvent(estado(), {
    choices <- unique(estado()$name_muni)
    updateSelectInput(inputId = "municipio", choices = choices)
  })
  
  
  
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

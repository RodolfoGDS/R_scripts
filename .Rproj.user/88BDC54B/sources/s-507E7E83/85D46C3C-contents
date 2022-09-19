# Ui básico 


library(shiny)
# O inputId deve ser um string simples, pode conter apenas letras, números e sublihados. Não pode ter 
# espaço, traço, ponto ou qualquer outro caracter especial. Deve ser único.

# texto livre 

#ui <- fluidPage(
#    textInput("login", "Digite o seu login"),
 #   passwordInput("Senha", "Digite a sua senha"),
#    textAreaInput("Texto_seguranca", "Digite a sua frase de segurança", rows = 3)
# )

#server <-  function(input, output, session){}
    

# Entradas numéricas  https://shiny.rstudio.com/articles/sliders.html

# ui <-  fluidPage(
  #  numericInput("num", "Número1", value = 0, min=0, max = 100),
   # sliderInput("nume2","Numero2", value= 50 , min = 0, max = 100),
#    sliderInput("range", "Range", value = c(10,20), min = 0, max = 100)
# )


# Entrada de datas

#ui <- fluidPage(
 #   dateInput("nascimento", "Data de Nascimento"),
 #   dateRangeInput("consulta","Selecione o intervalo de data:")
# )


# Escolhas Limitadas

#animais <- c("cachorro", "gato", " rato", "passaro", "burro", "outro")


#ui <- fluidPage(
 #   selectInput("Estado", "Qual o Estado de sua Residencia", state.name),
  #  radioButtons("animais", "Qual o seu animal favorito?", animais)
#)


#choicesNames ---> determina o que é mostrado ao usuário,
#choiceValues ---> determina o que é retornado em sua funçao de servidor.
#ui <- fluidPage(
  #  radioButtons("rb", "escolha um:",
    #             choiceNames = list(
    #                 icon("angry"),
     #                icon("smile"),
        #             icon("sad-tear")),
         #        choiceValues = list("angry", "happy", "sad")
          #       )
# )


# As listas suspensas craidas com o selectInput() apresentam a possibilidade de selecionar vários 
# elementos usando o multiple = TRUE.

#ui <- fluidPage(
    
 #   selectInput("Estado", "Digite os Estados com a letra A",  state.name, multiple = TRUE)
#)


# Use o checkboxGroup para selecionar mais de uma opção


#animais <- c("cachorro", "gato", " rato", "passaro", "burro", "outro")
#ui <- fluidPage(
 #   checkboxGroupInput("animal","Marque os animais que você gosta:", animais )
#)


# Para selções simples use apenaso checkboxInput

#ui <- fluidPage(
    
 #   checkboxInput("cleanup", "Limpar a selção?", value = TRUE),
  #  checkboxInput("shutdown", "Desligar?")
# )


# Uploads de arquivos

#ui <- fluidPage(
 #   fileInput("upload", NULL)
#)



# Botões de ação  : permite ao usuário uma ação 

#ui <- fluidPage(
 #   actionButton("click", "Click me!"),
 #   actionButton("drink", "Drink me!", icon = icon("cocktail"))
#)

# Personalizando os botões de ação: http://bootstrapdocs.com/v3.3.6/docs/css/#buttons


#ui <-  fluidPage(
 #   fluidRow(
  #      actionButton("click", "Click me!", class = 'btn-danger'),
   #     actionButton("drink", "Drink me!", class = "btn-lg btn-success")
#    ),
   # fluidRow(
    #    actionButton("eat","Eat me!", class = "btn-block")
#    )
# )

# Colocando um valor default dentro do textInput:  https://rdrr.io/cran/shiny/man/textInput.html
#ui <- fluidPage(
#    textInput("name", label = NULL, value = "Your name")
#)

# Criando um slider para data no formato YYYY-MM-DD https://rdrr.io/cran/shiny/man/sliderInput.html

#value = "2020-09-17"
#min = "2020-09-16"
#max = "2020-09-23"
#ui <-  fluidPage(
  #  sliderInput("deliver", "When should we deliver?", value = strptime(value,"%Y-%m-%d"),
    #            min = strptime(min,"%Y-%m-%d"),max = strptime(max,"%Y-%m-%d"), timeFormat = "%F")
#)

#?strptime()


# Criar um slide de valores entre 0 e 100 com intervalo de 5. Adcionar uma animação 
# para trocar de valor.

#ui <-  sliderInput("steps", "Escolha um valor:", value = 5 , min = 0 ,
 #                  max = 100, step = 5, animate = T)

# Criando listas de subgrupo no selectInput
 
# Saídas //  texto 

#ui <-  fluidPage(
 #   textOutput("text"),
  #  verbatimTextOutput("code")
#)

#server <- function(input, output, session){
 #   output$text <- renderText("Hello friend!" )
  #  output$code <- renderPrint(summary(1:10))
#}

# Saídas // tabelas

#ui <- fluidPage(
 #   tableOutput("static"),
  #  dataTableOutput("dynamic")
#)

#server <- function(input, output, session){
  #  output$static <- renderTable(head(mtcars))
   # output$dynamic <- renderDataTable(mtcars, options = list(pageLength = 5))
#}

# Gráficos

# <- fluidPage(
 #   plotOutput("plot", width ="400px")
#)

#server <- function(input,output, session){
 #   output$plot <- renderPlot(plot(1:5), res = 96)
#}
### Reatividade Básica

#ui <- fluidPage(
 #   textInput("name", "What's your name?"),
  #  textOutput("greeting")
#)

#server <- function(input,output,session){
#     output$greeting <- renderText({
#         paste0("hello ", input$name, "!")
#     })
# }
# 
# 
# ui <- fluidPage(
#     textInput("name", "What's your name?"),
#     textOutput("greeting")
# )
# 
# # server <- function(input,output, sessions){
# #     output$greeting <- renderText({paste0("hello ", input$name)})
# # }
# # 
# # server <- function(input,output,session){
# #     greeting <- reactive(paste0("hello ", input$name))
# #     output$greeting <- renderText({
# #         greeting()
# #     })
# # }
# 
# server <- function(input, output, server){
#     output$greeting <- renderText({
#         paste0("Hello ", input$name)
#     })
# }
library(ggplot2)

# 
# freqpoly <- function(x1,x2,binwidth = 0.1, xlim = c(-3,3)){
#     df <- data.frame(
#         x = c(x1,x2),
#         g = c(rep("x1",length(x1)), rep("x2", length(x2)))
#     )
#     ggplot(df,aes(x, colour = g))+
#         geom_freqpoly(binwidth=binwidth, size= 1)+
#         coord_cartesian(xlim=xlim)
# }
# 
# 
# t_test <- function(x1,x2){
#     test <- t.test(x1,x2)
#     sprintf(
#         "p value: %0.3f\n[%0.2f,%0.2f]",
#         test$p.value, test$conf.int[1],test$conf.int[2]
#     )
# }

# 
# ui <- fluidPage(
#     fluidRow(
#         column(4,
#                "Distribution 12",
#                numericInput("n1", label = "n", value = 1000, min = 1),
#                numericInput("mean1", label ="m", value = 0, step = 0.1),
#                numericInput("sd1", label = "s", value = 0.5, min = 0.1, step =0.1)
#                ),
#         column(4,
#                "Distribution 2",
#                numericInput("n2", label = "n", value = 1000, min = 1),
#                numericInput("mean2", label ="m", value = 0, step = 0.1),
#                numericInput("sd2", label = "s", value = 0.5, min = 0.1, step =0.1)
#                ),
#         column(4,
#                "Frequency polygon",
#                numericInput("binwidth", label = "Bin width", value = 0.1, step =0.1),
#                sliderInput("range", label = "range", value= c(-3,3), min = -5, max = 5)
#                )
#     ),
#     
#     fluidRow(
#         column(9, plotOutput("hist")),
#         column(3, verbatimTextOutput("ttest"))
#     )
# )
# 
# server <- function(input, output, session){
#     output$hist <- renderPlot({
#         x1 <- rnorm(input$n1, input$mean1, input$sd1)
#         x2 <- rnorm(input$n2, input$mean2, input$sd2)
#         
#         freqpoly(x1,x2, binwidth = input$binwidth, xlim = input$range)
#     }, res = 96)
#     
#     
#     output$ttest <- renderText({
#         x1 <-  rnorm(input$n1, input$mean1, input$sd1)
#         x2 <-  rnorm(input$n2,input$mean2, input$sd2)
#         
#         t_test(x1,x2)
#     })
# } 
#     
#     
# 
# # Reactive Timer
# ui <- fluidPage(
#     fluidRow(
#         column(3, 
#                numericInput("lambda1", label = "lambda1", value = 3),
#                numericInput("lambda2", label = "lambda2", value = 5),
#                numericInput("n", label = "n", value = 1e4, min = 0)
#         ),
#         column(9, plotOutput("hist"))
#     )
# )
# server <- function(input, output, session) {
#     timer <- reactiveTimer(500)
#     
#     x1 <- reactive({
#         timer()
#         rpois(input$n, input$lambda1)
#     })
#     x2 <- reactive({
#         timer()
#         rpois(input$n, input$lambda2)
#     })
#     
#     output$hist <- renderPlot({
#         freqpoly(x1(), x2(), binwidth = 1, xlim = c(0, 40))
#     }, res = 96)
# }

# Clcik Button

# ui <- fluidPage(
#     fluidRow(
#         column(3,
#                numericInput("lambda1", label = "lambda1", value = 3),
#                numericInput("lambda2", label = "lambda2", value = 5),
#                numericInput("n", label = "n", value = 1e4, min = 0),
#                actionButton("simulate", "Simulate!")
#                ),
#         column(9, plotOutput("hist"))
#     )
# )
# 
# server <-  function(input, output, session){
#     
#     x1 <-  reactive({
#         input$simulate
#         rpois(input$n, input$lambda1)
#     })
#     
#     x2 <- reactive({
#         input$simulate
#         rpois(input$n, input$lambda2)
#     }) 
#     
#     output$hist <- renderPlot({
#         freqpoly(x1(), x2(), binwidth = 1, xlim = c(0,40))
#     }, res = 96)
# }
#   
# 
# ui <- fluidPage(
#       fluidRow(
#           column(3,
#                  numericInput("lambda1", label = "lambda1", value = 3),
#                  numericInput("lambda2", label = "lambda2", value = 5),
#                  numericInput("n", label = "n", value = 1e4, min = 0),
#                  actionButton("simulate", "Simulate!")
#                  ),
#           column(9, plotOutput("hist"))
#       )
#   )
# 
# server <-  function(input, output, session){
#   x1 <-  eventReactive(input$simulate, {
#     rpois(input$n, input$lambda1)
#   })
#   x2 <- eventReactive(input$simulate,{
#     rpois(input$n, input$lambda2)
#   })
#   
#   output$hist <- renderPlot({
#     freqpoly(x1(),x2(), binwidth = 1 , xlim = c(0,40))
#   }, res = 96)
# }

# observadores
# 
# ui <- fluidPage(
#   textInput("name", "what's your name?"),
#   textOutput("greeting")
# )
# 
# server <- function(input, output, session){
#   string <- reactive(paste0("Hello ", input$name, "!"))
#   
#   output$greeting <-  renderText(string())
#   observeEvent(input$name, {
#     message("Greeting performed")
#   })
# }


# ui <-  fluidPage(
#   titlePanel("Central limit theorem"),
#   sidebarLayout(
#     sidebarPanel( plotOutput("hist")
#       
#     ),
#     mainPanel(
#       numericInput("m", "Number of samples", 2, min = 1, max = 100)
#      
#     )
#   )
# )
# 
# 
# server <- function(input, output, session){
#   output$hist <- renderPlot({
#     means <- replicate(1e4, mean(runif(input$m)))
#     hist(means, breaks = 20)
#   }, res = 96)
#   
# }

# ui <- fluidPage(
#   tabsetPanel(
#     tabPanel("Import data",
#              fileInput("file", "Data", buttonLabel = "Upload..."),
#              textInput("delim", "Delimiter (leave blank to guess","" ),
#              numericInput("skip", "Rows to skip", 0, min = 0),
#              numericInput("rows", "Rows to preview", 10, min = 1 )),
#     
#     tabPanel("Set parameters"),
#     tabPanel("Visualise results")
#   )
# )


# ui <-  fluidPage(
#   sidebarLayout(
#     sidebarPanel(
#       textOutput("panel")
#     ),
#     mainPanel(
#       tabsetPanel(
#         id = "tabset",
#         tabPanel("panel 1", "one"),
#         tabPanel("panel 2", "two"),
#         tabPanel("panel 3", "three")
#       )
#     )
#   )
# )
# 

# 
# ui <- fluidPage(
#   navlistPanel(
#     id = "tabset",
#     "Heading 1",
#     tabPanel("panel 1", "Panel one contents"),
#     "Heading 2",
#     tabPanel("panel 2", "Panel two contents"),
#     tabPanel("panel 3", "Panel three contents")
#   )
# )


# 
# ui <- navbarPage(
#   "Page title",
#   tabPanel("panel 1", "one"),
#   tabPanel("panel 2", "two"),
#   tabPanel("panel 3", "three"),
#   navbarMenu("subpanels",
#     tabPanel("Panel 4-a", "four-a"),
#     tabPanel("Panel 4-b", "four-b"),
#     tabPanel("Panel 4-c", "four-c")
#   )
# )
# 
# ui <- fluidPage(
#   theme = bslib::bs_theme(bootswatch = "united"),
#   sidebarLayout(
#     sidebarPanel(
#       textInput("txt", "Text input: ", "texte here"),
#       sliderInput( "slider", "Slider input: ", 1, 100, 30)
#     ),
#     mainPanel(
#       h1(paste0("Theme:flatly")),
#       h2("Header 2"),
#       p("Some text")
#     )
#   )
# )

# ui <- fluidPage(
#    plotOutput("plot", click = "plot_click"),
#    verbatimTextOutput("info")
# )
# 
# 
# server <- function(input, output, sessions){
#   output$plot <- renderPlot({
#     plot(mtcars$wt,  mtcars$mpg)
#   }, res = 96)
#   
#   output$info <- renderPrint({
#     req(input$plot_click)
#     x <- round(input$plot_click$x, digits = 2)
#     y <- round(input$plot_click$y, digits = 2)
#     cat("[", x, ",", y, "]", sep = "")
#   })
# }
# 
# 
# ui <- fluidPage(
#   plotOutput("plot", click = "plot_click"),
#   tableOutput("data")
# )
# 
# server <- function(input, output, session){
#   output$plot <- renderPlot({
#     plot(mtcars$wt, mtcars$mpg)
#   }, res = 96)
#   
#   output$data <- renderTable({
#     nearPoints(mtcars, input$plot_click, xvar = "wt",yvar ="mpg")
#   })
# }

# 
# ui <- fluidPage(
#   plotOutput("plot", click = "plot_click"),
#   tableOutput("data")
# )
# 
# server <- function(input, output, session){
#   
#   output$plot <- renderPlot({
#     ggplot(mtcars, aes(wt,mpg))+ geom_point()
#   }, res=96)
#   
#   output$data <- renderTable({
#     req(input$plot_click)
#     nearPoints(mtcars, input$plot_click)
#   })  
#   
# }
# 
# ui <- fluidPage(
#   plotOutput("plot", brush = "plot_brush"),
#   tableOutput("data")
# )
# 
# server <- function(input, output,session){
#   output$plot <- renderPlot({
#     ggplot(mtcars, aes(wt, mpg)) + geom_point()
#   },res=96)
#   
#   output$data <- renderTable({
#     brushedPoints(mtcars, input$plot_brush)
#   })
#   
# }

# set.seed(1014)
# df <- data.frame(x = rnorm(100), y = rnorm(100))
# 
# ui <- fluidPage(
#   plotOutput("plot", click = "plot_click", )
# )
# server <- function(input, output, session) {
#   dist <- reactiveVal(rep(1, nrow(df
#   observeEvent(input$plot_click,
#                dist(nearPoints(df, input$plot_click, allRows = TRUE, addDist = TRUE)$dist_)  
#   )
#   
#   output$plot <- renderPlot({
#     df$dist <- dist()
#     ggplot(df, aes(x, y, size = dist)) + 
#       geom_point() + 
#       scale_size_area(limits = c(0, 1000), max_size = 10, guide = NULL)
#   }, res = 96)
# }


# ui <- fluidPage(
#   plotOutput("plot", brush = "plot_brush", dblclick = "plot_reset")
# )

# server <- function(input, output, session) {
#     selected <- reactiveVal(rep(FALSE, nrow(mtcars)))
#     
#     observeEvent(input$plot_brush, {
#       brushed <- brushedPoints(mtcars, input$plot_brush, allRows = TRUE)$selected_
#       selected(brushed | selected())
#     })
#     observeEvent(input$plot_reset, {
#       selected(rep(FALSE, nrow(mtcars)))
#     })
#     
#     output$plot <- renderPlot({
#       mtcars$sel <- selected()
#       ggplot(mtcars, aes(wt, mpg)) + 
#         geom_point(aes(colour = sel)) +
#         scale_colour_discrete(limits = c("TRUE", "FALSE"))
#     }, res = 96)
#   
#   
#   }


ui <- fluidPage(
  sliderInput("height", "height", min = 100, max = 500, value = 250),
  sliderInput("width", "width", min = 100, max = 500, value = 250),
  plotOutput("plot", width = 250, height = 250)
)

server <- function(input, output, session){
  output$plot <- renderPlot(
    width = function() input$width,
    height
  )
}



shinyApp(ui = ui, server = server)









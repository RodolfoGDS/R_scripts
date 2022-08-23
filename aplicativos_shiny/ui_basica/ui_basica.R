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
#ui <-  fluidPage(
 #   selectInput("estado", "Escolha um estado:",
  #              list(`Costa Leste` = list("NY", "NJ", "CT"),
   #                  `Costa Oeste` = list("WA", "OR", "CA"),
    #                 `Midwest` = list("MN", "WI", "IA"))
#    ),
 #   textOutput("resultado")
#)


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

ui <- fluidPage(
    tableOutput("static"),
    dataTableOutput("dynamic")
)

server <- function(input, output, session){
    output$static <- renderTable(head(mtcars))
    output$dynamic <- renderDataTable(mtcars, options = list(pageLength = 5))
}


shinyApp(ui = ui, server = server)

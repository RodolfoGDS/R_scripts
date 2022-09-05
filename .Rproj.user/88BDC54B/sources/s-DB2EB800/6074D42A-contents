

library(shiny)
library(vroom)
library(tidyverse)
tidyverse_update()


prod_codes <- setNames(products$prod_code, products$title)

ui <-  fluidPage(
    fluidRow(
        column(6,
               selectInput("code","Product", choices = prod_codes)
            )
    ),



    fluidRow(
        column(4, tableOutput("diag")),
        column(4, tableOutput("body_part")),
        column(4, tableOutput("location"))
    ),


    fluidRow(
        column(12, plotOutput("age_sex"))
    )
)



server <- function(input, output, sessions){
    selected <- reactive(injuries %>% filter(prod_code == input$code))
    
    output$diag <- renderTable(
        selected() %>% count(diag, wt = weight, sort = T)
    )
    
    output$body_part <- renderTable(
        selected() %>% count(body_part, wt= weight, sort = T)
    )
    
    output$location <- renderTable(
        selected() %>%  count(location, wt = weight, sort = T)
    )
    
    
    summary <-  reactive({
        selected() %>% 
            count(age,sex, wt=wewight) %>% 
            left_join(population, by = c("age","sex")) %>% 
            mutate(rate  =  n/population *1e4)
    })
    
    
    output$age_sex <- renderPlot({
        summary() %>% 
            ggplot(aes(age, n, clour = sex))+
            geom_line() +
            labs(y = "Estimated number of injuries")
    }, res = 96)

}

# Run the application 
shinyApp(ui = ui, server = server)

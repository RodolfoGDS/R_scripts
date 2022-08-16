library(shiny)

ui <- fluidPage(
    sliderInput("x",label = "If x is", min = 1 , max= 50,  value = 5),
    sliderInput("y", label = "And y is", min = 1 , max= 50, value= 5),
    textOutput("product")
)


server <-  function(input,output,session){
    output$product <- renderText({
        paste0(" A multiplicação de x por y é ", input$x * input$y)
    })
}

shinyApp(ui, server)
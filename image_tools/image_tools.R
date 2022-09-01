
library(shiny)
library(raster)


ui <-  fluidPage(
    fileInput("rasterInput",NULL, buttonLabel =  "Insira o seu Raster", multiple = T),
    tableOutput("rasters"),
    plotOutput("plot")
)

server <-  function(input, output, session){
    options(shiny.maxRequestSize = 50 * 1024^2 )
    output$rasters <- renderTable(input$rasterInput)
    raster <- raster(input$rasterInput)
    output$plot <- renderPlot(raster)
}
# Run the application 
shinyApp(ui = ui, server = server)

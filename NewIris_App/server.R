# server.R
library(shiny)

shinyServer(function(input, output) {
        
        # Selected variables are added to a new data frame
        selectedData <- reactive({
                iris[, c(input$xcol, input$ycol)]
        })
        
        ## Using kmeans to create the kmeans cluster for the data.
       ## It is reactibe since any input changes in the X and Y axis will change the cluster
       
       clusters <- reactive({
                kmeans(selectedData(), input$clusters)
        })
        
       ## render plot is used to show the plot and will automatically change with the selection
        output$plot1 <- renderPlot({
                par(mar = c(5.0, 4.0, 0, 1))
                plot(selectedData(),
                     col = clusters()$cluster,
                     pch = 20, cex = 3)
                points(clusters()$centers, pch = 4, cex = 4, lwd=2)
        })
        
})
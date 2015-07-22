##ui.R

shinyUI(pageWithSidebar(
        titlePanel('Iris Data k-means cluster analysis'),
        sidebarPanel(
                selectInput('xcol', 'X Axis', names(iris)),
                selectInput('ycol', 'Y Axis', names(iris),
                            selected=names(iris)[[2]]),
                
                sliderInput("clusters",
                            "Number of clusters:",
                            min = 1,
                            max = 5,
                            value = 3)
      
        ),
        
        mainPanel(
                plotOutput('plot1')
        )
   )
)
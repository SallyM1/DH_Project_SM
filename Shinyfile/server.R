#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')

    })

}

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  # Reactive function to filter data based on selected region
  filtered_data <- reactive({
    filter(alcohol_deaths, region == input$region)
  })
  
  # Plot deaths over the years
  output$deathPlot <- renderPlot({
    ggplot(filtered_data(), aes(x = year, y = deaths)) +
      geom_line() +
      labs(title = paste("Alcohol-Related Deaths in", input$region),
           x = "Year", y = "Number of Deaths")+
      theme_minimal() +
      theme(text = element_text(size = 18))
  })
})

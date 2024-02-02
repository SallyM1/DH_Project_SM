#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
)

library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Alcohol-Related Deaths in Scotland"),
    tags$br(),
    tags$br(),
    tags$br(),
    
    sidebarLayout(
      sidebarPanel(
        # Dropdown menu for selecting region
        selectInput("region", "Select Region:",
                    choices = unique(alcohol_deaths$region),
                    selected = "Scotland"),
      ),
      mainPanel(
        # Plot output
        plotOutput("deathPlot")
      )
    )
  )
)

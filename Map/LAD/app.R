#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

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

# Define server logic required to draw a histogram
server <- function(input, output) {

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

# Run the application 
shinyApp(ui = ui, server = server)

library(tidyverse)
library(sf)
library(readxl)
library(extrafont)
theme_set(theme_minimal(base_size = 16, base_family = "Roboto"))
library(here)
here()

glimpse(la_lookup)
la_lookup %<>% 
  select(LAname) %>% #Keep only the LAname variable
  distinct #Keep unique names 

#Change Western Isles nomenclature to match the shapefile
la_lookup$LAname <- str_replace(la_lookup$LAname, "Na h-Eileanan an Iar", "Na h-Eileanan Siar")

la_lookup

scotland_la %<>%
  filter(lad17nm %in% la_lookup$LAname) %>% #keep Scot LAs only 
  rename(council = lad17nm) %>%  #rename what will be the "joining" variable to "council"
  select(lad17cd, council, geometry) %>% #drop unneeded variables
  map_at(c(1,2), as.character) %>% #coerce factor variables to character
  as_data_frame() #coerce the whole object to a data_frame

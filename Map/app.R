scotland.geojson <- import(here(# app.R

# Load required libraries
library(shiny)
library(leaflet)
library(sf)

# Load spatial data
scotland <- st_read("path/to/scotland.geojson")

# Define UI
ui <- fluidPage(
  titlePanel("Interactive Map of Scotland"),
  leafletOutput("map")
)

# Define server logic
server <- function(input, output) {
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%  # Add default OpenStreetMap tiles
      addPolygons(data = scotland, fillOpacity = 0.7, color = "black", weight = 1)
  })
}

# Run the application
shinyApp(ui, server)
)
scotland.geojson


library(shiny)
library(leaflet)
library(sf)


scotland <- st_read("scotland.geojson")


ui <- fluidPage(
  titlePanel("Interactive Map of Scotland"),
  leafletOutput("map")
)

# Define server logic
server <- function(input, output) {
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%  
      addPolygons(data = scotland, fillOpacity = 0.7, color = "black", weight = 1)
  })
}


shinyApp(ui, server)
view(scotland.geojson)
get(wd)

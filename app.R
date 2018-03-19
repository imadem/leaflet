library(shiny)
library(shinydashboard)
library(leaflet)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody(
    tags$style(type = "text/css", "#map {height: calc(100vh - 80px) !important;}"),
    leafletOutput("map")
  )
)

server <- function(input, output) {
   output$map <- renderLeaflet({
    leaflet() %>%  
  #addProviderTiles("Stamen.Watercolor") %>% 
  addProviderTiles("OpenWeatherMap.Rain") %>% 
  setView(lng = 113.9213,
          lat = 0.7893,
          zoom = 6)
   })
}
shinyApp(ui, server)

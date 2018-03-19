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
    leaflet() %>% addTiles() %>% 
  #addProviderTiles("Stamen.Watercolor") %>% 
  #addProviderTiles("OpenWeatherMap.Rain") %>% 
  setView(lng = 113.9213,
          lat = 0.7893,
          zoom = 6)
  addWMSTiles(
    "http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi",
    layers = "nexrad-n0r-900913",
    options = WMSTileOptions(format = "image/png", transparent = TRUE),
    attribution = "Weather data © 2012 IEM Nexrad"
  )
   })
}
shinyApp(ui, server)

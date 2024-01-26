
library(shiny)

ui <- fluidPage(
  selectInput("datasets",label = "dataset",choices = ls("package:datasets")),
  fileInput("upload",NULL),
  dateInput("date","date:",value = "2024-1-14"),
  verbatimTextOutput("summary"),
  tableOutput("table")
  
)

server <- function(input, output, session) {
  output$summary<-renderPrint({
    datasets<-get(input$datasets,"package:datasets")
    summary(datasets)
  })
  
  output$table<-renderTable({
    datasets<-get(input$datasets,"package:datasets")
    datasets
  })
  
}

shinyApp(ui, server)


library(shiny)
library(ggplot2)
source("functions.R") 

ui <- fluidPage(
  titlePanel("NGS of Streptomyces"),
  sidebarLayout(
    sidebarPanel(
      fileInput("sekwencja", "Choose fasta file.", multiple = FALSE, accept = '.fasta'),
      textInput('sekwencja_wpisywana', "Or paste in sequence.", value = "ACTGACT"),
      numericInput('window_size', 'Width of the read window.', 1000, min = 10, max = 1000000000),
      numericInput('window_by', 'Width of the window slide.', 10, min = 1, max = 10000),
      downloadButton('download_histogram', 'Download png plot'),
      numericInput('width_hist', 'Plot width [cm]', 20, min = 5, max = 25),
      numericInput('height_hist', 'Plot height [cm]', 14, min = 5, max = 25),
      numericInput('res_hist', 'Resolution', 200, min = 100, max = 500)),
    mainPanel(tabsetPanel(type="tab", 
                          tabPanel("Genes&stuff", tabsetPanel(type="tab"),
                                   tabPanel("Heatmap"),
                                   tabPanel("Table"),
                                   tabPanel("TPM"),
                                   tabPanel("GCSKEW")),
                          tabPanel("Results summary"),
                          tabPanel("Help&Info")))
  )
)

server <- function(input, output) {}
 

shinyApp(ui = ui, server = server)



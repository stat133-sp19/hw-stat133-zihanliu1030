library(shiny)
library(ggplot2)

fluidPage(
  
  # Application title
  titlePanel("Investing Modalities"),
  
  # Sidebar with a slider input for number of bins 
  fluidRow(
    column(4,sliderInput("initial", "Initial Amount",
                         min = 0, max = 100000, value = 1000, step = 500, pre = '$', sep = ',')),
    column(4,sliderInput("return", "Return Rate (in %)",
                         min = 0, max = 20, value = 5, step = 0.1)),
    column(4,sliderInput("year", "Years",
                         min = 0, max = 50, value = 20, step = 1)),
    column(4,sliderInput("contrib", "Annual Contribution",
                         min = 0, max = 50000, value = 2000, step = 500, pre = '$', sep = ',')),
    column(4,sliderInput("growth", "Growth Rate (in %)",
                         min = 0, max = 20, value = 2, step = 0.1)),
    column(4,selectInput("facet", "Facet?",
                         choices = c("No", "Yes"), selected = 'No'))
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    h4("Timelines"),
    plotOutput("distPlot", width = 900, height = 450),
    
    h4("Balances"),
    verbatimTextOutput("summary")
  )
)
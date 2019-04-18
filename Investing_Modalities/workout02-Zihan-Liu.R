library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
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

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot<-renderPlot({
    years <- 0:(input$year)
    no_contribution <- rep(NA, length(years))
    fixed_contribution <- rep(NA, length(years))
    growing_contribution <- c(input$initial)
    for (x in years){
      no_contribution[x + 1] <- (input$initial * (1 + input$return/100)^x)
      fixed_contribution[x + 1] <- (input$initial * (1 + input$return/100)^x) + (input$contrib * (((1 + input$return/100)^x - 1)/(input$return/100)))
    }
    for (y in 1:input$year) {growing_contribution[y+1] <- growing_contribution[y] * (1 + input$return/100) + input$contrib * (1 + input$growth/100) ^ (y - 1)}
    accounts <- data.frame('year' = rep(0:input$year, 3), 'value' = c(no_contribution, fixed_contribution, growing_contribution), 'variable' = as.factor(rep(c('no_contrib', 'fixed_contrib', 'growing_contrib'), each = input$year + 1)),ncol = 3)
    if (input$facet == "No") {
      ggplot(accounts) + 
        geom_point(aes(x = year, y = value, col = variable)) +
        geom_line(aes(x = year, y = value, col = variable)) +
        labs(x = 'year', y = 'value', title = 'Three modes of investing') +
        scale_x_continuous(breaks = seq(0, input$year, 2))
    }
    else if (input$facet == "Yes") {
      ggplot(accounts) + 
        geom_point(aes(x = year,y = value, col = variable)) +
        geom_line(aes(x = year,y = value,col = variable)) +
        geom_area(aes(x = year,y = value,fill = variable), alpha = 0.5) +
        scale_x_continuous(breaks = seq(0, input$year, 2)) +
        labs(x = 'year', y = 'value', title = 'Three modes of investing') +
        facet_grid(~ variable)
    }
  })
  
  output$summary <- renderPrint({
    years <- 0:(input$year)
    no_contribution <- rep(NA, length(years))
    fixed_contribution <- rep(NA, length(years))
    growing_contribution <- c(input$initial)
    for (x in years){
      no_contribution[x + 1] <- (input$initial * (1 + input$return/100)^x)
      fixed_contribution[x + 1] <- (input$initial * (1 + input$return/100)^x) + (input$contrib * (((1 + input$return/100)^x - 1)/(input$return/100)))
    }
    for (y in 1:input$year) {growing_contribution[y+1] <- growing_contribution[y] * (1 + input$return/100) + input$contrib * (1 + input$growth/100) ^ (y - 1)}
    accounts <- data.frame('year' = years, 'no_contrib' = no_contribution, 'fixed_contrib' = fixed_contribution, 'growing_contrib' = growing_contribution)
    accounts
  })
}

# Run the application 
shinyApp(ui = ui, server = server)


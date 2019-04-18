library(shiny)
library(ggplot2)

function(input, output) {
  
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
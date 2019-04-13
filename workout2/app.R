# Workout2 - Shiny App

library(shiny)
library(ggplot2)

future_value <- function(amount, rate, years){
  FV = amount * (1 + rate) ^ years
  return(FV)
}

annuity <- function(contrib, rate, years){
  FVA = contrib * (((1 + rate) ^ years -1) / rate)
  return(FVA)
}

growing_annuity <- function(contrib, rate, growth, years){
  FVGA = contrib * (((1 + rate) ^ years - (1 + growth) ^ years) / (rate - growth))
  return(FVGA)
}

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Savings Simulation"),
  
  # Sidebar with a slider input for number of bins 
  fluidRow(
    column(4,
           sliderInput("amount", "Initial Amount",
                       min = 1, max = 100000,
                       value = 1000, step = 20000,
                       pre = "$", sep = ",")),
    column(4,
           sliderInput("rate", "Return Rate (in %)",
                       min = 0, max = 20,
                       value = 5, step = 2)),
    column(4,
           sliderInput("years", "Years",
                       min = 0, max = 50,
                       value = 10, step = 5))),
  
  fluidRow(
    column(4,
           sliderInput("contrib", "Annual Contribution",
                       min = 0, max = 50000,
                       value = 2000, step = 10,000,
                       pre = "$", sep = ",")),
    column(4,
           sliderInput("growth", "Growth Rate (in %)",
                       min = 0, max = 20,
                       value = 2, step = 2)),
    column(4,
           selectInput("facet", "Facet?",
                       choices = c("No", "Yes")))
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    titlePanel("Timelines"),
    plotOutput("distPlot"),
    titlePanel("Balances"),
    tableOutput("tableOutput")
  )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  output$distPlot <- renderPlot(width = 920,{
    
    rate_in_percentage = 0.01 * input$rate
    growth_in_percentage = 0.01 * input$growth
    no_contrib = rep(input$amount, input$years)
    for (i in 1:input$years) {
      no_contrib[i+1] = future_value(amount = no_contrib[i], rate = rate_in_percentage, years = 1)
    }
    
    fixed_contrib = rep(input$amount, input$years)
    for (i in 1:input$years) {
      fixed_contrib[i+1] = future_value(amount = input$amount, rate = rate_in_percentage, years = i) + annuity(contrib = input$contrib, rate = rate_in_percentage, years = i)
    }
    
    growing_contrib = rep(input$amount, input$years)
    for (i in 1:input$years) {
      growing_contrib[i+1] = future_value(amount = input$amount, rate = rate_in_percentage, years = i) + growing_annuity(contrib = input$contrib, rate = rate_in_percentage, growth = growth_in_percentage, years = i)
    }
    
    modalities = data.frame(
      year = c(0:input$years),
      value = c(no_contrib = no_contrib,
                fixed_contrib = fixed_contrib,
                growing_contrib = growing_contrib),
      variable = c(rep("no_contrib", input$years+1), 
                   rep("fixed_contrib", input$years+1),
                   rep("growing_contrib", input$years+1)
      )
    )
    
    if (input$facet == "No"){
      ggplot(data = modalities)+
        geom_line(aes(x = year, y = value, color = variable))+
        geom_point(aes(x = year,  y = value, color = variable), cex = 0.5)+
        labs(title = "Three modes of investing")
    } else{
      modalities$variable_new = factor(modalities$variable, levels = c("no_contrib", "fixed_contrib", "growing_contrib"))
      ggplot(data = modalities)+
        geom_line(aes(x = year, y = value, color = variable))+
        geom_point(aes(x = year,  y = value, color = variable), cex = 0.5)+
        geom_area(aes(x = year, y = value, fill = variable), alpha = 0.4)+
        facet_wrap(~variable_new) +
        labs(title = "Three modes of investing")
    }
  })
  
  
  # Balances Table Part
  output$tableOutput <- renderTable({
    rate_in_percentage = 0.01 * input$rate
    growth_in_percentage = 0.01 * input$growth
    no_contrib = rep(input$amount, input$years)
    for (i in 1:input$years) {
      no_contrib[i+1] = future_value(amount = no_contrib[i], rate = rate_in_percentage, years = 1)
    }
    
    fixed_contrib = rep(input$amount, input$years)
    for (i in 1:input$years) {
      fixed_contrib[i+1] = future_value(amount = input$amount, rate = rate_in_percentage, years = i) + annuity(contrib = input$contrib, rate = rate_in_percentage, years = i)
    }
    
    growing_contrib = rep(input$amount, input$years)
    for (i in 1:input$years) {
      growing_contrib[i+1] = future_value(amount = input$amount, rate = rate_in_percentage, years = i) + growing_annuity(contrib = input$contrib, rate = rate_in_percentage, growth = growth_in_percentage, years = i)
    }
    
    modalities = data.frame(
      year = c(0:input$years),
      no_contrib = no_contrib,
      fixed_contrib = fixed_contrib,
      growing_contrib = growing_contrib)
    modalities
  }
  )
} 


# Run the application 
shinyApp(ui = ui, server = server)


library(shiny)
library(ggplot2)


# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Drawing Balls Experiment"),
  
  # Sidebar  
  sidebarLayout(
    sidebarPanel(
      sliderInput("repetitions",
                  label = "Number of repetitions:",
                  min = 1,
                  max = 5000,
                  value = 100),
      sliderInput("threshold",
                  label = "Threshold for choosing boxes:",
                  min = 0,
                  max = 1,
                  value = 0.5)
    ),
    
    # Show a plot of the relative frequencies
    mainPanel(
      plotOutput("freqs_plot")
    )
  )
)


# Define server logic required to draw the plot
server <- function(input, output) {
  
  output$freqs_plot <- renderPlot({
    box1 <- c('blue', 'blue', 'red')
    box2 <- c('blue', 'blue', 'red', 'red', 'red', 'white')
    
    size <- 4
    drawn_balls <- matrix("", input$repetitions, size)
    
    for (i in 1:input$repetitions) {
      aux <- runif(1)
      if (aux > 0.5) {
        drawn_balls[i, ] <- sample(box1, size, replace = TRUE)
      } else {
        drawn_balls[i,] <- sample(box2, size)
      }
    }
    
    # number of blue balls in each repetition
    num_blue <- apply(drawn_balls, 1, function(x) sum(x == 'blue'))
    
    # progression of relative frequencies
    blue_freqs <- vector(mode = "list", length = 5)
    for (req_blue in 0:4) {
      temp_freqs <- cumsum(num_blue == req_blue) / (1:input$repetitions)
      blue_freqs[[req_blue + 1]] <- temp_freqs
    }
    
    dat <- data.frame(
      reps = rep(1:input$repetitions, 5),
      freqs = unlist(blue_freqs),
      number = factor(rep(0:4, each = input$repetitions))
    )
    
    ggplot(data = dat, aes(x = reps, y = freqs, group = number)) +
      geom_path(aes(color = number)) +
      ggtitle("Relative frequencies of number of blue balls")
  })
}


# Run the application 
shinyApp(ui = ui, server = server)

library(shiny)
library(ggplot2)

# Define UI
ui <- fluidPage(
  theme = bslib::bs_theme(bootswatch = "darkly"),
  titlePanel("Shinylive Histogram App"),
  sidebarLayout(
    sidebarPanel(
      h4("Controls"),
      sliderInput("obs",
                  "Number of observations:",
                  min = 10,
                  max = 500,
                  value = 100),
      textInput("title", "Plot Title", "Histogram of Random Data")
    ),
    mainPanel(
      h3("Generated Plot"),
      plotOutput("distPlot")
    )
  )
)

# Define Server logic
server <- function(input, output) {
  output$distPlot <- renderPlot({
    # Generate a random distribution
    data <- data.frame(x = rnorm(input$obs))
    
    # Create the plot
    ggplot(data, aes(x = x)) +
      geom_histogram(bins = 30, fill = "#1E90FF", color = "white") +
      labs(
        title = input$title,
        x = "Value",
        y = "Frequency"
      ) +
      theme_minimal(base_size = 16)
  })
}

# Run the application
shinyApp(ui = ui, server = server)

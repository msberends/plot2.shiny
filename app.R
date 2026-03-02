library(plot2)
library(shiny)

tryCatch({
  plot2::create_interactively(hide_generated_code = TRUE, hide_export_buttons = FALSE, pretty_labels = TRUE, upload_tab = TRUE)
}, error = function(e) {
  # Provide a helpful error message in the UI
  ui <- fluidPage(
    titlePanel("Configuration Error"),
    mainPanel(
      h3("Unable to load the application"),
      p("There was an error loading the Shiny app."),
      h4("Error message:"),
      pre(as.character(e)),
      hr(),
      p("Please ensure that:"),
      tags$ul(
        tags$li("The ", code("plot2"), " package is properly installed"),
        tags$li("The package runs ", code("create_interactively()"), " without error"),
        tags$li("All dependencies are available; run ", code("plot2:::install_shiny_deps()"), " to confirm"),
      )
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
})

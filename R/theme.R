#' LiU Theme
#'
#' @description A function that adds a LiU theme onto a ggplot object.
#'
#' @param plot A `ggplot` object.
#'
#' @return A `ggplot` object.
#'
#' @export theme


theme <- function(plot){

  # ---V--- CHECK INPUT ---V---
  # Check plot argument
  #stopifnot("argument \"plot\" is not ggplot object" = is.ggplot(plot))
  # ---^--- CHECK INPUT ---^---

  #return(plot)

  # Load ggplot2 library
  #library(ggplot2)

  # Example data (replace with your actual data)
  liu_data <- data.frame(
    StudentID = 1:20,
    GPA = c(3.2, 3.5, 3.8, 2.9, 3.6, 3.2, 3.9, 2.7, 3.4, 3.1, 3.7, 3.0, 3.5, 3.8, 2.8, 3.3, 3.6, 3.2, 3.9, 2.9),
    StudyHours = c(20, 25, 30, 15, 28, 22, 32, 12, 27, 18, 29, 14, 26, 31, 16, 23, 28, 21, 33, 17)
  )

  # Variables for the scatter plot
  x_var <- "GPA"
  y_var <- "StudyHours"

  # Create a scatter plot with customized elements
  scatter_plot <- ggplot(data = liu_data, aes(x = !!sym(x_var), y = !!sym(y_var))) +
    geom_point() +
    labs(title = "Linköping University Student Data", subtitle = "GPA vs. Study Hours") +
    theme_minimal() +  # Start with a minimal theme
    theme(
      # Customize the background
      plot.background = element_rect(fill = "white"),

      # Customize the axes
      axis.text = element_text(color = "black"),
      axis.title = element_text(color = "darkblue"),

      # Customize the axis lines and gridlines
      panel.grid.major = element_line(color = "lightgray"),
      panel.grid.minor = element_line(color = "lightgray"),
      axis.line = element_line(color = "darkblue"),

      # Customize legend
      legend.background = element_rect(fill = "white"),
      legend.text = element_text(size = 12, color = "black"),
      legend.title = element_text(size = 14, color = "darkblue", face = "bold"),

      # Customize facets
      strip.text = element_text(size = 12, color = "darkblue", face = "bold")

)

  # Display the plot
  print(scatter_plot)
}

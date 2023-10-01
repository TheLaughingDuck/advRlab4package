#' LiU Theme
#'
#' @description A function that adds a LiU theme onto a ggplot object.
#'
#' @param plot A `ggplot` object.
#'
#' @return A `ggplot` object.
#'
#' @export

# Create a custom function with a different name
my_theme <- function(plot) {
  # ---V--- CHECK INPUT ---V---
  # Check if the input is a ggplot object
  stopifnot(is.ggplot(plot))
  # ---^--- CHECK INPUT ---^---

  # Apply the ggplot2 theme
  plot <- plot +
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

      # Add other customizations as needed
    )

  # Return the modified plot
  return(plot)
}


#theme <- function(plot){

  # ---V--- CHECK INPUT ---V---
  # Check plot argument
  #stopifnot("argument \"plot\" is not ggplot object" = is.ggplot(plot))
  # ---^--- CHECK INPUT ---^---


  # Return the plot
  #return(plot)
}







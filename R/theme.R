#' LiU Theme
#'
#' @description A function that adds a LiU theme onto a ggplot object.
#'
#' @param plot A `ggplot` object.
#'
#' @return A `ggplot` object.
#'
#' @export theme

# Create a custom function with a different name
theme <- function(data) {
  # ---V--- CHECK INPUT ---V---
  # Check if the input is a ggplot object
  stopifnot("argument \"plot\" is not ggplot object" = is.ggplot(plot))
  # ---^--- CHECK INPUT ---^---

  # Apply the ggplot2 theme
  #library(ggthemes)

  # Create a scatter plot with customized elements
  # plot <- ggplot(data = data, aes(x = !!sym("GPA"), y = !!sym("StudyHours"))) +
  #   geom_point() +
  #   labs(title = "Linköping University Student Data", subtitle = "GPA vs. Study Hours") +
  #
  #   theme_gdocs()

  # Return the modified plot
  return(plot)
}










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
theme <- function(data) {
  # ---V--- CHECK INPUT ---V---
  # Check if the input is a ggplot object
  #stopifnot(is.ggplot(plot))
  # ---^--- CHECK INPUT ---^---

  # Apply the ggplot2 theme
  library(ggthemes)

  # Create a scatter plot with customized elements
  plot <- ggplot(data = data, aes(x = !!sym("GPA"), y = !!sym("StudyHours"))) +
    geom_point() +
    labs(title = "Linköping University Student Data", subtitle = "GPA vs. Study Hours") +

    theme_gdocs()

  # Return the modified plot
  return(plot)
}

# Example data (replace with  data)
liu_data <- data.frame(
  StudentID = 1:20,
  GPA = c(3.2, 3.5, 3.8, 2.9, 3.6, 3.2, 3.9, 2.7, 3.4, 3.1, 3.7, 3.0, 3.5, 3.8, 2.8, 3.3, 3.6, 3.2, 3.9, 2.9),
  StudyHours = c(20, 25, 30, 15, 28, 22, 32, 12, 27, 18, 29, 14, 26, 31, 16, 23, 28, 21, 33, 17)
)

# Create the custom scatter plot using the function
theme(liu_data)










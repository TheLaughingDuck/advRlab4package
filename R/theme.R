#' LiU Theme
#'
#' @description A function that adds a LiU theme onto a ggplot object.
#'
#' @param plot A `ggplot` object.
#'
#' @return A `ggplot` object.
#'
#' @export


theme <- function(plot){

  # ---V--- CHECK INPUT ---V---
  # Check plot argument
  stopifnot("argument \"plot\" is not ggplot object" = is.ggplot(plot))
  # ---^--- CHECK INPUT ---^---

  return(plot)
}

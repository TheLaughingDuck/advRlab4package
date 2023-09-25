#' Linear regression
#'
#' @description A function for performing various linear regression tasks.
#'
#' @param formula A `formula` object.
#'
#' @param data A dataframe.
#'
#' @return An object of (S3) class `linreg`.
#'
#' @export


linreg <- function(formula, data){


  # ---V--- CHECK INPUT ---V---
  # Check formula argument
  #stopifnot("argument \"formula\" is not ---" = is.---(formula))

  # Check data argument
  stopifnot("argument \"data\" is not data.frame" = is.data.frame(data))
  # ---^--- CHECK INPUT ---^---


  # ---V--- CALCULATE MATH STUFF ---V---

  # ---^--- CALCULATE MATH STUFF ---^---


  # ---V--- CREATE LINREG CLASS ---V---
  linreg <- setRefClass("linreg",
                        fields=list(),
                        methods = list(
                          print <- function(){
                            print("Hello print")
                          },

                          plot <- function(){
                            print("")
                          },

                          resid <- function(){
                            print("")
                          },

                          pred <- function(){
                            print("")
                          },

                          coef <- function(){
                            print("")
                          },

                          summary <- function(){
                            print("")
                          }
                        ))
  # ---^--- CREATE LINREG CLASS ---^---


  # Create linreg object
  output <- linreg$new()

  return(output)
}

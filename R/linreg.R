#' Linear regression
#'
#' @description An RC class constructor of "linreg", for performing various linear regression tasks.
#'
#' @param formula A `formula` object.
#'
#' @param data A dataframe.
#'
#' @return An object of (RC) class `linreg`.
#'
#' @source [Linear regression on Wikipedia.](https://en.wikipedia.org/wiki/Linear_regression)
#'
#' @export


###------------V------------ INITIALIZING LINREG CLASS ------------V------------
linreg <- setRefClass("linreg",
                      fields=list(X="matrix",
                                  y="numeric",
                                  coefficients_beta="matrix",
                                  fitted_y="matrix",
                                  residuals_e="matrix",
                                  n_degfree="numeric",
                                  res_var_sigma2="matrix",
                                  var_of_beta="matrix",
                                  t_values="matrix"),#balance = "numeric", formula="formula", data="data.frame"),
                      methods = list(
                        summary = function(){return()})
                     )
###------------^------------ INITIALIZING LINREG CLASS ------------^------------




###------------V------------ SETTING UP METHODS ------------V------------
# Function to set up linreg class and check input
linreg$methods(initialize = function(formula, data){

  # ---V--- CHECK INPUT AND SETUP ---V---
  # Check formula argument
  stopifnot("argument \"formula\" is not class formula" = class(formula) == "formula")

  # Check data argument
  stopifnot("argument \"data\" is not data.frame" = is.data.frame(data))
  # ---^--- CHECK INPUT ---^---

  # ---V--- CALCULATE MATH STUFF ---V---
  X <<- model.matrix(formula, data = data)
  y <<- data[, all.vars(formula[[2]])]

  # go over this again and make sure it is correct
  # Use solve() or inv(). solve() seems to keep the row and col labels.
  coefficients_beta <<- solve(t(X) %*% X) %*% t(X) %*% y

  fitted_y <<- X %*% coefficients_beta

  residuals_e <<- y - fitted_y

  # Number of observations minus number of parameters
  n_degfree <<- length(y) - length(formula[[3]])-1 #-1 because of constant

  res_var_sigma2 <<- (t(residuals_e) %*% residuals_e)/n_degfree

  # Two issues: the multiplication, and also the fact that the variance matrix seems to have negative elements.
  # The res_var_sigma2[1] is because res_var_sigma2 is a matrix (1 row 1 col).
  var_of_beta <<- res_var_sigma2[1] * solve(t(X) %*% X)

  t_values <<- coefficients_beta / sqrt(var(coefficients_beta))[1]
  # ---^--- CALCULATE MATH STUFF ---^---
  })


# --- SHOW method ---
# This func makes so that print(linreg_object) works
linreg$methods(show = function(){
  cat(paste0(
    "Call:\n",
    "lm(formula = ...)\n\n",
    "Coefficients:\n\t",
    "coefficients here"))})


# --- PRINT method ---
linreg$methods(print = function(){
  cat(paste0(
    "Call:\n",
    "lm(formula = ...)\n\n",
    "Coefficients:\n\t",
    "coefficients here"))})


# --- PLOT method ---
linreg$methods(plot = function(){
  ggplot2::ggplot()
})


# --- RESID method ---
linreg$methods(resid = function(){return(.self$residuals_e)})


# --- PRED method ---
linreg$methods(pred = function(){return(.self$fitted_y)})


# --- COEF method ---
linreg$methods(coef = function(){return(.self$coefficients_beta)})


# --- SUMMARY method ---
linreg$methods(summary = function(){return(c("A summary of the linreg obj."))})
###------------^------------ SETTING UP METHODS ------------^------------

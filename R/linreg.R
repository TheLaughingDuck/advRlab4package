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
#' @import methods
#' @importFrom dplyr arrange
#' @importFrom magrittr %>%
#' @importFrom purrr keep_at
#' @importFrom ggplot2 ggplot geom_point geom_smooth geom_abline labs theme_bw geom_text
#' @importFrom ggplot2 aes
#'
#' @export linreg


###------------V------------ INITIALIZING LINREG CLASS ------------V------------
linreg <- setRefClass("linreg",
                      fields=list(
                                  # Defining arguments
                                  formula = "formula",
                                  data = "data.frame",
                                  data_name = "character",


                                  #Math variables
                                  X="matrix",
                                  y="numeric",
                                  coefficients_beta="matrix",
                                  fitted_y="matrix",
                                  residuals_e="matrix",
                                  n_degfree="numeric",
                                  res_var_sigma2="matrix",
                                  var_of_beta="matrix",
                                  t_values="matrix",

                                  #In-the-middle-variables
                                  data_arranged = "data.frame"))
###------------^------------ INITIALIZING LINREG CLASS ------------^------------




###------------V------------ SETTING UP METHODS ------------V------------
# --- INITIALIZE method ---
# Function to set up linreg class and check input
linreg$methods(initialize = function(formula_arg, data_arg){

  # Read in the data and save the given name of the data argument (for print and summary)
  formula <<- formula_arg
  data <<- data_arg
  data_name <<- deparse(substitute(data_arg))

  # ---V--- CHECK INPUT AND SETUP ---V---
  # These checks appear to already be done through the definition of the arguments in fields list above.
  # Check formula argument
  #stopifnot("argument \"formula\" is not class formula" = class(formula) == "formula")

  # Check data argument
  #stopifnot("argument \"data\" is not data.frame" = is.data.frame(data))
  # ---^--- CHECK INPUT ---^---

  # ---V--- CALCULATE MATH STUFF ---V---
  X <<- model.matrix(formula, data = data)
  y <<- data[, all.vars(formula[[2]])]

  # Use solve() or inv(). solve() seems to keep the row and col labels.
  coefficients_beta <<- solve(t(X) %*% X) %*% t(X) %*% y

  fitted_y <<- X %*% coefficients_beta
  data$fitted_y <<- fitted_y

  residuals_e <<- y - fitted_y
  data$residuals_e <<- residuals_e

  # Number of observations minus number of parameters
  n_degfree <<- length(y) - length(colnames(X))

  res_var_sigma2 <<- (t(residuals_e) %*% residuals_e)/n_degfree

  # The res_var_sigma2[1] is because res_var_sigma2 is a matrix (1 row 1 col).
  var_of_beta <<- res_var_sigma2[1] * solve(t(X) %*% X)

  t_values <<- coefficients_beta/sqrt(diag(var_of_beta))
  # ---^--- CALCULATE MATH STUFF ---^---
  })



# --- PLOT method ---
linreg$methods(plot = function(plots_to_show = c(1,2)){
  # Residuals vs Fitted plot
  p1 <- ggplot(data, aes(y=residuals_e, x=fitted_y)) +

    # Create points, lines
    geom_point(shape=21, size = 2.5) +
    geom_smooth(color="red", se=FALSE, size=0.1) + #, method = "lm") +
    geom_abline(intercept = 0, slope = 0, color = "grey", linetype="dashed") +

    # Configure labels, theme, style
    labs(title = "Residuals vs Fitted",
         x = paste0("Fitted values\nlinreg(",
                    as.character(formula)[2],
                    " ~ ",
                    as.character(formula)[3],
                    ")"),
         y = "Residuals") +

    theme_bw() +
    ggplot2::theme(panel.grid.major = element_blank(),
                   panel.grid.minor = element_blank(),
                   plot.title = element_text(hjust = 0.5))


  # Scale-location plot
  p2 <- ggplot(data,
               aes(y=sqrt(abs(residuals_e/as.numeric(res_var_sigma2))),
                   x=fitted_y)) +

    # Create points, lines
    geom_point(shape=21, size = 2.5) +
    geom_smooth(color="red", se=FALSE, size=0.1) +

    # Configure labels, theme, style
    labs(title = "Scale-Location",
         x = paste0("Fitted values\nlinreg(",
                    as.character(formula)[2],
                    " ~ ",
                    as.character(formula)[3],
                    ")"),
         y = expression(sqrt("|Standardized residuals|"))) +

    theme_bw() +
    ggplot2::theme(panel.grid.major = element_blank(),
                   panel.grid.minor = element_blank(),
                   plot.title = element_text(hjust = 0.5))


  # Adding row numbers to the dataset, and selecting three outliers with respect
  # to the residuals.
  data$row_num <<- rownames(data)
  data_arranged <<- data %>% arrange(desc(abs(residuals_e))) %>% head(3)

  # Add rownames to outliers in p1
  p1 <- p1 + geom_text(data=data_arranged,
                                aes(x=fitted_y,
                                    y = residuals_e,
                                    label=row_num),
                       hjust = "left",
                       nudge_x = 0.15,
                       size = 3)

  # Add rownames to outliers in p2
  p2 <- p2 + geom_text(data=data_arranged,
                       aes(x=fitted_y,
                           y = sqrt(abs(residuals_e/as.numeric(res_var_sigma2))),
                           label=row_num),
                       hjust = "left",
                       nudge_x = 0.15,
                       size = 3)


  # Return the plots
  return(keep_at(list(p1, p2), at=plots_to_show))

})



# --- PRINT method ---
linreg$methods(print = function(){
  cat("Call:\n",
      "linreg(formula = ", as.character(formula)[2], " ~ ", as.character(formula)[3], ", data = ", data_name, ")\n\n",
      "Coefficients:\n",
      sep="")

  # Print a matrix of the coefficients
  print.default(matrix(round(coefficients_beta, 2), nrow=1, ncol=3, dimnames = list("", colnames(X))))
  })



# --- SUMMARY method ---
linreg$methods(summary = function(){
  # Put together a dataframe that contain all the outputs
  df_output <- data.frame("Estimate" = coefficients_beta,
                          "Std. Error" = sqrt(diag(var_of_beta)),
                          "t value" = t_values,
                          "Prob" = pt(q=-abs(t_values), df=n_degfree) + pt(q=abs(t_values), df=n_degfree, lower.tail=FALSE))

  # Put together the statistical significance indicator column
  df_output <- mutate(df_output, " " = case_when(Prob < 0.001 ~ "***",
                                                 Prob < 0.01 ~ "**",
                                                 Prob < 0.05 ~ "*",
                                                 Prob < 0.1 ~ ".",
                                                 Prob < 1 ~ " "))

  # Set col and row names (mainly to get Pr(>|t|) working) but also "Std. Error" and "t value".
  colnames(df_output) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)", " ")
  rownames(df_output) <- colnames(X)

  # Put together the Call statement (with formula and data name)
  cat(
    "Call:\n",
    "linreg(formula = ", as.character(formula)[2], " ~ ", as.character(formula)[3], ", data = ", data_name, ")\n\n",
    "Coefficients:\n",

    sep="")

  # Print the matrix of estimates, Std. errors, t values etc.
  print.default(as.matrix(df_output), quote=FALSE)

  # Print a statistical significance key, and some results
  cat("---\n")
  cat("Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1\n\n")
  cat("Residual standard error: ", round(sqrt(res_var_sigma2[1]), 2), " on ", n_degfree, " degrees of freedom", sep="")
})



#--- SHOW method ---
#This func makes so that print(linreg_object) works
linreg$methods(show = function(){return(print())})


# --- RESID method ---
linreg$methods(resid = function(){return(residuals_e)})


# --- PRED method ---
linreg$methods(pred = function(){return(fitted_y)})


# --- COEF method ---
linreg$methods(coef = function(){return(coefficients_beta)})
###------------^------------ SETTING UP METHODS ------------^------------


# HELP and references
# ggplot2 title centering
#https://stackoverflow.com/questions/40675778/center-plot-title-in-ggplot2


<!-- badges: start -->
 [![R-CMD-check](https://github.com/TheLaughingDuck/advRlab4package/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/TheLaughingDuck/advRlab4package/actions/workflows/R-CMD-check.yaml)
 <!-- badges: end -->

# advRlab4package
A repository for lab 4 in the course Advanced Programming in R

## SETUP (this workflow should be verified/tested) (in this order)
* Clone this repository locally in a suitable location. Preferably name the folder "packagename".

## RStudio Setup
* Open RStudio and change the working directory (for example with `setwd("C:/users/...")`) to be _your package folder_.

* In RStudio console, load the package `devtools` with `library(devtools)`, which we will use to automate many of the developer tasks.

* Create an R Project with `create_package(path=packagename)`.

* You may need to reload the `devtools` package, since the last step should have opened a new RStudio session.

* Go into the folder `R` which should have been created when creating the R project. For each function that you want your package to have, create a file with the respective function name e.g. `function1.R`, `function2.R` etc. The content of these files should be roughly like below. The documentation parts can also be done manually in RStudio through `Code > Insert Roxygen Skeleton`. Try to write at least initial descriptions, param specifications etc. This will make it easier to get started on writing the functions later.

```
#' Function Title
#'
#' @description A short description, one paragraph.
#'
#' @param arg1 A short description of the arg1 argument. Must specify: accepted format.
#'
#' @param arg2 A short description of the arg2 argument. Must specify: accepted format.
#'
#' @return A short description of the output format.
#'
#' @export


function1 <- function(arg1, arg2){

  # ---V--- CHECK INPUT ---V---
  # Check arg1 argument
  #stopifnot("argument \"arg1\" is not ---" = is.---(arg1))

  # Check arg2 argument
  #stopifnot("argument \"arg2\" is not ---" = is.---(arg2))
  # ---^--- CHECK INPUT ---^---

  return()
}
```

* Whenever you have updated the Roxygen documentation of any function or dataset, run `document()` to update the corresponding `.Rd` files. Try running `?function1`.

* Create test files for your functions. Run `use_testthat()`, which will setup some folder structure for your coming tests. You can now run `use_test("function1")` to create a file called `test-function1.R` in which you will be able to write all your unit tests for `function1`. If you run `use_test("function1")` again (now or later), it will open that file so you can work in it. You can now run `devtools::test()` to run all unit tests in the package. A common workflow when developing or solving bugs for a specific function (say `function1`) is to open `test-function1` and then _highlight and run_ the specific unit tests you are working on.

* When testing, run `load_all()`. Now you should be able to call the functions from the RStudio console, and the documentation for the functions should be available in the `Help` window.

* To set up Github Actions, run `usethis::use_github_action_check_standard()`. This function does appear to have been deprecated (in `usethis` 2.2.0). Instead you can run `use_github_action("check-standard")`. Next, copy the badge string that has been printed in the R console and paste it at the very top of the `readme.md`. You **can** include the banner things: `<!-- badges: start -->` to keep the readme a bit structured in case you want to add more banners at some point. Now push these changes to the repository. At the top of `readme.md` in the repository, there should now be a build badge.

## Final checks (some of these things can also be done sporadically when appropriate)
* When the R project first was created, a `DESCRIPTION` file was automatically created. Open it and fill in the fields for **authors**, **title**.

* Make sure to select a licence for your package. DO NOT DO THIS: If you choose the **MIT License**, run `use_mit_license()` in the console (when the working directory is set to the package folder!). Please note that **this template** comes with the **MIT LICENSE**, but you may not necessarily want this for your package/repository. You should respect the license of this template while also somehow having a license of your own when you create your own package from this template.
 
* Run `check()` which will run a whole bunch of checks on the package, including running your unit tests.

* Make sure everything you want pushed is pushed into the repository. Test that it is possible to install the package by going to the RStudio console and running `devtools::install_github("a_link_to_your_repository", subdir="your subdirectory")`.

* Create a release of the package on Github?

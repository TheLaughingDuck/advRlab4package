<!-- badges: start -->
 [![R-CMD-check](https://github.com/TheLaughingDuck/advRlab4package/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/TheLaughingDuck/advRlab4package/actions/workflows/R-CMD-check.yaml)
 <!-- badges: end -->

# advRlab4package
A repository for lab 4 in the course Advanced Programming in R

## Downloading and running this package
* Open either RStudio or RGui. In the console, load the `devtools` package. See the [devtools readme](https://cran.r-project.org/web/packages/devtools/readme/README.html) for details (I recommend having a look at the Cheatsheet).

* Run `devtools::install_github("TheLaughingDuck/name_of_this_repo")`. Note that the name of this repository *should* (because of convention and because it might avoid some issues), be named packagename. In case you keep multiple packages in the same repo, specify the subdirectory/package-folder-name with the argument `subdir="subdirectory"` in `install_github()`.

* This package should now be installed on your machine. Try running `?packagename` and `?function1`.

## SETUP (this workflow should be verified/tested) (in this order)
* Clone this repository locally in a suitable location. Preferably name the folder "packagename".

## RStudio Setup
* Open RStudio and change the working directory (for example with `setwd("C:/users/...")`) to be _your package folder_.

* In RStudio console, load the package `devtools` with `library(devtools)`, which we will use to automate many of the developer tasks.

* Create an R Project with `create_package(path="the/file/path/of/your/package")`.

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

* Whenever you have updated the Roxygen documentation of any function or dataset, run `document()` to update the corresponding `.Rd` files. Try running `?function1`. See [Generating Rd files](http://cran.nexr.com/web/packages/roxygen2/vignettes/rd.html) for help. You should also document the package: run `use_package_doc()`. This creates a file `R/packagename-package.R` which is used to create the corresponding `man/packagename-package.Rd` when you run `document()`. Information from the DESCRIPTION file will automatically be added to this (`.Rd`)  file.

* Create test files for your functions. Run `use_testthat()`, which will setup some folder structure for your coming tests. You can now run `use_test("function1")` to create a file called `test-function1.R` in which you will be able to write all your unit tests for `function1`. If you run `use_test("function1")` again (now or later), it will open that file so you can work in it. You can now run `devtools::test()` to run all unit tests in the package. A common workflow when developing or solving bugs for a specific function (say `function1`) is to open `test-function1` and then _highlight and run_ the specific unit tests you are working on. You can also run the tests for the current file with `test_active_file()`. Here is a simple file template for the indivual unit test files:

```
test_that("Text explaining what this test will test", {
  expect_equal(new_function(arg1, arg2), expected_output)
})

test_that("The function works as intended", {
  expect_equal(new_function(arg1, arg2), expected_output)
})

test_that("Errors are discovered", {
  expect_error(new_function(arg1, arg2))
})

test_that("Output is as expected", {
  expect_output(new_function(arg1, arg2), "regex thing")
  expect_output(new_function(arg1, arg2), "regex thing")
  expect_output(new_function(arg1, arg2), "\\d\\d\\d***\\(\\)")
  expect_output(new_function(arg1, arg2), "A number: \d Anything:*")
})
```

* When testing, run `load_all()`. Now you should be able to call the functions from the RStudio console, and the documentation for the functions should be available in the `Help` window.

* To set up Github Actions, run `use_github_action("check-standard")`. Next, copy the badge string that has been printed in the R console and paste it at the very top of the `readme.md`. You **can** include the banner things: `<!-- badges: start -->` to keep the readme a bit structured in case you want to add more banners at some point. Now push these changes to the repository. At the top of `readme.md` in the repository, there should now be a build badge.
  * A deprecated version of this is `usethis::use_github_action_check_standard()`, which was deprecated in `usethis` 2.2.0.

## Final checks before finishing/creating a release
(some of these things can also be done sporadically when appropriate)

* When the R project first was created, a `DESCRIPTION` file was automatically generated. Open it and fill in the fields for **authors**, **title**, **description**.

* Routine just-in-case things: Run `document()`.

* Make sure to select a licence for your package. DO NOT DO THIS: If you choose the **MIT License**, run `use_mit_license()` in the console (when the working directory is set to the package folder!). Please note that **this template** comes with the **MIT LICENSE**, but you may not necessarily want this for your package/repository. You should respect the license of this template while also somehow having a license of your own when you create your own package from this template.
 
* Run `check()` which will run a whole bunch of checks on the package, including running your unit tests.

* Make sure everything you want pushed is pushed into the repository. Test that it is possible to install the package by going to the RStudio console and running `devtools::install_github("User_name/repository_name", subdir="your subdirectory")`.

* Create a release of the package on Github? Choose and set a version number.



# Other things (should be included somewhere)

* Make a package available with e.g. `use_package("dplyr")`.

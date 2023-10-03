# test_that("Text explaining what this test will test", {
#   expect_equal(new_function(arg1, arg2), expected_output)
# })

# test_that("for correct output format", {
#   #expect_equal(all(class(theme(ggplot())) == c("gg", "ggplot")), TRUE)
#   #expect_equal(new_function(arg1, arg2), expected_output)
# })

# test_that("Bad input is discovered", {
#   expect_error(theme(c(1:100)))
#
#   expect_error(theme(1), theme(2))
#   expect_error(theme(1))
# })


# PLOT TESTS
# Example data
data <- data.frame(
  StudentID = 1:20,
  GPA = c(3.2, 3.5, 3.8, 2.9, 3.6, 3.2, 3.9, 2.7, 3.4, 3.1, 3.7, 3.0, 3.5, 3.8, 2.8, 3.3, 3.6, 3.2, 3.9, 2.9),
  StudyHours = c(20, 25, 30, 15, 28, 22, 32, 12, 27, 18, 29, 14, 26, 31, 16, 23, 28, 21, 33, 17)
)

# Create the custom scatter plot using the function
theme(data)




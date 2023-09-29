# test_that("Text explaining what this test will test", {
#   expect_equal(new_function(arg1, arg2), expected_output)
# })

test_that("for correct output format", {
  expect_equal(all(class(theme(ggplot())) == c("gg", "ggplot")), TRUE)
  #expect_equal(new_function(arg1, arg2), expected_output)
})

# test_that("Bad input is discovered", {
#   expect_error(theme(c(1:100)))
#
#   expect_error(theme(1), theme(2))
#   expect_error(theme(1))
# })

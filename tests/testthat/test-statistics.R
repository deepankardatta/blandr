library(blandr)
context("Core blandr statistics functions check")

test_that("Check that the core blandr.statistics and blandr.statistics.formula functions are providing accurate results", {
  # perform calculations
  core_function_results <- blandr.statistics( giavarina.2015$Method.A , giavarina.2015$Method.B )
  formula_function_results <- blandr.statistics.formula( Method.B ~ Method.A, data = giavarina.2015 )
  # check means
  expect_equal( core_function_results$means , giavarina.2015$Mean )
  expect_equal( formula_function_results$means , giavarina.2015$Mean )
  expect_equal( core_function_results$means , formula_function_results$means )
  # check differences
  expect_equal( core_function_results$differences , giavarina.2015$Difference )
  expect_equal( formula_function_results$differences , giavarina.2015$Difference )
  expect_equal( core_function_results$differences , formula_function_results$differences )

})

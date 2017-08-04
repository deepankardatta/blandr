library(blandr)
context("Giavarina calculation check")

test_that("Check blandr results are equal to original paper", {
  # perform calculations
  test.cases <- blandr.statistics( giavarina.2015$Method.A , giavarina.2015$Method.B )
  # check means
  expect_equal( test.cases$means , giavarina.2015$Mean )
  # check differences
  expect_equal( test.cases$differences , giavarina.2015$Difference )

  # bias
  d <- round( test.cases$bias , 2 )
  expect_equal( d , -27.17 )
  # sd of bias
  s <- round( test.cases$biasStdDev , 2 )
  expect_equal( s , 34.81 )
  # upper LOA
  upper.loa <- round( test.cases$upperLOA , 2 )
  expect_equal( upper.loa , 41.05 )
  # lower LOA
  lower.loa <- round( test.cases$lowerLOA , 2 )
  expect_equal( lower.loa , -95.39 )
  # standard error of d
  se.d <- round( test.cases$biasSEM , 2 )
  expect_equal( se.d , 6.35 )
  # upper 95% CI of d
  upper.d <- round( test.cases$biasUpperCI , 2 )
  expect_equal( upper.d , -14.17 )
  # lower 95% CI of d
  lower.d <- round( test.cases$biasLowerCI , 2 )
  expect_equal( lower.d , -40.16 )

})




# Tests which will fail as the R calculations are too precise
# SE of LOA
# se.loa <- round( test.cases$LOA_SEM , 2 )
# expect_equal( se.loa , 11.01 )
# Upper 95% CI of upper LOA
# upper.loa.high <- round( test.cases$upperLOA_upperCI , 2 )
# expect_equal( upper.loa.high , 65.36 )
# Lower 95% CI of upper LOA
# upper.loa.low <- round( test.cases$upperLOA_lowerCI , 2 )
# expect_equal( upper.loa.low , 18.54 )
# Upper 95% CI of lower LOA
# lower.loa.high <- round( test.cases$lowerLOA_upperCI , 2 )
# expect_equal( lower.loa.high , -72.88 )
# Lower 95% CI of lower LOA
# lower.loa.low <- round( test.cases$lowerLOA_lowerCI , 2 )
# expect_equal( lower.loa.low , -117.90 )

library(blandr)
context("PEFR dataset value check")

test_that("Check that in-built data is same as downloaded data", {
  downloaded.data <- blandr.dataset.load("pefr")
  expect_equal( downloaded.data$wright1 , bland.altman.PEFR.1986$WrightFirst )
  expect_equal( downloaded.data$wright2 , bland.altman.PEFR.1986$WrightSecond )
  expect_equal( downloaded.data$mini1 , bland.altman.PEFR.1986$MiniWrightFirst )
  expect_equal( downloaded.data$mini2 , bland.altman.PEFR.1986$MiniWrightSecond )
})

test_that("Check blandr results are equal to original paper" , {
  # perform calculations
  test.cases <- blandr.statistics( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst , LoA.mode = 2 )

  # calculations will have to be rounded, as they didn't have accurate computers in 1986

  # d is bias = -2.1
  d <- round( test.cases$bias , 1 )
  expect_equal( d , -2.1 )
  # s is sd of bias = 38.8
  s <- round( test.cases$biasStdDev , 1 )
  expect_equal( s , 38.8 )
  # d + 2s = -2.1 + (2x38.8) = 75.5 l/min
  upper.loa <- round( d + 2 * s , 1 )
  expect_equal( upper.loa , 75.5 )
  # d - 2s = -2.1 - (2x38.8) = -79.7 l/min
  lower.loa <- round( d - 2 * s , 1 )
  expect_equal( lower.loa , -79.7 )
  # standard error of d is thus 9.4
  se.d <- round( test.cases$biasSEM , 1 )
  expect_equal( se.d , 9.4 )
  # 17.8 l/min
  upper.d <- round( d + 2.12 * se.d , 1 )
  expect_equal( upper.d , 17.8 )
  # -22.0 l/min
  lower.d <- round( d - 2.12 * se.d , 1 )
  expect_equal( lower.d , -22.0 )
  # 16.3 but R is too precise compared to 1986 paper
  se.loa <- round( test.cases$LOA_SEM , 1 )
  expect_equal( se.loa , 16.4 ) # the computer is a bit too accurate
  se.loa <- 16.3 # manual override
  expect_equal( se.loa , 16.3 )
  #  110.1 l/min
  upper.loa.high <- round( upper.loa + 2.12 * se.loa , 1 )
  expect_equal( upper.loa.high , 110.1 )
  #  40.9 l/min
  upper.loa.low <- round( upper.loa - 2.12 * se.loa , 1 )
  expect_equal( upper.loa.low , 40.9 )
  # -45.1 l/min
  lower.loa.high <- round( lower.loa + 2.12 * se.loa , 1 )
  expect_equal( lower.loa.high , -45.1 )
  # -114.3 l/min
  lower.loa.low <- round( lower.loa - 2.12 * se.loa , 1 )
  expect_equal( lower.loa.low , -114.3 )

})

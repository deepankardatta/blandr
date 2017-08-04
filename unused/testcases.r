# test cases

# checking that the internet data is same as the transcribed data
test$wright1 == bland.altman.PEFR.1986$WrightFirst
test$wright2 == bland.altman.PEFR.1986$WrightSecond
test$mini1 == bland.altman.PEFR.1986$MiniWrightFirst
test$mini2 == bland.altman.PEFR.1986$MiniWrightSecond

# checking the caclulation from the original Bland Altman paper
# using the more accurate modern calculations
blandr.statistics( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst )
# using the original calculations (switched using LoA.mode=2)
blandr.statistics( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst , LoA.mode = 2 )

test.cases <- blandr.statistics( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst , LoA.mode = 2 )

# correct answers from paper
# d is bias = -2.1
d <- round( test.cases$bias , 1 )
d
# s is sd of bias = 38.8
s <- round( test.cases$biasStdDev , 1 )
s
# d + 2s = -2.1 + (2x38.8) = 75.5 l/min
upper.loa <- round( d + 2 * s , 1 )
upper.loa
# d - 2s = -2.1 - (2x38.8) = -79.7 l/min
lower.loa <- round( d - 2 * s , 1 )
lower.loa
# standard error of d is thus 9.4
se.d <- round( test.cases$biasSEM , 1 )
se.d
# 17.8 l/min
upper.d <- round( d + 2.12 * se.d , 1 )
upper.d
# -22.0 l/min
lower.d <- round( d - 2.12 * se.d , 1 )
lower.d
# 16.3 but R is too precise compared to 1986 paper
se.loa <- round( test.cases$LOA_SEM , 1 )
se.loa
se.loa <- 16.3 # manual override
se.loa
#  110.1 l/min
upper.loa.high <- round( upper.loa + 2.12 * se.loa , 1 )
upper.loa.high
#  40.9 l/min
upper.loa.low <- round( upper.loa - 2.12 * se.loa , 1 )
upper.loa.low
# -45.1 l/min
lower.loa.high <- round( lower.loa + 2.12 * se.loa , 1 )
lower.loa.high
# -114.3 l/min
lower.loa.low <- round( lower.loa - 2.12 * se.loa , 1 )
lower.loa.low


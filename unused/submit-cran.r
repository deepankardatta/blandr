# http://r-pkgs.had.co.nz/release.html

# Original scripts written c.2017. Need to update them to use newer version of devtolls

library(devtools)

# RUN-ONCE
# devtools::use_readme_rmd()
# devtools::use_build_ignore("NEWS.md")
# devtools::use_cran_comments()
# devtools::use_testthat()

# RUN every build
# make code to knit the README and NEWS files automatically
devtools::document()
devtools::document()
devtools::test()
devtools::build()
# devtools::build_manual()

# RUN before submission for checks
library(rhub) #see ?rhubv2 for info
devtools::check()
check_win_devel()
test_coverage()

# RUN for submission
devtools::release()

# These are the old versions of the check
# check_win()
# devtools::check_win()
# devtools::check_rhub()

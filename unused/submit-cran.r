# http://r-pkgs.had.co.nz/release.html

library(devtools)

# RUN-ONCE
# devtools::use_readme_rmd()
# devtools::use_build_ignore("NEWS.md")
# devtools::use_cran_comments()
# devtools::use_testthat()

# RUN every build
devtools::document()
devtools::document()
devtools::test()
devtools::build()

# RUN before submission for checks
devtools::check()
check_win()
devtools::check_win()
devtools::check_rhub()

# RUN for submission
devtools::release()

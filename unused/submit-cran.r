# http://r-pkgs.had.co.nz/release.html

# RUN-ONCE
# devtools::use_readme_rmd()
# devtools::use_build_ignore("NEWS.md")
# devtools::use_cran_comments()
# devtools::use_testthat()

# RUN every build
devtools::test()
devtools::document()
devtools::check()

# RUN final build
devtools::build_win()
devtools::revdep_check()
devtools::release()

# http://r-pkgs.had.co.nz/release.html

# RUN-ONCE
#devtools::use_readme_rmd()
#devtools::use_build_ignore("NEWS.md")
#devtools::use_cran_comments()
#devtools::use_testthat()

# RUN every build
devtools::document()
devtools::document()
devtools::test()
devtools::build()
devtools::check()

# RUN final build
devtools::build_win()
devtools::revdep_check()
devtools::release()

# http://r-pkgs.had.co.nz/release.html

# devtools::use_readme_rmd()
devtools::document()
devtools::check()
# devtools::build_win()
devtools::revdep_check()
devtools::use_build_ignore("NEWS.md")

devtools::release()

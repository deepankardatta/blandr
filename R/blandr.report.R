# BETA blandr.report function
#
# Lot of stuff needs to be done
# Call by doing blandr.report( method1 , method2 )
# blandr.report( measurement1 , measurement2 )

blandr.report <- function( method1 , method2 ) {
  rmarkdown::render("R/blandr-report.Rmd",
                    params = list(
                    method1 = method1,
                    method2 = method2)
                    )
}


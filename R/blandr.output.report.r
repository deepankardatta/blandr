#' @title Bland-Altman report generating function (BETA)
#'
#' @description Generates a report for the Bland-Altman statistics. The function passes data to a R markdown
#'
#' @author Deepankar Datta <deepankardatta@nhs.net>
#'
#' @import rmarkdown
#'
#' @param method1 A list of numbers for the first method
#' @param method2 A list of numbers for the second method
#'
#' @examples
#' # Generates two random measurements
#' measurement1 <- rnorm(100)
#' measurement2 <- rnorm(100)
#'
#' blandr.output.report( measurement1 , measurement2 )
#'
#' @export

blandr.output.report <- function( method1 , method2 ) {

  report_location <- system.file( "blandr-report.Rmd" , package="blandr" )

  rmarkdown::render( report_location ,
                     params = list(
                     method1 = method1,
                     method2 = method2)
                     )
}


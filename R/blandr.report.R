#' @title Bland-Altman report generating function (BETA)
#'
#' @description Generates a report for the Bland-Altman statistics. The function passes data to a R markdown
#'
#' @author Deepankar Datta <deepankardatta@nhs.net>
#'
#' @param method1 A list of numbers for the first method
#' @param method2 A list of numbers for the second method
#'
#' @examples
#' # Generates two random measurements
#' measurement1 <- rnorm(100)
#' measurement2 <- rnorm(100)
#'
#' blandr.report( measurement1 , measurement2 )
#'
#' @export

blandr.report <- function( method1 , method2 , ... ) {
  rmarkdown::render("R/blandr-report.Rmd",
                    params = list(
                    method1 = method1,
                    method2 = method2)
                    )
}


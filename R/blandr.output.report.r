#' @title Bland-Altman report generating function (BETA)
#'
#' @description Generates a report for the Bland-Altman statistics. The function passes data to a R markdown
#'
#' @author Deepankar Datta <deepankardatta@nhs.net>
#'
#' @import rmarkdown
#' @import shiny
#' @import jmvcore
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

  if( !rmarkdown::pandoc_available() ) {

    stop("The \"pandoc\" system is needed for this function to work. Please install it.",
         call. = FALSE)

  } else {

    report_location <- system.file( "blandr_report_template.Rmd" , package="blandr" )

    rmarkdown::run( file = report_location ,
                    render_args = list( runtime = "shiny" ,
                      params = list( method1 = method1 , method2 = method2 ) # End of params
                      ) # End of render_args
    ) # End of rmarkdown::run

  } # END OF IF STATEMENT

} # END OF FUNCTION


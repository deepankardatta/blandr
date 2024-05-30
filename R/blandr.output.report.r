#' @title Bland-Altman report generator
#'
#' @description Generates a report for the Bland-Altman statistics using rMarkdown and Shiny.
#'
#' @note Use the function to generate a report. You can also take the .Rmd file to customise it and create
#' @note your own report. Or use rMarkdown to save the contents. I couldn't add this to the function as it's
#' @note not allowed in CRAN. On the otherhand a full Shiny app would take too long. So this is a stop-gap way
#' @note of creating this function. Hopefully I can improve it in the future
#'
#' @author Deepankar Datta <deepankar.datta@gmail.com>
#'
#' @import rmarkdown
#' @import jmvcore
#'
#' @param method1 A list of numbers for the first method
#' @param method2 A list of numbers for the second method
#'
#' @examples
#' # NOT RUN
#' # Generates two random measurements
#' # measurement1 <- rnorm(100)
#' # measurement2 <- rnorm(100)
#'
#' # blandr.output.report( measurement1 , measurement2 )
#' #
#' # Use this to manually run the rmarkdown template
#' # However specify where the template is
#' # Also define your methods as method1 and method2 exactly
#' # For a reason I can't fathom (or how the list of parameters is constructed)
#' # not naming them method1 and method2 makes them invisible to the rMarkdown document
#' #
#' # rmarkdown::run( file = "blandr_report_template.Rmd" ,
#' #      render_args = list( runtime = "shiny" ,
#' #          params = list( method1 = method1 ,
#' #               method2 = method2 ) ) )
#' # END OF NOT RUN
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
                      params = list( method1 = method1 ,
                                     method2 = method2 ) # End of params
                      ) # End of render_args
    ) # End of rmarkdown::run

  } # END OF IF STATEMENT

} # END OF FUNCTION


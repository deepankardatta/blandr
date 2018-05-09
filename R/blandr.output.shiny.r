#' @title Bland-Altman report generating function
#'
#' @description Generates a report for the Bland-Altman statistics. The function passes data to a R markdown
#'
#' @note Based on Shiny examples at https://beta.rstudioconnect.com/content/2671/Combining-Shiny-R-Markdown.html
#'
#' @author Deepankar Datta <deepankardatta@nhs.net>
#'
#' @import rmarkdown
#' @import shiny
#' @import markdown
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

blandr.output.shiny <- function( method1 , method2 ) {

  require(shiny)
  shinyApp(
    ui = fluidPage(
      titlePanel("Bland-Altman analysis"),

      sidebarLayout(
        sidebarPanel(

          # Could also consider putting a file input and export box here

          ),

        mainPanel( # Start of Shiny dashboard output
          includeMarkdown("R/report_template.Rmd")
          )
      )
    ),
    server = function(input, output) {

    } # End of server= line
  )
}

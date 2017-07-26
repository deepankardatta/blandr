#' @title Bland-Altman display and draw for R
#'
#' @description Stub function: calls both the display and plots functions (in that order). Uses the same parameters as the plot and display functions to allow easy all-in-one use.
#' @description This function may be deprecated in future, as you really can use the functions easily separately.
#'
#' @author Deepankar Datta <deepankardatta@nhs.net>
#'
#' @inheritParams blandr.display
#' @inheritParams blandr.draw
#'
#' @include blandr.display.r
#' @include blandr.draw.r
#'
#' @examples
#' # Generates two random measurements
#' measurement1 <- rnorm(100)
#' measurement2 <- rnorm(100)
#'
#' # Generates a plot, with no optional arguments
#' blandr.display.and.draw( measurement1 , measurement2 )
#'
#' # Generates a plot, with title
#' blandr.display.and.draw( measurement1 , measurement2 , plotTitle = 'Bland-Altman example plot' )
#'
#' @export

blandr.display.and.draw <- function(method1, method2, plotter = "ggplot", method1name = "Method 1", 
    method2name = "Method 2", plotTitle = "Bland-Altman plot for comparison of 2 methods", 
    sig.level = 0.95, annotate = FALSE, ciDisplay = TRUE, ciShading = FALSE, normalLow = FALSE, 
    normalHigh = FALSE, lowest_y_axis = FALSE, highest_y_axis = FALSE, point_size = 0.8) {
    
    blandr.display(method1 = method1, method2 = method2, sig.level = sig.level)
    
    blandr.draw(method1, method2, plotter, method1name, method2name, plotTitle, sig.level, 
        annotate, ciDisplay, ciShading, normalLow, normalHigh, lowest_y_axis, highest_y_axis, 
        point_size)
    
}

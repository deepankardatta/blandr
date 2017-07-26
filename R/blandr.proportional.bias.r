#' @title Bland-Altman function to look for proportional bias
#'
#' @description Draws a Bland-Altman chart with regression line to look at proportional bias. Only uses ggplot2.
#'
#' @references http://rforpublichealth.blogspot.co.uk/2013/11/ggplot2-cheatsheet-for-scatterplots.html
#'
#' @author Deepankar Datta <deepankardatta@nhs.net>
#'
#' @inheritParams blandr.statistics
#' @inheritParams blandr.plot.limits
#' @inheritParams blandr.ggplot
#'
#' @include blandr.statistics.r
#' @include blandr.plot.limits.r
#' @include blandr.ggplot.r
#'
#' @examples
#' # Generates two random measurements
#' measurement1 <- rnorm(100)
#' measurement2 <- rnorm(100)
#'
#' # Call the function, with no optional arguments
#' blandr.proportional.bias( measurement1 , measurement2 )
#'
#' # Call the function, with title
#' blandr.proportional.bias( measurement1 , measurement2 , plotTitle = 'Bland-Altman example plot' )
#'
#' @export

blandr.proportional.bias <- function(method1, method2, method1name = "Method 1", method2name = "Method 2", 
    plotTitle = "Bland-Altman plot with regression line", sig.level = 0.95, LoA.mode = 1, 
    ciDisplay = FALSE, ciShading = FALSE, normalLow = FALSE, normalHigh = FALSE, lowest_y_axis = FALSE, 
    highest_y_axis = FALSE) {
    
    # Passes data to the blandr.statistics function to generate Bland-Altman statistics
    statistics.results <- blandr.statistics(method1, method2, sig.level, LoA.mode)
    
    # Will comment this part out - it was originally made for the base rplot graph drawing
    # ggplot2 seems to be able to set its own limits, and additional is easier to customise
    # The vignette has instructions how to take the ba.plot output to customise axes Passed
    # data to the blandr.plot.limits function to work out the axes limits plot.limits <-
    # blandr.plot.limits(statistics.results, lowest_y_axis, highest_y_axis)
    
    # Pass data to the blandr.ggplot function to use ggplot2 graphics system
    ba.plot <- blandr.ggplot(statistics.results = statistics.results, method1name = method1name, 
        method2name = method2name, plotTitle = plotTitle, ciDisplay = ciDisplay, ciShading = ciShading, 
        normalLow = normalLow, normalHigh = normalHigh)
    ba.plot <- ba.plot + ggplot2::geom_smooth(method = "lm")
    ba.plot
    
    # Prints out the regression equation Couldn't figure this out myself So took example code
    # from
    # http://rforpublichealth.blogspot.co.uk/2013/11/ggplot2-cheatsheet-for-scatterplots.html
    m <- lm(statistics.results$differences ~ statistics.results$means)
    a <- signif(coef(m)[1], digits = 2)
    b <- signif(coef(m)[2], digits = 2)
    textlab <- paste("y = ", b, "x + ", a, sep = "")
    print(textlab)
    
    return(ba.plot)
    
    # END OF FUNCTION
}

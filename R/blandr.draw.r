#' @title Bland-Altman drawing function for R
#'
#' @description Bland-Altman drawing function. Depends on the blandr.statistics function in the package. Will generate a plot via the standard R plotting functions.
#'
#' @author Deepankar Datta <deepankardatta@nhs.net>
#'
#' @note Started 2015-11-14
#' @note Last update 2015-11-19
#' @note Originally designed for LAVAS and CVLA
#'
#' @param plotter (Optional- default='ggplot') Selects which graphics engine to use to plot the Bland-Altman charts. 2 options are 'ggplot' or 'rplot'. If unknown parameter sent, will default to 'ggplot'
#'
#' @inheritParams blandr.statistics
#' @inheritParams blandr.plot.limits
#' @inheritParams blandr.basic.plot
#' @inheritParams blandr.ggplot
#'
#' @include blandr.statistics.r
#' @include blandr.plot.limits.r
#' @include blandr.basic.plot.r
#' @include blandr.ggplot.r
#'
#' @examples
#' # Generates two random measurements
#' measurement1 <- rnorm(100)
#' measurement2 <- rnorm(100)
#'
#' # Generates a plot, with no optional arguments
#' blandr.draw( measurement1 , measurement2 )
#'
#' # Generates a plot, using the in-built R graphics
#' blandr.draw( measurement1 , measurement2 , plotter = 'rplot' )
#'
#' # Generates a plot, with title changed
#' blandr.draw( measurement1 , measurement2 , plotTitle = 'Bland-Altman example plot' )
#'
#' # Generates a plot, with title changed, and confidence intervals off
#' blandr.draw( measurement1 , measurement2 , plotTitle = 'Bland-Altman example plot' ,
#' ciDisplay = FALSE , ciShading = FALSE )
#'
#' @export

blandr.draw <- function(method1, method2, plotter = "ggplot", method1name = "Method 1", method2name = "Method 2",
    plotTitle = "Bland-Altman plot for comparison of 2 methods", sig.level = 0.95, LoA.mode = 1,
    annotate = FALSE, ciDisplay = TRUE, ciShading = TRUE, normalLow = FALSE, normalHigh = FALSE,
    lowest_y_axis = FALSE, highest_y_axis = FALSE, point_size = 0.8) {

    # Passes data to the blandr.statistics function to generate Bland-Altman statistics
    statistics.results <- blandr.statistics(method1, method2, sig.level, LoA.mode)

    # Passed data to the blandr.plot.limits function to generate plot limits
    plot.limits <- blandr.plot.limits(statistics.results, lowest_y_axis, highest_y_axis)

    # Plots data, dependent on what has been selected as the 'plotter' option Implemented as
    # an if/else statement
    if (plotter == "rplot") {

        # Pass data to the blandr.basic.plot function to use R's in-built graphics system
        blandr.basic.plot(statistics.results, plot.limits, method1name, method2name, plotTitle,
            annotate, ciDisplay, ciShading, normalLow, normalHigh, point_size)

    } else {

        # Pass data to the blandr.ggplot function to use ggplot2 graphics system
        ba.plot <- blandr.ggplot(statistics.results = statistics.results, method1name = method1name,
            method2name = method2name, plotTitle = plotTitle, ciDisplay = ciDisplay, ciShading = ciShading,
            normalLow = normalLow, normalHigh = normalHigh)
        ba.plot

    }

    # If ggplot has been selected as the drawing function, returns the ggplot data if further
    # annotation needs to be done In reality what this checks for if the plotter function IS
    # NOT rplot
    if (plotter != "rplot") {

        return(ba.plot)

    }

    # END OF FUNCTION
}

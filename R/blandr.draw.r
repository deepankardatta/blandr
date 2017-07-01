#' @title Bland-Altman drawing function for R
#'
#' @description Bland-Altman drawing function. Depends on the blandr.statistics function in the package. Will generate a plot via the standard R plotting functions.
#'
#' @note Started 2015-11-14
#' @note Last update 2015-11-19
#' @note Originally designed for LAVAS and CVLA
#'
#' @param method1 A list of numbers.
#' @param method2 A list of numbers.
#' @param plotter (Optional) Switch to note if uses R's built in drawing functions, or ggplot2. Options = 'rplot' or 'ggplot'. Defaults to 'ggplot'. rplot currently has more available options.
#' @param method1name (Optional) Plotting name for 1st method, default 'Method 1'
#' @param method2name (Optional) Plotting name for 2nd method, default 'Method 2'
#' @param plotTitle (Optional) Title name, default 'Bland-Altman plot for comparison of 2 methods'
#' @param sig.level (Optional) Two-tailed significance level. Expressed from 0 to 1. Defaults to 0.95.
#' @param LoA.mode (Optional) Switch to change how accurately the limits of agreement (LoA) are calculated from the bias and its standard deviation. The default is LoA.mode=1 which calculates LoA with the more accurate 1.96x multiplier. LoA.mode=2 uses the 2x multiplier which was used in the original papers.
#' @param annotate (Optional) TRUE/FALSE switch to provides annotations to plot, default=FALSE
#' @param ciDisplay (Optional) TRUE/FALSE switch to plot confidence intervals for bias and limits of agreement, default=TRUE
#' @param ciShading (Optional) TRUE/FALSE switch to plot confidence interval shading to plot, default=TRUE
#' @param normalLow (Optional) If there is a normal range, entering a continuous variable will plot a vertical line on the plot to indicate its lower boundary
#' @param normalHigh (Optional) If there is a normal range, entering a continuous variable will plot a vertical line on the plot to indicate its higher boundary
#' @param lowest_y_axis (Optional) If given a continuous variable will use this as the lower boundary of the y axis. Useful if need multiple plots with equivalent y-axes. Defaults to FALSE.
#' @param highest_y_axis (Optional) If given a continuous variable will use this as the upper boundary of the y axis. Useful if need multiple plots with equivalent y-axes. Defaults to FALSE.
#' @param point_size (Optional) Size of marker for each dot. Default is cex=0.8
#'
#' @include blandr.statistics.r
#' @include blandr.plot.limits.r
#' @include blandr.basic.plot.r
#' @include blandr.ggplot.r
#' @export

blandr.draw <- function(method1, method2, plotter = "ggplot", method1name = "Method 1", method2name = "Method 2",
    plotTitle = "Bland-Altman plot for comparison of 2 methods", sig.level = 0.95, LoA.mode = 1, annotate = FALSE,
    ciDisplay = TRUE, ciShading = TRUE, normalLow = FALSE, normalHigh = FALSE, lowest_y_axis = FALSE, highest_y_axis = FALSE,
    point_size = 0.8) {

    # Passes data to the blandr.statistics function to generate Bland-Altman statistics
    statistics.results <- blandr.statistics(method1, method2, sig.level, LoA.mode)

    # Passed data to the blandr.plot.limits function to
    plot.limits <- blandr.plot.limits(statistics.results, lowest_y_axis, highest_y_axis)

    # Plots data, dependent on what has been selected as the 'plotter' option Implemented as an if/else statement
    if (plotter == "rplot") {

        # Pass data to the blandr.basic.plot function to use R's in-built graphics system
        blandr.basic.plot(statistics.results, plot.limits, method1name, method2name, plotTitle, annotate, ciDisplay,
            ciShading, normalLow, normalHigh, point_size)

    } else {

        # Pass data to the blandr.ggplot function to use ggplot2 graphics system
        ba.plot <- blandr.ggplot(statistics.results, method1name, method2name, plotTitle, ciDisplay,
            ciShading, normalLow, normalHigh)
        ba.plot

    }

    # If ggplot has been selected as the drawing function, returns the ggplot data if further annotation needs to be
    # done In reality what this checks for if the plotter function IS NOT rplot
    if (plotter != "rplot") {

        return(ba.plot)

    }

    # END OF FUNCTION
}

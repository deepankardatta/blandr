#' @title Bland-Altman drawing function for R
#'
#' @description Draws a Bland-Altman chart with regression line to look at proportional bias. Only uses ggplot2.
#'
#' @param method1 A list of numbers.
#' @param method2 A list of numbers.
#' @param method1name (Optional) Plotting name for 1st method, default 'Method 1'
#' @param method2name (Optional) Plotting name for 2nd method, default 'Method 2'
#' @param plotTitle (Optional) Title name, default 'Bland-Altman plot for comparison of 2 methods'
#' @param sig.level (Optional) Two-tailed significance level. Expressed from 0 to 1. Defaults to 0.95.
#' @param LoA.mode (Optional) Switch to change how accurately the limits of agreement (LoA) are calculated from the bias and its standard deviation. The default is LoA.mode=1 which calculates LoA with the more accurate 1.96x multiplier. LoA.mode=2 uses the 2x multiplier which was used in the original papers.
#' @param annotate (Optional) TRUE/FALSE switch to provides annotations to plot, default=FALSE
#' @param ciDisplay (Optional) TRUE/FALSE switch to plot confidence intervals for bias and limits of agreement,  Defaults to FALSE for proportional bias.
#' @param ciShading (Optional) TRUE/FALSE switch to plot confidence interval shading to plot,  Defaults to FALSE for proportional bias.
#' @param normalLow (Optional) If there is a normal range, entering a continuous variable will plot a vertical line on the plot to indicate its lower boundary
#' @param normalHigh (Optional) If there is a normal range, entering a continuous variable will plot a vertical line on the plot to indicate its higher boundary
#' @param lowest_y_axis (Optional) If given a continuous variable will use this as the lower boundary of the y axis. Useful if need multiple plots with equivalent y-axes. Defaults to FALSE.
#' @param highest_y_axis (Optional) If given a continuous variable will use this as the upper boundary of the y axis. Useful if need multiple plots with equivalent y-axes. Defaults to FALSE.
#' @param point_size (Optional) Size of marker for each dot. Default is cex=0.8
#'
#' @include blandr.statistics.r
#' @include blandr.plot.limits.r
#' @include blandr.ggplot.r
#' @export

blandr.proportional.bias <- function(method1, method2, method1name = "Method 1", method2name = "Method 2",
    plotTitle = "Bland-Altman plot with regression line", sig.level = 0.95, LoA.mode = 1, annotate = FALSE, ciDisplay = FALSE,
    ciShading = FALSE, normalLow = FALSE, normalHigh = FALSE, lowest_y_axis = FALSE, highest_y_axis = FALSE, point_size = 0.8) {

    # Passes data to the blandr.statistics function to generate Bland-Altman statistics
    statistics.results <- blandr.statistics(method1, method2, sig.level, LoA.mode)

    # Passed data to the blandr.plot.limits function to
    plot.limits <- blandr.plot.limits(statistics.results, lowest_y_axis, highest_y_axis)

    # Pass data to the blandr.ggplot function to use ggplot2 graphics system
    ba.plot <- blandr.ggplot(statistics.results, plot.limits, method1name, method2name, plotTitle, ciDisplay,
        ciShading, normalLow, normalHigh)
    ba.plot <- ba.plot + ggplot2::geom_smooth(method = "lm")
    ba.plot

    # Prints out the regression equation Couldn't figure this out myself So took example code from
    # http://rforpublichealth.blogspot.co.uk/2013/11/ggplot2-cheatsheet-for-scatterplots.html
    m <- lm(statistics.results$differences ~ statistics.results$means)
    a <- signif(coef(m)[1], digits = 2)
    b <- signif(coef(m)[2], digits = 2)
    textlab <- paste("y = ", b, "x + ", a, sep = "")
    print(textlab)

    return(ba.plot)

    # END OF FUNCTION
}

#' Bland-Altman display and draw for R
#'
#' @description Stub function: calls both the display and plots functions (in that order). Uses the same parameters as the plot and display functions to allow easy all-in-one use.
#' @description This function should be deprecated, as you really can use the functions easily separately.
#'
#' @param method1 A list of numbers.
#' @param method2 A list of numbers.
#' @param method1name Plotting name for 1st method, default 'Method 1'
#' @param method2name Plotting name for 2nd method, default 'Method 2'
#' @param plotTitle Title name, default 'Bland-Altman plot for comparison of 2 methods'
#' @param sig.level (Optional) Two-tailed significance level. Expressed from 0 to 1. Defaults to 0.95.
#' @param annotate (Optional) TRUE/FALSE switch to provides annotations to plot, default=FALSE
#' @param ciDisplay (Optional) TRUE/FALSE switch to plot confidence intervals for bias and limits of agreement, default=TRUE
#' @param ciShading (Optional) TRUE/FALSE switch to plot confidence interval shading to plot, default=FALSE
#' @param normalLow (Optional) If there is a normal range, entering a continuous variable will plot a vertical line on the plot to indicate its lower boundary
#' @param normalHigh (Optional) If there is a normal range, entering a continuous variable will plot a vertical line on the plot to indicate its higher boundary
#' @param lowest_y_axis (Optional) Defaults to NULL If given a continuous variable will use this as the lower boundary of the y axis. Useful if need multiple plots with equivalent y-axes.
#' @param highest_y_axis (Optional) Defaults to NULL If given a continuous variable will use this as the upper boundary of the y axis. Useful if need multiple plots with equivalent y-axes.
#' @param point_size (Optional) Size of marker for each dot. Default is cex=0.8
#'
#' @include blandr.display.r
#' @include blandr.draw.r

blandr.display.and.draw <- function(method1, method2, method1name = "Method 1", method2name = "Method 2", plotTitle = "Bland-Altman plot for comparison of 2 methods",
    sig.level = 0.95, annotate = FALSE, ciDisplay = TRUE, ciShading = FALSE, normalLow = FALSE, normalHigh = FALSE,
    lowest_y_axis = FALSE, highest_y_axis = FALSE, point_size = 0.8) {

    blandr.display(method1, method2, sig.level)

    blandr.draw(method1, method2, method1name, method2name, plotTitle, sig.level, annotate, ciDisplay, ciShading,
        normalLow, normalHigh, lowest_y_axis, highest_y_axis, point_size)

}

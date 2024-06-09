#' @title (DEPRECATED) Bland-Altman drawing function for R
#'
#' @description (DEPRECATED) Re-directs to blandr.draw.r
#'
#' @author Deepankar Datta <deepankar.datta@gmail.com>
#'
#' @inheritParams blandr.draw
#'
#' @include blandr.draw.r

blandr.plot <- function(method1, method2, plotter = "ggplot", method1name = "Method 1", method2name = "Method 2",
    plotTitle = "Bland-Altman plot for comparison of 2 methods", sig.level = 0.95, annotate = FALSE,
    ciDisplay = TRUE, ciShading = TRUE, normalLow = FALSE, normalHigh = FALSE, lowest_y_axis = FALSE,
    highest_y_axis = FALSE, point_size = 0.8) {

    .Deprecated("blandr.draw")

    blandr.draw(method1, method2, plotter, method1name, method2name, plotTitle, sig.level,
        annotate, ciDisplay, ciShading, normalLow, normalHigh, lowest_y_axis, highest_y_axis,
        point_size)

    # END OF FUNCTION

}

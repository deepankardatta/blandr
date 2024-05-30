#' @title (DEPRECATED) Bland-Altman display and plot for R
#'
#' @description (DEPRECATED) Re-directs to blandr.display.and.draw
#'
#' @author Deepankar Datta <deepankar.datta@gmail.com>
#'
#' @inheritParams blandr.display.and.draw
#'
#' @include blandr.display.and.draw.r

blandr.display.and.plot <- function(method1, method2, method1name = "Method 1", method2name = "Method 2",
    plotTitle = "Bland-Altman plot for comparison of 2 methods", sig.level = 0.95, annotate = FALSE,
    ciDisplay = TRUE, ciShading = FALSE, normalLow = FALSE, normalHigh = FALSE, lowest_y_axis = FALSE,
    highest_y_axis = FALSE, point_size = 0.8) {

    .Deprecated("blandr.display.and.draw")

    blandr.display.and.draw(method1, method2, method1name, method2name, plotTitle, sig.level,
        annotate, ciDisplay, ciShading, normalLow, normalHigh, lowest_y_axis, highest_y_axis,
        point_size)

}

#' @title Plot method for \code{blandr} objects
#'
#' @description Plot a Bland-Altman chart from the results of \code{blandr} objects
#' using the in-built rplot drawing functions
#'
#' @param x a blandr class object, the results from \code{blandr.statistics}.
#' @param ... other arguments.
#'
#'
#' @examples
#'
#' results = blandr.statistics( Method.B ~ Method.A , data = giavarina.2015 )
#' results
#' plot(results)
#'
#' @export

plot.blandr = function( x,
                        method1name = "Method 1" ,
                        method2name = "Method 2" ,
                        plotTitle = "Bland-Altman plot for comparison of 2 methods",
                        sig.level = 0.95,
                        LoA.mode = 1,
                        annotate = FALSE,
                        ciDisplay = TRUE,
                        ciShading = TRUE,
                        normalLow = FALSE,
                        normalHigh = FALSE,
                        lowest_y_axis = FALSE,
                        highest_y_axis = FALSE,
                        point_size = 0.8,
                        overlapping = FALSE ,
                        plotter = "ggplot" ,
                        x.plot.mode = "means" ,
                        y.plot.mode = "difference" ,
                        plotProportionalBias = FALSE ,
                        plotProportionalBias.se = TRUE ,
                        assume.differences.are.normal = TRUE ,
                        ...){

  # Originally the library assumed the output of the Bland-Altman calculations was in
  # statistics.results. In moving to a S3 "blandr" object, we pass the object a x
  # However this makes the readibility suffer as I sometimes have to work out if x
  # means the x axis, or the data that was passed over. So I've just made sure it is
  # referred to as statistics.results for my sanity
  statistics.results <- x

  plot.limits <- blandr.plot.limits( statistics.results , lowest_y_axis , highest_y_axis )

  # Plot data
  if (annotate == TRUE) {
    par.default <- par(no.readonly = TRUE)  # Original values
    par(oma = c(1.5, 0, 0, 0))  # 1.5 line2 at the bottom
  }
  plot(statistics.results$differences ~ statistics.results$means, main = plotTitle, xlab = "Means",
       ylab = "Differences", xaxs = "i", xlim = c(plot.limits$x_lower, plot.limits$x_upper),
       ylim = c(plot.limits$y_lower, plot.limits$y_upper), pch = 21, bg = "black", cex = point_size)

  # Drawing mean difference and limit of agreement lines
  ba.lines <- c(-statistics.results$sig.level.convert.to.z, 0, statistics.results$sig.level.convert.to.z)
  abline(h = 0, lty = 1)
  abline(h = statistics.results$bias + ba.lines * statistics.results$biasStdDev, lty = 2)

  # Drawing confidence intervals (OPTIONAL)
  if (ciDisplay == TRUE) {
    abline(h = c(statistics.results$biasUpperCI, statistics.results$biasLowerCI, statistics.results$upperLOA_upperCI,
                 statistics.results$upperLOA_lowerCI, statistics.results$lowerLOA_upperCI, statistics.results$lowerLOA_lowerCI),
           lty = 3)
    # Shading areas for 95% confidence intervals (OPTIONAL)
    if (ciShading == TRUE) {
      rect(plot.limits$x_lower, statistics.results$biasLowerCI, plot.limits$x_upper,
           statistics.results$biasUpperCI, border = NA, col = rgb(0, 0, 1, 0.5))
      rect(plot.limits$x_lower, statistics.results$upperLOA_lowerCI, plot.limits$x_upper,
           statistics.results$upperLOA_upperCI, border = NA, col = rgb(0, 1, 0, 0.5))
      rect(plot.limits$x_lower, statistics.results$lowerLOA_lowerCI, plot.limits$x_upper,
           statistics.results$lowerLOA_upperCI, border = NA, col = rgb(1, 0, 0, 0.5))
    }
  }

  if (normalLow != FALSE) {
    abline(v = normalLow, col = 6, lty = 1)
  }

  if (normalHigh != FALSE) {
    abline(v = normalHigh, col = 6, lty = 1)
  }

  # Outer margin legend text (OPTIONAL)
  if (annotate == TRUE) {
    mtext(paste(" Bland-Altman plot for ", method1name, "minus", method2name, "- each plotted point may represent multiple values - with plotted bias, limits of agreement and respective confidence intervals",
                "\n", "In Bland-Altman analyses we want the difference to be as close to 0 as possible with narrow 95% limits of agreement (LOA).",
                "\n", "n =", length(statistics.results$differences), "\n", "Upper 95% LOA (in green) =",
                round(statistics.results$upperLOA, 1), "(95% CI", round(statistics.results$upperLOA_lowerCI,
                                                                        2), "-", round(statistics.results$upperLOA_upperCI, 2), ")", "\n", "Mean difference (in blue) =",
                round(statistics.results$bias, 1), "(95% CI", round(statistics.results$biasLowerCI,
                                                                    2), "-", round(statistics.results$biasUpperCI, 2), ")", "\n", "Lower 95% LOA (in red) =",
                round(statistics.results$lowerLOA, 1), "(95% CI", round(statistics.results$lowerLOA_lowerCI,
                                                                        2), "-", round(statistics.results$lowerLOA_upperCI, 2), ")"), cex = 0.3,
          line = 0, side = SOUTH <- 1, adj = 0, outer = TRUE)
    par(par.default)  # Reset to original values
  }

  # END OF FUNCTION

}

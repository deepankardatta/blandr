#' @title (DEPRECATED) Bland-Altman summary statistics display function
#'
#' @description (DEPRECATED) Displays results of Bland-Altman analysis in a nicer text format. Relies on the blandr.statistics function in the package.
#'
#' @author Deepankar Datta <deepankar.datta@gmail.com>
#'
#' @param method1 A list of numbers.
#' @param method2 A list of numbers.
#' @param sig.level (Optional) Two-tailed significance level. Expressed from 0 to 1. Defaults to 0.95.
#'
#' @include blandr.statistics.r
#'
#' @examples
#' # Generates two random measurements
#' measurement1 <- rnorm(100)
#' measurement2 <- rnorm(100)
#'
#' # Displays basic statistics for the two measurements in a readable form
#' blandr.output.text( measurement1 , measurement2 )
#'
#' @export

blandr.output.text <- function(method1, method2, sig.level = 0.95) {

    .Deprecated("blandr.output.text")

    result <- blandr.statistics(method1, method2, sig.level)

    # Print summary Bland-Altman statistics
    cat("Number of comparisons: ", length(result$differences), "\n")
    cat("Maximum value for average measures: ", max(result$means), "\n")
    cat("Minimum value for average measures: ", min(result$means), "\n")
    cat("Maximum value for difference in measures: ", max(result$differences), "\n")
    cat("Minimum value for difference in measures: ", min(result$differences), "\n")
    cat("\n")
    cat("Bias: ", result$bias, "\n")
    cat("Standard deviation of bias: ", result$biasStdDev, "\n")
    cat("\n")
    cat("Standard error of bias: ", result$biasSEM, "\n")
    cat("Standard error for limits of agreement: ", result$LOA_SEM, "\n")
    cat("\n")
    cat("Bias: ", result$bias, "\n")
    cat("Bias- upper 95% CI: ", result$biasUpperCI, "\n")
    cat("Bias- lower 95% CI: ", result$biasLowerCI, "\n")
    cat("\n")
    cat("Upper limit of agreement: ", result$upperLOA, "\n")
    cat("Upper LOA- upper 95% CI: ", result$upperLOA_upperCI, "\n")
    cat("Upper LOA- lower 95% CI: ", result$upperLOA_lowerCI, "\n")
    cat("\n")
    cat("Lower limit of agreement: ", result$lowerLOA, "\n")
    cat("Lower LOA- upper 95% CI: ", result$lowerLOA_upperCI, "\n")
    cat("Lower LOA- lower 95% CI: ", result$lowerLOA_lowerCI, "\n")
    cat("\n")
    cat("Derived measures: ", "\n")
    cat("Mean of differences/means: ", (mean(result$differences/result$means * 100)), "\n")
    cat("Point estimate of bias as proportion of lowest average: ", (result$bias/min(result$means) *
        100), "\n")
    cat("Point estimate of bias as proportion of highest average", (result$bias/max(result$means) *
        100), "\n")
    cat("Spread of data between lower and upper LoAs: ", (result$upperLOA - result$lowerLOA),
        "\n")
    cat("Bias as proportion of LoA spread: ", (result$bias/(result$upperLOA - result$lowerLOA) *
        100), "\n")
    cat("\n")
    cat("Bias: \n", result$bias, " (", result$biasLowerCI, " to ", result$biasUpperCI, ")",
        "\n")
    cat("ULoA: \n", result$upperLOA, " (", result$upperLOA_lowerCI, " to ", result$upperLOA_upperCI,
        ")", "\n")
    cat("LLoA: \n", result$lowerLOA, " (", result$lowerLOA_lowerCI, " to ", result$lowerLOA_upperCI,
        ")", "\n")
    cat("\n")

    # END OF FUNCTION
}

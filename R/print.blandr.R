#' @title Print method for \code{blandr} objects
#'
#' @description Compactly print the statistics used to construct a Bland-Altman plot
#'
#' @author Deepankar Datta <deepankar.datta@gmail.com>
#'
#' @param x the results from \code{blandr.statistics}.
#' @param digits number of significant digits to be used.
#' @param ... other arguments.
#'
#' @importFrom stats pt
#'
#' @examples
#'
#' results = blandr.statistics.formula(Method.B ~ Method.A, data = giavarina.2015)
#' results
#'
#' @export

print.blandr = function(x, digits = getOption("digits"), ...){

  tstat = x$bias / x$biasSEM
  degF = x$no.of.observations - 1
  pval = 2 * (1 - pt(abs(tstat), degF))

  fmt.tstat = format(signif(tstat, max(1L, digits - 2L)))
  fmt.pval = format.pval(pval, digits = max(1L, digits - 3L))
  fmt.sigLevel = format(100 * x$sig.level)

  cat("Bland-Altman Statistics\n")
  cat("=======================\n")
  cat(glue::glue("t = {fmt.tstat}, df = {degF}, p-value = {fmt.pval}\n\n"))
  cat("alternative hypothesis: true bias is not equal to 0\n\n")
  # cat(glue::glue("{fmt.sigLevel} percent confidence interval:\n"))

  # Print summary Bland-Altman statistics
  cat("=======================\n")
  cat("Number of comparisons: ", length(x$differences), "\n")
  cat("Maximum value for average measures: ", max(x$means), "\n")
  cat("Minimum value for average measures: ", min(x$means), "\n")
  cat("Maximum value for difference in measures: ", max(x$differences), "\n")
  cat("Minimum value for difference in measures: ", min(x$differences), "\n")
  cat("\n")
  cat("Bias: ", x$bias, "\n")
  cat("Standard deviation of bias: ", x$biasStdDev, "\n")
  cat("\n")
  cat("Standard error of bias: ", x$biasSEM, "\n")
  cat("Standard error for limits of agreement: ", x$LOA_SEM, "\n")
  cat("\n")
  cat("Bias: ", x$bias, "\n")
  cat("Bias- upper 95% CI: ", x$biasUpperCI, "\n")
  cat("Bias- lower 95% CI: ", x$biasLowerCI, "\n")
  cat("\n")
  cat("Upper limit of agreement: ", x$upperLOA, "\n")
  cat("Upper LOA- upper 95% CI: ", x$upperLOA_upperCI, "\n")
  cat("Upper LOA- lower 95% CI: ", x$upperLOA_lowerCI, "\n")
  cat("\n")
  cat("Lower limit of agreement: ", x$lowerLOA, "\n")
  cat("Lower LOA- upper 95% CI: ", x$lowerLOA_upperCI, "\n")
  cat("Lower LOA- lower 95% CI: ", x$lowerLOA_lowerCI, "\n")
  cat("\n")
  cat("=======================\n")
  cat("Derived measures: ", "\n")
  cat("Mean of differences/means: ", (mean(x$differences/x$means * 100)), "\n")
  cat("Point estimate of bias as proportion of lowest average: ", (x$bias/min(x$means) *
                                                                     100), "\n")
  cat("Point estimate of bias as proportion of highest average", (x$bias/max(x$means) *
                                                                    100), "\n")
  cat("Spread of data between lower and upper LoAs: ", (x$upperLOA - x$lowerLOA),
      "\n")
  cat("Bias as proportion of LoA spread: ", (x$bias/(x$upperLOA - x$lowerLOA) *
                                               100), "\n")
  cat("\n")
  cat("=======================\n")
  cat("Bias: \n", x$bias, " (", x$biasLowerCI, " to ", x$biasUpperCI, ")",
      "\n")
  cat("ULoA: \n", x$upperLOA, " (", x$upperLOA_lowerCI, " to ", x$upperLOA_upperCI,
      ")", "\n")
  cat("LLoA: \n", x$lowerLOA, " (", x$lowerLOA_lowerCI, " to ", x$lowerLOA_upperCI,
      ")", "\n")
  cat("\n")

  # END OF OUTPUT

}

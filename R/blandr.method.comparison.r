#' @title Bland-Altman method comparison
#'
#' @description Everyone likes graphs, lines and T-tests. This uses the data provided to generate simple tests whilst trying to explain why they should be treated with caution in method comparison studies. This is hopefully the first step in getting people to use the Bland-Altman functions as I suspect everyone will try to do these tests anyway.
#'
#' @author Deepankar Datta <deepankar.datta@gmail.com>
#'
#' @param method1 A list of numbers.
#' @param method2 A list of numbers.
#' @param sig.level (Optional) Two-tailed significance level. Expressed from 0 to 1. Defaults to 0.95.
#'
#' @references Based on: (1) Bland, J. M., & Altman, D. (1986). Statistical methods for assessing agreement between two methods of clinical measurement. The Lancet, 327(8476), 307-310. http://dx.doi.org/10.1016/S0140-6736(86)90837-8
#' @references Linnet K., Limitations of the paired t-test for evaluation of method comparison data. Clin Chem. 1999 Feb;45(2):314-5. PMID: 9931067
#' @references Zaki R, Bulgiba A, Ismail R, Ismail NA. Statistical Methods Used to Test for Agreement of Medical Instruments Measuring Continuous Variables in Method Comparison Studies: A Systematic Review PLoS ONE 2012 7(5): e37908. doi: 10.1371/journal.pone.0037908
#'
#' @include blandr.data.preparation.r
#'
#' @examples
#' # Generates two random measurements
#' measurement1 <- rnorm(100)
#' measurement2 <- rnorm(100)
#'
#' # Call the function
#' blandr.method.comparison( measurement1 , measurement2 )
#'
#' @export

blandr.method.comparison <- function(method1, method2, sig.level = 0.95) {

    # Prepares the data
    comparison.data <- blandr.data.preparation(method1, method2, sig.level)

    # Some messages before going on
    cat("\nNote as per Bland and Altman 1986 linear correlation DOES NOT mean agreement. ")
    cat("Data which seem to be in poor agreement can produce quite high correlations. ")
    cat("Line of equality in dashed black, linear regression model in solid red.\n")

    # Linear regression line model
    model <- lm(comparison.data$method1 ~ comparison.data$method2)
    multiplier <- model$coefficients[2]
    multiplier <- as.numeric(multiplier)
    intercept <- model$coefficients[1]
    intercept <- as.numeric(intercept)

    # Plot as described by Bland-Altman in 1986
    plot(comparison.data$method2, comparison.data$method1, main = "Plot of two methods with line of equality",
        xlab = "Method 1", ylab = "Method 2")
    # Line of equality
    abline(0, 1, lty = 2)
    # Fit line
    abline(model, col = "red")

    # Paired T-test
    results.paired.t.test <- t.test(comparison.data$method1, comparison.data$method2, paired = TRUE)

    # Writes results for paired T-test
    cat("\nPaired T-tests evaluate for significant differences between the means of two sets of data. It does not test agreement, as the results of a T-test can be hidden by the distribution of differences. See the references for further reading.\n")
    cat("Paired T-test p-value: ", results.paired.t.test$p.value, "\n")

    # Writes correlation coefficient
    cat("\nCorrelation coefficients only tell us the linear relationship between 2 variables and nothing about agreement.\n")
    cat("Correlation coefficient:", cor(comparison.data$method1, comparison.data$method2),
        "\n")

    # Writes regression model
    cat("\nLinear regression models, are conceptually similar to correlation coefficients, and again tell us nothing about agreement.\n")
    cat("Using method 1 to predict the dependent method 2, using least squares regression.\n")
    cat("Regression equation: method 2 = ", multiplier, "x method 1 + ", intercept, "\n")

}

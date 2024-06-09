#' @title Data preparation for method comparison analysis
#'
#' @description Prepares the data and runs error checks before the calling function runs whatever method analysis mode is wants.
#'
#' @author Deepankar Datta <deepankar.datta@gmail.com>
#'
#' @param method1 A list of numbers.
#' @param method2 A list of numbers.
#' @param sig.level Significance level. Is not optional in this function, as the calling package should have a default value to pass if needed
#'
#' @return method.comparison A data frame of paired values. These have been data checked, and empty rows omitted, from the originally supplied data.
#'
#' @examples
#' # Generates two random measurements
#' measurement1 <- rnorm(100)
#' measurement2 <- rnorm(100)
#'
#' # Calls the function - do note that this function was really
#' # meant to be called from other functions and not a stand-alone funtion
#' blandr.data.preparation( measurement1 , measurement2, sig.level=0.95 )
#'
#' @export

blandr.data.preparation <- function( method1 , method2 , sig.level ) {

    # Put everything into a data frame for easier handling Stems from the error in some of
    # the sepsis data I had
    method.comparison <- data.frame( method1 , method2 )

    # Omit rows which have empty values
    method.comparison <- na.omit( method.comparison )

    # Data checks
    if (length(method.comparison$method1) != length(method.comparison$method2))
        stop("Method comparison analysis error: the 2 methods must have paired values.")
    if (!is.numeric(method.comparison$method1))
        stop("Method comparison analysis error: the first method is not a number.")
    if (!is.numeric(method.comparison$method2))
        stop("Method comparison analysis error: the second method is not a number.")
    if (sig.level < 0)
        stop("Method comparison analysis error: you can't have a significance level less than 0.")
    if (sig.level < 0.8)
        warning("Method comparison analysis warning: do you really want a significance level <0.8?")
    if (sig.level > 1)
        stop("Method comparison analysis error: you can't have a significance level greater than 1.")
    if (sig.level == 1)
        warning("Method comparison analysis warning: selecting a significance level of 1 suggest that probability testing might not be what you need.")

    # Returns the data
    return(method.comparison)

}

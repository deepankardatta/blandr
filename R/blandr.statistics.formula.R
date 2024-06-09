#' @title Bland-Altman statistics for R - submitting data as a formula
#'
#' @description If data is supplied as a formula, the function interprets it
#' and then passes it through to the main blandr.statistics function.
#'
#' @author Deepankar Datta <deepankar.datta@gmail.com>
#'
#' @note This was initially packaged in the same file as the blandr.statistics function. Changes to R package checks made it easier to separate it out, but functionally it has not changed.
#'
#' @param formula A formula, to be eventually passed to the blandr.statistics function
#' @param data A data frame
#' @param ... other arguments.
#'
#' @importFrom stats coef cor lm na.omit qnorm qt sd t.test model.frame model.response
#'
#' @include blandr.statistics.r
#'
#' @examples
#'
#' # Generates two random measurements
#' measurement1 <- rnorm(100)
#' measurement2 <- rnorm(100)
#'
#' # Generates Bland-Altman statistics data of the two measurements using the formula interface
#'
#' blandr.statistics.formula( measurement2 ~ measurement1 )
#'
#' # Example with a real data set
#' blandr.statistics.formula( Method.B ~ Method.A, data = giavarina.2015 )
#'
#' @rdname blandr.statistics.formula
#' @export

# 2024-05-31 - looking back at this function many years after I first made it is interesting
# It's difficult to parse after being away from using R for so much time
# It makes sense after a while though
#
# I might just delete this function eventually. There must have been a reason I put in a method to
# look at data passed in a different way. Again can't think of why...

blandr.statistics.formula = function( formula , data = parent.frame() , ...){
  if ( missing(formula) || (length(formula) != 3) )
    stop("'formula' missing or incorrect")

  mf = model.frame(formula, data)
  method2 = model.response(mf)
  method1 = mf[,2]

  blandr.statistics( method1 = method1 , method2 = method2 )
}

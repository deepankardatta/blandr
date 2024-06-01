#' @title Bland-Altman statistics for R - submitting data as a formula
#'
#' @description If data is supplied as a formula, the function interprets it
#' and then passes it through to the main blandr.statistics function.
#'
#' @author Deepankar Datta <deepankar.datta@gmail.com>
#'
#' @note This was initially packaged in the same file as the blandr. statistics function. Changes to R package checks made it easier to separate it out, but functionally it has not changed.
#'
#' @inheritParams blandr.statistics
#'
#' @include blandr.statistics.r
#'
#' @param formula A formula, to be eventually passed to the blandr.statistics function
#' @param data A data frame
#' @param ... other arguments.
#'
#' @rdname blandr.statistics.formula
#' @export

# 2024-05-31 - looking back at this function many years after I first made it is interesting
# It's difficult to parse after being away from using R for so much time
# It makes sense after a while though

blandr.statistics.formula = function(formula, data = parent.frame(), ...){
  if (missing(formula) || (length(formula) != 3))
    stop("'formula' missing or incorrect")

  mf = model.frame(formula, data)
  y = model.response(mf)
  x = mf[,2]

  blandr.statistics(x = x, y = y, ...)
}

#' @title Print method for \code{blandr} objects
#'
#' @description Compactly print the statistics used to construct a Bland-Altman plot
#'
#' @param x the results from \code{blandr.statistics}.
#' @param digits number of significant digits to be used.
#' @param ... other arguments.
#'
#'
#' @examples
#'
#' results = blandr.statistics(Method.B ~ Method.A, data = giavarina.2015)
#' results
#' print(results)
#'
#' @export

print.blandr = function(x, digits = getOption("digits"), ...){

  cat( "Bland-Altman Statistics\n" )
  cat( "=======================\n" )
  cat( "Number of comparisons: " , length(x$differences) , "\n" )
  cat( "\n" )
  cat( "Bias: ", x$bias , " (", x$biasLowerCI , " to " , x$biasUpperCI , ")" , "\n" )
  cat( "Upper limit of agreement: " , x$upperLOA , " (" , x$upperLOA_lowerCI , " to " , x$upperLOA_upperCI , ")" , "\n" )
  cat( "Lower limit of agreement: " , x$lowerLOA , " (" , x$lowerLOA_lowerCI , " to " , x$lowerLOA_upperCI , ")" , "\n" )
  cat( "\n" )

}

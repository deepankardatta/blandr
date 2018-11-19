#' Print method for \code{blandr} objects
#'  
#' Compactly print the statistics used to construct a Bland-Altman plot
#' 
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
  cat(glue::glue("t = {fmt.tstat}, df = {degF}, p-value = {fmt.pval}\n"))
  cat("alternative hypothesis: true bias is not equal to 0\n")
  
  cat(glue::glue("{fmt.sigLevel} percent confidence interval:\n"))
}
#' @title Bland-Altman statistics for R
#'
#' @description Bland-Altman analysis function for R. Package created as existing
#' functions don't suit my needs, and don't generate 95\% confidence intervals
#' for bias and limits of agreement. This base function calculates the basic
#' statistics, and generates return values which can be used in the related
#' \code{blandr.display} and \code{bland.altamn.plot} functions. However
#' the return results can be used to generate a custom chart if desired.
#'
#' @author Deepankar Datta <deepankardatta@nhs.net>
#'
#' @note The function will give similar answers when used on the original Bland-Altman PEFR data sets. They won't be exactly the same as (a) for 95\% limits of agreement I have used +/-1.96, rather than 2, and (b) the computerised calculation means that the rounding that is present in each step of the original examples does not occur. This will give a more accurate answer, although I can understand why in 1986 rounding would occur at each step for ease of calculation.
#' @note The function depends on paired values.
#' @note It currently only can currently work out fixed bias.
#' @note Improvements for the future: proportional bias charts will need further work
#'
#' @note Started 2015-11-14
#' @note Last update 2016-02-04
#' @note Originally designed for LAVAS and CVLA
#'
#' @references Based on: (1) Bland, J. M., & Altman, D. (1986). Statistical methods for assessing agreement between two methods of clinical measurement. The Lancet, 327(8476), 307-310. http://dx.doi.org/10.1016/S0140-6736(86)90837-8
#' @references Confidence interval work based on follow-up paper: (2) Altman, D. G., & Bland, J. M. (2002). Commentary on quantifying agreement between two methods of measurement. Clinical chemistry, 48(5), 801-802. http://www.clinchem.org/content/48/5/801.full.pdf
#'
#' @param method1 A list of numbers.
#' @param method2 A list of numbers.
#' @param sig.level (Optional) Two-tailed significance level. Expressed from 0 to 1. Defaults to 0.95.
#' @param LoA.mode (Optional) Switch to change how accurately the limits of agreement (LoA) are calculated from the bias and its standard deviation. The default is LoA.mode=1 which calculates LoA with the more accurate 1.96x multiplier. LoA.mode=2 uses the 2x multiplier which was used in the original papers. This should really be kept at default, except to double check calculations in older papers.
#' @return means List of arithmetic mean of the two methods
#' @return differences List of differences of the two methods
#' @return sig.level Significance level supplied to the function
#' @return sig.level.convert.to.z Significance level convert to Z value
#' @return bias Bias of the two methods
#' @return biasUpperCI Upper confidence interval of the bias (based on significance level)
#' @return biasLowerCI Lower confidence interval of the bias (based on significance level)
#' @return biasStdDev
#' @return biasSEM Standard error for the bias
#' @return LOA_SEM Standard error for the limits of agreement
#' @return upperLOA Upper limit of agreement
#' @return upperLOA_upperCI Upper confidence interval of the upper limit of agreement
#' @return upperLOA_lowerCI Lower confidence interval of the upper limit of agreement
#' @return lowerLOA Lower limit of agreement
#' @return lowerLOA_upperCI Upper confidence interval of the lower limit of agreement
#' @return lowerLOA_lowerCI Lower confidence interval of the lower limit of agreement
#'
#' @importFrom  stats coef cor lm na.omit qnorm qt sd t.test
#'
#' @include blandr.data.preparation.r
#'
#' @examples
#' # Generates two random measurements
#' measurement1 <- rnorm(100)
#' measurement2 <- rnorm(100)
#'
#' # Generates Bland-Altman statistics data of the two measurements
#' blandr.statistics( measurement1 , measurement2 )
#'
#' @export

blandr.statistics <- function(method1, method2, sig.level = 0.95, LoA.mode = 1) {
    
    # This sends to the preparation function, which does some sense checks on the data And
    # makes sure that the values are prepared
    ba.data <- blandr.data.preparation(method1, method2, sig.level)
    
    # method1 and method2 are the measurements
    means <- (ba.data$method1 + ba.data$method2)/2
    differences <- ba.data$method1 - ba.data$method2
    bias <- mean(differences)
    biasStdDev <- sd(differences)
    
    # Convert confidence interval to a two-tailed z-value Don't really need this but kept as
    # a remnant of old version to possibly use in the future
    alpha <- 1 - sig.level
    sig.level.two.tailed <- 1 - (alpha/2)
    sig.level.convert.to.z <- qnorm(sig.level.two.tailed)
    
    # Compute the 95% limits of agreement (based on 1st paper) Don't use the significance
    # level supplied to the function here!  (The significance level is for confidence
    # intervals, not for limits of agreement!)  We want to know in the sample what limits 95%
    # of the pop resides within The LoA.mode switch can change before the +/-1.96 multiplier
    # used in more recent papers Or the estimated +/-2 multiplier used in the original paper
    # The default is LoA.mode which gives a LoA.multiplier of 1.96
    if (LoA.mode == 2) {
        LoA.multiplier <- 2
    } else {
        LoA.multiplier <- 1.96
    }
    upperLOA <- bias + (LoA.multiplier * biasStdDev)
    lowerLOA <- bias - (LoA.multiplier * biasStdDev)
    
    # Confidence intervals (based on 2nd paper) Based on significance level supplied
    # (defaults to 95% CI) For mean
    biasSEM <- sd(differences)/sqrt(length(differences))
    biasCI <- qt(sig.level.two.tailed, df = length(differences) - 1) * biasSEM
    biasUpperCI <- bias + biasCI
    biasLowerCI <- bias - biasCI
    # For limits of agreement LOAVariance from Carkeet
    LOAVariance <- ((1/length(differences)) + ((sig.level.convert.to.z^2)/(2 * (length(differences) - 
        1)))) * biasStdDev^2
    LOA_SEM <- sqrt(LOAVariance)
    LOA_CI <- qt(sig.level.two.tailed, df = length(differences) - 1) * LOA_SEM
    upperLOA_upperCI <- upperLOA + LOA_CI
    upperLOA_lowerCI <- upperLOA - LOA_CI
    lowerLOA_upperCI <- lowerLOA + LOA_CI
    lowerLOA_lowerCI <- lowerLOA - LOA_CI
    
    return(list(means = means, differences = differences, sig.level = sig.level, sig.level.convert.to.z = sig.level.convert.to.z, 
        bias = bias, biasUpperCI = biasUpperCI, biasLowerCI = biasLowerCI, biasStdDev = biasStdDev, 
        biasSEM = biasSEM, LOA_SEM = LOA_SEM, upperLOA = upperLOA, upperLOA_upperCI = upperLOA_upperCI, 
        upperLOA_lowerCI = upperLOA_lowerCI, lowerLOA = lowerLOA, lowerLOA_upperCI = lowerLOA_upperCI, 
        lowerLOA_lowerCI = lowerLOA_lowerCI)  #CLOSE OF LIST
)  #CLOSE OF RETURN
    
    # END OF FUNCTION
}

#' @title Bland-Altman statistics for R
#'
#' @description Bland-Altman analysis function for R. Package created as existing
#' functions don't suit my needs, and don't generate 95\% confidence intervals
#' for bias and limits of agreement. This base function calculates the basic
#' statistics, and generates return values which can be used in the related
#' \code{blandr.display} and \code{bland.altamn.plot} functions. However
#' the return results can be used to generate a custom chart if desired.
#'
#' @author Deepankar Datta <deepankar.datta@gmail.com>
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
#' @param method1 Either a formula, or a vector of numbers corresponding to the results from method 1.
#' @param method2 A vector of numbers corresponding to the results from method 2. Only needed if \code{X} is a vector.
#' @param sig.level (Optional) Two-tailed significance level. Expressed from 0 to 1. Defaults to 0.95.
#' @param LoA.mode (Optional) Switch to change how accurately the limits of agreement (LoA) are calculated from the bias and its standard deviation. The default is LoA.mode=1 which calculates LoA with the more accurate 1.96x multiplier. LoA.mode=2 uses the 2x multiplier which was used in the original papers. This should really be kept at default, except to double check calculations in older papers.
#'
#' @return An object of class 'blandr' is returned. This is a list with the following elements:
#' \item{means}{List of arithmetic mean of the two methods}
#' \item{differences}{List of differences of the two methods}
#' \item{method1}{Returns the 'method1' list in the data frame if further evaluation is needed}
#' \item{method2}{Returns the 'method2' list in the data frame if further evaluation is needed}
#' \item{sig.level}{Significance level supplied to the function}
#' \item{sig.level.convert.to.z}{Significance level convert to Z value}
#' \item{bias}{Bias of the two methods}
#' \item{biasUpperCI}{Upper confidence interval of the bias (based on significance level)}
#' \item{biasLowerCI}{Lower confidence interval of the bias (based on significance level)}
#' \item{biasStdDev}{Standard deviation for the bias}
#' \item{biasSEM}{Standard error for the bias}
#' \item{LOA_SEM}{Standard error for the limits of agreement}
#' \item{upperLOA}{Upper limit of agreement}
#' \item{upperLOA_upperCI}{Upper confidence interval of the upper limit of agreement}
#' \item{upperLOA_lowerCI}{Lower confidence interval of the upper limit of agreement}
#' \item{lowerLOA}{Lower limit of agreement}
#' \item{lowerLOA_upperCI}{Upper confidence interval of the lower limit of agreement}
#' \item{lowerLOA_lowerCI}{Lower confidence interval of the lower limit of agreement}
#' \item{proportion}{Differences/means*100}
#' \item{no.of.observations}{Number of observations}
#' \item{regression.equation}{A regression equation to help determine if there is any proportional bias}
#' \item{regression.fixed.slope}{The slope value of the regression equation}
#' \item{regression.fixed.intercept}{The intercept value of the regression equation}
#'
#' @importFrom stats coef cor lm na.omit qnorm qt sd t.test model.frame model.response
#'
#' @include blandr.data.preparation.r
#'
#' @examples
#'
#' # Generates two random measurements
#' measurement1 <- rnorm(100)
#' measurement2 <- rnorm(100)
#'
#' # Generates Bland-Altman statistics data of the two measurements
#' blandr.statistics( measurement1 , measurement2 )
#'
#' @rdname blandr.statistics
#' @export

# Hold over from 0.5.x versions of blandr - which are years old
# The c.2024 devtools seem to choke on this and it's not clear why
# blandr.statistics = function(x, ...){
# UseMethod("blandr.statistics")
# }
# 2024-05-30: commentary after 5 years of not looking at this code
# I think I was trying to be too clever in allowing the user to either pass two vectors
# or pass a formula to the function. I am not clear why I felt this was necessary.

blandr.statistics <- function( method1,
                               method2,
                               sig.level = 0.95,
                               LoA.mode = 1 ) {

    # This sends to the preparation function, which does some sense checks on the data And
    # makes sure that the values are prepared
    ba.data <- blandr.data.preparation( method1 , method2 , sig.level )

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
    # The default is LoA.mode which gives a LoA.multiplier of 1.96. In future we could use an
    # even more precise multipler for limits of agreement.
    if (LoA.mode == 2) {
        LoA.multiplier <- 2
    } else {
        LoA.multiplier <- 1.96
    }
    upperLOA <- bias + (LoA.multiplier * biasStdDev)
    lowerLOA <- bias - (LoA.multiplier * biasStdDev)

    # Confidence intervals (based on 2nd paper) Based on significance level supplied
    # (defaults to 95% CI) CI for mean
    biasSEM <- sd(differences)/sqrt(length(differences))
    biasCI <- qt(sig.level.two.tailed, df = length(differences) - 1) * biasSEM
    biasUpperCI <- bias + biasCI
    biasLowerCI <- bias - biasCI

    # CI for limits of agreement LOAVariance from Carkeet
    LOAVariance <- ((1/length(differences)) + ((sig.level.convert.to.z^2)/(2 * (length(differences) -
        1)))) * biasStdDev^2
    LOA_SEM <- sqrt(LOAVariance)
    LOA_CI <- qt(sig.level.two.tailed, df = length(differences) - 1) * LOA_SEM
    upperLOA_upperCI <- upperLOA + LOA_CI
    upperLOA_lowerCI <- upperLOA - LOA_CI
    lowerLOA_upperCI <- lowerLOA + LOA_CI
    lowerLOA_lowerCI <- lowerLOA - LOA_CI

    # Difference/mean proportion
    proportion <- differences / means * 100

    # Number of observations
    no.of.observations <- length(means)

    # Works out numbers for proportional bias
    # Couldn't figure this out myself So took example code from
    # http://rforpublichealth.blogspot.co.uk/2013/11/ggplot2-cheatsheet-for-scatterplots.html
    m <- lm( differences ~  means )
    a <- signif(coef(m)[1], digits = 2)
    b <- signif(coef(m)[2], digits = 2)
    regression.equation <- paste("y(differences) = ", b, " x(means) + ", a, sep = "")

    results =
      list(
        means = means ,
        differences = differences ,
        method1 = method1 ,
        method2 = method2 ,
        sig.level = sig.level,
        sig.level.convert.to.z = sig.level.convert.to.z ,
        bias = bias ,
        biasUpperCI = biasUpperCI ,
        biasLowerCI = biasLowerCI ,
        biasStdDev = biasStdDev ,
        biasSEM = biasSEM ,
        LOA_SEM = LOA_SEM ,
        upperLOA = upperLOA ,
        upperLOA_upperCI = upperLOA_upperCI ,
        upperLOA_lowerCI = upperLOA_lowerCI ,
        lowerLOA = lowerLOA ,
        lowerLOA_upperCI = lowerLOA_upperCI ,
        lowerLOA_lowerCI = lowerLOA_lowerCI ,
        proportion = proportion ,
        no.of.observations = no.of.observations ,
        regression.equation = regression.equation ,
        regression.fixed.slope = b ,
        regression.fixed.intercept = a
        )  #CLOSE OF LIST

    class(results) = "blandr"
    return(results)

    # END OF FUNCTION
}

\name{giavarina.2015}
\alias{giavarina.2015}
\docType{data}
\title{Sample comparison data from Giavarina (2015)}
\description{This is sample comparison data, taken from Giavarina's 2015 paper on Bland-Altman analysis. The data is from table 1 of the paper.  I do not claim any copyright on the data - this is meant to allow testing of the function. I encourage future package authors to use the .rda file if they so wish.}
\usage{data("giavarina.2015")}
\format{
  A data frame with 30 observations on the following 5 variables.
  \describe{
    \item{\code{Method.A}}{a numeric vector}
    \item{\code{Method.B}}{a numeric vector}
    \item{\code{Mean}}{a numeric vector}
    \item{\code{Difference}}{a numeric vector}
    \item{\code{Diff.Mean.Proportion}}{a factor with levels}
  }
}
\references{Giavarina D. Understanding Bland Altman analysis. Biochemia Medica. 2015;25(2):141-151. doi:10.11613/BM.2015.015.}
\examples{
data(giavarina.2015)}
\keyword{datasets}

This is version 0.4.3 of "blandr"
This is a FIRST SUBMISSION to CRAN - I have updated the package in response to 
comments by Uwe Ligges

## Changes in revised 0.4.3 in response to CRAN suggestions
Examples and more comments put into R files, so that roxygen2 can put into manual

## Changes in 0.4.2 in response to CRAN suggestions
(1) "Suggestion: Bland-Altman Method Comparison"

Title changed to: "Bland-Altman Method Comparison" as suggested

(2) Adn you could not simply contribute to another package that implements
the plot?

I started this as a group of functions for myself a long time ago for personal work, when there seemed to be no similar functions that would create the same work. As the code was already there I felt it would be good to share with the world.

The plotting functions are based on statistical functions already written, as the other packages didn't calculate the necessary summary statistics. I felt this would force complete re-writes of the already available packages, whereas this set of functions are already built to work together.

The package has the benefit that it concentrates on one thing: Bland-Altman method comparisons. Further it outputs ggplot code that can be customised by any user.

On top of this it means that I can maintain and improve on the code as needed, which I am to do.

(3) Is there some reference about the method you can add in the Description
field in the form Authors (year) <doi:.....>?

I have changed the description to so: "Carries out Bland Altman analyses (also known as a Tukey mean-difference plot) as described by JM Bland and DG Altman in 1986 (doi: 10.1016/S0140-6736(86)90837-8). This package was created in 2015 as existing Bland-Altman analysis functions did not calculate confidence intervals. This package was created to rectify this,  and create reproducible plots."

(4) write the DOI as <doi:10.1016/S0140-6736(86)90837-8>

=====

Changes in the DESCRIPTION file

## Test environments
* local OS X install, Mac OS X 10.12.5, R 3.4.0
* win-builder (devel and release) - via devtools::build_win()

## R CMD check results
using R version 3.4.0 (2017-04-21)
using platform: x86_64-apple-darwin15.6.0 (64-bit)
using session charset: UTF-8

There were no ERRORs or WARNINGs.

1 NOTE on win-builder: "Possibly mis-spelled words in DESCRIPTION". These words are not mis-spelled.

No errors from revdep

## Reverse dependencies

This is a new release, so there are no reverse dependencies.

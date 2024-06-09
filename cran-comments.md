## Changes to 0.5.1 for version 0.6
Massive apologies. I am re-submitting to CRAN after being de-listed. I will hold my hands up and say due to work I have left this to neglect.
It has come to my attention that it was delisted due to some automated tests failing: https://github.com/deepankardatta/blandr/issues/29 and
https://cran-archive.r-project.org/web/checks/2024/2024-05-10_check_results_blandr.html

Compounding this is that the re-directs to my email have obviously failed. I have the same email inbox, and my work keeps on generating new 
addresses to point to this. To fix this I have change my email to a "home" address. If you feel that this is unsafe please do let me know.

To address the issues in the check I have taken out of the DESCRIPTION file the imports for R6 as suggested. I have not done so for knitr and markdown as when running devtools::build() and devtools::check(), R notes that I need to declare knitr for the vignette builder.

I note the errors on "blandr.dataset.fibre()" that a file couldn't be loaded because it was "403 Forbidden". I can load this from my own
computer. The CRAN check page suggests that this dataset loads on linux and macos, but fails on Windows and development versions. I cannot explain this. I wonder if the issue is if that multiple builds of this have been tested, and have been trying to access the website, it has blocked it as a potential denial of service attack?

The main purpose of this submission is to get the blandr package back onto CRAN for developers who need it. Then I will work on more permanent fixes.

I have checked this builds on 2 MacOS computers. The devtools::check_win_devel() seems to return no errors.

Re-submit 2024-06-09

## Final submission to CRAN for 0.5.1
This is version 0.5.1 of "blandr"
This is a third version submission to CRAN

## Changes to 0.5.1
In response to web checks (https://cran.r-project.org/web/checks/check_results_blandr.html) which were only highlighted in Solaris and Linux versions of blandr when tested. Changed some functions to test the availability of ggplot2, and if not stops execution of the function. Further the auto report function checks for the existence of pandoc, and again stops if not found. In response to further comments, the blandr.output.report function has been overhauled to not use temporary files - instead of rmarkdown::render, it uses rmarkdown::run to display the report instead

## Changes in 0.5.0
Update libraries to have an autoreport function. The codebase also include code for a Jamovi module which can also be run in base R.

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

Changes in the DESCRIPTION file #2024 don't submit yet

## Test environments
* local OS X install, Mac OS Sonoma 14.4.1, R 4.4.0 (arm64)
* 2nd local OS X install, macOS Big Sur 11.7.10, R 4.3.2 (x86)
* win-builder (devel and release) - via devtools::check_win_devel()
* rhub::rc_submit() - using rhubv2 but none github method (plan to setup on next version)
** tested on first 4 platform ooptions: linux, macos, macos-arm64, windows

## R CMD check results
using R version 4.4.0 (2024-04-24)
using platform: aarch64-apple-darwin20
using session charset: UTF-8

R CMD check results
0 errors | 0 warnings | 1 note

This one note is as follows:
"Namespaces in Imports field not imported from:
    ‘knitr’ ‘markdown’
    All declared Imports should be used."
Not using these imports fails the vignette builder

* win-builder only generates one note, for a potential mis-spelled word
* rhub builder does not seem to generate any warnings

## Reverse dependencies

There are no reverse dependencies.

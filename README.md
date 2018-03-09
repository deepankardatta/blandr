
<!-- README.md is generated from README.Rmd. Please edit that file -->
blandr: a Bland-Altman Method Comparison package for R
======================================================

*blandr* carries out Bland Altman analyses (also known as a Tukey mean-difference plot) as described by JM Bland and DG Altman in 1986.

This package was started in 2015 as existing Bland-Altman R functions did not calculate confidence intervals. The *blandr* was created to fulfil this need.

*blandr* has been improved iteratively over time, and hopefully this library will be useful to researchers as an open-source and reproducible package.

The benefits
------------

-   Calculates confidence intervals
-   Outputs ggplot2 information to create extensible plots
-   Has a basic Jamovi module, to allow GUI analysis for those not comfortable with command line tools
-   Has a function to chart for proportional bias
-   If you get me through GitHub, I will do my best to maintain and improve this package

Citations
=========

You can find the citation information through the usual R citation commands:

``` r
citation("blandr")
#> 
#> To cite blandr in publications, please use:
#> 
#>   Datta, D. (2017). blandr: a Bland-Altman Method Comparison
#>   package for R. Zenodo. DOI:10.5281/zenodo.824514
#>   https://github.com/deepankardatta/blandr
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {blandr: a Bland-Altman Method Comparison package for R},
#>     author = {Deepankar Datta},
#>     doi = {10.5281/zenodo.824514},
#>     year = {2017},
#>     url = {https://github.com/deepankardatta/blandr},
#>   }
```

The DOI will refer to all versions of blandr. If you need to cite specific releases DOIs, the full versioning information can be found at Zenodo (<https://zenodo.org/record/824515>), with the full source code at the blandr GitHub page (<https://github.com/deepankardatta/blandr/>).

Installation
------------

blandr is available as a package from CRAN and can be installed with the following commands:

``` r
install.packages("blandr")
library(blandr)
```

You can install the blandr development version, hosted on github at <https://github.com/deepankardatta/blandr/>, with the following commands:

``` r
install.packages("devtools")
devtools::install_github("deepankardatta/blandr")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(blandr)
load(file="Data/bland.altman.PEFR.1986.rda")
blandr.display ( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst , sig.level=0.95 )
blandr.draw( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst )
```

The Jamovi module
-----------------
One of the benefits of the current version is that it includes a basic module for the Jamovi GUI statistical spreadsheet (<https://www.jamovi.org/>). I'm a believer in making this tool more accesible and Jamovi is a way to do this. The Jamovi module is still under development, and will be submitted to the Jamovi module repository soon. However until this is done, it can be installed using the following commands:

``` r
install.packages('jmvtools', repos=c('https://repo.jamovi.org', 'https://cran.r-project.org'))
library(jmvtools)
jmvtools::install()
```

Why the name?
-------------

Thinking of a unique name was difficult - and it wasn't worth spending/wasting time on this initially. Curiously it was going to be called BlandAltmanEdinburgh (as I was in Edinburgh at the time I made this) until I considerd uploading this to GitHub and CRAN.

Hadley Wickham has an excellent set of documentation on creating packages. The one on naming (<http://r-pkgs.had.co.nz/package.html>) is worth a read. Reflecting on it a lot of the naming issues are to prevent collisions with similarly named packages, so using *blandaltman* in the name might have cause problems. Mirroring the pre-existing *plyr* and *knitr* I thought I'd just add a "r" to "bland": yes it doesn't involve Altman's name, but I couldn't think of anything better.

If you can think of a better name please let me know!

Further information
-------------------

Further information can be found in the function help files in the package, as well as in the vignettes.

Future improvements
-------------------

Whilst this package is good enough for use, there is the scope for iterative improvements.

Future works include:

-   There are a further few deprecated functions to delete (I just need to finish a few projects first!!).
-   The package needs to have to go through some validation and testing
-   For further testing I need to write some *testhtat* modules
-   The function descriptions needs to be improved
-   Some of the roxygen2 documentation can be improved by calling the import parameters function
-   I want to add a few more sample data packs: including some of my own if possible
-   Development of a report generator
-   Development of the Jamovi module

Help wanted!
------------

Comments on the code, suggestions for improvement, verification tests, validation studies, and even code contributions would be gratefully accepted. Email me at <deepankardatta@nhs.net> and I'll try and get back to you as soon as possible. Please do bear in mind this is a side-project, and I can be otherwise busy with a lot of other work.

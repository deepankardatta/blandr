
<!-- README.md is generated from README.Rmd. Please edit that file -->

# blandr: a Bland-Altman Method Comparison package for R

*blandr* carries out Bland Altman analyses (also known as a Tukey
mean-difference plot) as described by JM Bland and DG Altman in 1986.
This package was started in 2015 as existing Bland-Altman R functions
did not calculate confidence intervals. *blandr* has been improved
iteratively over time, and hopefully will be useful as an open-source
library for reproducible science.

## The benefits

- Calculates and plots confidence intervals
- Outputs ggplot2 information to create extensible plots
- Associated Jamovi module, allowing researchers and users uncomfortable
  with command line tools to use a graphical user interface
- Shiny/rmarkdown-based automatic report generating function
- Developing functions to chart for proportional bias
- Open source and on GitHub - anyone can contribute and extend the
  library

# Citations

You can find the citation information through the usual R citation
commands:

``` r
citation("blandr")
```

The DOI will refer to all versions of blandr. If you need to cite
specific releases DOIs, the full versioning information can be found at
Zenodo (<https://zenodo.org/record/824514>), with the full source code
at the blandr GitHub page (<https://github.com/deepankardatta/blandr/>).

## Installation

blandr is available as a package from CRAN and can be installed with the
following commands:

``` r
install.packages("blandr")
library(blandr)
```

You can install the blandr development version, hosted on github at
<https://github.com/deepankardatta/blandr/>, with the following
commands:

``` r
install.packages("devtools")
devtools::install_github("deepankardatta/blandr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(blandr)
load(file="Data/bland.altman.PEFR.1986.rda")
blandr.display ( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst , sig.level=0.95 )
blandr.draw( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst )
```

## The Jamovi module

One of the benefits of *blandr* is that the library has been developed
so a module can be generated for the Jamovi GUI statistical spreadsheet
(<https://www.jamovi.org/>). I’m a believer in making this tool more
accesible and Jamovi is a way to do this. The Jamovi module will also be
iteratively developed - the code for each Jamovi version is linked to
the CRAN version on GitHub. The module will be on the Jamovi library.

If you want to use the development versions of *blandr*, you can install
Jamovi from the comman line using the following commands:

``` r
install.packages('jmvtools', repos=c('https://repo.jamovi.org', 'https://cran.r-project.org'))
library(jmvtools)
jmvtools::install()
```

You can then download the *blandr* GitHub development branch and install
it to Jamovi from the command line.

## Why the odd name?

Thinking of a unique name was difficult - if you look through the
history of the sources the package had a very cumbersome name. This had
to change when uploading to CRAN as it seemed to be frowned upon.

Hadley Wickham has an excellent set of documentation on creating
packages. The one on naming (<http://r-pkgs.had.co.nz/package.html>) is
worth a read. Reflecting on it a lot of the naming issues are to prevent
collisions with similarly named packages, so using *blandaltman* in the
name might have cause problems. Mirroring the pre-existing *plyr* and
*knitr* I thought I’d just add a “r” to “bland”: yes it doesn’t involve
Altman’s name, but I couldn’t think of anything better.

If you can think of a better name please let me know!

## Further information

Further information can be found in the function help files in the
package, as well as in the vignettes.

## System Requirements

The library is quite small, and mostly depends on the ggplot2 library.
However the report functions do require rmarkdown, knitr, and most
importantly pandoc - the function should check this is available and
stop gracefully if not. Further the Jamovi based functions need the
Jamovi library to work.

## Future improvements

Whilst this package is good enough for use, there is the scope for
iterative improvements.

Future works include:

- There are a further few deprecated functions to delete (I just need to
  finish a few projects first!!).
- The package needs to have to go through some validation and testing
- For further testing I need to write some *testhtat* modules
- The function descriptions needs to be improved
- Some of the roxygen2 documentation can be improved by calling the
  import parameters function
- I want to add a few more sample data packs: including some of my own
  if possible
- Development of a report generator
- Further development of the Jamovi module

## Help wanted!

Comments on the code, suggestions for improvement, verification tests,
validation studies, and even code contributions would be gratefully
accepted. Email me at deepankar(dot)datta(at)gmail.com and I’ll try and
get back to you as soon as possible. Please do bear in mind this is a
side-project, and I can be otherwise busy with a lot of other work.

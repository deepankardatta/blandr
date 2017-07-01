# blandr: a Bland-Altman package for R

*blandr* is a package to carry out Bland Altman analyses (also known as a Tukey mean-difference plot) in R. This package was started in 2015 as existing Bland-Altman R functions did not calculate confidence intervals: my belief is that when drawing Bland-Altman plots, confidence intervals should be considered the gold-standard. *blandr* fills this need!

*blandr* further generates plotting data to allow easy generation of charts using ggplot, as well as R's in-built drawing capabilities.

## Why release a version <1.0?

I am believer that if the function is good enough to work, I should just publish, see if others can improve it and just iterate slowly to get to a version 1.0. What counts as a 1.0? Well I'd like other people to help validate it, and add a few more functions, to a point there should not be much more to add to this.

From what I've read this is what's called a "Minimum Viable Product" (https://en.wikipedia.org/wiki/Minimum_viable_product).

## Why the name?

Thinking of a unique name was difficult - and it wasn't worth spending/wasting time on this initially. Curiously it was going to be called BlandAltmanEdinburgh (as I was in Edinburgh at the time I made this) until I considerd uploading this to GitHub and CRAN.

Hadley Wickham has an excellent set of documentation on creating packages. The one on naming (http://r-pkgs.had.co.nz/package.html) is worth a read. Reflecting on it a lot of the naming issues are to prevent collisions with similarly named packages, so using *blandaltman* in the name might have cause problems. Mirroring the pre-existing *plyr* and *knitr* I thought I'd just add a "r" to "bland": yes it doesn't involve Altman's name, but I couldn't think of anything better.

If you can think of a better name please let me know!

## Further information

Further information can be found in the function help files in the package, as well as in the vignettes.

## Future improvements

I need to take out the last references to *BlandAltmanEdinburgh* and change it to *blandr*. There are a further few deprecated functions to delete (I just need to finish a few projects first!!). The package needs to have to go through some validation and testing, and I need to write some *testhtat* modules. There will be a lot of iterative improvements to come.

## Version history

* 2015 - first preliminary coding
* 2015-11-14 - first proper R packaged version
* 2016-02-04 - updated for a few stuides
* 2017-06-30 - finally got round to updating it to use ggplot2, and updating to version 0.4
* 2017-07-01 - first version uploaded to GitHub

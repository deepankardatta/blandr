## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----gh-installation, eval = FALSE--------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("deepankardatta/blandr")

## -----------------------------------------------------------------------------
library(blandr)
library(ggplot2)

## -----------------------------------------------------------------------------
blandr.statistics ( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst , sig.level=0.95 )

## -----------------------------------------------------------------------------
stats.data <- blandr.statistics ( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst , sig.level=0.95 )
summary(stats.data)
stats.data

## -----------------------------------------------------------------------------
stats.data[1]
stats.data[2]
stats.data[5]
stats.data[6]

## -----------------------------------------------------------------------------
blandr.output.text ( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst , sig.level=0.95 )

## ----fig.width=6, fig.height=5------------------------------------------------
blandr.draw( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst )

## ----fig.width=6, fig.height=5------------------------------------------------
blandr.draw( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst , ciDisplay = FALSE , ciShading = FALSE )

## ----fig.width=6, fig.height=5------------------------------------------------
vignette.chart <- blandr.draw( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst )
vignette.chart
vignette.chart <- vignette.chart + geom_vline( xintercept = 300 , linetype = 4 , col=6 )
vignette.chart
vignette.chart <- vignette.chart + annotate("text", x=400, y=40 , label= "An example of why ggplot2 is a better choice for charting")
vignette.chart

## ----fig.width=6, fig.height=5------------------------------------------------
wright.stats <- blandr.statistics( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst )
wright.plot <- blandr.plot.limits (wright.stats )
plot( x=wright.stats$means , y=wright.stats$differences )

## ----fig.width=6, fig.height=5------------------------------------------------
blandr.draw( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst , ciDisplay = FALSE )

## ----fig.width=6, fig.height=5------------------------------------------------
vignette.chart <- blandr.draw( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst , ciDisplay = FALSE )
vignette.chart

## ----fig.width=6, fig.height=5------------------------------------------------
wright.stats <- blandr.statistics( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst )
wright.plot <- blandr.plot.limits (wright.stats )
vignette.chart.2 <- vignette.chart + ggplot2::coord_cartesian( xlim=c( wright.plot$x_lower , wright.plot$x_upper ) , ylim=c( wright.plot$y_lower , wright.plot$y_upper ) )
vignette.chart.2

## ----fig.width=6, fig.height=5------------------------------------------------
vignette.chart.3 <- vignette.chart + ggplot2::coord_cartesian( xlim=c( 0 , wright.plot$x_upper ) , ylim=c( wright.plot$y_lower , wright.plot$y_upper ) , expand = FALSE )
vignette.chart.3

## ----fig.width=6, fig.height=5------------------------------------------------
blandr.draw( bland.altman.PEFR.1986$WrightFirst , bland.altman.PEFR.1986$MiniWrightFirst , plotter="rplot" )


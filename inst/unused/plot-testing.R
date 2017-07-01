library(blandr)

### THIS IS A TESTING FUNCTION - NOT FOR INCLUSION INTO FINAL PACKAGE

wright.stats <- blandr.statistics( WrightFirst , MiniWrightFirst )
wright.plot <- blandr.plot.limits (wright.stats )

### NOTE MANUALLY PASSING THROUGH TO blandr.ggplot FUNCTION

# ggplot save testing
baplot.test <- blandr.draw( WrightFirst , MiniWrightFirst , plotter="ggplot" )
summary(baplot.test)
baplot.test
baplot.test2 <- baplot.test + ggplot2::coord_cartesian( xlim=c( wright.plot$x_lower , wright.plot$x_upper ) , ylim=c( wright.plot$y_lower , wright.plot$y_upper ) )
baplot.test2
baplot.test3 <- baplot.test + ggplot2::coord_cartesian( xlim=c( 0 , wright.plot$x_upper ) , ylim=c( wright.plot$y_lower , wright.plot$y_upper ) , expand = FALSE )
baplot.test3

# PLOT TESTING
blandr.draw( WrightFirst , MiniWrightFirst , plotter="rplot" )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="odd statement" )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="ggplot" )
# blandr.ggplot(wright.stats,wright.plot)

# ciDisplay TESTING
blandr.draw( WrightFirst , MiniWrightFirst , plotter="rplot" , ciDisplay = FALSE )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="rplot" , ciDisplay = TRUE )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="odd statement" , ciDisplay = TRUE )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="ggplot" , ciDisplay = FALSE )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="ggplot" , ciDisplay = TRUE )
# blandr.ggplot(wright.stats , wright.plot , ciDisplay = FALSE )
# blandr.ggplot(wright.stats , wright.plot , ciDisplay = TRUE )

# ciShading TESTING
blandr.draw( WrightFirst , MiniWrightFirst , plotter="rplot" , ciShading = FALSE )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="rplot" , ciShading = TRUE )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="ggplot" , ciShading = FALSE )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="ggplot" , ciShading = TRUE )
# blandr.ggplot(wright.stats , wright.plot , ciShading = FALSE )
# blandr.ggplot(wright.stats , wright.plot , ciShading = TRUE )

# ciDisplay negative, ciShading TESTING - ciShading shouldn't display if ciDisplay is negative
blandr.draw( WrightFirst , MiniWrightFirst , plotter="rplot" , ciDisplay = FALSE , ciShading = FALSE )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="rplot" , ciDisplay = FALSE , ciShading = TRUE )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="ggplot" , ciDisplay = FALSE , ciShading = FALSE )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="ggplot" , ciDisplay = FALSE , ciShading = TRUE )
# blandr.ggplot(wright.stats , wright.plot , ciDisplay = FALSE , ciShading = FALSE )
# blandr.ggplot(wright.stats , wright.plot , ciDisplay = FALSE , ciShading = TRUE  )



# Normal line testing
# with rplot
blandr.draw( WrightFirst , MiniWrightFirst , plotter="rplot" , normalHigh=500 )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="rplot" , normalLow=300 )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="rplot" , normalLow=300 , normalHigh=500 )
# with ggplot
blandr.draw( WrightFirst , MiniWrightFirst , plotter="ggplot" , normalHigh=500 )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="ggplot" , normalLow=300 )
blandr.draw( WrightFirst , MiniWrightFirst , plotter="ggplot" , normalLow=300 , normalHigh=500 )
# Direct to ggplot
# blandr.ggplot( wright.stats , wright.plot, normalHigh=500 )
# blandr.ggplot( wright.stats , wright.plot, normalLow=300 )
# blandr.ggplot( wright.stats , wright.plot, normalLow=300 , normalHigh=500 )




# FULL FUNCTION TESTING
# blandr.draw( WrightFirst , MiniWrightFirst , plotter="rplot" , method1 , method2 , method1name="Method 1" , method2name="Method 2" , plotTitle="Bland-Altman plot for comparison of 2 methods" , sig.level=0.95 , annotate=FALSE , ciDisplay=TRUE , ciShading=TRUE , normalLow=FALSE , normalHigh=FALSE , lowest_y_axis=FALSE , highest_y_axis=FALSE )
# blandr.ggplot( wright.stats , wright.plot )


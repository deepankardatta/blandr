library(blandr)

### THIS IS A TESTING FUNCTION - NOT FOR INCLUSION INTO FINAL PACKAGE

giavarina.stats <- blandr.statistics( giavarina$Method.A , giavarina$Method.B )
giavarina.plot <- blandr.plot.limits (wright.stats )

blandr.method.comparison( giavarina$Method.B , giavarina$Method.A )

baplot.test <- blandr.draw( giavarina$Method.A , giavarina$Method.B , plotter="ggplot" )
baplot.test
baplot.test4 <- baplot.test + geom_smooth(method='lm',formula=y~x)
baplot.test4


rm(testplot)
testplot <- blandr.proportional.bias( WrightFirst , MiniWrightFirst )
testplot
testplot + blandrgeom_smooth(method='lm',formula=y~x)
testplot
testplot + blandrgeom_text(x = 25, y = 300, label = lm_eqn(df), parse = TRUE)
testplot


blandr.proportional.bias( WrightFirst , MiniWrightFirst )
blandr.proportional.bias( giavarina$Method.A , giavarina$Method.B )
blandr.proportional.bias( WrightFirst , MiniWrightFirst , ciShading = FALSE )
blandr.proportional.bias( giavarina$Method.A , giavarina$Method.B , ciShading = FALSE )
blandr.proportional.bias( WrightFirst , MiniWrightFirst , ciDisplay = FALSE )
blandr.proportional.bias( giavarina$Method.A , giavarina$Method.B , ciDisplay = FALSE )





library(BlandAltmanEdinburgh)
wright.stats <- blandr.statistics( giavarina$Method.A , giavarina$Method.B )
wright.plot <- blandr.plot.limits( wright.stats )
blandr.proportional.bias( giavarina$Method.A , giavarina$Method.B )

m <- lm( giavarina$Method.B ~ giavarina$Method.A )
a <- signif(coef(m)[1], digits = 2)
b <- signif(coef(m)[2], digits = 2)
textlab <- paste("y = ",b,"x + ",a, sep="")
print(textlab)


baplot.test <- blandr.draw( giavarina$Method.A , giavarina$Method.B )
baplot.test
baplot.test4 <- baplot.test + geom_smooth(method='lm',formula=y~x)
baplot.test4




blandr.method.comparison( giavarina$Method.B , giavarina$Method.A )
blandr.draw( giavarina$Method.A , giavarina$Method.B )
blandr.proportional.bias( giavarina$Method.A , giavarina$Method.B )

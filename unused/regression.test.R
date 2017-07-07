statistics.results <- blandr.statistics( giavarina$Method.A , giavarina$Method.B )

# Passed data to the blandr.plot.limits function to
plot.limits <- blandr.plot.limits( statistics.results )

# Pass data to the blandr.ggplot function to use ggplot2 graphics system
ba.plot <- blandr.ggplot( statistics.results , plot.limits )
ba.plot <- ba.plot + ggplot2::geom_smooth(method='lm',formula=y~x)
ba.plot

# Prints out the regression equation
m <- lm( statistics.results$differences ~ statistics.results$means )
a <- signif(coef(m)[1], digits = 2)
b <- signif(coef(m)[2], digits = 2)
textlab <- paste("y = ",b,"x + ",a, sep="")
print(textlab)

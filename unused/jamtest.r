lavas.raw <- read.csv("unused/lavas.csv")
lavas.frame <- data.frame(lavas.raw)

# works
jamoviBAanalysis( data=lavas.frame , method1="VBG.lactate" , method2="ABG.lactate" , marginalHist = FALSE )

# errors
jamoviBAanalysis( data=lavas.frame , method1="VBG.lactate" , method2="ABG.lactate" , marginalHist = TRUE )

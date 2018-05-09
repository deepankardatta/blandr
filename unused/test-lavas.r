library(readxl)
library(blandr)
LAVASdata <- read_excel("unused/LAVAS.xlsx", sheet = "Sheet2")
ls(LAVASdata)
summary(LAVASdata)
blandr.draw( LAVASdata$VBG.LAC,LAVASdata$ABG.LAC,"Venous","Arterial", plotTitle="Bland-Altman plot: A-LACT vs PV-LACT", annotate=TRUE, ciShading=TRUE )

blandr.draw( LAVASdata$VBG.LAC,LAVASdata$ABG.LAC,"Venous","Arterial", plotTitle="Bland-Altman plot: A-LACT vs PV-LACT", annotate=TRUE, ciShading=TRUE , overlapping = TRUE )

test <- blandr.statistics(LAVASdata$VBG.LAC,LAVASdata$ABG.LAC)

blandr.output.report( LAVASdata$VBG.LAC , LAVASdata$ABG.LAC )
blandr.output.report( LAVASdata$LAB.LAC , LAVASdata$ABG.LAC )


method1 <- as.double(LAVASdata$ABG.LAC)
method2 <- as.double(LAVASdata$VBG.LAC)

rmarkdown::run( file = "inst/blandr_report_template.Rmd" , render_args = list( runtime = "shiny" , params = list( method1 = method1 , method2 = method2 ) ) )


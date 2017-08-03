library(readxl)
library(blandr)
LAVASdata <- read_excel("unused/LAVAS.xlsx", sheet = "Sheet2")
ls(LAVASdata)
summary(LAVASdata)
blandr.draw( LAVASdata$VBG.LAC,LAVASdata$ABG.LAC,"Venous","Arterial", plotTitle="Bland-Altman plot: A-LACT vs PV-LACT", annotate=TRUE, ciShading=TRUE )

blandr.draw( LAVASdata$VBG.LAC,LAVASdata$ABG.LAC,"Venous","Arterial", plotTitle="Bland-Altman plot: A-LACT vs PV-LACT", annotate=TRUE, ciShading=TRUE , overlapping = TRUE )

test <- blandr.statistics(LAVASdata$VBG.LAC,LAVASdata$ABG.LAC)

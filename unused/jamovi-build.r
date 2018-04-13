# Gets the newest version
# install.packages('jmvtools', repos=c('https://repo.jamovi.org', 'https://cran.r-project.org'))
library(jmvtools)

# Checks if can find current version
jmvtools::check()

# Installs
devtools::document()
devtools::document()
devtools::build()
jmvtools::install()

# Adds another analysis
# jmvtools::addAnalysis(name='ttest', title='Independent Samples T-Test')

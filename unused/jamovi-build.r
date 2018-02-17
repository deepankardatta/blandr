# Gets the newest version
install.packages('jmvtools', repos=c('https://repo.jamovi.org', 'https://cran.r-project.org'))

# Checks if can find current version
jmvtools::check()

# Installs
devtools::document()
jmvtools::install()

# Adds another analysis
# jmvtools::addAnalysis(name='ttest', title='Independent Samples T-Test')

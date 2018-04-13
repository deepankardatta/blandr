
# This file is a generated template, your changes will not be overwritten

jamoviBAstatsClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "jamoviBAstatsClass",
    inherit = jamoviBAstatsBase,
    private = list(
        .run = function() {

          if ( !is.null(self$options$method1) && !is.null(self$options$method2) ) {

          # read the option values into shorter variable names
          method1 <- self$options$method1
          method2 <- self$options$method2

          # get the data
          data <- self$data

          # convert to appropriate type
          data[[method1]] <- jmvcore::toNumeric(data[[method1]])
          data[[method2]] <- jmvcore::toNumeric(data[[method2]])

          # calculate the results
          results <- blandr.statistics( data[[method1]] , data[[method2]] )

          # convert the results into output
          # print for R terminal output
          print(results)
          # following for Jamovi output
          self$results$text$setContent(results)

        } # close if function for calculations

        })
)

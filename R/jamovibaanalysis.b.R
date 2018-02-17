
# This file is a generated template, your changes will not be overwritten

jamoviBAanalysisClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "jamoviBAanalysisClass",
    inherit = jamoviBAanalysisBase,
    private = list(
        .run = function() {

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

          # create a nice table
          table <- self$results$table
          table$setRow(rowNo=1, values=list(
            observations = results$no.of.observations ,
            bias         = results$bias ,
            upperLOA     = results$upperLOA ,
            lowerLOA     = results$lowerLOA
          ))

          # standard Jamovi method to pass prepared data over for plotting
          image <- self$results$plot
          image$setState(results)


        },
        .plot=function(image, ...) {  # <-- the plot function
          plotData <- image$state
          plot <-  blandr.ggplot( plotData ,
                                  ciDisplay = self$options$ciDisplay,
                                  ciShading = self$options$ciShading )
          print(plot)
          TRUE

        })
)

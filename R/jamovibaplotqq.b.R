
jamoviBAplotQQClass <- if (requireNamespace('jmvcore')) R6::R6Class(
  "jamoviBAplotQQClass",
  inherit = jamoviBAplotQQBase,
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

        # standard Jamovi method to pass prepared data over for plotting
        image <- self$results$plot
        image$setState(results)

      } # close if function for calculations

    },

    .plot=function(image, ggtheme, ...) {

      if ( !is.null(self$options$method1) && !is.null(self$options$method2) ) {

        plotData <- image$state
        plot <- blandr.plot.qq( plotData )
        plot <- plot + ggtheme
        print(plot)
        TRUE

      } # close if function for plot

    })
)


jamoviBAanalysisClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "jamoviBAanalysisClass",
    inherit = jamoviBAanalysisBase,
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

          # create a nice table
          table <- self$results$table
          table$setRow( rowNo=1 , values=list(
            table_row_names = paste( "Bias ( n = " , results$no.of.observations , ")" ) ,
            estimate        = results$bias ,
            UpperCI         = results$biasUpperCI ,
            LowerCI         = results$biasLowerCI
          ))
          table$setRow( rowNo=2, values=list(
            table_row_names = "Lower limit of agreement" ,
            estimate        = results$lowerLOA ,
            UpperCI         = results$lowerLOA_upperCI ,
            LowerCI         = results$lowerLOA_lowerCI
          ))
          table$setRow( rowNo=3 , values=list(
            table_row_names = "Upper limit of agreement" ,
            estimate        = results$upperLOA ,
            UpperCI         = results$upperLOA_upperCI ,
            LowerCI         = results$upperLOA_lowerCI
          ))


          # observations = results$no.of.observations

          # standard Jamovi method to pass prepared data over for plotting
          image <- self$results$plot
          image$setState(results)

          } # close if function for calculations

        },

        .plot=function(image, ggtheme, ...) {

          if ( !is.null(self$options$method1) && !is.null(self$options$method2) ) {

            # Attempt to introduce a way to customise the plot
            # if ( self$options$titleOfPlot == "" ) {
            # titleOfPlot <- "Bland-Altman Plot"
            #}
            #else { titleOfPlot <- self$options$titleOfPlot }

          plotData <- image$state
          plot <-  blandr.plot.ggplot( statistics.results = plotData ,
                                  plotTitle = "Bland-Altman plot" ,
                                  ciDisplay = self$options$ciDisplay ,
                                  ciShading = self$options$ciShading ,
                                  plotProportionalBias = self$options$plotProportionalBias ,
                                  plotProportionalBias.se = self$options$plotProportionalBias.se ,
                                  overlapping = self$options$overlapping )
          plot <- plot + ggtheme
          print(plot)
          TRUE

        } # close if function for plot

        })
)

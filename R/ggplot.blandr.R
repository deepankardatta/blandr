#' @title ggplot method for \code{blandr} objects
#'
#' @description Plot a Bland-Altman chart from the results of \code{blandr} objects
#' using ggplot2 drawing functions
#'
#' @param x a blandr class object, the results from \code{blandr.statistics}.
#' @param ... other arguments.
#'
#' @include ggplot2
#'
#' @examples
#'
#' results = blandr.statistics( Method.B ~ Method.A , data = giavarina.2015 )
#' results
#' ggplot(results)
#'
#' @export

ggplot.blandr = function( x ,
                        method1name = "Method 1" ,
                        method2name = "Method 2" ,
                        plotTitle = "Bland-Altman plot for comparison of 2 methods",
                        sig.level = 0.95,
                        LoA.mode = 1,
                        annotate = FALSE,
                        ciDisplay = TRUE,
                        ciShading = TRUE,
                        normalLow = FALSE,
                        normalHigh = FALSE,
                        lowest_y_axis = FALSE,
                        highest_y_axis = FALSE,
                        point_size = 0.8,
                        overlapping = FALSE ,
                        plotter = "ggplot" ,
                        x.plot.mode = "means" ,
                        y.plot.mode = "difference" ,
                        plotProportionalBias = FALSE ,
                        plotProportionalBias.se = TRUE ,
                        assume.differences.are.normal = TRUE ,
                        ...){

  # Does a check if ggplot2 is available
  # It should be as it is in the imports section but in CRAN checks some systems don't have it!
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Package \"ggplot2\" needed for this function to work. Please install it.",
         call. = FALSE)
  }

  # Originally the library assumed the output of the Bland-Altman calculations was in
  # statistics.results. In moving to a S3 "blandr" object, we pass the object a x
  # However this makes the readibility suffer as I sometimes have to work out if x
  # means the x axis, or the data that was passed over. So I've just made sure it is
  # referred to as statistics.results for my sanity
  statistics.results <- x

  # Selects if x-axis uses means (traditional) or selects one of the methods
  # as the gold standard (non-traditional BA)
  # See Krouwer JS (2008) Why Bland-Altman plots should use X, not (Y+X)/2 when X is a reference method. Statistics in Medicine 27:778-780
  # NOT ENABLED YET
  x.axis <- statistics.results$means

  # Selects if uses differences (traditional) or proportions (non-traditional BA)
  if( y.plot.mode == "proportion" ) {
    y.axis <- statistics.results$proportion
  } else {
    y.axis <- statistics.results$differences
  }

  # Constructs the plot.data dataframe
  plot.data <- data.frame( x.axis , y.axis )

  # Rename to allow plotting
  # This was a hangover from an older version so I'm not sure we need it anymore
  # But not really a priority to check and remove now
  colnames(plot.data)[1] <- "x.axis"
  colnames(plot.data)[2] <- "y.axis"

  # Plot using ggplot
  ba.plot <- ggplot( plot.data , aes( x = plot.data$x.axis , y = plot.data$y.axis ) ) +
    geom_point() +
    theme(plot.title = element_text(hjust = 0.5)) +
    geom_hline( yintercept = 0 , linetype = 1 ) + # "0" line
    geom_hline( yintercept = statistics.results$bias , linetype = 2 ) + # Bias
    geom_hline( yintercept = statistics.results$bias + ( statistics.results$biasStdDev * statistics.results$sig.level.convert.to.z ) , linetype = 2 ) + # Upper limit of agreement
    geom_hline( yintercept = statistics.results$bias - ( statistics.results$biasStdDev * statistics.results$sig.level.convert.to.z ) , linetype = 2 ) + # Lower limit of agreement
    ggtitle( plotTitle ) +
    xlab( "Means" )

  # Re-titles the y-axis dependent on which plot option was used
  if ( y.plot.mode == "proportion" ) {
    ba.plot <- ba.plot + ylab( "Difference / Average %" )
  } else {
    ba.plot <- ba.plot + ylab( "Differences" )
  }

  # Drawing confidence intervals (OPTIONAL)
  if( ciDisplay == TRUE ) {
    ba.plot <- ba.plot +
      geom_hline( yintercept = statistics.results$biasUpperCI , linetype = 3 ) + # Bias - upper confidence interval
      geom_hline( yintercept = statistics.results$biasLowerCI , linetype = 3 ) + # Bias - lower confidence interval
      geom_hline( yintercept = statistics.results$upperLOA_upperCI , linetype = 3 ) + # Upper limit of agreement - upper confidence interval
      geom_hline( yintercept = statistics.results$upperLOA_lowerCI , linetype = 3 ) + # Upper limit of agreement - lower confidence interval
      geom_hline( yintercept = statistics.results$lowerLOA_upperCI , linetype = 3 ) + # Lower limit of agreement - upper confidence interval
      geom_hline( yintercept = statistics.results$lowerLOA_lowerCI , linetype = 3 ) # Lower limit of agreement - lower confidence interval

    # Shading areas for 95% confidence intervals (OPTIONAL)
    # This needs to be nested into the ciDisplay check
    if( ciShading == TRUE ) {
      ba.plot <- ba.plot +
        annotate( "rect", xmin = -Inf , xmax = Inf , ymin = statistics.results$biasLowerCI , ymax = statistics.results$biasUpperCI , fill="blue" , alpha=0.3 ) + # Bias confidence interval shading
        annotate( "rect", xmin = -Inf , xmax = Inf , ymin = statistics.results$upperLOA_lowerCI , ymax = statistics.results$upperLOA_upperCI , fill="green" , alpha=0.3 ) + # Upper limits of agreement confidence interval shading
        annotate( "rect", xmin = -Inf , xmax = Inf , ymin = statistics.results$lowerLOA_lowerCI , ymax = statistics.results$lowerLOA_upperCI , fill="red" , alpha=0.3 ) # Lower limits of agreement confidence interval shading
    }

  }
  ### Function has finished drawing of confidence intervals at this line

  # If a normalLow value has been sent, plots this line
  if( normalLow != FALSE ) {
    # Check validity of normalLow value to plot line
    if( is.numeric(normalLow) == TRUE ) {
      ba.plot <- ba.plot + geom_vline( xintercept = normalLow , linetype = 4 , col=6 )
    }
  }

  # If a normalHighvalue has been sent, plots this line
  if( normalHigh != FALSE ) {
    # Check validity of normalHigh value to plot line
    if( is.numeric(normalHigh) == TRUE ) {
      ba.plot <- ba.plot + geom_vline( xintercept = normalHigh , linetype = 4 , col=6 )
    }
  }

  # If overlapping=TRUE uses geom_count
  # See the param description at the top
  if( overlapping == TRUE ) {
    ba.plot <- ba.plot + geom_count()
  }

  # If plotProportionalBias switch is TRUE, plots a proportional bias line as well
  if( plotProportionalBias == TRUE ) {

    # Check for validity of options passed to the plotProportionalBias.se switch
    # As if we throw an invalid option to ggplot it will just stop with an error
    if( plotProportionalBias.se !=TRUE && plotProportionalBias.se != FALSE) {
      plotProportionalBias.se <- TRUE
    }

    # Plots line
    ba.plot <- ba.plot + ggplot2::geom_smooth( method = 'lm' , se = plotProportionalBias.se )
  } # End of drawing proportional bias line

  # Draws marginal histograms if option selected
  # Idea from http://labrtorian.com/tag/bland-altman/
  # REMOVED AS INTRODUCED SOME INCOMPATIBILITIES DEPENDENT ON USERS R VERSION
  # ALSO MASSIVELY INCREASED PACKAGE SIZE
  # if( marginalHistogram == TRUE ) { ba.plot <- ggMarginal( ba.plot , type="histogram" ) }

  # Return the ggplot2 output
  return(ba.plot)

  #END OF FUNCTION

}

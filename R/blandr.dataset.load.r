#' @title Function to load example data sets
#'
#' @description Loads example data sets from the internet.
#'
#' @note Dataset 1 ("1","PEFR","pefr") - Bland Altman PEFR dataset (from \code{blandr.dataset.pefr})
#' @note Dataset 2 ("2","o2sats","sealey") - Selaey oxygen saturations dataset (from \code{blandr.dataset.o2sats})
#' @note Dataset 3 ("3","fibre","darbela") - D'arbela mean velocity of circumferential fibre shortening dataset (from \code{blandr.dataset.fibre})
#' @note Dataset 4 ("4","sbp","close") - Close systolic blood pressure dataset (from \code{blandr.dataset.sbp})
#'
#' @author Deepankar Datta <deepankar.datta@gmail.com>
#'
#' @param dataset.name Loads the requisite data set. See the description for further details.
#'
#' @return example.dataset A data frame containing the requisite dataset
#'
#' @include blandr.dataset.pefr.r
#' @include blandr.dataset.o2sats.r
#' @include blandr.dataset.fibre.r
#' @include blandr.dataset.sbp.r
#'
#' @examples
#' blandr.dataset.load( "pefr" )
#' pefr.data <- blandr.dataset.load( "pefr" )
#'
#' @export

blandr.dataset.load <- function( dataset.name ) {

  # Dependent on the dataset.name parameter, loads the correct data set
  # PEFR
  if( dataset.name=="pefr" ) { example.dataset <- blandr.dataset.pefr() }
  if( dataset.name=="PEFR" ) { example.dataset <- blandr.dataset.pefr() }
  if( dataset.name=="1" ) { example.dataset <- blandr.dataset.pefr() }
  # Oxygen saturations
  if( dataset.name=="o2sats" ) { example.dataset <- blandr.dataset.o2sats() }
  if( dataset.name=="sealey" ) { example.dataset <- blandr.dataset.o2sats() }
  if( dataset.name=="2" ) { example.dataset <- blandr.dataset.o2sats() }
  # Fibre velocity
  if( dataset.name=="fibre" ) { example.dataset <- blandr.dataset.fibre() }
  if( dataset.name=="darbela" ) { example.dataset <- blandr.dataset.fibre() }
  if( dataset.name=="3" ) { example.dataset <- blandr.dataset.fibre() }
  # Systolic blood pressure
  if( dataset.name=="sbp" ) { example.dataset <- blandr.dataset.sbp() }
  if( dataset.name=="close" ) { example.dataset <- blandr.dataset.sbp() }
  if( dataset.name=="4" ) { example.dataset <- blandr.dataset.sbp() }

  # STOP condition if no valid dataset name
  # Works this out by seeing if the example.dataset variable has been created
  if( !exists("example.dataset") )
    stop("A valid dataset needs to be specified")

  # Returns the data
  return(example.dataset)

}

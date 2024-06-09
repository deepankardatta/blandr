#' @title Function to load D'arbela mean velocity of circumferential fibre shortening dataset from internet
#'
#' @description Loads the D'arbela mean velocity of circumferential fibre shortening dataset from Martin Bland's website.
#'
#' @author Deepankar Datta <deepankar.datta@gmail.com>
#'
#' @note The function converts the STATA DCT data format into a data frame that R can process.
#'
#' @return converted.from.dct A data frame containing the dataset
#'
#' @references https://www-users.york.ac.uk/~mb55/datasets/pefr.dct - The D'arbela mean velocity of circumferential fibre shortening dataset from Martin Bland's website
#' @references https://www-users.york.ac.uk/~mb55/datasets/datasets.htm - Martin Bland's example data-set webpage
#' @references Bland JM, Altman DG. (1986) Statistical methods for assessing agreement between two methods of clinical measurement. Lancet i, 307-310.
#'
#' @import stringr
#'
#' @examples
#' blandr.dataset.fibre()
#' pefr.data <- blandr.dataset.fibre()
#'
#' @export

blandr.dataset.fibre <- function() {

  # The internet dataset is in a plain-text ASCII format.
  # The dataset is in STATA DCT format.
  # The function can be then customised for each DCT file on Martin Bland's website.

  # Read data
  data.from.internet = readLines("https://www-users.york.ac.uk/~mb55/datasets/darbela.dct")

  # Create new data frame
  converted.from.dct <- data.frame()

  # Loop to read data
  for(i in 6:105) {
    x <- str_extract_all(data.from.internet[i],"\\(?[0-9,.]+\\)?")[[1]]
    y <- as.numeric(gsub(",","",x))
    converted.from.dct <- rbind( converted.from.dct , y )
  }

  # Label column names from dictionary
  colnames(converted.from.dct) <- c(data.from.internet[2:4])

  # Returns the data
  return(converted.from.dct)

}


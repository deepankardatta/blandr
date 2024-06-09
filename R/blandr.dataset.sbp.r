#' @title Function to load Close systolic blood pressure dataset from internet
#'
#' @description Loads the Close systolic blood pressure dataset from Martin Bland's website.
#'
#' @author Deepankar Datta <deepankar.datta@gmail.com>
#'
#' @note The function converts the STATA DCT data format into a data frame that R can process.
#'
#' @return converted.from.dct A data frame containing the dataset
#'
#' @references https://www-users.york.ac.uk/~mb55/datasets/pefr.dct - The Close systolic blood pressure dataset from Martin Bland's website
#' @references https://www-users.york.ac.uk/~mb55/datasets/datasets.htm - Martin Bland's example data-set webpage
#' @references Bland JM, Altman DG. (1995) Comparing methods of measurement: why plotting difference against standard method is misleading. Lancet, 346, 1085-7.
#'
#' @import stringr
#'
#' @examples
#' blandr.dataset.sbp()
#' pefr.data <- blandr.dataset.sbp()
#'
#' @export

blandr.dataset.sbp <- function() {

  # The internet dataset is in a plain-text ASCII format.
  # The dataset is in STATA DCT format.
  # The function can be then customised for each DCT file on Martin Bland's website.

  # Read data
  data.from.internet = readLines("https://www-users.york.ac.uk/~mb55/datasets/fingsys.dct")

  # Create new data frame
  converted.from.dct <- data.frame()

  # Loop to read data
  for(i in 8:207) {
    x <- str_extract_all(data.from.internet[i],"\\(?[0-9,.]+\\)?")[[1]]
    y <- as.numeric(gsub(",","",x))
    converted.from.dct <- rbind( converted.from.dct , y )
  }

  # Label column names from dictionary
  colnames(converted.from.dct) <- c(data.from.internet[3:6])

  # Returns the data
  return(converted.from.dct)

}


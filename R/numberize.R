#' @title Scale and One-Hot Encode Data Frames
#'
#' @description Takes a data frame and converts all numeric variables to a
#' scale from 0 to 1 and converts all character and factor variables to a
#' one-hot encoded structure
#'
#' @param df a data frame for conversion
#'
#' @return a data frame
#'
#' @examples
#' \dontrun{
#'  numberize(iris)
#' }
#'
#' @importFrom stats as.formula
#' @export

numberize <- function(df) {
  # identify which columns are numeric
  numdf <- df[,sapply(df, is.numeric)]
  # standardize numeric columns
  numdf <- sapply(numdf, function(x) (x-min(x))/(max(x)-min(x)))

  # identify which columns are factors
  factdf <- df[,sapply(df, function(x) is.factor(x) | is.character(x)), drop = FALSE]
  # one-hot encode factor columns
  form <- paste("~ ", paste(colnames(factdf), collapse = " + "))
  factdf <- stats::model.matrix(as.formula(form), factdf)

  # concatenate into new data frame
  newdf <- as.data.frame(cbind(numdf, factdf[,-1]))
  # return new data frame
  return(newdf)
}

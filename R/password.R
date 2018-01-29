#' @title Generate a Random Password
#'
#' @description samples with replacement from a group of possible uppercase
#' letters, lowercase letters, numbers, and special characters to output a
#' string that could be used as a password
#'
#' @return a string
#'
#' @examples
#' \dontrun{
#' password()
#' }
#'
#' @export

password <- function() {
  # list of letters, numbers, numbers
  choices <- c(LETTERS, letters, 0:9)
  # add special characters
  choices <- c(choices, strsplit("!@#$%^&*()|[].,/","")[[1]])
  # generate password
  pw <- paste(sample(choices, 10, replace = TRUE), collapse = "")
  # return result
  return(pw)
}

#' @title s3 method for silly
#'
#' @description S3 Method for silly
#' @exportMethod silly
#' @param x A value
silly <- function(x) UseMethod('silly')


#' @title Invoke s3 silly method for numeric objects
#' @description S3 Method for silly applied to numerics
#' @param x A numeric value
#' @export
silly.numeric <- function(x) return(as.character(x * 2))

#' @title Invoke s3 silly method for numeric objects
#' @description S3 Method for silly applied to characters
#' @param x A character string
#' @export
silly.character <- function(x) return(as.numeric(x))

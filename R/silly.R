#' @title s3 method for silly
#'
#' @exportMethod silly
silly <- function(x,...) UseMethod('silly')


#' @title Invoke s3 silly method for numeric objects
#' @export
silly.numeric <- function(x,...) return(as.character(x * 2))

#' @title Invoke s3 silly method for numeric objects
#' @export
silly.character <- function(x,...) return(as.numeric(x))

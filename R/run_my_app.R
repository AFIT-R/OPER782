#' @title Runs a shiny app in my package
#'
#' @description
#' Runs as shiny app
#'
#' @param app_name Charater string for a directory in this package
#' @param ...      Additional options passed to shinyAppDir
#'
#' @return A printed shiny app
#'
#'
#' @importFrom shiny shinyAppDir
#' @import dplyr
#' @examples
#' \dontrun{ run_my_app('myfirstApp')}
#'
#' @export
run_my_app <- function(app_name,...) {

  app_dir <- system.file('apps', app_name, package = 'OPER782')

  shiny::shinyAppDir(appDir = app_dir, options = list(...))
}

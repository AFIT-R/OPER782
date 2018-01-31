run_my_app <- function(app_name,...) {

  app_dir <- system.file('apps', app_name, package = 'OPER782')

  shiny::shinyAppDir(appDir = app_dir, options = list(...))
}

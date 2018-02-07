#' @title An example shinygadget
#'
#' @description This would normally be an exciting description
#'
#' @param min The minimum x value
#' @param max The maximum x value
#' @param theme A \code{character} string for a theme provided
#'              by the \code{shinythemes} package
#'
#' @import shiny
#' @import metricsgraphics
#' @importFrom pacman p_load p_load_gh
#' @importFrom stats dnorm pnorm qnorm
#' @importFrom shinythemes shinytheme
#'
#' @export
my_gadget <- function(min, max, theme = 'flatly') {

  pacman::p_load(metricsgraphics, shiny)
  pacman::p_load_gh("rstudio/shinygadgets")

  ui = fluidPage(title = 'The Normal Distribution',
                 theme = shinythemes::shinytheme(theme = theme),

sidebarLayout(
  sidebarPanel(width = 3,
     sliderInput("mu.n",
                 label = HTML("Mean (&mu;)"),
                 min = -3,
                 max = 3,
                 step = 0.5,
                 value = 0,
                 animate = T),
                 hr(),
     sliderInput("sig.n",
                 label = HTML("Std Dev (&sigma;)"),
                 min = 0.5,
                 max = 5,
                 step = 0.5,
                 value = 1,
                 animate = T),
     actionButton('done', h4('Finish'), width = '100%')),

mainPanel(width = 9,
  tabsetPanel(type = 'pills',
    tabPanel('Distribution Function',
      metricsgraphicsOutput(height = "550px", "norC")),
    tabPanel('Density',
      metricsgraphicsOutput(height = "550px", "norP")),
    tabPanel('Survival',
      metricsgraphicsOutput(height = "550px", "norR")),
    tabPanel('Hazard',
      metricsgraphicsOutput(height = "550px", "norh")),
    tabPanel('Cumulative Hazard',
      metricsgraphicsOutput(height = "550px", "norH")),
    tabPanel('Quantile',
      metricsgraphicsOutput(height = "550px", "norQ"))))))

server = function(input, output, session) {

    p  <- signif(seq(0, 1, length = 500), digits = 4)

    rv <- reactiveValues( )

    observe({
      rv$mu.n <- input$mu.n
      rv$sig.n <- input$sig.n
      rv$t  <- signif(digits = 4,
                      seq(min, max,length = 500))
      rv$C  <- pnorm(rv$t, rv$mu.n, rv$sig.n)
      rv$P  <- dnorm(rv$t, rv$mu.n, rv$sig.n)
      rv$R  <- 1-rv$C
      rv$h  <- exp(log(rv$P)-log(rv$R))
      rv$H  <- -1*log(1-rv$C)
      rv$Q  <- qnorm(p, rv$mu.n, rv$sig.n)
      rv$df <- data.frame(Time = rv$t,
                          PROB = p,
                          CDF = rv$C,
                          PDF = rv$P,
                          REL = rv$R,
                          haz = rv$h,
                          HAZ = rv$H,
                          QUANT = rv$Q)
    })

    output$norC <- renderMetricsgraphics({
      mjs_plot(rv$df, x = Time, y = CDF, decimals = 4, top = 0) %>%
        mjs_line(area = TRUE) %>%
        mjs_labs(x_label = 'Time (t)', y_label = 'F(t)')%>%
        mjs_add_css_rule("{{ID}} .mg-active-datapoint { font-size: 20pt }")
    })

    output$norP <- renderMetricsgraphics({
      mjs_plot(rv$df, x = Time, y = PDF, decimals = 4) %>%
        mjs_line(area = TRUE) %>%
        mjs_labs(x_label = 'Time (t)', y_label = 'f(t)') %>%
        mjs_add_css_rule("{{ID}} .mg-active-datapoint { font-size: 20pt }")
    })

    output$norR <- renderMetricsgraphics({
      mjs_plot(rv$df, x = Time, y = REL, decimals = 4) %>%
        mjs_line(area = TRUE) %>%
        mjs_labs(x_label = 'Time (t)', y_label = 'S(t)') %>%
        mjs_add_css_rule("{{ID}} .mg-active-datapoint { font-size: 20pt }")
    })

    output$norh <- renderMetricsgraphics({
      mjs_plot(rv$df, x = Time, y = haz, decimals = 4) %>%
        mjs_line(area = TRUE) %>%
        mjs_labs(x_label = 'Time (t)', y_label = 'h(t)') %>%
        mjs_add_css_rule("{{ID}} .mg-active-datapoint { font-size: 20pt }")
    })

    output$norH <- renderMetricsgraphics({
      mjs_plot(rv$df, x = Time, y = HAZ, decimals = 4) %>%
        mjs_line(area = TRUE) %>%
        mjs_labs(x_label = 'Time (t)', y_label = 'H(t)') %>%
        mjs_add_css_rule("{{ID}} .mg-active-datapoint { font-size: 20pt }")
    })

    output$norQ <- renderMetricsgraphics({
      mjs_plot(rv$df, x = PROB, y = QUANT, decimals = 4) %>%
        mjs_line(area = TRUE) %>%
        mjs_labs(x_label = 'Probability', y_label = HTML('q(p)')) %>%
        mjs_add_css_rule("{{ID}} .mg-active-datapoint { font-size: 20pt }")
    })

    observeEvent(input$done, {

      stopApp(list(data = rv$df))

      })
}
              runGadget(app = ui,
                        server = server,
                        viewer = browserViewer(browser = getOption("browser")))

}

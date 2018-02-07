server = function(input, output, session) {

p  <- signif(seq(0, 1, length = 500), digits = 4)

rv <- reactiveValues( )

observe({
  rv$mu.n <- input$mu.n
  rv$sig.n <- input$sig.n
  rv$t  <- signif(digits = 4,
                  seq(min(input$range.n), 
                      max(input$range.n), 
                      length = 500))
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
}
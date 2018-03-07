server = function(input, output, session) {

  p  <- signif(seq(0, 1, length = 500), digits = 4)
  mu  <- input$mu.n
  sig <- input$sig.n
  t <- signif(digits = 4,
              seq(min(input$range.n),
                  max(input$range.n),
                  length = 500))

  CDF <- pnorm(t, mean = mu, sd = sig)
  PDF <- dnorm(t, mean = mu, sd = sig)
  REL <- 1-pnorm(t, mean = mu, sd = sig)
  haz <- PDF/(1-CDF)
  HAZ <- -1*log(1-CDF)
  QUANT <- qnorm(p, mean = mu, sd = sig )
  df <- data.frame(Time = t,
                   PROB = p,
                   CDF = CDF,
                   PDF = PDF,
                   REL = REL,
                   haz = haz,
                   HAZ = HAZ,
                   QUANT = QUANT)

output$norC <- renderMetricsgraphics({
  mjs_plot(df, x = Time, y = CDF, decimals = 4, top = 0) %>%
  mjs_line(area = TRUE) %>%
  mjs_labs(x_label = 'Time (t)', y_label = 'F(t)')%>%
  mjs_add_css_rule("{{ID}} .mg-active-datapoint { font-size: 20pt }")
})

output$norP <- renderMetricsgraphics({
  mjs_plot(df, x = Time, y = PDF, decimals = 4) %>%
  mjs_line(area = TRUE) %>%
  mjs_labs(x_label = 'Time (t)', y_label = 'f(t)') %>%
  mjs_add_css_rule("{{ID}} .mg-active-datapoint { font-size: 20pt }")
})

output$norR <- renderMetricsgraphics({
  mjs_plot(df, x = Time, y = REL, decimals = 4) %>%
  mjs_line(area = TRUE) %>%
  mjs_labs(x_label = 'Time (t)', y_label = 'S(t)') %>%
  mjs_add_css_rule("{{ID}} .mg-active-datapoint { font-size: 20pt }")
})

output$norh <- renderMetricsgraphics({
  mjs_plot(df, x = Time, y = haz, decimals = 4) %>%
  mjs_line(area = TRUE) %>%
  mjs_labs(x_label = 'Time (t)', y_label = 'h(t)') %>%
  mjs_add_css_rule("{{ID}} .mg-active-datapoint { font-size: 20pt }")
})

output$norH <- renderMetricsgraphics({
  mjs_plot(df, x = Time, y = HAZ, decimals = 4) %>%
  mjs_line(area = TRUE) %>%
  mjs_labs(x_label = 'Time (t)', y_label = 'H(t)') %>%
  mjs_add_css_rule("{{ID}} .mg-active-datapoint { font-size: 20pt }")
})

output$norQ <- renderMetricsgraphics({
  mjs_plot(df, x = PROB, y = QUANT, decimals = 4) %>%
  mjs_line(area = TRUE) %>%
  mjs_labs(x_label = 'Probability', y_label = 't(p)') %>%
  mjs_add_css_rule("{{ID}} .mg-active-datapoint { font-size: 20pt }")
})
}

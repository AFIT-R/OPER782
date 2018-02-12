p  <- signif(seq(0, 1, length = 500), digits = 4)
t <- seq(-4,4, length.out = 500)
mu.n  <- 0
sig.n <- 1


CDF <- pnorm(t, mean = mu.n, sd = sig.n)
PDF <- dnorm(t, mean = mu.n, sd = sig.n)
REL <- 1-pnorm(t, mean = mu.n, sd = sig.n)
haz <- PDF / (1 - CDF)
HAZ <- -1 * log(1 - CDF)
QUANT <- qnorm(p, mean = mu.n, sd = sig.n)
df <- data.frame(Time = t,
                 PROB = p,
                 CDF = CDF,
                 PDF = PDF,
                 REL = REL,
                 haz = haz,
                 HAZ = HAZ,
                 QUANT = QUANT)

## CDF
mjs_plot(df, x = Time, y = CDF, decimals = 4, top = 0) %>%
mjs_line(area = TRUE) %>%
mjs_labs(x_label = 'Time (t)', y_label = 'F(t)')

## PDF
mjs_plot(df, x = Time, y = PDF, decimals = 4, top = 0) %>%
  mjs_line(area = TRUE) %>%
  mjs_labs(x_label = 'Time (t)', y_label = 'f(t)')

## REL
mjs_plot(df, x = Time, y = REL, decimals = 4, top = 0) %>%
  mjs_line(area = TRUE) %>%
  mjs_labs(x_label = 'Time (t)', y_label = 'R(t)')

## hazard
mjs_plot(df, x = Time, y = haz, decimals = 4, top = 0) %>%
  mjs_line(area = TRUE) %>%
  mjs_labs(x_label = 'Time (t)', y_label = 'h(t)')

## Cumulative Hazard
mjs_plot(df, x = Time, y = HAZ, decimals = 4, top = 0) %>%
  mjs_line(area = TRUE) %>%
  mjs_labs(x_label = 'Time (t)', y_label = 'H(t)')

## Quantile
mjs_plot(df, x = Time, y = QUANT, decimals = 4, top = 0) %>%
  mjs_line(area = TRUE) %>%
  mjs_labs(x_label = 'Time (t)', y_label = 't(p)')

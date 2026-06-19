library(ggplot2)
library(tidyr)

stocks <- read.csv("Lab13.csv")

stocks_long <- pivot_longer(
  stocks,
  cols = c(Stock_A, Stock_B, Stock_C),
  names_to = "Stock",
  values_to = "Price"
)

ggplot(stocks_long,
       aes(x = Date,
           y = Price,
           color = Stock,
           group = Stock)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  labs(
    title = "Stock Prices Over Time",
    x = "Date",
    y = "Stock Price ($)"
  ) +
  theme_minimal()

stocks$Pct_Change <- c(
  NA,
  diff(stocks$Stock_A) /
    head(stocks$Stock_A, -1) * 100
)

pct_data <- na.omit(stocks)

ggplot(pct_data,
       aes(x = Date,
           y = Pct_Change)) +
  geom_bar(
    stat = "identity",
    fill = "steelblue"
  ) +
  geom_text(
    aes(label = round(Pct_Change, 2)),
    vjust = -0.3
  ) +
  labs(
    title = "Daily Percentage Change in Stock A",
    x = "Date",
    y = "Percentage Change (%)"
  ) +
  theme_minimal()
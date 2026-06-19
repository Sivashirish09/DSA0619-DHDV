library(tidyr)
library(ggplot2)
library(readr)

sales <- read_csv("Lab6.csv")

sales_long <- pivot_longer(
  sales,
  cols = c(January_Sales, February_Sales, March_Sales),
  names_to = "Month",
  values_to = "Sales"
)

ggplot(sales_long,
       aes(Product_Name, Sales, fill = Month)) +
  geom_col(position = "dodge") +
  geom_text(aes(label = Sales),
            position = position_dodge(width = 0.9),
            vjust = -0.3,
            size = 4) +
  labs(
    title = "Quarterly Product Sales",
    x = "Product",
    y = "Sales"
  ) +
  theme_minimal()

sales_long <- pivot_longer(
  sales,
  cols = c(January_Sales, February_Sales, March_Sales),
  names_to = "Month",
  values_to = "Sales"
)

ggplot(sales_long,
       aes(Month, Sales,
           fill = Product_Name,
           group = Product_Name)) +
  geom_area() +
  labs(
    title = "Overall Sales Trend",
    x = "Month",
    y = "Sales"
  ) +
  theme_minimal()
library(ggplot2)
library(readr)
library(dplyr)

sales <- read_csv("Lab1.csv")

sales$Month <- factor(
  sales$Month,
  levels = c(
    "January","February","March","April","May"
  )
)

ggplot(sales,aes(Month,Sales,group=1)) +
  geom_line(color = "blue", linewidth = 0.8) +
  geom_point(color = "blue", size = 3) +
  labs(
    title="Monthly Sales Trend",
    x="Month",
    y="Sales ($)"
  ) +
  scale_y_continuous(
    limits = c(10000, 24000),
    breaks = seq(10000, 24000, 2000)
  ) +
  theme_minimal()

top_products <- sales %>%
  arrange(desc(Product_Sales)) %>%
  mutate(Color = ifelse(Product_Sales == max(Product_Sales), "Highest", "Others"))

ggplot(top_products,
       aes(reorder(Product, Product_Sales), Product_Sales, fill = Color)) +
  geom_col() +
  scale_fill_manual(values = c("Highest" = "red", "Others" = "gray70")) +
  labs(
    title = "Top Selling Products",
    x = "Product",
    y = "Sales ($)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

ggplot(sales,
       aes(Advertising_Budget,Sales)) +
  geom_point(size=3) +
  geom_smooth(method="lm",se=FALSE) +
  labs(
    title="Advertising Budget vs Monthly Sales",
    x="Advertising Budget ($)",
    y="Sales ($)"
  ) +
  scale_y_continuous(
    limits = c(14000, 24000),
    breaks = seq(10000, 24000, 2000)
  ) +
  theme_minimal()
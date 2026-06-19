library(ggplot2)
library(readr)

inventory <- read_csv("Lab4.csv")

ggplot(inventory,
       aes(Product_Name, Quantity_Available)) +
  geom_col(fill = "steelblue") +
  labs(
    title = "Product Inventory Quantities",
    x = "Product",
    y = "Quantity Available"
  ) +
  theme_minimal()

ggplot(inventory,
       aes(Category,Quantity_Available,fill = Product_Name)) +
  geom_col() +
  labs(
    title = "Product Quantity by Category",
    x = "Category",
    y = "Quantity Available"
  ) +
  theme_minimal()

ggplot(inventory,
       aes(Price,
           Quantity_Available,
           color = Category)) +
  geom_point(size = 4) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "black"
  ) +
  labs(
    title = "Price vs Quantity Available",
    x = "Price",
    y = "Quantity Available"
  ) +
  theme_minimal()
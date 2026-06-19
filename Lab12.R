library(ggplot2)

inventory <- read.csv("Lab12.csv")

ggplot(inventory,
       aes(x = Product_Name,
           y = Quantity_Available)) +
  geom_bar(stat = "identity",
           fill = "steelblue") +
  geom_text(aes(label = Quantity_Available),
            vjust = -0.3) +
  labs(
    title = "Quantity of Products in Inventory",
    x = "Product Name",
    y = "Quantity Available"
  ) +
  theme_minimal()

ggplot(inventory,
       aes(x = Category,
           y = Quantity_Available,
           fill = Product_Name)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Quantity_Available),
            position = position_stack(vjust = 0.5),
            color = "white") +
  labs(
    title = "Product Quantities within Categories",
    x = "Product Category",
    y = "Quantity Available",
    fill = "Product"
  ) +
  theme_minimal()
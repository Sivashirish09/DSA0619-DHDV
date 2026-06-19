library(ggplot2)
library(readr)
library(tidyr)
traffic <- read_csv("Lab5.csv")

ggplot(traffic,
       aes(Date, Page_Views, group = 1)) +
  geom_line(color = "blue", linewidth = 1.2) +
  geom_point(color = "black", size = 3) +
  labs(
    title = "Daily Page Views Trend",
    x = "Date",
    y = "Page Views"
  ) +
  theme_minimal

top_ctr <- traffic %>%
  arrange(desc(Click_Through_Rate))

ggplot(top_ctr,
       aes(reorder(Date, Click_Through_Rate),
           Click_Through_Rate)) +
  geom_col(fill = "steelblue") +
  geom_text(aes(label = paste0(Click_Through_Rate, "%")),
            hjust = -0.2,
            size = 4) +
  coord_flip() +
  labs(
    title = "Top Days by Click Through Rate",
    x = "Date",
    y = "CTR (%)"
  ) +
  theme_minimal()

area_data <- pivot_longer(
  traffic,
  cols = c(Likes, Shares, Comments),
  names_to = "Interaction",
  values_to = "Count"
)

ggplot(area_data,
       aes(Date, Count, fill = Interaction)) +
  geom_area() +
  labs(
    title = "User Interaction Distribution",
    x = "Date",
    y = "Count"
  ) +
  theme_minimal()
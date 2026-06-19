library(ggplot2)
library(readr)

data <- read_csv("Lab7.csv")

ggplot(data, aes(x = Age)) +
  geom_histogram(
    binwidth = 5,
    fill = "steelblue",
    color = "black"
  ) +
  labs(
    title = "Customer Age Distribution",
    x = "Age",
    y = "Frequency"
  ) +
  theme_minimal()

gender_data <- data %>%
  count(Gender)

ggplot(gender_data,
       aes(x = "",
           y = n,
           fill = Gender)) +
  geom_col(width = 1) +
  coord_polar("y") +
  geom_text(aes(label = n),
            position = position_stack(vjust = 0.5)) +
  labs(
    title = "Gender Distribution"
  ) +
  theme_void()
library(ggplot2)
library(maps)
data <- read.csv("Lab11.csv")

ggplot(data,
       aes(x = Longitude,
           y = Latitude,
           size = Population,
           label = City)) +
  geom_point(color = "blue", alpha = 0.7) +
  geom_text(vjust = -1) +
  labs(
    title = "Geographic Distribution of Cities",
    x = "Longitude",
    y = "Latitude",
    size = "Population"
  ) +
  theme_minimal()

ggplot(data,
       aes(x = Avg_Temperature,
           y = Population,
           size = Elevation,
           color = City)) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Temperature vs Population",
    x = "Average Temperature",
    y = "Population"
  ) +
  theme_minimal()
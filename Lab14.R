library(ggplot2)
library(dplyr)
energy <- read.csv("Lab14.csv")

ggplot(energy, aes(x = Units_Consumed)) +
  geom_histogram(
    bins = 5,
    fill = "skyblue",
    color = "black"
  ) +
  geom_density(
    aes(y = after_stat(count)),
    color = "red",
    linewidth = 1
  ) +
  labs(
    title = "Distribution of Energy Consumption",
    x = "Units Consumed (kWh)",
    y = "Frequency"
  ) +
  theme_minimal()

ggplot(
  energy,
  aes(
    x = Temperature,
    y = Units_Consumed,
    size = Peak_Hours
  )
) +
  geom_point(
    alpha = 0.6,
    color = "steelblue"
  ) +
  labs(
    title = "Temperature vs Energy Consumption",
    x = "Temperature (°C)",
    y = "Units Consumed (kWh)",
    size = "Peak Hours"
  ) +
  theme_minimal()

renewable_avg <- energy %>%
  group_by(Sector) %>%
  summarise(
    Avg_Renewable = mean(Renewable_Usage)
  )

ggplot(
  renewable_avg,
  aes(
    x = Sector,
    y = Avg_Renewable,
    fill = Sector
  )
) +
  geom_col() +
  geom_text(
    aes(label = round(Avg_Renewable,1)),
    vjust = -0.3
  ) +
  labs(
    title = "Average Renewable Energy Usage by Sector",
    x = "Sector",
    y = "Renewable Usage (%)"
  ) +
  theme_minimal()
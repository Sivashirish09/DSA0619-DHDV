library(ggplot2)
library(dplyr)
app <- read.csv("Lab19.csv")


ggplot(app, aes(x = Screen_Time)) +
  geom_histogram(
    bins = 5,
    fill = "skyblue",
    color = "black"
  ) +
  labs(
    title = "Histogram of Screen Time",
    x = "Screen Time (hrs)",
    y = "Frequency"
  ) +
  theme_minimal()


ggplot(app, aes(x = Screen_Time)) +
  geom_density(
    fill = "orange",
    alpha = 0.6
  ) +
  labs(
    title = "Density Plot of Screen Time",
    x = "Screen Time (hrs)",
    y = "Density"
  ) +
  theme_minimal()

correlation <- cor(app$Data_Used,
                   app$Screen_Time)

print(correlation)

ggplot(app,
       aes(x = Data_Used,
           y = Screen_Time)) +
  geom_point(
    color = "blue",
    size = 3
  ) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "red"
  ) +
  labs(
    title = "Data Used vs Screen Time",
    x = "Data Used (GB)",
    y = "Screen Time (hrs)"
  ) +
  theme_minimal()

avg_sat <- app %>%
  group_by(Gender) %>%
  summarise(
    Avg_Satisfaction = mean(Satisfaction)
  )

ggplot(avg_sat,
       aes(x = Gender,
           y = Avg_Satisfaction,
           fill = Gender)) +
  geom_col() +
  geom_text(
    aes(label = round(Avg_Satisfaction,2)),
    vjust = -0.3
  ) +
  labs(
    title = "Average Satisfaction by Gender",
    x = "Gender",
    y = "Average Satisfaction"
  ) +
  theme_minimal()
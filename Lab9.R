library(ggplot2)
library(zoo)
library(dplyr)
data <- read.csv("Lab9.csv")

ggplot(data, aes(x = Quiz_Score)) +
  geom_histogram(
    binwidth = 6,
    fill = "steelblue",
    color = "black"
  ) +
  labs(
    title = "Distribution of Quiz Scores",
    x = "Quiz Score",
    y = "Frequency"
  ) +
  theme_minimal()

ggplot(data,
       aes(x = Course,
           y = Quiz_Score,
           fill = Course)) +
  geom_boxplot() +
  labs(
    title = "Quiz Score by Course",
    x = "Course",
    y = "Quiz Score"
  ) +
  theme_minimal()

ggplot(data,
       aes(x = Study_Time,
           y = Quiz_Score,
           size = Videos_Watched,
           color = Course)) +
  geom_point(alpha = 0.6) +
  labs(
    title = "Study Time vs Quiz Score",
    x = "Study Time (hrs)",
    y = "Quiz Score",
    size = "Videos Watched"
  ) +
  theme_minimal()

data$Login_Date <- as.Date(data$Login_Date)

monthly <- data %>%
  mutate(Month = format(Login_Date, "%Y-%m")) %>%
  group_by(Month) %>%
  summarise(Avg_Quiz = mean(Quiz_Score))

monthly$Moving_Avg <- rollmean(
  monthly$Avg_Quiz,
  k = 2,
  fill = NA,
  align = "right"
)

ggplot(monthly,
       aes(x = Month,
           y = Avg_Quiz,
           group = 1)) +
  geom_line(color = "blue", linewidth = 1.2) +
  geom_point(size = 3, color = "blue") +
  geom_line(aes(y = Moving_Avg),
            color = "red",
            linewidth = 1.2,
            linetype = "dashed") +
  labs(
    title = "Average Monthly Quiz Score",
    x = "Month",
    y = "Average Quiz Score"
  ) +
  theme_minimal()
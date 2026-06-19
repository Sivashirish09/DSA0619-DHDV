library(dplyr)
library(ggplot2)
library(zoo)
students <- read.csv("Lab15.csv")

ggplot(students, aes(x = Math_Score)) +
  geom_histogram(
    bins = 5,
    fill = "skyblue",
    color = "black"
  ) +
  labs(
    title = "Distribution of Math Scores",
    x = "Math Score",
    y = "Frequency"
  ) +
  theme_minimal()


ggplot(students,
       aes(x = Gender,
           y = Science_Score,
           fill = Gender)) +
  geom_boxplot() +
  labs(
    title = "Science Scores by Gender",
    x = "Gender",
    y = "Science Score"
  ) +
  theme_minimal()

ggplot(
  students,
  aes(
    x = Study_Hours,
    y = Math_Score,
    color = Gender
  )
) +
  geom_point(size = 4) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "black"
  ) +
  labs(
    title = "Study Hours vs Math Score",
    x = "Study Hours",
    y = "Math Score"
  ) +
  theme_minimal()

students$Exam_Date <- as.Date(students$Exam_Date)

monthly_avg <- students %>%
  mutate(Month = format(Exam_Date, "%Y-%m")) %>%
  group_by(Month) %>%
  summarise(
    Avg_Math = mean(Math_Score)
  )

monthly_avg$Moving_Avg <- rollmean(
  monthly_avg$Avg_Math,
  k = 2,
  fill = NA,
  align = "right"
)

ggplot(monthly_avg,
       aes(x = Month,
           y = Avg_Math,
           group = 1)) +
  geom_line(color = "blue", linewidth = 1) +
  geom_point(size = 3, color = "blue") +
  geom_line(
    aes(y = Moving_Avg),
    color = "red",
    linetype = "dashed",
    linewidth = 1
  ) +
  labs(
    title = "Monthly Average Math Scores",
    x = "Month",
    y = "Average Math Score"
  ) +
  theme_minimal()
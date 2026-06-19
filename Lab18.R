library(ggplot2)
library(tidyr)

student <- read.csv("Lab18.csv")

score_data <- pivot_longer(
  student,
  cols = c(Test_Score, Participation_Score),
  names_to = "Score_Type",
  values_to = "Score"
)

ggplot(score_data,
       aes(x = Student_ID,
           y = Score,
           fill = Score_Type,
           group = Score_Type)) +
  geom_area(alpha = 0.7) +
  labs(
    title = "Test and Participation Scores Across Students",
    x = "Student ID",
    y = "Score"
  ) +
  theme_minimal()

student$Attendance_Quartile <- cut(
  student$Attendance,
  breaks = quantile(student$Attendance,
                    probs = seq(0,1,0.25)),
  include.lowest = TRUE,
  labels = c("Q1","Q2","Q3","Q4")
)

ggplot(student,
       aes(x = Attendance_Quartile,
           y = Study_Hours,
           fill = Attendance_Quartile)) +
  geom_boxplot() +
  labs(
    title = "Study Hours by Attendance Quartile",
    x = "Attendance Quartile",
    y = "Study Hours"
  ) +
  theme_minimal()

ggplot(student,
       aes(x = Test_Score)) +
  geom_density(
    fill = "skyblue",
    alpha = 0.6
  ) +
  labs(
    title = "Density Plot of Test Scores",
    x = "Test Score",
    y = "Density"
  ) +
  theme_minimal()
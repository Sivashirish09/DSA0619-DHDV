library(ggplot2)
library(dplyr)

survey <- read.csv("Lab10.csv")

q1 <- survey %>%
  count(Question_1)

ggplot(q1,
       aes(x = Question_1,
           y = n,
           fill = Question_1)) +
  geom_col() +
  geom_text(aes(label = n),
            vjust = -0.3) +
  labs(
    title = "Distribution of Answers for Question 1",
    x = "Answer",
    y = "Count"
  ) +
  theme_minimal()

long_data <- pivot_longer(
  survey,
  cols = c(Question_1, Question_2, Question_3),
  names_to = "Question",
  values_to = "Response"
)

ggplot(long_data,
       aes(x = Question,
           fill = Response)) +
  geom_bar() +
  labs(
    title = "Overall Distribution of Responses",
    x = "Question",
    y = "Count"
  ) +
  theme_minimal()
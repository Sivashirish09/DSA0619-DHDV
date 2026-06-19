library(ggplot2)
library(readr)

emp <- read_csv("Lab3.csv")

ggplot(emp,
       aes(Years_of_Service,
           Performance_Score,
           color = Department,
           group = Department)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  labs(
    title = "Employee Performance Trend",
    x = "Years of Service",
    y = "Performance Score"
  ) +
  theme_minimal()

dept <- emp %>%
  count(Department)

ggplot(dept,
       aes(Department, n)) +
  geom_col(fill = "steelblue") +
  geom_text(aes(label = n),
            vjust = -0.3) +
  labs(
    title = "Employee Distribution by Department",
    x = "Department",
    y = "Number of Employees"
  ) +
  theme_minimal()
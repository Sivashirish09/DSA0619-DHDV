library(ggplot2)
library(readr)

emp <- read_csv("Lab3.csv")
emp <- emp[order(emp$Years_of_Service), ]
ggplot(emp,
       aes(x = Employee_ID,
           y = Performance_Score,
           color = Department,
           group = Department)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  labs(
    title = "Employee Performance Trend",
    x = "Employee ID",
    y = "Performance Score",
    color = "Department"
  ) +
  theme_minimal()


dept_count <- emp %>%
  count(Department) %>%
  mutate(Color = ifelse(n == max(n),"Highest","Others"))

ggplot(dept_count,
       aes(Department,n,fill=Color)) +
  geom_col() +
  scale_fill_manual(values=c("Highest"="red",
                             "Others"="gray70")) +
  labs(
    title="Distribution of Employees Across Departments",
    x="Department",
    y="Number of Employees"
  ) +
  theme_minimal() +
  theme(legend.position="none")

ggplot(emp,
       aes(Years_of_Service,
           Performance_Score,
           color = Department)) +
  geom_point(size = 4) +
  geom_smooth(method = "lm",
              se = FALSE,
              color = "black") +
  labs(
    title = "Years of Service vs Performance Score",
    x = "Years of Service",
    y = "Performance Score"
  ) +
  theme_minimal()
health <- read.csv("Lab16.csv")

pairs(
  health[, c("Age", "BMI", "BP", "Cholesterol")],
  main = "Scatterplot Matrix of Health Indicators",
  col = "blue",
  pch = 19
)

qqnorm(
  health$Cholesterol,
  main = "Q-Q Plot of Cholesterol Levels",
  col = "blue",
  pch = 19
)

qqline(
  health$Cholesterol,
  col = "red",
  lwd = 2
)

plot(
  ecdf(health$Cholesterol),
  main = "ECDF of Cholesterol Levels",
  xlab = "Cholesterol",
  ylab = "Cumulative Probability",
  col = "darkgreen",
  lwd = 2
)
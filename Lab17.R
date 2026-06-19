library(ggplot2)
library(corrplot)
vehicle <- read.csv("Lab17.csv")

vehicle$Safety_Rating <- as.factor(vehicle$Safety_Rating)

ggplot(vehicle,
       aes(x = Safety_Rating,
           y = Fuel_Efficiency,
           fill = Safety_Rating)) +
  geom_violin(alpha = 0.7) +
  geom_boxplot(width = 0.1, fill = "white") +
  labs(
    title = "Fuel Efficiency by Safety Rating",
    x = "Safety Rating",
    y = "Fuel Efficiency (km/l)"
  ) +
  theme_minimal()

ggplot(vehicle,
       aes(x = Horsepower,
           y = Top_Speed,
           color = Engine_Size)) +
  geom_point(size = 4) +
  geom_smooth(method = "lm",
              se = FALSE,
              color = "black") +
  labs(
    title = "Horsepower vs Top Speed",
    x = "Horsepower",
    y = "Top Speed (km/h)",
    color = "Engine Size (L)"
  ) +
  theme_minimal()

num_data <- vehicle[, c("Engine_Size",
                        "Horsepower",
                        "Fuel_Efficiency",
                        "Top_Speed",
                        "Safety_Rating")]
cor_matrix <- cor(num_data)

corrplot(
  cor_matrix,
  method = "color",
  addCoef.col = "black",
  tl.col = "black",
  tl.srt = 45
)
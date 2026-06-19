fitness <- read.csv("Lab25.csv")

hist(fitness$Steps,
     main="Daily Steps Distribution",
     xlab="Steps",
     ylab="Frequency",
     col="lightblue")

activity_level <- ifelse(fitness$ActiveMinutes < 45, "Low",
                         ifelse(fitness$ActiveMinutes <= 60, "Medium", "High"))

activity_counts <- table(activity_level)

pie(activity_counts,
    main="Activity Level Categories",
    col=rainbow(length(activity_counts)))

barplot(fitness$CaloriesBurned,
        names.arg=fitness$UserID,
        main="Calories Burned by User",
        xlab="User ID",
        ylab="Calories Burned",
        col="orange")

plot(fitness$Steps,
     fitness$CaloriesBurned,
     main="Steps vs Calories Burned",
     xlab="Steps",
     ylab="Calories Burned",
     pch=19,
     col="blue")
plant <- read.csv("Lab27.csv")

hist(plant$OutputMW,
     main="Power Output Distribution",
     xlab="Output (MW)",
     ylab="Frequency",
     col="lightblue")

status_counts <- table(plant$Status)

pie(status_counts,
    main="Plant Status Distribution",
    col=rainbow(length(status_counts)))

barplot(plant$Temperature,
        names.arg=plant$PlantID,
        main="Temperatures by Plant",
        xlab="Plant ID",
        ylab="Temperature",
        col="orange")

plot(plant$OutputMW,
     plant$Temperature,
     main="Output vs Temperature",
     xlab="Output (MW)",
     ylab="Temperature",
     pch=19,
     col="blue")
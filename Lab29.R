water <- read.csv("Lab29.csv")

hist(water$pHLevel,
     main="pH Level Distribution",
     xlab="pH Level",
     ylab="Frequency",
     col="lightblue")

quality_counts <- table(water$Quality)

pie(quality_counts,
    main="Water Quality Categories",
    col=rainbow(length(quality_counts)))

barplot(water$Turbidity,
        names.arg=water$SampleID,
        main="Turbidity by Sample",
        xlab="Sample ID",
        ylab="Turbidity",
        col="orange")

plot(water$pHLevel,
     water$Turbidity,
     main="pH Level vs Turbidity",
     xlab="pH Level",
     ylab="Turbidity",
     pch=19,
     col="blue")
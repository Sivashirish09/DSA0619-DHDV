music <- read.csv("Lab30.csv")

hist(music$DurationMin,
     main="Song Duration Distribution",
     xlab="Duration (Min)",
     ylab="Frequency",
     col="lightblue")

genre_counts <- table(music$Genre)

pie(genre_counts,
    main="Genre Distribution",
    col=rainbow(length(genre_counts)))

avg_streams <- aggregate(Streams000s ~ Genre,
                         data=music,
                         FUN=mean)

barplot(avg_streams$Streams000s,
        names.arg=avg_streams$Genre,
        main="Average Streams by Genre",
        xlab="Genre",
        ylab="Average Streams (000s)",
        col="orange")

plot(music$DurationMin,
     music$Streams000s,
     main="Duration vs Streams",
     xlab="Duration (Min)",
     ylab="Streams (000s)",
     pch=19,
     col="blue")
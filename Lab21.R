movies <- read.csv("Lab21.csv")

hist(movies$Rating,
     main="Movie Ratings Distribution",
     xlab="Rating",
     ylab="Frequency",
     col="lightblue")

genre_counts <- table(movies$Genre)

pie(genre_counts,
    main="Genre Distribution",
    col=rainbow(length(genre_counts)))

avg_ratings <- aggregate(Rating ~ Genre,
                         data=movies,
                         FUN=mean)

barplot(avg_ratings$Rating,
        names.arg=avg_ratings$Genre,
        main="Average Ratings by Genre",
        xlab="Genre",
        ylab="Average Rating",
        col="orange")

plot(movies$DurationMin,
     movies$Rating,
     main="Duration vs Rating",
     xlab="Duration (Minutes)",
     ylab="Rating",
     pch=19,
     col="blue")
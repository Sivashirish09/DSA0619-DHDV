posts <- read.csv("Lab28.csv")

hist(posts$Likes,
     main="Likes Distribution",
     xlab="Likes",
     ylab="Frequency",
     col="lightblue")

engagement <- c(sum(posts$Likes),
                sum(posts$Comments),
                sum(posts$Shares))

names(engagement) <- c("Likes", "Comments", "Shares")

pie(engagement,
    main="Total Engagement Components",
    col=rainbow(length(engagement)))

barplot(posts$Comments,
        names.arg=posts$PostID,
        main="Comments by Post",
        xlab="Post ID",
        ylab="Comments",
        col="pink")

plot(posts$Likes,
     posts$Shares,
     main="Likes vs Shares",
     xlab="Likes",
     ylab="Shares",
     pch=19,
     col="blue")
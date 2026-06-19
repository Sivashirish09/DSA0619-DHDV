library_data <- read.csv("Lab22.csv")

hist(library_data$BooksBorrowed,
     main="Books Borrowed Distribution",
     xlab="Books Borrowed",
     ylab="Frequency",
     col="lightblue")

fine_status <- ifelse(library_data$FineAmount > 0,
                      "With Fine",
                      "Without Fine")

fine_counts <- table(fine_status)

pie(fine_counts,
    main="Users With and Without Fines",
    col=c("lightcoral","lightgreen"))

barplot(library_data$FineAmount,
        names.arg=library_data$UserID,
        main="Fine Amount by User",
        xlab="User ID",
        ylab="Fine Amount",
        col="orange")

plot(library_data$DaysKept,
     library_data$FineAmount,
     main="Days Kept vs Fine Amount",
     xlab="Days Kept",
     ylab="Fine Amount",
     pch=19,
     col="blue")
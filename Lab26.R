orders <- read.csv("Lab26.csv")

hist(orders$BillAmount,
     main="Bill Amount Distribution",
     xlab="Bill Amount",
     ylab="Frequency",
     col="lightblue")

dining_counts <- table(orders$DiningType)

pie(dining_counts,
    main="Dining Type Distribution",
    col=rainbow(length(dining_counts)))

barplot(orders$ItemsOrdered,
        names.arg=orders$OrderID,
        main="Items Ordered by Order",
        xlab="Order ID",
        ylab="Items Ordered",
        col="pink")

plot(orders$ItemsOrdered,
     orders$BillAmount,
     main="Items Ordered vs Bill Amount",
     xlab="Items Ordered",
     ylab="Bill Amount",
     pch=19,
     col="blue")
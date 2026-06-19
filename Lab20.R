
hospital <- read.csv("Lab20.csv")

hist(hospital$Age,
     main="Patient Age Distribution",
     xlab="Age",
     ylab="Frequency",
     col="lightblue")

status_counts <- table(hospital$AppointmentStatus)

pie(status_counts,
    main="Appointment Status Distribution",
    col=c("lightgreen","lightcoral"))

barplot(hospital$WaitingTimeDays,
        names.arg=hospital$PatientID,
        main="Waiting Times by Patient",
        xlab="Patient ID",
        ylab="Waiting Time (Days)",
        col="orange")

plot(hospital$Age,
     hospital$WaitingTimeDays,
     main="Age vs Waiting Time",
     xlab="Age",
     ylab="Waiting Time (Days)",
     pch=19,
     col="blue")
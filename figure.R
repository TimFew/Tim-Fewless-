# Load dataset
data(cars)

# Create plot with small custom touches
data(cars)

plot(cars$speed, cars$dist,
     main = "Relationship Between Speed and Stopping Distance",
     xlab = "Speed (mph)",
     ylab = "Stopping Distance (ft)")

# Add a line of best fit
abline(lm(dist ~ speed, data = cars), lty = 2)

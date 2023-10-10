# Load the CSV file
data <- read.csv("airline_delay.csv", header = TRUE)

# Remove rows with missing values in arr_delay
delay_data <- na.omit(data$arr_delay)

# Open PDF for writing (or create if it doesn't exist)
pdf("Rplots.pdf", width = 10, height = 6)

# Print a message 
cat("Data loaded and cleaned.\n")

# Histogram
hist(delay_data, main = "Histogram of Arrival Delay", xlab = "Arrival Delay (minutes)", ylab = "Frequency", col = "lightblue")

# Print a message
cat("Histogram created.\n")

# Density Plot
plot(density(delay_data), main = "Density Plot of Arrival Delay", xlab = "Arrival Delay (minutes)", col = "blue")

# Print a message
cat("Density plot created.\n")

# QQ Plot
qqnorm(delay_data)
qqline(delay_data, col = 2)

# Print a message
cat("QQ plot created.\n")

# Select relevant columns
selected_columns <- c("arr_delay", "carrier_delay", "weather_delay", "nas_delay", "security_delay", "late_aircraft_delay")

# Create a new data frame with selected columns
selected_data <- data[selected_columns]

# Generate normal distribution plots
for (col in selected_columns) {
  delay_data <- na.omit(selected_data[[col]])
  hist(delay_data, prob = TRUE, col = "lightblue", main = col, xlab = col, ylab = "Density")
  lines(density(delay_data), col = "blue", lwd = 2)
}

# Close the PDF device
dev.off()

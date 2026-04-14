library(ggplot2)
library(dplyr)

# Load the dataset (you will select the file when prompted)
anes_data <- read.csv(file.choose())

# Clean the data
anes_clean <- anes_data[!is.na(anes_data$VCF0110) & !is.na(anes_data$VCF0706) & anes_data$VCF0110 > 0 & anes_data$VCF0706 > 0, ]

# Create education variable
anes_clean$education <- factor(
  anes_clean$VCF0110,
  levels = c(1, 2, 3, 4),
  labels = c(
    "Grade school or less",
    "High school",
    "Some college",
    "College degree"
  )
)

# Create turnout variable
anes_clean$turnout <- ifelse(anes_clean$VCF0706 == 7, "Did not vote", "Voted")

# Create the plot
ggplot(anes_clean, aes(x = education, fill = turnout)) +
  geom_bar(position = "fill") +
  labs(
    title = "Education Level and Voter Turnout",
    x = "Education Level",
    y = "Proportion",
    fill = "Turnout"
  )

# Save the plot
ggsave("anes_turnout_plot.png")
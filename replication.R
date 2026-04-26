library(tidyverse)
library(lmtest)
library(sandwich)

load("Main Data.RData")

data <- x

data <- data %>%
  filter(excluded != 1) %>%
  mutate(
    senate = ifelse(is.na(senate), 0, senate),
    P2P = 0,
    P2P = ifelse(place_on_paper <= 87 & election == 2006, 1, P2P),
    P2P = ifelse(place_on_paper < 117 & election == 2008, 1, P2P),
    govP2P = gov * P2P
  )

model_table1 <- lm(current_vote ~ govP2P + gov + P2P + previous_vote + y2006, data = data)

coeftest(model_table1, vcov = vcovCL(model_table1, cluster = ~id))

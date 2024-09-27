#### Preamble ####
# Purpose: Simulates the cleaned data 
# Author:DEZHEN CHEN
# Date: 27 September 2024
# Contact: dezhen.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
#### Preamble ####
# Purpose: Simulate beach observation data
# Author: Dezhen Chen
# Date: 23 September 2024
# Contact: N/A
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(1008441)

# Define the number of observations
number_of_observations <- 100

# Define possible categories for wind direction and wave action
wind_directions <- c("East", "North-East", "North", "North-West", "West", "South-West", "South", "South-East")
wave_actions <- c("high", "low", "moderate", "none")

# Simulate data
# Simulate data
data <- tibble(
  id = 1:number_of_observations,  
  dataCollectionDate = as.Date(runif(number_of_observations, 
                                     as.numeric(as.Date("2022-01-01")), 
                                     as.numeric(as.Date("2023-12-31"))), 
                               origin = "1970-01-01"),
  beachName = sample(c("Beach A", "Beach B", "Beach C"), number_of_observations, replace = TRUE),
  windSpeed = runif(number_of_observations, min = 0, max = 100), # Wind speed in km/h
  windDirection = sample(wind_directions, number_of_observations, replace = TRUE),
  airTemp = runif(number_of_observations, min = -10, max = 40), # Air temperature in Celsius
  rain = sample(c("Yes", "No"), number_of_observations, replace = TRUE),
  rainAmount = ifelse(rain == "Yes", runif(number_of_observations, min = 0, max = 100), 0), # Rainfall in mm
  waterTemp = runif(number_of_observations, min = 0, max = 30), # Water temperature in Celsius
  waterFowl = rpois(number_of_observations, lambda = 5), # Count of water fowl
  waveAction = sample(wave_actions, number_of_observations, replace = TRUE),
  waterClarity = sample(c("Clear", "Muddy", "Cloudy"), number_of_observations, replace = TRUE),
  turbidity = runif(number_of_observations, min = 0, max = 100) # Turbidity in NTUs
)


#### Write CSV ####
write_csv(data, file = "data/beach_observation_data.csv")




